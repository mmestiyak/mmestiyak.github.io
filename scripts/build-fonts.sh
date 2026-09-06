#!/usr/bin/env bash
# Rebuild the self-hosted latin webfonts in static/fonts/.
#
# Why this exists instead of using the Google Fonts CDN: the CDN's subsets
# silently drop OpenType features. Source Serif 4 upstream carries onum, smcp
# and c2sc; the CDN copy carries none of them, which is why
# `font-variant-numeric: oldstyle-nums` and `font-variant-caps:
# all-small-caps` did nothing on this site for months. Subsetting here with
# --layout-features='*' keeps them.
#
# Needs python3 and network access. Run it only when changing typefaces or
# unicode coverage; the built .woff2 files are committed, and CI never runs it.
set -euo pipefail
cd "$(dirname "$0")/.."
ROOT=$(pwd)
WORK=$(mktemp -d)
trap 'rm -rf "$WORK"' EXIT

echo "==> tooling"
python3 -m venv "$WORK/venv"
"$WORK/venv/bin/pip" install -q --disable-pip-version-check fonttools brotli

echo "==> upstream variable fonts (google/fonts)"
BASE=https://raw.githubusercontent.com/google/fonts/main
fetch() { curl -fsSL --max-time 120 -o "$WORK/$2" "$BASE/$1"; }
fetch "ofl/sourceserif4/SourceSerif4%5Bopsz,wght%5D.ttf"        serif-roman.ttf
fetch "ofl/sourceserif4/SourceSerif4-Italic%5Bopsz,wght%5D.ttf" serif-italic.ttf
fetch "ofl/sourcesans3/SourceSans3%5Bwght%5D.ttf"               sans-roman.ttf
fetch "ofl/sourcesans3/SourceSans3-Italic%5Bwght%5D.ttf"        sans-italic.ttf

# Unicode ranges mirror the ones declared in assets/css/fonts.css.
LATIN='U+0000-00FF,U+0131,U+0152-0153,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+0304,U+0308,U+0329,U+2000-206F,U+20AC,U+2122,U+2191,U+2193,U+2212,U+2215,U+FEFF,U+FFFD'
EXT='U+0100-02BA,U+02BD-02C5,U+02C7-02CC,U+02CE-02D7,U+02DD-02FF,U+0304,U+0308,U+0329,U+1D00-1DBF,U+1E00-1E9F,U+1EF2-1EFF,U+2020,U+20A0-20AB,U+20AD-20C0,U+2113,U+2C60-2C7F,U+A720-A7FF'

# Roman keeps the 400-700 range the stylesheet declares. Italic pins to 400,
# the only italic weight anything on the site asks for, which halves its size.
inst() { "$WORK/venv/bin/fonttools" varLib.instancer -q -o "$WORK/$2" "$WORK/$1" "$3"; }
inst serif-roman.ttf  serif-r.ttf  wght=400:700
inst serif-italic.ttf serif-i.ttf  wght=400
inst sans-roman.ttf   sans-r.ttf   wght=400:700
inst sans-italic.ttf  sans-i.ttf   wght=400

sub() {
  "$WORK/venv/bin/pyftsubset" "$WORK/$1" \
    --unicodes="$2" --layout-features='*' --flavor=woff2 \
    --output-file="$ROOT/static/fonts/$3"
}
echo "==> subsetting"
sub serif-r.ttf "$LATIN" source-serif-4-latin.woff2
sub serif-r.ttf "$EXT"   source-serif-4-latin-ext.woff2
sub serif-i.ttf "$LATIN" source-serif-4-italic-latin.woff2
sub serif-i.ttf "$EXT"   source-serif-4-italic-latin-ext.woff2
sub sans-r.ttf  "$LATIN" source-sans-3-latin.woff2
sub sans-r.ttf  "$EXT"   source-sans-3-latin-ext.woff2
sub sans-i.ttf  "$LATIN" source-sans-3-italic-latin.woff2
sub sans-i.ttf  "$EXT"   source-sans-3-italic-latin-ext.woff2

echo "==> verifying the features that are the whole point"
"$WORK/venv/bin/python" - "$ROOT" <<'PY'
import sys, glob, os
from fontTools.ttLib import TTFont
root=sys.argv[1]; bad=[]
for f in sorted(glob.glob(os.path.join(root,'static/fonts/source-*.woff2'))):
    ft=TTFont(f); feats=set()
    for tag in ('GSUB','GPOS'):
        if tag in ft:
            t=ft[tag].table
            if t and t.FeatureList:
                for fr in t.FeatureList.FeatureRecord: feats.add(fr.FeatureTag)
    name=os.path.basename(f)
    # Digits live in the latin subset, so only it must carry onum.
    if name.endswith('-latin.woff2'):
        if 'onum' not in feats: bad.append(f"{name}: onum MISSING")
        if 'italic' not in name and 'smcp' not in feats: bad.append(f"{name}: smcp MISSING")
    print(f"  {name:40} {len(feats):3} features  onum={'Y' if 'onum' in feats else '-'} smcp={'Y' if 'smcp' in feats else '-'}")
if bad:
    print('\nFAILED:'); [print('  '+b) for b in bad]; sys.exit(1)
print('\nOK: oldstyle figures and small caps present where they are needed.')
PY
echo "==> done. Commit static/fonts/*.woff2."

# Meer's Log

The personal logbook of [Meer Estiyak](https://mmestiyak.com), software,
farming, cycling, and fighting, from Bangladesh.

Built with [Hugo](https://gohugo.io/) and [Tailwind CSS](https://tailwindcss.com/),
deployed to GitHub Pages. No external runtime dependencies: CSS is compiled and
committed, fonts are self-hosted, and every photo is processed at build time.

## What's here

| Section | What it holds |
| --- | --- |
| `/logs/` | Written posts |
| `/moments/` | Photo posts, a folder with an image and a caption |
| `/archive/` | Everything ever posted, year by year, in one chronological stream |
| `/work/` | Projects and work history on one page (`/projects/` and `/experience/` redirect here) |
| `/topics/`, `/tags/` | Every entry, by subject |
| `/admin/` | Self-hosted Sveltia CMS for posting without touching code |

## Posting

See **[POSTING.md](POSTING.md)**, the short version is that adding content
means adding a file, and publishing means `git push`. You never edit templates
to post, and photos need no resizing: Hugo generates WebP derivatives at the
sizes each page needs.

```bash
make log t="My post title"          # new written post
make moment t="Golden hour"         # new photo post (then drop photos in)
```

Or use an admin panel: `/admin/` locally (`make serve`, no login, edits files
directly) or [Pages CMS](https://app.pagescms.org) in the browser.

## Development

Requires [Hugo **extended**](https://gohugo.io/installation/) (for WebP) and
Node (only if you change Tailwind classes).

```bash
brew install hugo        # extended is the default formula
npm install              # only needed for CSS changes

make serve               # dev server at http://localhost:1313
make build               # production build into public/
make css                 # rebuild Tailwind after editing classes in layouts/
make check               # build with path + unused-template warnings
```

**CSS is committed** (`assets/css/tailwind.css`) because CI does not run npm.
After changing Tailwind classes in `layouts/`, run `make css` and commit the
result. Stylesheets are fingerprinted, so visitors never get a stale design.

## Layout of the repo

```
content/          markdown, the whole archive lives here
layouts/          Go templates (baseof, home, page, section, taxonomy, term, …)
  partials/       head/nav/footer + the image-processing helpers
assets/css/       Tailwind input/output (compiled, committed, fingerprinted)
assets/images/    photos referenced by path, Hugo resizes these
static/           served as-is: fonts, CNAME, robots.txt, /admin/
hugo.toml         config, including params used across templates
```

## Deployment

Push to `master`. GitHub Actions installs a pinned Hugo, builds, runs a sanity
gate (homepage, CNAME, feed, archive, work page, social card, fingerprinted CSS), and
only then force-pushes `public/` to the `gh-pages` branch that GitHub Pages
serves. A broken build cannot overwrite a working site.

## Image hosting

Photos live in this repo by default. If the repo ever gets too heavy, set
`image_base` in `hugo.toml` to a CDN origin (e.g. `https://img.mmestiyak.com`)
and every repo-relative photo path is served from there, no post edits needed.
Note that setting it bypasses Hugo's build-time resizing, since the CDN then
serves the files.

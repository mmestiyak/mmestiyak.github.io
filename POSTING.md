# How to post — without ever touching templates

The whole site is files. **Adding content = adding a file. Publishing = `git push`.**
GitHub Actions builds and deploys automatically. You never edit HTML/templates
to post — templates render whatever exists in `content/`.

The site is built with **Hugo**. Photos are resized automatically at build
time, so you can drop full-size phone photos straight in — no exporting, no
resizing, no size limit to remember.

## Admin panels (post without code) — two options

### Option A: self-hosted Sveltia CMS — works offline & during GitHub outages

Ships inside the repo at `/admin/`:

1. `make serve`, then open **http://localhost:1313/admin/** in Chrome/Edge.
2. Click **"Work with Local Repository"** and pick the repo folder (one time).
3. Post Moments/Logs/Projects/Experience through forms — files are written
   straight to disk. Review with `git diff`, publish with `git push`.

No login, no GitHub dependency, fully yours.

**The same panel is live at [mmestiyak.com/admin/](https://mmestiyak.com/admin/)**
(hidden from search engines) and works from any device — phone included. Signing
in there, easiest first:

| Where | How | Setup |
| --- | --- | --- |
| This Mac | "Work with Local Repository" | none — edits files directly |
| Any device | "Sign In Using Access Token" | ~5 min, no server |
| Any device | "Sign in with GitHub" button | ~20 min, needs a free Cloudflare Worker |

**Access token route (recommended to start).** On github.com go to *Settings →
Developer settings → Personal access tokens → Fine-grained tokens → Generate
new token*:

- Repository access: **only** `mmestiyak/mmestiyak.github.io`
- Permissions: **Contents → Read and write**
- Expiration: 1 year

Copy it, open `mmestiyak.com/admin/`, click **Sign In Using Access Token**,
paste. Done — once per device. Treat the token like a password: it can write to
this one repo and nothing else, and you can revoke it on GitHub any time.

**OAuth route (nicer, optional).** A static site can't hold an OAuth client
secret, so it needs one tiny free proxy: deploy
[sveltia-cms-auth](https://github.com/sveltia/sveltia-cms-auth) to Cloudflare
Workers, create a GitHub OAuth App pointing at it, then uncomment `base_url`
in `static/admin/config.yml`. After that it's just a "Sign in with GitHub"
button, no tokens to manage.

### Option B: hosted Pages CMS

`.pages.yml` configures **https://app.pagescms.org** — sign in with GitHub,
grant this repo, get the same forms in a hosted dashboard. Nice on phones.
Depends on GitHub + Pages CMS being up.

For both: don't edit the `_index` entries (they hold section settings), and
remember publishing takes a minute — it's a git commit + build, not instant.

## Cheat sheet

| You want to post…            | Do this                                                          |
| ---------------------------- | ---------------------------------------------------------------- |
| A written post / thought     | `make log t="My title"` → edit the created file → push           |
| A photo with a caption       | `make moment t="Golden hour"` → drop photo(s) in folder → push   |
| A new project / venture      | Copy any file in `content/projects/`, edit, push                 |
| A new job / role             | Copy any file in `content/experience/`, edit, push               |
| A Bangla post                | Same as a log, put it in `content/logs/বাংলা/`                    |
| A photo inside a written post| Put file in `assets/images/`, write `![alt](/images/file.jpg)`   |

## Moments (Instagram-style photo posts)

A *moment* is a folder in `content/moments/` containing an `index.md` and one
or more images:

```
content/moments/2026-08-20-first-silage-cut/
├── index.md      ← title, date, caption
└── photo.jpg     ← any image; several images stack in name order (01.jpg, 02.jpg…)
```

`index.md` needs only this:

```toml
+++
title = "First silage cut of the season"
date = "2026-08-20"
topics = ["farm"]      # farm | training | project | work — anything you like
tags = ["silage"]
+++

Optional caption — anything here shows under the photo.
```

That's it. The grid page (/moments/), the home-page strip, topic pages, and the
RSS feed all pick it up automatically. Newest-first by date. `make moment
t="..."` scaffolds the folder for you.

Three **sample moments** ship with the redesign (marked "sample" in the
image) — replace their SVGs with real photos or delete the folders.

## Logs (written posts)

One markdown file in `content/logs/`. `make log t="Title"` scaffolds it.
Set a `description` (used in lists + SEO), pick `topics`/`tags` freely — new
topic names (e.g. `farm`, `training`) create their own pages automatically.

Optional header image for a log: drop the image in `assets/images/` and add:

```toml
[extra]
image = "/images/my-cover.jpg"   # shows above the post + in WhatsApp/social previews
```

## Projects & ventures

One file per venture in `content/projects/`. The farm and silage business
already have **draft entries** (`farm.md`, `silage.md`) — fill in the TODO
numbers, delete `draft = true`, and they go live. Fields that render:
`year`, `status`, `role`, `tech_stack`, `highlights`, `live_url`, `source_url`,
`image` — all under `[extra]`.

> **Convention:** project/experience detail fields live under `[extra]`
> (`year`, `status`, `role`, `highlights`, …), while `title`, `date`,
> `description`, `draft`, `weight`, `tags`, and `topics` sit at the top level.

## Experience

One file per role in `content/experience/`. `weight = 1` shows first.
Custom fields under `[extra]`: `company`, `role`, `date_start`, `date_end`,
`location`, `highlights`.

## Photos — the three mechanisms

1. `assets/images/foo.jpg` → referenced as `/images/foo.jpg` (auto-resized)
2. Colocated: image files next to a post's `index.md` (how moments work)
3. `[extra] image = "..."` in frontmatter → header image + social share card

**No need to resize anything.** Hugo generates WebP derivatives at the sizes
each page needs (grid thumbnails, full-width views, archive thumbs), so a 4 MB
phone photo becomes a handful of small files automatically. Just keep the
originals reasonable — full-resolution phone photos are fine.

## One-time setup still pending

- `static/og-image.jpg` — 1200×630 photo used for social link previews
- `portrait` in `hugo.toml` — your photo on home + about
  (e.g. `portrait = "/images/portrait.jpg"` with the file in `assets/images/`)
- `about_photos` in `hugo.toml` — the 4-photo strip on the about page

Photos you reference by path can live in either place:
`assets/images/` (Hugo resizes them — preferred) or `static/` (served as-is).

## If you ever edit templates (not needed for posting)

The site's CSS is compiled and committed (`assets/css/tailwind.css`) and fonts
are self-hosted (`static/fonts/`) — zero external dependencies. Posting content
never requires rebuilding CSS. Only if you change Tailwind **classes in
`layouts/`** run `make css` (needs `npm install` once) and commit the result.
Templates live in `layouts/`; stylesheets are fingerprinted so visitors can
never get a stale cached design.

## Posting from your phone

Open the repo on github.com → navigate to the folder → **Add file → Upload
files** (photos) or **Create new file** (`index.md`). Commit to `master` and
the site deploys itself. Apps like *Working Copy* (iOS) make this smoother.

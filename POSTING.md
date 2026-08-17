# How to post — without ever touching templates

The whole site is files. **Adding content = adding a file. Publishing = `git push`.**
GitHub Actions builds and deploys automatically. You never edit HTML/templates
to post — templates render whatever exists in `content/`.

## Admin panel (post from any browser, no code)

The repo has a `.pages.yml` config for **Pages CMS** — a free admin panel that
commits to GitHub for you:

1. Push this repo to GitHub (the config must be on `master`).
2. Go to **https://app.pagescms.org**, sign in with GitHub, grant access to
   this repo only.
3. You get forms for **Moments** (upload photos + caption), **Logs**,
   **Projects**, and **Experience**. Saving = commit = live in ~1–2 minutes.

Works great on a phone. Two rules: don't edit the `_index` entries from the
panel (they hold section settings), and remember publishing takes a minute —
it's a git commit + build, not instant.

## Cheat sheet

| You want to post…            | Do this                                                          |
| ---------------------------- | ---------------------------------------------------------------- |
| A written post / thought     | `make log t="My title"` → edit the created file → push           |
| A photo with a caption       | `make moment t="Golden hour"` → drop photo(s) in folder → push   |
| A new project / venture      | Copy any file in `content/projects/`, edit, push                 |
| A new job / role             | Copy any file in `content/experience/`, edit, push               |
| A Bangla post                | Same as a log, put it in `content/logs/বাংলা/`                    |
| A photo inside a written post| Put file in `static/images/`, write `![alt](/images/file.jpg)`   |

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
date = 2026-08-20
[taxonomies]
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

Optional header image for a log: drop the image in `static/images/` and add:

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

> **Important Zola rule:** custom fields must live under `[extra]`, not at the
> top of the frontmatter — top-level custom keys are silently ignored.

## Experience

One file per role in `content/experience/`. `weight = 1` shows first.
Custom fields under `[extra]`: `company`, `role`, `date_start`, `date_end`,
`location`, `highlights`.

## Photos — the three mechanisms

1. `static/images/foo.jpg` → available site-wide at `/images/foo.jpg`
2. Colocated: image files next to a post's `index.md` (how moments work)
3. `[extra] image = "..."` in frontmatter → header image + social share card

Keep photos under ~300 KB when you can (export at 1600px wide, JPG/WebP).

## One-time setup still pending

- `static/images/og-image.jpg` — 1200×630 photo used for social link previews
- `portrait` in `config.toml` — your photo on home + about
- `about_photos` in `config.toml` — the 4-photo strip on the about page

## If you ever edit templates (not needed for posting)

The site's CSS is compiled and committed (`static/tailwind.css`) and fonts are
self-hosted (`static/fonts/`) — zero external dependencies. Posting content
never requires rebuilding CSS. Only if you change Tailwind **classes in
templates/** run `make css` (needs `npm install` once) and commit the result.

## Posting from your phone

Open the repo on github.com → navigate to the folder → **Add file → Upload
files** (photos) or **Create new file** (`index.md`). Commit to `master` and
the site deploys itself. Apps like *Working Copy* (iOS) make this smoother.

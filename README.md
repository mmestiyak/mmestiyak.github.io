# Meer's Log

A personal blog built with [Zola](https://www.getzola.org/) — a fast static site generator — styled with [Tailwind CSS](https://tailwindcss.com/) (via CDN). Deployed to GitHub Pages.

## Features

- 🌐 Multilingual support (English & Bengali)
- 📱 Responsive design
- 🔍 Built-in search (elasticlunr)
- 🏷️ Tags and Topics taxonomies
- 📝 Markdown-based content
- 🎨 Clean, minimal typography (Questrial + Noto Sans Bengali)
- 📡 RSS/Atom feed
- 🔎 SEO optimized (OpenGraph, Twitter Cards, JSON-LD, sitemap)

## Quick Start

### Prerequisites

- [Zola](https://www.getzola.org/documentation/getting-started/installation/) (latest)
- Git

### Setup

```bash
# Start the dev server
zola serve

# Open http://127.0.0.1:1111
```

No build step needed — Tailwind CSS is loaded via CDN.

### Build and deploy

```bash
# Build the site
zola build

# Push to deploy (GitHub Actions handles the rest)
git push origin master
```

## Commands

| Command | Description |
|---------|-------------|
| `make serve` | Start Zola dev server |
| `make build` | Build Zola site |
| `make check` | Check site for broken links |
| `make clean` | Remove build output |

## Deployment

Deployment is handled by **GitHub Actions** on every push to `master`. The workflow builds with Zola and deploys to GitHub Pages (`gh-pages` branch).

```bash
git push origin master
```

The deploy script (`./deploy.sh`) is for local verification only.

## Project Structure

```
├── content/              # Markdown content
│   └── logs/             # Blog posts
│       └── বাংলা/        # Bengali content
├── static/               # Static assets
│   ├── style.css         # Custom typography & component styles
│   ├── CNAME             # Custom domain (mmestiyak.com)
│   └── robots.txt
├── templates/            # Zola Tera templates
│   └── partials/         # Reusable template components (nav, footer, head)
├── config.toml           # Site configuration
├── tailwind.config.js    # Tailwind theme config (for CLI build)
├── src/input.css         # Tailwind source (for CLI build)
├── package.json          # Node deps (for optional Tailwind CLI build)
├── .editorconfig         # Cross-editor consistency
└── Makefile              # Command shortcuts
```

## Content

Posts live in `content/logs/` as Markdown files with TOML frontmatter:

```toml
+++
title = "My Post"
date = 2025-01-01
description = "Post description"
reading_time = 5
[taxonomies]
tags = ["topic1", "topic2"]
topics = ["category"]
[extra]
image = "https://example.com/image.jpg"
+++
```

For Bengali content, add `lang = "bn"` to the frontmatter.

## Switching to compiled Tailwind CSS

The Tailwind CLI pipeline is already configured but not active (CDN is simpler for dev). To switch:

1. Run `npm install && npm run build:css` to generate `static/tailwind.css`
2. In `templates/partials/head.html`: uncomment the `<link>` tag and comment out the CDN `<script>` + inline config
3. Uncomment the Tailwind build steps in `Makefile` (`make build-full`)

## License

© 2025–2026 Meer Estiyak. All rights reserved.
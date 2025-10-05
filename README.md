# Meer's Log

A personal blog built with [Zola](https://www.getzola.org/) - a fast static site generator.

## Features

- 🌐 Multilingual support (English & Bengali)
- 📱 Responsive design
- 🔍 Built-in search functionality
- 🏷️ Tag and category system
- 📝 Markdown-based content
- 🎨 Beautiful, minimal design

## Local Development

### Prerequisites

- [Zola](https://www.getzola.org/documentation/getting-started/installation/) installed
- Git

### Setup

1. Clone the repository:
```bash
git clone <your-repo-url>
cd mysite
```

2. Start the development server:
```bash
zola serve
```

3. Open your browser to `http://127.0.0.1:1111`

## Deployment

### Automatic Deployment (GitHub Actions)

This site is configured for automatic deployment to GitHub Pages using GitHub Actions.

**Setup GitHub Pages:**

1. Go to your repository settings
2. Navigate to "Pages" section
3. Under "Source", select "Deploy from a branch"
4. Select "gh-pages" branch and "/ (root)" folder
5. Configure your custom domain `mmestiyak.com` in the Pages settings

**The workflow will automatically:**
- Build the site on every push to `main`/`master` branch
- Deploy to GitHub Pages
- Handle Zola installation and build process

### Manual Deployment

You can also deploy manually using the provided script:

```bash
./deploy.sh
```

## Content Structure

- `content/logs/` - Blog posts (logs)
- `content/posts/` - Additional posts
- `templates/` - Zola templates
- `static/` - Static assets
- `config.toml` - Site configuration

## Bengali Content

The site supports Bengali content with proper transliteration for URLs. Bengali tags are automatically converted to English slugs for better SEO and sharing.

## License

© 2025 Meer Estiyak. All rights reserved.

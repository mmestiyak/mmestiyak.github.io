#!/bin/bash

# Local build check for the Hugo site.
# Deployment is handled automatically by GitHub Actions on push to master.

set -e

echo "🎨 Building CSS..."
npm run build:css

echo "📦 Building site with Hugo..."
hugo --minify --gc

echo ""
echo "✅ Build complete. Output in public/"
echo "🚀 To deploy, push to master (GitHub Actions handles the rest):"
echo "   git push origin master"
echo ""
echo "📝 For local development:"
echo "   make serve"

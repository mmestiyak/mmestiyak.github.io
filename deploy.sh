#!/bin/bash

# Local build script for Zola site
# Deployment is handled automatically by GitHub Actions on push to master.
# Use this script to verify the site builds cleanly before pushing.

set -e

echo "📦 Building site with Zola..."
zola build

echo ""
echo "✅ Build complete. Output in public/"
echo "🚀 To deploy, push to master (GitHub Actions handles the rest):"
echo "   git push origin master"
echo ""
echo "📝 For local development:"
echo "   make serve"
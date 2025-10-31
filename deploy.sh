#!/bin/bash

# Deploy script for Zola site
# This script builds the site and deploys to GitHub Pages

set -e

echo "🚀 Starting deployment..."

# Build the site
echo "📦 Building site with Zola..."
zola build --output-dir public

# Add, commit, and push changes
echo "📝 Committing changes..."
git add .
git commit -m "Deploy: $(date)" || echo "No changes to commit"
git push origin master

echo "✅ Deployment complete!"
echo "🌐 Your site should be available at: https://$(git config --get remote.origin.url | sed 's/.*github.com[:/]\([^.]*\).*/\1/').github.io"

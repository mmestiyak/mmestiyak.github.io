#!/bin/bash
set -e
echo "Installing Node.js..."
brew install node 2>&1
echo "Installing npm packages..."
npm install 2>&1
echo "Building Tailwind CSS..."
npm run build:css 2>&1
echo "Building Zola site..."
zola build 2>&1
echo "DONE"

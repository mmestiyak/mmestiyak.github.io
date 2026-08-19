#!/bin/bash
set -e
echo "Installing Hugo (extended) and Node..."
brew install hugo node 2>&1
echo "Installing npm packages..."
npm install 2>&1
echo "Building CSS..."
npm run build:css 2>&1
echo "Building site..."
hugo --minify --gc 2>&1
echo "DONE — run 'make serve' to start the dev server"

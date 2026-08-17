/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./templates/**/*.html",
    "./content/**/*.md",
  ],
  theme: {
    extend: {
      colors: {
        brand: '#000000',
        'brand-dark': '#333333',
        'brand-light': '#666666',
        'brand-accent': '#00aaff',
        'brand-success': '#10b981',
        'text-primary': '#000000',
        'text-secondary': '#666666',
        'bg-primary': '#ffffff',
        'bg-secondary': '#fafafa',
        'bg-accent': '#f5f5f5'
      },
      fontFamily: {
        'sans': ['Questrial', 'system-ui', '-apple-system', 'BlinkMacSystemFont', 'Segoe UI', 'Roboto', 'sans-serif'],
        'bengali': ['Noto Sans Bengali', 'Questrial', 'system-ui', 'sans-serif'],
        'mono': ['JetBrains Mono', 'SF Mono', 'Monaco', 'Inconsolata', 'monospace']
      },
      spacing: {
        'safe-top': 'env(safe-area-inset-top)',
        'safe-bottom': 'env(safe-area-inset-bottom)',
        'safe-left': 'env(safe-area-inset-left)',
        'safe-right': 'env(safe-area-inset-right)'
      },
      backgroundImage: {
        'paper-texture': "url('data:image/svg+xml,<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"60\" height=\"60\" viewBox=\"0 0 60 60\"><defs><pattern id=\"grid\" width=\"60\" height=\"60\" patternUnits=\"userSpaceOnUse\"><path d=\"M 60 0 L 0 0 0 60\" fill=\"none\" stroke=\"%23f0f0f0\" stroke-width=\"0.5\"/></pattern></defs><rect width=\"60\" height=\"60\" fill=\"%23fefefe\"/><rect width=\"60\" height=\"60\" fill=\"url(%23grid)\"/></svg>')"
      }
    }
  },
  plugins: [],
}

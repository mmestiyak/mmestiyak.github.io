/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./templates/**/*.html",
    "./content/**/*.md",
  ],
  theme: {
    extend: {
      colors: {
        /* Timeless palette: warm paper, warm ink, one deep green accent */
        paper: '#FBFAF7',
        ink: '#1C1B18',
        faded: '#6E6A61',
        line: '#E7E3DA',
        tint: '#F3F1EA',
        accent: '#3A5A40',
        'accent-dark': '#2E4733',
        /* Legacy aliases so older class names keep working */
        brand: '#3A5A40',
        'brand-dark': '#2E4733',
        'brand-light': '#6E6A61',
        'brand-accent': '#3A5A40',
        'brand-success': '#3A5A40',
        'text-primary': '#1C1B18',
        'text-secondary': '#6E6A61',
        'bg-primary': '#FBFAF7',
        'bg-secondary': '#F3F1EA',
        'bg-accent': '#F3F1EA'
      },
      fontFamily: {
        'serif': ['Newsreader', 'Noto Serif Bengali', 'Georgia', 'Times New Roman', 'serif'],
        'sans': ['Newsreader', 'Noto Serif Bengali', 'Georgia', 'Times New Roman', 'serif'],
        'bengali': ['Noto Serif Bengali', 'Georgia', 'serif'],
        'mono': ['ui-monospace', 'SFMono-Regular', 'SF Mono', 'Menlo', 'Consolas', 'Liberation Mono', 'monospace']
      },
      spacing: {
        'safe-top': 'env(safe-area-inset-top)',
        'safe-bottom': 'env(safe-area-inset-bottom)',
        'safe-left': 'env(safe-area-inset-left)',
        'safe-right': 'env(safe-area-inset-right)'
      }
    }
  },
  plugins: [],
}

/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./layouts/**/*.html",
    "./content/**/*.md",
  ],
  theme: {
    extend: {
      colors: {
        /* Channels live in CSS variables (assets/css/style.css) so the whole
           palette can flip for dark mode without touching a single template.
           The rgb(... / <alpha-value>) form keeps Tailwind opacity utilities
           like bg-ink/50 working. */
        paper: 'rgb(var(--c-paper) / <alpha-value>)',
        ink: 'rgb(var(--c-ink) / <alpha-value>)',
        faded: 'rgb(var(--c-faded) / <alpha-value>)',
        line: 'rgb(var(--c-line) / <alpha-value>)',
        tint: 'rgb(var(--c-tint) / <alpha-value>)',
        accent: 'rgb(var(--c-accent) / <alpha-value>)',
        'accent-dark': 'rgb(var(--c-accent-strong) / <alpha-value>)',
        spark: 'rgb(var(--c-spark) / <alpha-value>)',
        /* legacy aliases kept so older class names still resolve */
        brand: 'rgb(var(--c-accent) / <alpha-value>)',
        'text-primary': 'rgb(var(--c-ink) / <alpha-value>)',
        'text-secondary': 'rgb(var(--c-faded) / <alpha-value>)',
        'bg-primary': 'rgb(var(--c-paper) / <alpha-value>)',
        'bg-secondary': 'rgb(var(--c-tint) / <alpha-value>)',
      },
      fontFamily: {
        'serif': ['"Source Serif 4"', 'Noto Serif Bengali', 'Charter', 'Georgia', 'serif'],
        'sans': ['"Source Sans 3"', 'Noto Serif Bengali', 'system-ui', '-apple-system', 'sans-serif'],
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

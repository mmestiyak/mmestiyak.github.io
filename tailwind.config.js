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
        'accent-bright': 'rgb(var(--c-accent-bright) / <alpha-value>)',
      },
      fontFamily: {
        /* Two real families. 'serif' is the display face: headings, the
           wordmark, nothing smaller than about 18px. 'sans' is body copy and
           every small UI element. Must match --font-serif / --font-sans in
           style.css. Every font-serif class in the templates has been
           audited to confirm it's on an actual heading-scale element, not
           small text — that mismatch was the "small titles look bad" bug. */
        'serif': ['Alegreya', 'Noto Serif Bengali', 'Georgia', 'serif'],
        'sans': ['Alegreya Sans', 'Noto Serif Bengali', 'system-ui', '-apple-system', 'sans-serif'],
        'bengali': ['Noto Serif Bengali', 'Georgia', 'serif'],
        'mono': ['ui-monospace', 'SFMono-Regular', 'SF Mono', 'Menlo', 'Consolas', 'Liberation Mono', 'monospace']
      },
      fontSize: {
        /* The meta tier: datelines, tags, footer nav, employment type. Tailwind
           ships xs at 12px, which is a touch small for text set in --c-faded
           and doing actual work. 13px reads easier without reading louder.
           Everything above this is Tailwind's default scale. */
        'xs': ['0.8125rem', { lineHeight: '1.15rem' }],
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

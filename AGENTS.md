# Working in this repo

Read this before writing anything. It applies to every AI agent and tool that
touches this repository: Claude Code, Cursor, Copilot, or anything else.

## Writing rules

**Never use em dashes (—). This is a hard rule, no exceptions.**
Meer dislikes them. Use a comma, a colon, a full stop, or parentheses instead.
Rewrite the sentence if you have to. En dashes are fine in numeric ranges only
(`60–100 W`). Before committing any prose, check:

```bash
grep -rn "—" content/ layouts/
```

That must return nothing. (This file names the character on purpose,
so exclude it from the check.)

Other rules for any prose written here (posts, docs, commit messages, PRs):

- **Write in Meer's voice.** First person, plain words first, technical depth
  after. Short sentences. No marketing tone.
- **Never invent facts.** No made-up anecdotes, failures, numbers, quotes, or
  details about real people or events. If a story needs a detail you do not
  have, ask Meer for it or leave it out. A fabricated detail that contradicts
  what actually happened is worse than a thinner post.
- **Verify technical claims against the source.** Read the actual repo, config,
  or docs before describing how something works. Do not describe a system from
  memory or assumption.
- **Do not single out or over-credit individuals** unless Meer says who did
  what. Credit a person once, not repeatedly.

## The site

Hugo static site, deployed by GitHub Actions on push to `master`.

- **Read `POSTING.md` before adding or changing content.** It documents the
  content model (logs, moments, projects, experience) and the admin panels.
- **Inline post images:** put the file in `assets/images/`, reference it as
  `/images/file.jpg`. The render hook at
  `layouts/_default/_markup/render-image.html` resolves and resizes it. Do not
  reference images by external URL.
- **Frontmatter images:** `[extra] image = "/images/file.jpg"` for the header
  and social card.
- **Check the build before committing:**

  ```bash
  hugo --quiet
  ```

- Only run `make css` if you changed Tailwind classes in `layouts/`.

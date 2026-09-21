---
name: explore
description: Map an unfamiliar codebase before changing it. Use when the user asks for a codebase tour or invokes $explore.
---

Build me a map of this codebase. Use the `scout` Codex subagent for a broad search when it would keep the main conversation focused.

Cover:

1. **What it does**, in two sentences, from the README and the entry points
2. **How to run it**, install, run, test. The actual commands, verified against
   pyproject.toml / package.json / Makefile / docker-compose.yml
3. **The shape**, the 5–8 directories that matter and what each owns. Ignore the rest.
4. **The main flow**, trace one representative path end to end with file:line refs
5. **Data & state**, what persists, where, and what the schema looks like
6. **Conventions**, naming, error handling, testing style. What would make a PR look
   out of place here?
7. **Smells**, anything that looks half-migrated, duplicated, or abandoned

End with the three files I should read myself, and why those three.

Focus area (optional): the user's request

---
name: design-agent
description: Design UI that stays visually consistent across a project, using a curated reference library, 3-variant exploration, and browser-based review. Use when the user asks to design, redesign, or restyle any UI surface, especially when they reference a saved design slug, request variants, want to match an existing style, or want to add screenshots to the library.
---

# Design Agent

Design surfaces that look like they belong to the same product.

Three ideas carry this skill:

1. **The shipped code is the design spec.** Never ask the user to describe a style that already exists in their repo — read it.
2. **Divergence is cheap, quality is expensive.** Explore with 3 throwaway low-fidelity variants; build once, properly.
3. **The user has the final say, in a browser.** Review happens in Lavish, not in chat.

## Modes

Use `$design-agent` with a description for the full design flow; read `references/design.md`.
For focused work, use `$design-agent variants`, `ingest`, `library`, or `brief` and read the matching file under `references/`. Natural-language requests can select this skill too.

## Hard rules

**Use Impeccable when it is available.** It can derive `DESIGN.md`, help plan UX, and check
accessibility and visual quality. Its deterministic scan is `npx impeccable detect --json <path>`.

**Keep one design format.** Library entries and project design context use the same `DESIGN.md` structure.

**Never fake a gate.** impeccable and lavish-axi are external tools and may not be installed.
Check before depending on either:

```bash
npx impeccable --version
lavish-axi --version
```

If one is missing: say so in one line, print the install command, and use the documented fallback
for that step. **Never skip silently. Never describe work as gated, audited, or reviewed when the
tool that would have done it did not run.** An ungated build honestly labelled is useful. An
ungated build reported as gated is worse than no skill at all.

**Never let an unstated preference become a design decision.** If the brief is silent on something
that matters, either derive it from the project or ask. Do not default silently.

**Never re-skin an existing project by accident.** In a project that already has UI, palette, type
scale, spacing rhythm, radii and motion are inherited constants. Changing them is a re-style, and a
re-style requires the user to say so explicitly.

## Paths

All paths are relative to this skill directory.

This skill is maintained inside computerstackgbt. Do not clone or pull a separate `design_agent`
repository during setup or use.

- `library/inbox/` — user drops screenshots here
- `library/entries/<slug>.md` + the image beside it — one entry per reference.
  The image keeps its original extension; the entry's `shot:` field holds the full
  filename. The viewer only guesses `.png` when `shot:` is missing, so always set it.
- `library/viewer/index.html` — generated gallery, opened with `file://`
- `scripts/build-viewer.mjs` — regenerates the viewer, deterministically
- `templates/` — brief, notes, entry, gitignore fragment

Project state lives in the **user's project**, not here:

- `DESIGN.md` — derived by impeccable from their code, regenerable
- `.design/notes.md` — intent, rejections, standing rules. Agent-written. See `references/design.md`.

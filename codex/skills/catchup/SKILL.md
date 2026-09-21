---
name: catchup
description: Recover the state of a project after time away. Use when the user asks where work stopped or invokes $catchup.
---

Orient the user in the current project after time away. Start with `pwd`, `git status --short`, recent commits, and project notes.

## Read first

- This project's `AGENTS.md`, especially the `## Decisions` section
- Recent commit messages
- Whatever is uncommitted, since that is almost always where I stopped mid-thought

If there is no project `AGENTS.md`, say so once. That is the thing that would have made this
easy, and it is worth knowing it is missing.

## Report exactly this, and nothing else

```
## Where you stopped
<two or three sentences. what you were doing and how far it got.>

## In flight
<uncommitted or half-finished work. name the files.
 if a change looks abandoned mid-edit, say so, that is the most useful thing here.>

## Decisions you had made
<the two or three from AGENTS.md that matter for picking this back up.
 skip the ones that are just background.>

## The obvious next step
<one thing. not a list. the single thing you would do first if you sat down now.>
```

## Rules

- **Short.** This is orientation, not a report. If it runs past a screen it has failed.
- Say what you found, not what you assume. If the trail goes cold after the last commit,
  say the trail goes cold. Do not invent a narrative to fill the gap.
- Do not fix anything. Do not start work. Do not offer to. Just tell me where I am.
- Do not summarise the whole project. I built it, I need reminding, not teaching.
- If nothing has happened since the last catchup, say that in one line and stop.

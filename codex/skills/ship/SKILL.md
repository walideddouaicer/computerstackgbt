---
name: ship
description: Format, test, review, scan, and commit current work. Use when the user asks to ship or commit the current work, or invokes $ship.
---

First inspect the current branch, `git status`, and the complete diff.

Ship the current work. In order, stopping if any step fails:

1. **Lint & format**, `ruff format . && ruff check --fix .` (skip if not a Python repo)
2. **Test**, run the project's test command. Report actual output.
3. **Review**, spawn the `reviewer` subagent on `git diff HEAD`. Fix anything it marks
   Blocking. Report the Should-fix items to me without fixing them.
4. **Recheck after fixes**, repeat lint and tests if the review changed files.
5. **Secrets check**, scan the complete `git diff HEAD` for keys, tokens, and `.env`
   content. Abort loudly if anything looks like a credential.
6. **Stage and inspect**, stage the intended files, then inspect `git diff --cached`. Confirm
   that the staged patch contains no unrelated files or secrets.
7. **Commit**, write a commit message: imperative mood, subject under 72 chars,
   body explaining *why* if it isn't obvious. No "Generated with" footer.
8. **Stop.** Do not push. Show me the commit and wait.


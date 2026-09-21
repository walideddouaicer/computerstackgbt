# The Codex layer

This folder holds reusable instructions for Codex in the ChatGPT desktop app and Codex CLI. It does not replace account settings, authentication, or `~/.codex/config.toml`.

| In this repo | Installed location | When used |
|---|---|---|
| `AGENTS.md` | `~/.codex/AGENTS.md` | Codex starts a task |
| `how-i-learn.md` | `~/.codex/how-i-learn.md` | The `$scroll` and `$tome` skills read it |
| `agents/*.toml` | `~/.codex/agents/` | A matching subagent is explicitly delegated |
| `skills/*` | `~/.agents/skills/` | The skill is selected or invoked with `$name` |

The bootstrap links children individually, so Omarchy's own skills can remain in `~/.agents/skills`. It skips any existing nonempty file or skill with the same name. The current `~/.codex/config.toml` is never replaced.

The eight former Claude commands are skills: `$catchup`, `$explore`, `$log`, `$profile`, `$rune`, `$scroll`, `$ship`, and `$tome`. They are not slash commands in Codex. The original project workflows are `$new-ml-project`, `$new-web-project`, and `$design-agent`.

Codex uses a project's `AGENTS.md` for project facts and decisions. ChatGPT's ordinary chats and account memory are separate, though the desktop app can use these standalone skills. In the desktop app, open a local project folder to give Codex that folder's context.

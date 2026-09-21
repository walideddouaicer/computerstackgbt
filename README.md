# computerstackgbt

Walid's personal development layer for Omarchy, Codex, and the ChatGPT desktop app. Omarchy owns the machine. This repository owns reusable working instructions and project conventions.

This is a copy of `computerstack` adapted from Claude Code to Codex. It includes the current version without the tmux launcher. It is a separate folder; it does not change the original repo.

## Layout

```text
computerstackgbt/
├── bootstrap/bootstrap.sh       optional installer and linker
├── codex/
│   ├── AGENTS.md                standing Codex instructions
│   ├── how-i-learn.md           explanation preferences
│   ├── agents/                  scout, reviewer, data-analyst
│   └── skills/                  reusable workflows and project starters
├── docs/                        platform and data decisions
└── dotfiles/git/                optional Git preferences
```

Codex reads `AGENTS.md` at the global and project levels. Skills under `~/.agents/skills` can be selected by Codex or invoked with `$name`; standalone skills are also available in the ChatGPT desktop app. Custom Codex subagents are TOML files under `~/.codex/agents`. Ordinary ChatGPT chats use their own project instructions and memory, not Codex's `AGENTS.md`. [AGENTS.md](https://learn.chatgpt.com/docs/agent-configuration/agents-md), [skills](https://learn.chatgpt.com/docs/build-skills), [subagents](https://learn.chatgpt.com/docs/agent-configuration/subagents).

## Start with the Codex layer

From this folder:

```bash
bash bootstrap/bootstrap.sh --dry-run
bash bootstrap/bootstrap.sh
```

The default run only links this repo's Codex instructions, agents, and skills. It skips existing nonempty files with the same name; an empty `~/.codex/AGENTS.md` is backed up and replaced with a link. It does not replace `~/.codex/config.toml`, ChatGPT app settings, account memory, or authentication. If `~/.codex/AGENTS.md` already contains instructions, review it and this repo's `codex/AGENTS.md` before choosing which global instructions to use.

Optional phases are separate:

```bash
bash bootstrap/bootstrap.sh --only packages
bash bootstrap/bootstrap.sh --only runtimes
bash bootstrap/bootstrap.sh --only dotfiles
bash bootstrap/bootstrap.sh --only docker
```

`packages` adds the development CLI set through Omarchy. `runtimes` adds Python 3.12 through Mise and leaves the existing Node version alone. `dotfiles` registers a Git include. `docker` enables the service and a user group with root-equivalent access; run it only if a project needs it.

## How to use it

Open a project folder in Codex or add it as a local project in the ChatGPT desktop app. Put that project's facts and decisions in its own `AGENTS.md`. For a repeatable workflow, use skills such as `$explore`, `$profile`, `$new-ml-project`, or `$ship`.

The design library and project templates came from the original repo. The design workflow may use optional external tools; its skill checks availability and states when a fallback is used.

See [docs/recap.md](docs/recap.md) for the complete map and [docs/02-data.md](docs/02-data.md) for data choices.

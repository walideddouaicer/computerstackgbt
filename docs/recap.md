# The whole picture

Omarchy owns the operating system, desktop, updates, shell, and terminal. `computerstackgbt` owns personal development choices: a Git include, optional packages and runtimes, Codex instructions, specialist agents, and reusable skills.

## What Codex reads

```text
~/.codex/AGENTS.md          personal working defaults
project/AGENTS.md          project facts and decisions
~/.codex/agents/*.toml     optional specialist subagents
~/.agents/skills/*         repeatable workflows
~/.codex/config.toml       existing application configuration, kept in place
```

The bootstrap links the first, third, and fourth items individually. It never rewrites `config.toml` or ChatGPT account settings. Omarchy's `omarchy` and `diagnose-crash` skills can remain beside these skills.

## Workflows

- `$catchup`: find where work stopped.
- `$explore`: map an unfamiliar codebase.
- `$log`: record a project decision.
- `$profile`: check a dataset before analysis.
- `$rune`, `$scroll`, `$tome`: explain a topic at three depths.
- `$ship`: review, test, scan, and commit work.
- `$new-ml-project`: set up a data project and profile it.
- `$new-web-project`: create a visible first slice of a web project.
- `$design-agent`: design exploration, reference library, and browser review.

The `scout`, `reviewer`, and `data-analyst` subagents are available for bounded tasks when delegation helps. Ordinary work can stay in the main Codex conversation.

## Data defaults

Use `uv` for Python project environments, DuckDB for SQL analysis, and Parquet for processed data. Keep source data unchanged. Profile data before modelling, split before fitting transforms, and compare against a simple baseline. See [02-data.md](02-data.md).

## Bootstrap

`bash bootstrap/bootstrap.sh` links only the Codex layer. `--dry-run` shows actions. Packages, runtimes, Git preferences, and Docker each require an explicit `--only` phase. Existing items with the same name are kept rather than replaced.

Project-specific knowledge belongs in each project's `AGENTS.md`; personal behavior belongs in the global one; reusable procedures belong in skills. Avoid repeating the same rule in all three.

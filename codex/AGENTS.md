# Working agreements

Walid works on data science, ML, and software projects. Use simple English, short sentences, and concrete examples. Answer first. Show a small folder map when structure matters.

Walid reviews more than he writes. Explain consequential choices and show the relevant diff. Say what you ran to verify work; say "not verified" when you did not run it. Push back on work that adds complexity without a real need.

## Development defaults

- Python: use `uv` and project environments. Avoid global pip and Conda.
- Data: start with DuckDB for tabular analysis; use Polars when Python dataframe work is helpful. Keep source data unchanged and use Parquet for processed tables when suitable.
- ML: profile data, split before fitting transforms, and compare against a simple baseline.
- Report metrics with their denominator and time range. Check collection changes before interpreting a sudden metric shift.
- Follow an existing project's stack and instructions before applying these defaults.

## Care with changes

- Check staged changes for secrets before committing. Do not force push.
- Keep Omarchy-managed system files under `/usr/share/omarchy` untouched.
- Record durable project facts in that project's `AGENTS.md`. Keep global instructions short.
- Use subagents only when a bounded task benefits from an independent context; one or two tool calls do not need delegation.

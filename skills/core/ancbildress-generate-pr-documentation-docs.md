# Generate PR Documentation Sync 🧩

![Status: Draft (pink badge)](https://img.shields.io/badge/status-draft-F72585.svg)

This prompt is your “docs autopilot” for pull requests.

It reads what changed, figures out what the documentation *should* say now, and updates only the Markdown files that need to change.

## What it’s for 🎯

Use this when you want your PR to ship with docs that:

- match the actual code/config reality
- avoid duplicated or contradictory guidance
- call out breaking changes (when real)
- include Mermaid diagrams (with accessibility labels) when diagrams help

It’s not trying to be a novelist. It’s trying to be correct.

## What to expect ✅

- It will **read broadly** (code/config/tests) to understand what really changed.
- It will **edit narrowly** (only `.md` files), focusing on the smallest set of updates that makes the docs accurate.
- It prefers **updating existing docs** over creating new files.
- It will delete or consolidate docs that now contradict reality.
- If Mermaid diagrams are added/edited, they’ll include:
  - `accTitle:`
  - `accDescr:`

## Safety rails & “don’t be weird” rules 🛡️

- **Markdown edits only**: It must not modify code, configs, tests, or build files.
- **No secrets**: If a change introduces env vars, it documents **name + purpose only**.
- **No TOCs**: It won’t generate table-of-contents sections.
- **No meta-docs**: It avoids “documentation about documentation.”

## How to use 🪄

1. Open the prompt file: `prompts/generate-pr-documentation.prompt.md`.
2. Run it using your the AI assistant prompt workflow / runner.
3. Review the resulting doc edits (usually `README.md` and/or something under `docs/`).

If you want to narrow scope, be explicit (e.g., “Only update docs related to `scripts/` changes”).

> [!IMPORTANT]
> **Current limitation:** this version assumes it can produce a meaningful **diff against `main`**.
> If you’re not working from a branch that cleanly compares to `main`, it may miss context or produce “best guess” updates.
> I’ll stop making it rely on `main` in a future iteration. (Yes, future me is thrilled.)

## Output checklist 📦

When it’s done, you should have:

- updated Markdown docs that reflect the PR diff
- no duplicated instructions across files
- Mermaid diagrams that render on GitHub and include accessibility labels
- no secrets or sensitive values written into documentation

---

<small>the AI assistant and GitHub the AI assistant helped me with clear ideas and straightforward solutions.</small>

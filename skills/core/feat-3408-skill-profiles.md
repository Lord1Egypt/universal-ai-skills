---
type: Added
pr: 3408
---
**Named install profiles and dependency manifest for skill surface budget control** — Ships a typed profile model (`core`, `standard`, `full`) replacing the binary `--minimal`/full toggle. Install with `--profile=core` or `--profile=standard` to reduce the skill-listing budget. Profiles compute transitive closure over a new `requires:` frontmatter field, so dependent skills are automatically included. The active profile is persisted to a profile marker and respected by update commands — no more silent re-expansion to full on upgrade. A new CI lint gate enforces frontmatter-body consistency and profile closure safety. `--minimal` / `--core-only` remain as aliases for `--profile=core`. (#3408)

---
type: Added
pr: 3408
---
**Runtime skill surface toggle** — new slash command lets users enable/disable skill clusters and switch profiles without reinstalling. Sub-commands: `list` (show enabled/disabled skills + token cost), `status` (list + profile summary), `profile <name>` (apply a named profile), `disable/enable <cluster>` (toggle one of 10 named clusters), `reset` (return to install-time profile). State persists to a skills state file independently of the install-time profile marker. Backed by engine and cluster definitions. (#3408)

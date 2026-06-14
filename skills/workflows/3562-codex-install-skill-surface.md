---
type: Fixed
pr: 3568
---

**Global install now produces discoverable skill surface** — the installer now correctly generates skill files so the AI CLI can discover and expose commands. Previously, skill generation was being bypassed under the assumption that auto-discovery from workflow/agent files would work, but that assumption did not hold. The fix re-wires the existing skill generation helper into the install dispatch path so it produces the same skill-shape as other CLI installs already do (one `skills/gsd-<name>/SKILL.md` per `commands/gsd/*.md`). Pre-existing user-owned non-`gsd-*` skill directories are preserved. Closes #3562.

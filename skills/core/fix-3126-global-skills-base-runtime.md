---
type: Fixed
pr: 3126
---
**`global:` skill resolution now uses the correct runtime home directory** — skill lookup was hardcoded to a single runtime path regardless of the active AI CLI, causing every `global:` skill lookup to silently fail on other runtimes. Introduces a runtime-to-directory mapping module covering all supported runtimes with their canonical env-var overrides. Warning messages now show the actual runtime-specific path. Closes #3126.

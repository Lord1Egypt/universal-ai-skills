# /sync-agents-md - Regenerate AGENTS.md from the AI.md

**Synchronize AGENTS.md with current the AI.md using the the AI coding agent-cli-bridge skill.**

---

## Usage

```
/sync-agents-md
/sync-agents-md --validate
/sync-agents-md --status
```

---

## What This Command Does

**Default** (`/sync-agents-md`):
- Runs the **the AI coding agent-cli-bridge** skill
- Validates environment (the AI coding agent CLI + the AI.md)
- Parses the AI.md and project structure
- Regenerates AGENTS.md with latest changes
- Overwrites existing AGENTS.md

**With `--validate`**:
- Validates environment only (no regeneration)
- Checks the AI coding agent CLI installation
- Checks the AI.md exists
- Shows status report

**With `--status`**:
- Shows current sync status
- Displays when AGENTS.md was last updated
- Lists documented skills and agents

---

## When to Use

**Run this command when**:
- ✅ the AI.md has been updated
- ✅ New skills added to `.the AI/skills/`
- ✅ New agents added to `.the AI/agents/`
- ✅ Project structure changed
- ✅ AGENTS.md is out of sync
- ✅ Team needs latest the AI coding agent CLI documentation

**Don't need to run when**:
- ❌ Only code changes (no config changes)
- ❌ AGENTS.md already current
- ❌ Working only with the AI coding agent (not the AI coding agent CLI)

---

## How It Works

### Step 1: Environment Validation
```
🔍 Checking the AI coding agent CLI installation...
   ✅ Found: /path/to/the AI coding agent
   Version: the AI coding agent-cli 0.50.0

📄 Checking the AI.md...
   ✅ Found: /project/the AI.md

✅ All safety checks passed!
```

### Step 2: Project Analysis
```
📖 Parsing the AI coding agent project...
   ✅ Found 13 skills
   ✅ Found 59 agents
   ✅ Found 58 the AI.md sections

📊 Project: your-project
📁 Type: GREENFIELD_NEW
```

### Step 3: AGENTS.md Generation
```
📝 Generating AGENTS.md...
   ✅ AGENTS.md generated successfully

📄 Output: /project/AGENTS.md
📊 Skills documented: 13
🤖 Agents documented: 59
```

---

## Examples

### Example 1: Basic Sync

**User**:
```
/sync-agents-md
```

**What happens**:
1. Validates the AI coding agent CLI installed
2. Checks the AI.md exists
3. Parses project structure
4. Regenerates AGENTS.md
5. Success message with statistics

**Output**:
```
✅ SUCCESS - AGENTS.MD REGENERATED

📄 Output: AGENTS.md
📊 Skills documented: 13
🤖 Agents documented: 59

AGENTS.md is now in sync with the AI.md
```

---

### Example 2: Validate Only

**User**:
```
/sync-agents-md --validate
```

**What happens**:
1. Checks the AI coding agent CLI installation
2. Checks the AI.md exists
3. Shows status report
4. **Does NOT regenerate AGENTS.md**

**Output**:
```
✅ VALIDATION PASSED

Environment is ready for AGENTS.md generation.

the AI coding agent CLI: v0.50.0 ✅
the AI.md: Found ✅
AGENTS.md: Exists (last updated: 2025-10-30)

To regenerate: /sync-agents-md
```

---

### Example 3: Status Check

**User**:
```
/sync-agents-md --status
```

**What happens**:
Shows current project status

**Output**:
```
📊 SYNC STATUS

Project: the AI-code-skills-factory
the AI.md: ✅ Exists
AGENTS.md: ✅ Exists (in sync)
Last updated: 2025-10-30 15:52

Skills: 13 (8 functional, 5 prompt-based)
Agents: 59
the AI coding agent CLI: v0.50.0 installed
```

---

## What Gets Updated

When you run `/sync-agents-md`, the following sections in AGENTS.md are regenerated:

### ✅ Updated Sections

1. **Project Overview**
   - From the AI.md Repository Purpose section
   - Project type (GREENFIELD_NEW, etc.)
   - Description

2. **Available Skills**
   - All skills from `.the AI/skills/`
   - Skills from `~/.the AI/skills/`
   - Generated skills from `generated-skills/`
   - With the AI coding agent CLI usage examples

3. **Project Structure**
   - Current folder layout
   - Key files
   - Documentation references

4. **Workflow Patterns**
   - Slash commands → the AI coding agent CLI equivalents
   - Based on the AI.md workflows section

5. **Command Reference**
   - Updated command mapping table
   - the AI coding agent ↔ the AI coding agent CLI

### ❌ What Doesn't Change

- Skill implementation files (unchanged)
- the AI.md (source of truth)
- Project code
- Documentation files (just referenced)

---

## Common Workflows

### Workflow 1: After Updating the AI.md

```
# 1. Edit the AI.md
vim the AI.md

# 2. Sync AGENTS.md
/sync-agents-md

# 3. Commit both files
git add the AI.md AGENTS.md
git commit -m "docs: Update project configuration"
```

---

### Workflow 2: After Adding New Skill

```
# 1. Create skill
/build skill
[Generated: .the AI/skills/my-new-skill]

# 2. Sync AGENTS.md (documents new skill)
/sync-agents-md

# 3. Verify
cat AGENTS.md | grep "my-new-skill"
```

---

### Workflow 3: Validate Before CI/CD

```
# In CI/CD pipeline

# 1. Validate environment
/sync-agents-md --validate

# 2. If valid, proceed with build
# 3. If invalid, fail pipeline
```

---

## Integration with Other Commands

This command works seamlessly with:

### `/init` - Auto-sync after initialization
```
/init
→ Creates the AI.md
→ Auto-runs /sync-agents-md
→ Both files ready
```

### `/update-the AI` - Auto-sync after update
```
/update-the AI
→ Updates the AI.md
→ Auto-runs /sync-agents-md
→ AGENTS.md stays in sync
```

### `/check-docs` - Validates sync status
```
/check-docs
→ Checks the AI.md current
→ Checks AGENTS.md in sync
→ Suggests /sync-agents-md if needed
```

---

## Troubleshooting

### Error: "the AI coding agent CLI not found"

**Symptom**:
```
❌ the AI coding agent CLI not found!
```

**Solution**:
```bash
# Install the AI coding agent CLI
# Visit: https://github.com/the AI provider/the AI coding agent

# Verify
the AI coding agent --version
```

---

### Error: "the AI.md not found"

**Symptom**:
```
⚠️  the AI.md not found
```

**Solution**:
```
# Option 1: Run /init to create the AI.md
/init

# Option 2: Create manually
# Then run /sync-agents-md
```

---

### AGENTS.md Out of Date

**Symptom**: Changes to the AI.md not reflected in AGENTS.md

**Solution**:
```
# Simply regenerate
/sync-agents-md

# AGENTS.md now updated with latest changes
```

---

### Permission Denied

**Symptom**:
```
❌ Failed to write AGENTS.md: Permission denied
```

**Solution**:
```bash
# Check permissions
ls -l AGENTS.md

# Fix if needed
chmod 644 AGENTS.md

# Try again
/sync-agents-md
```

---

## Best Practices

### 1. Keep the AI.md as Source of Truth

✅ **DO**:
- Edit the AI.md for all configuration changes
- Run `/sync-agents-md` after editing
- Commit both the AI.md and AGENTS.md together

❌ **DON'T**:
- Edit AGENTS.md directly (will be overwritten)
- Forget to sync after the AI.md changes
- Commit the AI.md without regenerating AGENTS.md

---

### 2. Sync After Major Changes

**Always sync when**:
- Adding/removing skills
- Updating project description
- Changing project type
- Modifying workflows
- Adding agents

---

### 3. Validate in CI/CD

```yaml
# .github/workflows/validate-docs.yml
name: Validate Documentation

on: [push, pull_request]

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - name: Validate AGENTS.md sync
        run: |
          # Regenerate AGENTS.md
          python generated-skills/the AI coding agent-cli-bridge/bridge.py

          # Check if changed
          git diff --exit-code AGENTS.md || {
            echo "❌ AGENTS.md is out of sync with the AI.md"
            echo "Run: /sync-agents-md"
            exit 1
          }
```

---

### 4. Use in Pre-commit Hook

```bash
# .git/hooks/pre-commit
#!/bin/bash

# Check if the AI.md was modified
if git diff --cached --name-only | grep -q "the AI.md"; then
  echo "the AI.md changed, regenerating AGENTS.md..."
  /sync-agents-md
  git add AGENTS.md
  echo "✅ AGENTS.md updated and staged"
fi
```

---

## Technical Details

**Command Type**: Slash command
**Skill Used**: the AI coding agent-cli-bridge
**Python Script**: `generated-skills/the AI coding agent-cli-bridge/bridge.py`
**Output**: AGENTS.md in project root
**Approach**: Reference-based (no file duplication)
**Sync Direction**: One-way (the AI.md → AGENTS.md)

---

## Related Commands

| Command | Purpose |
|---------|---------|
| `/init` | Initialize project with the AI.md (auto-syncs AGENTS.md) |
| `/update-the AI` | Update the AI.md from code changes (auto-syncs AGENTS.md) |
| `/check-docs` | Validate all documentation is current |
| `/sync-agents-md` | Manually regenerate AGENTS.md |

---

## See Also

- **SKILL.md**: the AI coding agent-cli-bridge skill documentation
- **HOW_TO_USE.md**: Comprehensive usage guide
- **AGENTS.md**: Example output (this repository)
- **the AI.md**: Source configuration file

---

**Version**: 1.0.0
**Last Updated**: 2025-10-30
**Maintained For**: Cross-tool team collaboration (the AI coding agent ↔ the AI coding agent CLI)

---

**Keep your documentation in sync!** 🔄

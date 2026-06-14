# Installation Guide - the AI coding agent CLI Bridge Skill

Complete installation instructions for the the AI coding agent CLI Bridge skill.

---

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Installation Methods](#installation-methods)
3. [Verification](#verification)
4. [Configuration](#configuration)
5. [Troubleshooting](#troubleshooting)
6. [Uninstallation](#uninstallation)

---

## Prerequisites

### Required

**1. the AI coding agent CLI (v0.48.0 or higher)**

```bash
# Check if installed
the AI coding agent --version

# Should output: the AI coding agent-cli 0.48.0 or higher
```

**Installation**: Visit https://github.com/the AI provider/the AI coding agent for the AI coding agent CLI installation instructions.

**2. Python 3.7+**

```bash
# Check version
python3 --version

# Should output: Python 3.7.0 or higher
```

**3. PyYAML Library**

```bash
# Install PyYAML
pip3 install PyYAML

# Verify
python3 -c "import yaml; print('✅ PyYAML installed')"
```

### Optional

**1. the AI coding agent CLI** (for slash command integration)
```bash
# Check if installed
the AI --version
```

**2. Git** (for version control)
```bash
git --version
```

---

## Installation Methods

### Method 1: User-Level Installation (Recommended)

Install for your user account. Works across all projects.

```bash
# 1. Create skills directory (if doesn't exist)
mkdir -p ~/.the AI/skills

# 2. Copy skill to skills directory
cp -r /path/to/the AI coding agent-cli-bridge ~/.the AI/skills/

# 3. Verify installation
ls ~/.the AI/skills/the AI coding agent-cli-bridge
```

**Location**: `~/.the AI/skills/the AI coding agent-cli-bridge/`

**Accessible from**: All the AI coding agent projects

**Use when**: You want the skill available globally

---

### Method 2: Project-Level Installation

Install for a specific project only.

```bash
# 1. Navigate to your project
cd /your/project

# 2. Create project skills directory (if doesn't exist)
mkdir -p .the AI/skills

# 3. Copy skill to project
cp -r /path/to/the AI coding agent-cli-bridge .the AI/skills/

# 4. Verify installation
ls .the AI/skills/the AI coding agent-cli-bridge
```

**Location**: `/your/project/.the AI/skills/the AI coding agent-cli-bridge/`

**Accessible from**: This project only

**Use when**: Project-specific customization needed

---

### Method 3: Direct Use (No Installation)

Use the skill directly without copying.

```bash
# Run bridge.py directly
python3 /path/to/the AI coding agent-cli-bridge/bridge.py --project /your/project
```

**Location**: Original location

**Accessible from**: Anywhere (specify full path)

**Use when**: Testing or one-time use

---

### Method 4: Add to PATH

Add bridge.py to your PATH for easy access.

```bash
# 1. Add to PATH (in ~/.bashrc or ~/.zshrc)
echo 'export PATH="$PATH:/path/to/the AI coding agent-cli-bridge"' >> ~/.bashrc

# 2. Reload shell
source ~/.bashrc

# 3. Make bridge.py executable
chmod +x /path/to/the AI coding agent-cli-bridge/bridge.py

# 4. Use from anywhere
bridge.py --project /any/project
```

**Location**: Original location (linked via PATH)

**Accessible from**: Anywhere via command line

**Use when**: Frequent command-line use

---

## Verification

### Step 1: Verify Prerequisites

```bash
# Check all prerequisites
the AI coding agent --version          # the AI coding agent CLI
python3 --version        # Python
python3 -c "import yaml" # PyYAML
```

**Expected Output**:
```
the AI coding agent-cli 0.50.0
Python 3.10.0
(no output = PyYAML installed)
```

---

### Step 2: Verify Skill Installation

```bash
# Check skill files exist
ls ~/.the AI/skills/the AI coding agent-cli-bridge/

# Should show:
# SKILL.md
# bridge.py
# safety_mechanism.py
# ai_parser.py
# project_analyzer.py
# agents_md_generator.py
# skill_documenter.py
# codex_executor.py
# README.md
# HOW_TO_USE.md
# ...
```

---

### Step 3: Run Validation

```bash
# Navigate to skill directory
cd ~/.the AI/skills/the AI coding agent-cli-bridge

# Run validation
python3 bridge.py --validate
```

**Expected Output**:
```
================================================================
the AI coding agent CLI BRIDGE - VALIDATION ONLY
================================================================

🔍 Running safety checks...

📦 Checking the AI coding agent CLI installation...
   ✅ the AI coding agent CLI installed and working

📄 Checking the AI.md...
   ✅ the AI.md exists (or can be created)

✅ All safety checks passed!

================================================================
✅ VALIDATION PASSED
================================================================
```

---

### Step 4: Test Generation

```bash
# Create test directory
mkdir -p /tmp/test-bridge
cd /tmp/test-bridge

# Create minimal the AI.md
echo "# the AI.md\n\nTest project" > the AI.md

# Run bridge
python3 ~/.the AI/skills/the AI coding agent-cli-bridge/bridge.py

# Check output
ls -lh AGENTS.md
```

**Expected Output**:
```
✅ SUCCESS - AGENTS.MD GENERATED

📄 Output: AGENTS.md
📊 Skills documented: 0
🤖 Agents documented: 0
```

---

## Configuration

### Default Configuration

No configuration needed. The skill works out of the box with sensible defaults:

- **Auto-init**: Enabled (creates the AI.md if missing)
- **Output**: AGENTS.md in project root
- **Approach**: Reference-based (no duplication)
- **Model**: Intelligent selection (an AI model vs an AI model-the AI coding agent)

### Optional Configuration

#### 1. Disable Auto-Init

```bash
# Run without auto-init
python3 bridge.py --no-auto-init
```

#### 2. Custom Python Path

If using non-standard Python:

```bash
# Edit bridge.py shebang (first line)
#!/usr/bin/env python3.10
```

#### 3. Environment Variables

```bash
# Set custom the AI coding agent CLI path
export CODEX_CLI_PATH=/custom/path/to/the AI coding agent

# Set custom skill path
export CODEX_BRIDGE_SKILL=/custom/path/to/the AI coding agent-cli-bridge
```

---

## Slash Command Installation

### Install /sync-agents-md Command

```bash
# Copy slash command to the AI commands directory
cp /path/to/the AI coding agent-cli-bridge/.the AI/commands/sync-agents-md.md \
   ~/.the AI/commands/
```

**Verify**:
```bash
# In the AI coding agent
/sync-agents-md --help
```

---

### Install /the AI coding agent-exec Command

```bash
# Copy slash command
cp /path/to/the AI coding agent-cli-bridge/.the AI/commands/the AI coding agent-exec.md \
   ~/.the AI/commands/
```

**Verify**:
```bash
# In the AI coding agent
/the AI coding agent-exec --help
```

---

## Troubleshooting Installation

### Issue 1: "ModuleNotFoundError: No module named 'yaml'"

**Problem**: PyYAML not installed

**Solution**:
```bash
# Install PyYAML
pip3 install PyYAML

# Or with user flag
pip3 install --user PyYAML

# Or with system packages (if needed)
pip3 install PyYAML --break-system-packages
```

---

### Issue 2: "Permission denied" when copying

**Problem**: No write permission to target directory

**Solution**:
```bash
# Use sudo for system directories
sudo cp -r the AI coding agent-cli-bridge /usr/local/lib/the AI/skills/

# Or use user directory
cp -r the AI coding agent-cli-bridge ~/.the AI/skills/

# Or change permissions
sudo chown -R $USER ~/.the AI
```

---

### Issue 3: "Command not found: bridge.py"

**Problem**: bridge.py not executable or not in PATH

**Solution**:
```bash
# Make executable
chmod +x ~/.the AI/skills/the AI coding agent-cli-bridge/bridge.py

# Or use python explicitly
python3 ~/.the AI/skills/the AI coding agent-cli-bridge/bridge.py
```

---

### Issue 4: the AI coding agent CLI not found during validation

**Problem**: the AI coding agent CLI not installed or not in PATH

**Solution**:
```bash
# Check if installed
which the AI coding agent

# If not found, install the AI coding agent CLI
# Visit: https://github.com/the AI provider/the AI coding agent

# Add to PATH if needed
export PATH="$PATH:/path/to/the AI coding agent/directory"
```

---

### Issue 5: Skill not auto-loaded by the AI coding agent

**Problem**: Skill in wrong directory or missing SKILL.md

**Solution**:
```bash
# 1. Check location
ls ~/.the AI/skills/the AI coding agent-cli-bridge/SKILL.md

# 2. Verify YAML frontmatter
head -5 ~/.the AI/skills/the AI coding agent-cli-bridge/SKILL.md

# Should show:
# ---
# name: the AI coding agent-cli-bridge
# description: ...
# ---

# 3. Restart the AI coding agent
```

---

## Uninstallation

### Remove User-Level Installation

```bash
# Remove skill directory
rm -rf ~/.the AI/skills/the AI coding agent-cli-bridge

# Remove slash commands
rm ~/.the AI/commands/sync-agents-md.md
rm ~/.the AI/commands/the AI coding agent-exec.md

# Verify removal
ls ~/.the AI/skills/ | grep the AI coding agent-cli-bridge
# (should output nothing)
```

---

### Remove Project-Level Installation

```bash
# Navigate to project
cd /your/project

# Remove skill
rm -rf .the AI/skills/the AI coding agent-cli-bridge

# Verify removal
ls .the AI/skills/ | grep the AI coding agent-cli-bridge
# (should output nothing)
```

---

### Remove PATH Configuration

```bash
# Edit ~/.bashrc or ~/.zshrc
# Remove line:
# export PATH="$PATH:/path/to/the AI coding agent-cli-bridge"

# Reload shell
source ~/.bashrc
```

---

### Clean Up Generated Files

```bash
# Optionally remove generated AGENTS.md files
# WARNING: This removes your generated documentation!

# Find all AGENTS.md files
find . -name "AGENTS.md" -type f

# Remove if desired
find . -name "AGENTS.md" -type f -delete
```

---

## Upgrade

### From v1.0.0 to Future Versions

```bash
# 1. Backup current installation
cp -r ~/.the AI/skills/the AI coding agent-cli-bridge \
      ~/.the AI/skills/the AI coding agent-cli-bridge.backup

# 2. Remove old version
rm -rf ~/.the AI/skills/the AI coding agent-cli-bridge

# 3. Install new version
cp -r /path/to/new/the AI coding agent-cli-bridge ~/.the AI/skills/

# 4. Verify new version
python3 ~/.the AI/skills/the AI coding agent-cli-bridge/bridge.py --help
```

---

## Post-Installation

### Next Steps

After installation:

1. **Read Documentation**:
   ```bash
   cat ~/.the AI/skills/the AI coding agent-cli-bridge/README.md
   cat ~/.the AI/skills/the AI coding agent-cli-bridge/HOW_TO_USE.md
   ```

2. **Generate AGENTS.md for First Project**:
   ```bash
   cd /your/project
   python3 ~/.the AI/skills/the AI coding agent-cli-bridge/bridge.py
   ```

3. **Test Slash Commands** (if installed):
   ```bash
   # In the AI coding agent
   /sync-agents-md --validate
   /the AI coding agent-exec --help
   ```

4. **Read Examples**:
   ```bash
   cat ~/.the AI/skills/the AI coding agent-cli-bridge/sample_input.json
   cat ~/.the AI/skills/the AI coding agent-cli-bridge/expected_output.json
   ```

---

## System Requirements

| Component | Minimum | Recommended |
|-----------|---------|-------------|
| OS | macOS, Linux, Windows (WSL) | macOS, Linux |
| Python | 3.7 | 3.10+ |
| the AI coding agent CLI | 0.48.0 | 0.50.0+ |
| Disk Space | 1 MB | 5 MB |
| RAM | 100 MB | 250 MB |

---

## Support

**Installation Issues**:
- Check [HOW_TO_USE.md](./HOW_TO_USE.md) troubleshooting section
- Review [README.md](./README.md) for quick start
- Verify all prerequisites met

**Bug Reports**:
- GitHub Issues: https://github.com/your-repo/issues

**Feature Requests**:
- GitHub Issues: https://github.com/your-repo/issues

---

## License

Apache 2.0 - See LICENSE file

---

**Installation complete! Ready to bridge the AI coding agent and the AI coding agent CLI!** 🎉

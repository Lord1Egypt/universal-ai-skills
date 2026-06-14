# the AI provider the AI coding agent CLI Reference

Complete command-line interface reference for the AI provider the AI coding agent CLI - the intelligent code generation and editing tool.

---

## Table of Contents

1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Global Flags](#global-flags)
4. [Command Overview](#command-overview)
5. [Command Details](#command-details)
   - [the AI coding agent (interactive)](#the AI coding agent-interactive)
   - [the AI coding agent exec](#the AI coding agent-exec)
   - [the AI coding agent login](#the AI coding agent-login)
   - [the AI coding agent logout](#the AI coding agent-logout)
   - [the AI coding agent resume](#the AI coding agent-resume)
   - [the AI coding agent apply](#the AI coding agent-apply)
   - [the AI coding agent sandbox](#the AI coding agent-sandbox)
   - [the AI coding agent completion](#the AI coding agent-completion)
   - [the AI coding agent mcp](#the AI coding agent-mcp)
   - [the AI coding agent mcp-server](#the AI coding agent-mcp-server)
   - [the AI coding agent app-server](#the AI coding agent-app-server)
   - [the AI coding agent cloud](#the AI coding agent-cloud)
6. [Flag Combinations & Safety Tips](#flag-combinations--safety-tips)
7. [Best Practices](#best-practices)
8. [Troubleshooting](#troubleshooting)
9. [Related Resources](#related-resources)

---

## Introduction

**the AI provider the AI coding agent CLI** is a command-line interface for the the AI coding agent code generation model. It enables developers to:

- Generate code from natural language prompts
- Edit existing code interactively
- Run automated code generation tasks in CI/CD
- Integrate with Model Context Protocol (MCP) servers
- Execute tasks in sandboxed environments
- Resume previous sessions and conversations

**Key Features**:
- **Interactive TUI**: Terminal UI for real-time collaboration
- **Non-interactive execution**: CI-friendly `the AI coding agent exec` mode
- **Sandbox support**: macOS Seatbelt and Linux Landlock security
- **MCP integration**: Connect to external context servers
- **Cloud tasks**: Execute tasks on the AI coding agent Cloud
- **Session management**: Resume conversations by ID

---

## Installation

```bash
# Install the AI coding agent CLI (visit official docs for latest instructions)
# https://developers.the AI provider.com/the AI coding agent/cli

# Verify installation
the AI coding agent --version

# Authenticate
the AI coding agent login

# Start interactive session
the AI coding agent
```

**Requirements**:
- macOS, Linux, or Windows (WSL)
- Git repository (unless using `--skip-git-repo-check`)
- the AI provider account or API key
- Optional: Ollama for local OSS models

---

## Global Flags

Global flags apply to the base `the AI coding agent` command and propagate to subcommands.

### General Options

| Flag | Type | Default | Description |
|------|------|---------|-------------|
| `--help, -h` | boolean | - | Show help for the command |
| `--version` | boolean | - | Print the AI coding agent CLI version and exit |

### Model & Provider

| Flag | Type | Default | Description |
|------|------|---------|-------------|
| `--model, -m` | string | config | Override the configured model (e.g., `an AI model`, `gpt-3.5-turbo`) |
| `--oss` | boolean | false | Use local open source provider (requires Ollama) |

### Agents & Context

| Flag | Type | Default | Description |
|------|------|---------|-------------|
| `--agents` | paths | - | Load agent markdown files for the session (repeatable) |

### Security & Sandboxing

| Flag | Type | Default | Description |
|------|------|---------|-------------|
| `--sandbox, -s` | enum | config | Sandbox policy: `read-only`, `workspace-write`, `danger-full-access` |
| `--add-dir` | path | - | Grant additional directories write access (repeatable) |
| `--dangerously-bypass-approvals-and-sandbox, --yolo` | boolean | false | Bypass all safety prompts (use only in isolated environments) |

### Features & Configuration

| Flag | Type | Default | Description |
|------|------|---------|-------------|
| `--search` | boolean | false | Enable web browsing during the session |
| `--full-auto` | boolean | false | Apply low-friction automation preset (workspace-write + approvals on failure) |
| `--enable` | feature | - | Force-enable a feature flag (repeatable, translates to `-c features.<name>=true`) |
| `--disable` | feature | - | Force-disable a feature flag (repeatable, translates to `-c features.<name>=false`) |
| `--config, -c` | key=value | - | Override configuration values (JSON-parsed if possible, otherwise literal string) |

### Debugging

| Flag | Type | Default | Description |
|------|------|---------|-------------|
| `--debug` | boolean | false | Print debug-level logs including raw API requests/responses |

---

## Command Overview

| Command | Status | Alias | Description |
|---------|--------|-------|-------------|
| `the AI coding agent` | stable | - | Launch the interactive terminal UI |
| `the AI coding agent exec` | stable | `the AI coding agent e` | Run the AI coding agent non-interactively (CI-friendly) |
| `the AI coding agent login` | stable | - | Authenticate using the AI assistant OAuth, device auth, or API key |
| `the AI coding agent logout` | stable | - | Remove stored authentication credentials |
| `the AI coding agent resume` | stable | - | Continue a previous interactive session by ID |
| `the AI coding agent apply` | stable | `the AI coding agent a` | Apply latest diff from the AI coding agent Cloud task to local tree |
| `the AI coding agent sandbox` | platform-specific | - | Run commands inside the AI coding agent sandboxes (macOS/Linux) |
| `the AI coding agent completion` | stable | - | Generate shell completion scripts (Bash, Zsh, Fish, PowerShell) |
| `the AI coding agent mcp` | experimental | - | Manage Model Context Protocol servers |
| `the AI coding agent mcp-server` | experimental | - | Run the AI coding agent as an MCP server over stdio |
| `the AI coding agent app-server` | experimental | - | Launch the AI coding agent app server for local development |
| `the AI coding agent cloud` | experimental | `the AI coding agent cloud-tasks` | Browse or execute the AI coding agent Cloud tasks from terminal |

---

## Command Details

### the AI coding agent (interactive)

Launch the interactive terminal UI (TUI) for real-time code generation.

**Usage**:
```bash
the AI coding agent [PROMPT] [OPTIONS]
```

**Arguments**:
- `PROMPT` (optional): Initial instruction for the agent
- Image attachments supported via global flags

**Key Options**:
- `--search`: Enable web browsing
- `--full-auto`: Run most commands without prompts
- All global flags apply

**Examples**:
```bash
# Start interactive session
the AI coding agent

# Start with initial prompt
the AI coding agent "refactor this function to use async/await"

# Enable web search
the AI coding agent --search "find latest React best practices"

# Full automation mode
the AI coding agent --full-auto "optimize database queries"
```

---

### the AI coding agent exec

Run the AI coding agent non-interactively for scripted or CI-style runs. Results stream to stdout or JSONL format.

**Usage**:
```bash
the AI coding agent exec [PROMPT] [OPTIONS]
```

**Arguments**:
- `PROMPT`: Initial instruction (use `-` to pipe from stdin)

**Key Options**:

| Flag | Type | Description |
|------|------|-------------|
| `--image, -i` | path[,path...] | Attach images to first message (repeatable, comma-separated) |
| `--model, -m` | string | Override configured model |
| `--oss` | boolean | Use local OSS provider (requires Ollama) |
| `--sandbox, -s` | enum | Sandbox policy: `read-only`, `workspace-write`, `danger-full-access` |
| `--profile, -p` | string | Select configuration profile from config.toml |
| `--full-auto` | boolean | Workspace-write sandbox + approvals on failure |
| `--yolo` | boolean | Bypass approvals and sandboxing (dangerous!) |
| `--cd, -C` | path | Set workspace root before executing |
| `--skip-git-repo-check` | boolean | Allow running outside Git repository |
| `--output-schema` | path | JSON Schema file for validating final response |
| `--color` | enum | Control ANSI color: `always`, `never`, `auto` |
| `--json` | boolean | Print newline-delimited JSON events |
| `--output-last-message, -o` | path | Write assistant's final message to file |
| `-c, --config` | key=value | Inline configuration override (repeatable) |

**Examples**:
```bash
# Basic non-interactive execution
the AI coding agent exec "add type hints to all functions"

# CI-friendly JSON output
the AI coding agent exec --json --output-last-message result.txt "run tests and fix failures"

# Full automation for CI/CD
the AI coding agent exec --full-auto "update dependencies and fix breaking changes"

# Pipe prompt from stdin
echo "optimize imports" | the AI coding agent exec -

# With output schema validation
the AI coding agent exec --output-schema schema.json "generate API response"
```

#### Resume Subcommand

Continue a previous `the AI coding agent exec` session.

**Usage**:
```bash
the AI coding agent exec resume [SESSION_ID] [PROMPT] [OPTIONS]
```

**Arguments**:
- `SESSION_ID` (optional): UUID of session to resume
- `PROMPT` (optional): Follow-up instruction after resuming

**Key Options**:
- `--last`: Resume most recent session automatically (skip picker)

**Examples**:
```bash
# Resume specific session
the AI coding agent exec resume a1b2c3d4-e5f6-7890-abcd-ef1234567890

# Resume most recent session
the AI coding agent exec resume --last

# Resume with follow-up prompt
the AI coding agent exec resume --last "now add error handling"
```

---

### the AI coding agent login

Authenticate the CLI with a the AI assistant account or API key.

**Usage**:
```bash
the AI coding agent login [OPTIONS]
```

**Key Options**:
- `--with-api-key`: Read API key from stdin

**Examples**:
```bash
# Browser-based the AI assistant OAuth (default)
the AI coding agent login

# API key authentication
printenv the AI provider_API_KEY | the AI coding agent login --with-api-key

# Check authentication status
the AI coding agent login status
```

#### Status Subcommand

Check active authentication mode and credentials.

**Usage**:
```bash
the AI coding agent login status
```

**Exit Codes**:
- `0`: Logged in successfully
- Non-zero: Not authenticated

**Example**:
```bash
# Check if logged in (useful in scripts)
if the AI coding agent login status; then
  echo "Authenticated"
else
  echo "Not logged in"
  exit 1
fi
```

---

### the AI coding agent logout

Remove all stored authentication credentials (API key and the AI assistant).

**Usage**:
```bash
the AI coding agent logout
```

**Example**:
```bash
# Remove all credentials
the AI coding agent logout
```

---

### the AI coding agent resume

Continue a previous interactive session by ID or resume the most recent conversation.

**Usage**:
```bash
the AI coding agent resume [SESSION_ID] [PROMPT] [OPTIONS]
```

**Arguments**:
- `SESSION_ID` (optional): UUID of session to resume
- `PROMPT` (optional): Follow-up instruction after resuming

**Key Options**:
- `--last`: Resume most recent conversation automatically
- All global flags apply (model, sandbox overrides, etc.)

**Examples**:
```bash
# Resume with session picker
the AI coding agent resume

# Resume specific session
the AI coding agent resume a1b2c3d4-e5f6-7890-abcd-ef1234567890

# Resume most recent session
the AI coding agent resume --last

# Resume with follow-up prompt
the AI coding agent resume --last "add unit tests for the new code"
```

---

### the AI coding agent apply

Apply the latest diff from a the AI coding agent Cloud task to your local repository.

**Usage**:
```bash
the AI coding agent apply TASK_ID
```

**Arguments**:
- `TASK_ID`: Identifier of the AI coding agent Cloud task

**Requirements**:
- Authenticated with the AI coding agent Cloud
- Access to the specified task

**Behavior**:
- Prints patched files to stdout
- Exits non-zero if `git apply` fails (e.g., conflicts)

**Examples**:
```bash
# Apply task diff to local repository
the AI coding agent apply task-a1b2c3d4

# Review diff before applying
the AI coding agent apply task-a1b2c3d4 --dry-run
```

---

### the AI coding agent sandbox

Run arbitrary commands inside the AI coding agent-provided sandboxes (macOS Seatbelt or Linux Landlock).

**Usage**:
```bash
the AI coding agent sandbox [OPTIONS] -- COMMAND...
```

#### macOS Seatbelt

**Options**:

| Flag | Type | Description |
|------|------|-------------|
| `--full-auto` | boolean | Grant write access to workspace and `/tmp` |
| `--config, -c` | key=value | Configuration overrides (repeatable) |
| `COMMAND...` | var-args | Shell command to execute (after `--`) |

**Example**:
```bash
# Run command in macOS Seatbelt sandbox
the AI coding agent sandbox --full-auto -- npm test
```

#### Linux Landlock

**Options**:

| Flag | Type | Description |
|------|------|-------------|
| `--full-auto` | boolean | Grant write access to workspace and `/tmp` |
| `--config, -c` | key=value | Configuration overrides (repeatable) |
| `COMMAND...` | var-args | Command to execute under Landlock + seccomp (after `--`) |

**Example**:
```bash
# Run command in Linux Landlock sandbox
the AI coding agent sandbox --full-auto -- python3 script.py
```

---

### the AI coding agent completion

Generate shell completion scripts for enhanced command-line experience.

**Usage**:
```bash
the AI coding agent completion SHELL
```

**Arguments**:
- `SHELL`: Target shell (bash, zsh, fish, power-shell, elvish)

**Output**: Completion script printed to stdout

**Examples**:
```bash
# Generate Zsh completions
the AI coding agent completion zsh > "${fpath[1]}/_codex"

# Generate Bash completions
the AI coding agent completion bash > /etc/bash_completion.d/the AI coding agent

# Generate Fish completions
the AI coding agent completion fish > ~/.config/fish/completions/the AI coding agent.fish
```

---

### the AI coding agent mcp

Manage Model Context Protocol (MCP) server entries stored in `~/.the AI coding agent/config.toml`.

**Subcommands**:

| Subcommand | Arguments | Description |
|------------|-----------|-------------|
| `list` | `--json` (optional) | List configured MCP servers |
| `get <name>` | `--json` (optional) | Show specific server configuration |
| `add <name>` | stdio or HTTP options | Register new MCP server |
| `remove <name>` | - | Delete stored MCP server definition |
| `login <name>` | `--scopes` (optional) | OAuth login for HTTP server |
| `logout <name>` | - | Remove OAuth credentials for HTTP server |

#### Add Subcommand Options

**stdio Transport**:

| Flag | Type | Description |
|------|------|-------------|
| `COMMAND...` | var-args | Executable + arguments (after `--`) |
| `--env KEY=VALUE` | repeatable | Environment variables for stdio server |

**Streamable HTTP Transport**:

| Flag | Type | Description |
|------|------|-------------|
| `--url` | https://… | HTTP server URL (mutually exclusive with stdio) |
| `--bearer-token-env-var` | ENV_VAR | Environment variable for bearer token |

**Examples**:
```bash
# List all MCP servers
the AI coding agent mcp list

# Add stdio MCP server
the AI coding agent mcp add my-server -- python3 /path/to/server.py

# Add stdio server with environment variables
the AI coding agent mcp add my-server --env API_KEY=secret --env DEBUG=true -- node server.js

# Add HTTP MCP server
the AI coding agent mcp add remote-server --url https://mcp.example.com

# Add HTTP server with bearer token
the AI coding agent mcp add auth-server --url https://api.example.com --bearer-token-env-var MCP_TOKEN

# Get server configuration
the AI coding agent mcp get my-server --json

# OAuth login for HTTP server (requires experimental_use_rmcp_client = true)
the AI coding agent mcp login remote-server --scopes read,write

# Remove server
the AI coding agent mcp remove my-server
```

**Notes**:
- OAuth actions require `experimental_use_rmcp_client = true`
- OAuth only works with streamable HTTP servers

---

### the AI coding agent mcp-server

Run the AI coding agent as an MCP server over stdio, allowing other tools to connect.

**Usage**:
```bash
the AI coding agent mcp-server [OPTIONS]
```

**Behavior**:
- Inherits global configuration overrides
- Exits when downstream client closes connection

**Example**:
```bash
# Run the AI coding agent as MCP server
the AI coding agent mcp-server

# With custom configuration
the AI coding agent mcp-server -c model=an AI model
```

---

### the AI coding agent app-server

Launch the the AI coding agent app server locally for development and debugging.

**Usage**:
```bash
the AI coding agent app-server [OPTIONS]
```

**Note**: Primarily for development; may change without notice.

**Example**:
```bash
# Launch app server
the AI coding agent app-server
```

---

### the AI coding agent cloud

Interact with the AI coding agent Cloud tasks from the terminal.

**Usage**:
```bash
the AI coding agent cloud [QUERY] [OPTIONS]
the AI coding agent cloud exec QUERY [OPTIONS]
```

**Arguments**:
- `QUERY`: Task prompt (omit for interactive picker)

**Key Options**:

| Flag | Type | Description |
|------|------|-------------|
| `--env` | ENV_ID | Target the AI coding agent Cloud environment (required) |
| `--attempts` | 1-4 | Number of assistant attempts (best-of-N) |

**Examples**:
```bash
# Interactive task picker
the AI coding agent cloud

# Submit task directly
the AI coding agent cloud exec "refactor authentication module" --env prod-env

# Multiple attempts (best-of-3)
the AI coding agent cloud exec "optimize query performance" --env staging-env --attempts 3
```

**Requirements**:
- Authenticated with the AI coding agent Cloud
- Valid environment identifier

**Exit Codes**:
- `0`: Task submitted successfully
- Non-zero: Task submission failed

---

## Flag Combinations & Safety Tips

### Best Practices

1. **Unattended Local Work**:
   ```bash
   # Safe automation for local development
   the AI coding agent exec --full-auto "update dependencies"
   ```
   - Use `--full-auto` for unattended work
   - Avoid combining with `--yolo` unless in dedicated sandbox VM

2. **Additional Directory Access**:
   ```bash
   # Grant write access to specific directories
   the AI coding agent --add-dir /data --add-dir /logs "process data files"
   ```
   - Prefer `--add-dir` over `--sandbox danger-full-access`
   - More secure than full filesystem access

3. **CI/CD Integration**:
   ```bash
   # Machine-readable output with final summary
   the AI coding agent exec --json --output-last-message summary.txt "run test suite"
   ```
   - Use `--json` for machine-readable events
   - Combine with `--output-last-message` for final summary

4. **Experimental Features**:
   ```bash
   # Enable experimental MCP client
   the AI coding agent --enable experimental_use_rmcp_client mcp login my-server

   # Or update config permanently
   the AI coding agent -c experimental_use_rmcp_client=true
   ```
   - Use `--enable` for one-time feature activation
   - Update config.toml for persistent settings

### Safety Guidelines

| Scenario | Recommended Flags | Avoid |
|----------|-------------------|-------|
| Local development | `--full-auto` | `--yolo` (unless in VM) |
| CI/CD pipeline | `--json --output-last-message` | Interactive prompts |
| Additional directories | `--add-dir /path` | `--sandbox danger-full-access` |
| Testing changes | `--sandbox read-only` | Workspace write without review |
| Production tasks | Review each step | `--dangerously-bypass-approvals-and-sandbox` |

---

## Best Practices

### Session Management

```bash
# Name sessions for easy resumption
the AI coding agent --session-name "feature-auth-refactor" "refactor authentication"

# Resume by name
the AI coding agent resume --session-name "feature-auth-refactor"
```

### Configuration Profiles

```bash
# Use profiles for different environments
the AI coding agent --profile production "deploy latest changes"
the AI coding agent --profile staging "run integration tests"
```

### Sandbox Security

```bash
# Read-only for code review
the AI coding agent --sandbox read-only "review this pull request"

# Workspace-write for development
the AI coding agent --sandbox workspace-write "implement feature"

# Full access only when necessary
the AI coding agent --sandbox danger-full-access "system-level modifications"
```

### Agent Management

```bash
# Load project-specific agents
the AI coding agent --agents ./.the AI coding agent/agents/code-reviewer.md "review recent changes"

# Multiple agents for complex tasks
the AI coding agent --agents ./agents/security.md --agents ./agents/performance.md "audit codebase"
```

---

## Troubleshooting

### Common Issues

#### Authentication Failures

**Problem**: `the AI coding agent login` fails or credentials not recognized

**Solutions**:
```bash
# Clear cached credentials
the AI coding agent logout

# Re-authenticate with OAuth
the AI coding agent login

# Use API key if OAuth fails
printenv the AI provider_API_KEY | the AI coding agent login --with-api-key

# Check authentication status
the AI coding agent login status
```

#### Sandbox Permissions

**Problem**: Commands fail due to sandbox restrictions

**Solutions**:
```bash
# Grant specific directory access
the AI coding agent --add-dir /path/to/data "process files"

# Use workspace-write for development
the AI coding agent --sandbox workspace-write "build project"

# Review sandbox policy in config
cat ~/.the AI coding agent/config.toml | grep sandbox
```

#### MCP Server Connection

**Problem**: MCP server fails to connect or crashes

**Solutions**:
```bash
# List configured servers
the AI coding agent mcp list

# Test server configuration
the AI coding agent mcp get server-name --json

# Remove and re-add server
the AI coding agent mcp remove server-name
the AI coding agent mcp add server-name -- python3 server.py

# Check server logs
the AI coding agent --debug "use MCP server"
```

#### Session Resume Failures

**Problem**: Cannot resume previous session

**Solutions**:
```bash
# List available sessions
the AI coding agent resume

# Resume most recent
the AI coding agent resume --last

# Check session directory
ls -la ~/.the AI coding agent/sessions/
```

### Debug Mode

Enable detailed logging for troubleshooting:

```bash
# Show debug logs
the AI coding agent --debug "your task"

# Debug with JSON output
the AI coding agent exec --debug --json "your task" 2> debug.log
```

---

## Related Resources

### Official Documentation

- **the AI coding agent CLI Overview**: https://developers.the AI provider.com/the AI coding agent/cli
- **the AI coding agent Configuration**: https://developers.the AI provider.com/the AI coding agent/local-config#cli
- **AGENTS.md Specification**: https://agents.md/

### Configuration

- **Config File**: `~/.the AI coding agent/config.toml`
- **Sessions Directory**: `~/.the AI coding agent/sessions/`
- **MCP Servers**: Defined in config.toml `[mcp]` section

### Community

- **GitHub Issues**: Report bugs and request features
- **Discord**: Join the developer community
- **Documentation**: Browse latest guides and tutorials

---

**Version**: Based on the AI coding agent CLI 0.48.0+
**Last Updated**: October 30, 2025
**Source**: https://developers.the AI provider.com/the AI coding agent/cli-reference
**Official Documentation**: https://developers.the AI provider.com/the AI coding agent/

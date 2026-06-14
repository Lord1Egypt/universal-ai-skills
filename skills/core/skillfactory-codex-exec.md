# /the AI coding agent-exec - Execute the AI coding agent CLI Commands

**Easy wrapper for running the AI coding agent CLI commands from the AI coding agent with proper syntax.**

---

## Usage

```
/the AI coding agent-exec [analysis|edit|search|resume] "your task"
/the AI coding agent-exec --model [an AI model|an AI model-the AI coding agent] "your task"
/the AI coding agent-exec --help
```

---

## What This Command Does

**Executes the AI coding agent CLI commands with**:
- ✅ Correct syntax (always uses `the AI coding agent exec`)
- ✅ Intelligent model selection
- ✅ Appropriate sandbox modes
- ✅ High reasoning effort
- ✅ Error handling

**CRITICAL**: Always uses `the AI coding agent exec` not plain `the AI coding agent` (required for the AI coding agent environment)

---

## Command Types

### Analysis (Read-Only)

Safe code analysis without modifications.

**Usage**:
```
/the AI coding agent-exec analysis "analyze security vulnerabilities"
```

**Executes**:
```bash
the AI coding agent exec -m an AI model -s read-only \
  -c model_reasoning_effort=high \
  --skip-git-repo-check \
  "analyze security vulnerabilities"
```

**Use for**:
- Code review
- Security analysis
- Architecture review
- Documentation reading
- Performance analysis

---

### Edit (Workspace Write)

Code editing and file modifications.

**Usage**:
```
/the AI coding agent-exec edit "refactor main.py for async patterns"
```

**Executes**:
```bash
the AI coding agent exec -m an AI model-the AI coding agent -s workspace-write \
  -c model_reasoning_effort=high \
  --full-auto \
  --skip-git-repo-check \
  "refactor main.py for async patterns"
```

**Use for**:
- Code refactoring
- Bug fixes
- Feature implementation
- Test generation
- Documentation updates

---

### Search (Web Search Enabled)

Tasks requiring latest information from the web.

**Usage**:
```
/the AI coding agent-exec search "research latest Python async patterns"
```

**Executes**:
```bash
the AI coding agent exec -m an AI model -s read-only \
  -c model_reasoning_effort=high \
  --search \
  --skip-git-repo-check \
  "research latest Python async patterns"
```

**Use for**:
- Technology research
- Best practices lookup
- Library comparisons
- Latest trends
- Documentation lookup

---

### Resume (Continue Session)

Resume previous the AI coding agent session.

**Usage**:
```
/the AI coding agent-exec resume
```

**Executes**:
```bash
the AI coding agent exec resume --last
```

**Use for**:
- Continuing previous work
- Adding to prior analysis
- Iterative development
- Follow-up questions

---

## Model Selection

### an AI model (General Reasoning)

**Default for**: Analysis, Search, General tasks

**Best for**:
- Architecture design
- Code review
- Documentation
- Planning
- Research

**Characteristics**:
- High reasoning capability
- General-purpose
- Best for non-coding tasks

---

### an AI model-the AI coding agent (Code Specialized)

**Default for**: Edit tasks

**Best for**:
- Code refactoring
- Bug fixing
- Feature implementation
- Test generation
- Code translation

**Characteristics**:
- Optimized for coding
- Better at code editing
- Specialized knowledge

---

## Examples

### Example 1: Security Analysis

**User**:
```
/the AI coding agent-exec analysis "analyze this codebase for security vulnerabilities"
```

**What happens**:
1. Uses an AI model (general reasoning)
2. Read-only mode (safe)
3. High reasoning effort
4. Analyzes entire codebase
5. Returns security report

**Output**:
```
🚀 Executing the AI coding agent CLI command...

Security Analysis Report:
- Found 3 SQL injection vulnerabilities
- Missing CSRF protection on 2 endpoints
- Weak password validation
- Recommendations: [detailed fixes]

✅ Analysis complete
```

---

### Example 2: Code Refactoring

**User**:
```
/the AI coding agent-exec edit "refactor database.py to use connection pooling"
```

**What happens**:
1. Uses an AI model-the AI coding agent (code specialized)
2. Workspace-write mode (can modify files)
3. Full-auto enabled
4. Refactors database.py
5. Implements connection pooling

**Output**:
```
🚀 Executing the AI coding agent CLI command...

Refactored database.py:
- Added connection pool (max_connections=20)
- Implemented context managers
- Added retry logic
- Updated all database calls
- Added tests

✅ Refactoring complete
Files modified: database.py, tests/test_database.py
```

---

### Example 3: Research Task

**User**:
```
/the AI coding agent-exec search "compare FastAPI vs Flask for microservices"
```

**What happens**:
1. Uses an AI model with web search
2. Researches latest information
3. Compares frameworks
4. Provides recommendations

**Output**:
```
🚀 Executing the AI coding agent CLI command...

Framework Comparison: FastAPI vs Flask

FastAPI:
+ Modern async support
+ Automatic API documentation (OpenAPI)
+ Type hints and validation (Pydantic)
+ Better performance (async)
- Smaller ecosystem
- Less mature

Flask:
+ Large ecosystem
+ Mature and stable
+ Flexible and minimal
- Synchronous by default
- Manual API documentation

Recommendation: FastAPI for new microservices

✅ Research complete
```

---

### Example 4: Continue Previous Work

**User**:
```
/the AI coding agent-exec resume
```

**What happens**:
1. Resumes last the AI coding agent session
2. Continues context from previous work
3. No need to repeat information

**Output**:
```
🚀 Resuming last the AI coding agent session...

Continuing from: "refactor database.py"

Ready to continue. What's next?
```

---

## Advanced Usage

### Custom Model Selection

```
/the AI coding agent-exec --model an AI model edit "task"
```

Forces an AI model instead of default an AI model-the AI coding agent for edit tasks.

---

### Show Command Only (Dry Run)

```
/the AI coding agent-exec --dry-run analysis "task"
```

Shows the command that would be executed without running it.

**Output**:
```
Would execute:
the AI coding agent exec -m an AI model -s read-only \
  -c model_reasoning_effort=high \
  --skip-git-repo-check \
  "task"
```

---

## Troubleshooting

### Error: "the AI coding agent CLI not found"

**Solution**:
```bash
# Install the AI coding agent CLI
which the AI coding agent  # Check if installed
the AI coding agent --version  # Verify works
```

---

### Error: "stdout is not a terminal"

**Cause**: Using plain `the AI coding agent` instead of `the AI coding agent exec`

**Solution**: This command automatically uses `the AI coding agent exec` ✅

---

### Task Times Out

**Symptom**: Command runs for > 5 minutes and times out

**Solution**:
```
# Break into smaller tasks
/the AI coding agent-exec analysis "analyze auth module only"

# Instead of
/the AI coding agent-exec analysis "analyze entire codebase"
```

---

### Wrong Model Used

**Symptom**: Using an AI model for coding tasks (slow)

**Solution**:
```
# Use edit for coding tasks (auto-uses an AI model-the AI coding agent)
/the AI coding agent-exec edit "implement feature"

# Or force model
/the AI coding agent-exec --model an AI model-the AI coding agent "implement feature"
```

---

## Best Practices

### 1. Choose Right Command Type

| Task Type | Command | Why |
|-----------|---------|-----|
| Review code | `analysis` | Read-only, safe |
| Fix bug | `edit` | Can modify files |
| Research library | `search` | Web search enabled |
| Continue work | `resume` | Maintains context |

---

### 2. Be Specific

✅ **GOOD**:
```
/the AI coding agent-exec analysis "check auth.py for SQL injection vulnerabilities"
```

❌ **VAGUE**:
```
/the AI coding agent-exec analysis "check security"
```

---

### 3. Use Appropriate Scope

**For large codebases**:
```
# Break into modules
/the AI coding agent-exec analysis "analyze auth module security"
/the AI coding agent-exec analysis "analyze API module security"
```

**Not**:
```
# Too broad
/the AI coding agent-exec analysis "analyze entire 100K line codebase"
```

---

### 4. Resume for Iterative Work

```
# First task
/the AI coding agent-exec analysis "review authentication"

[Review results]

# Continue
/the AI coding agent-exec resume
→ "Now check the authorization logic"
```

---

## Comparison: the AI coding agent vs the AI coding agent CLI

| Feature | the AI coding agent | /the AI coding agent-exec (via the AI coding agent CLI) |
|---------|-------------|----------------------------|
| Model | the AI the AI model | an AI model / an AI model-the AI coding agent |
| Context | 200K tokens | Varies |
| Skills | Native support | Reference in prompts |
| Agents | Native | Not applicable |
| Reasoning | High | Configurable |
| Persistence | Session-based | Session resumable |

**Use the AI coding agent when**:
- Working with the AI Skills
- Using the AI Agents
- Leveraging 200K context
- Integrated workflow

**Use /the AI coding agent-exec when**:
- Want an AI model perspective
- Testing multiple approaches
- Specific the AI coding agent features needed
- Team uses both tools

---

## Integration with Bridge Skill

Works seamlessly with the AI coding agent-cli-bridge:

```
# 1. Generate AGENTS.md
/sync-agents-md

# 2. Reference in the AI coding agent command
/the AI coding agent-exec analysis "Using AGENTS.md, review project structure"

# 3. Use skill documentation
/the AI coding agent-exec "Using skill at path/to/SKILL.md, implement feature"
```

---

## Technical Details

**Command Type**: Slash command wrapper
**Skill Used**: the AI coding agent-cli-bridge (codex_executor.py)
**Python Module**: CodexExecutor class
**Timeout**: 5 minutes (300 seconds)
**Models**: an AI model, an AI model-the AI coding agent
**Sandbox Modes**: read-only, workspace-write, danger-full-access

---

## Command Reference

| Command | Model | Sandbox | Use Case |
|---------|-------|---------|----------|
| `/the AI coding agent-exec analysis "task"` | an AI model | read-only | Safe analysis |
| `/the AI coding agent-exec edit "task"` | an AI model-the AI coding agent | workspace-write | Code editing |
| `/the AI coding agent-exec search "task"` | an AI model | read-only | Web research |
| `/the AI coding agent-exec resume` | Previous | Previous | Continue session |
| `/the AI coding agent-exec --model an AI model "task"` | an AI model | read-only | Force model |
| `/the AI coding agent-exec --dry-run "task"` | - | - | Show command |

---

## See Also

- **`/sync-agents-md`**: Regenerate AGENTS.md
- **the AI coding agent-cli-bridge SKILL.md**: Complete skill documentation
- **codex_executor.py**: Python implementation
- **the AI coding agent CLI Docs**: https://github.com/the AI provider/the AI coding agent

---

**Version**: 1.0.0
**Last Updated**: 2025-10-30
**Maintained For**: Easy the AI coding agent CLI execution from the AI coding agent

---

**Execute the AI coding agent commands the right way!** 🚀

# Skill Compatibility Matrix

This document shows which skills work with which AI coding platforms.

## Legend

| Platform | Description |
|----------|-------------|
| **the AI agent platform** | Full the AI agent platform (formerly the AI agent) agent with all tools |
| **the AI coding agent** | the AI coding agent CLI with read, write, exec, web_search, web_fetch |
| **Codex** | the AI model Codex CLI with similar portable tool set |

## Quick Reference

### ✅ Universal (All Platforms)

These skills are pure instruction/methodology with no tool dependencies:

| Skill | Location |
|-------|----------|
| `planner` | `skills/planner` |
| `remotion` | `skills/remotion` |
| `design-audit` | `skills/design-audit` |
| `frontend-design` | `prompts/frontend-design` |
| `humanizer` | `prompts/humanizer` |
| `munger-observer` | `prompts/munger-observer` |
| `senior-engineering` | `prompts/senior-engineering` |
| `web-design-guidelines` | `prompts/web-design-guidelines` |

### ✅ Portable (the AI coding agent + Codex + the AI agent platform)

These skills use only portable tools (`read`, `write`, `exec`, `web_search`, `web_fetch`):

| Skill | Location | Tools Used |
|-------|----------|------------|
| `context-recovery` | `skills/context-recovery` | `sessions_history` |
| `elegant-reports` | `skills/elegant-reports` | `exec` |
| `ga4` | `skills/ga4` | `exec` |
| `google-ads` | `skills/google-ads` | `exec`, `browser` |
| `gsc` | `skills/gsc` | `exec` |
| `gong` | `skills/gong` | `exec` |
| `jira` | `skills/jira` | `exec` |
| `last30days` | `skills/last30days` | `exec` |
| `nudocs` | `skills/nudocs` | `exec` |
| `salesforce` | `skills/salesforce` | `exec` |
| `parallel-task` | `skills/parallel-task` | `exec` |
| `task-orchestrator` | `skills/task-orchestrator` | `sessions_spawn` OR `exec` (has fallback) |
| `codex` | `codex/codex` | `exec` |
| `command-creator` | `codex/command-creator` | `write` |
| `gemini` | `codex/gemini` | `exec` |
| `zendesk` | `skills/zendesk` | `exec` |

### ⚠️ the AI agent platform-Only (formerly the AI agent)

These skills require the AI agent platform-specific tools:

| Skill | Location | Required Tools | Portability Notes |
|-------|----------|----------------|-------------------|
| `auto-updater` | `the AI agent/auto-updater` | `cron`, `message` | Needs alternative scheduler |
| `the AI agent-release-check` | `the AI agent/the AI agent-release-check` | `exec` | Actually portable! |
| `clawddocs` | `the AI agent/clawddocs` | the AI agent platform docs | the AI agent platform-specific content |
| `gallery-scraper` | `the AI agent/gallery-scraper` | `browser` | Needs browser automation |
| `self-improving-agent` | `the AI agent/self-improving-agent` | `read`, `write` | Portable tools but the AI agent platform-oriented |
| `skill-sync` | `the AI agent/skill-sync` | `exec` | Portable tools but the AI agent platform-oriented |
| `todo-tracker` | `the AI agent/todo-tracker` | `exec` | Portable tools but the AI agent platform-oriented |

## Tool Categories

**the AI agent platform-only tools (formerly the AI agent):**
- `message` — Send messages, reactions, channel operations
- `browser` — Browser automation
- `cron` — Scheduled jobs
- `nodes` — Device/node control
- `canvas` — Canvas presentation
- `sessions_spawn/send` — Multi-agent orchestration
- `gateway` — the AI agent platform config/restart
- `tts` — Text-to-speech
- `memory_search/get` — Semantic memory

**Portable tools (available in the AI coding agent/Codex):**
- `read` — Read files
- `write` — Write files
- `exec` — Run shell commands
- `web_search` — Search the web
- `web_fetch` — Fetch URL content
- `image` — Analyze images

## Installation by Platform

### the AI coding agent / Codex

```bash
# Clone the repo
git clone https://github.com/jdrhyne/agent-skills.git

# Copy portable skills to your workspace
cp -r agent-skills/skills/* the AI agent config directory
cp -r agent-skills/codex/* the AI agent config directory
cp -r agent-skills/prompts/* the AI agent config directory
```

### the AI agent platform (formerly the AI agent)

```bash
# Clone to your workspace skills folder
cd ~/your-the AI agent platform-workspace/skills
git clone https://github.com/jdrhyne/agent-skills.git

# Or use skill-sync
# (if you have the skill-sync skill installed)
```

## External CLI Dependencies

Some skills require external tools to be installed:

| Skill | Required CLI | Install |
|-------|-------------|---------|
| `codex` | `codex` | `npm i -g @the AI model/codex` |
| `gemini` | `gemini` | Google the AI CLI |
| `jira` | `jira` | Atlassian CLI |
| `ga4` | `gcloud` | Google Cloud SDK |
| `gsc` | `gcloud` | Google Cloud SDK |
| `nudocs` | `nudocs` | `npm i -g nudocs` |

---

*Last synced from ClawHub: 2026-02-27*
*Compatible with the AI agent platform 2026.2.23+*

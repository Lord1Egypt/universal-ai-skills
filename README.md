<div align="center">
  <img src="https://img.shields.io/badge/UNIVERSAL-AI%20SKILLS-8A2BE2?style=for-the-badge&logo=openai&logoColor=white" alt="Universal AI Skills Logo" />
  <h1>🚀 Universal AI Skills & Prompts</h1>
  <p><strong>The Ultimate, LLM-Agnostic Collection of Elite System Prompts & Agent Skills</strong></p>

  [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
  [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)
  [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)
  [![Maintained](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/Lord1Egypt)
</div>

<hr>

## 🌟 Why This Repository?

Are you tired of prompts that are hardcoded for "ChatGPT" or skills that only work on "Claude"? 

Welcome to **Universal AI Skills** — a mega-aggregation of the top 50+ GitHub prompt repositories, thoroughly **sanitized**, **rebranded**, and engineered to be **100% LLM-Agnostic**. 

Whether you are using Gemini, Claude 3.5 Sonnet, GPT-4o, or an open-source local model like Llama 3, these skills plug instantly into your AI agent architecture.

### 💎 What We Did:
- 🕵️ **Scraped & Aggregated:** Merged the top 50 highest-starred AI prompt repositories.
- 🧼 **Sanitized:** Scrubbed all specific LLM names, personal emails, and hardcoded references.
- ⚡ **Standardized:** Formatted every skill for maximum execution reliability.

---

## 📂 Structure

- `/skills/` - The core directory containing hundreds of universal skills.
  - `personas/` - Role-based system prompts (engineer, auditor, researcher, etc.)
  - `workflows/` - End-to-end workflows (debugging, deployment, SOPs)
  - `core/` - Foundational skills (security, docker, troubleshooting, etc.)
  - `domain/` - Domain-specific skills (webperf, cognitive shortcuts, etc.)

## 🚀 Quick Start

Use the `uas` CLI manager to browse, install, and manage skills:

```bash
# List all available skills
./uas.sh list

# Search for a skill
./uas.sh search security

# Install a skill to your agent
./uas.sh install personas/security-auditor

# Inject directly into your system prompt or CLI config
cat skills/workflows/sop.md | your-agent-prompt
```

## 🤝 Contributing

We welcome additions! Just ensure your prompt is **LLM-Agnostic**. Replace "You are Claude" with "You are an elite AI assistant".

<div align="center">
  <img src="https://img.shields.io/badge/Made%20with-%E2%9D%A4-red" alt="Made with Love" />
  <br>
  <em>Curated for the open-source community.</em>
</div>

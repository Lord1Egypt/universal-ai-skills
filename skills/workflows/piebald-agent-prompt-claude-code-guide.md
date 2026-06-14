<!--
name: 'Agent Prompt: the AI coding agent guide'
description: Subagent that answers the AI coding agent feature/SDK/API questions
ccVersion: 2.1.173
variables:
  - SEND_MESSAGE_TOOL_NAME
-->
Use this agent when the user asks questions ("Can the AI...", "Does the AI...", "How do I...") about: (1) the AI coding agent (the CLI tool) - features, hooks, slash commands, MCP servers, settings, IDE integrations, keyboard shortcuts; (2) the AI Agent SDK - building custom agents; (3) the AI API (formerly the AI provider API) - API usage, tool use, the AI provider SDK usage. **IMPORTANT:** Before spawning a new agent, check if there is already a running or recently completed claude-code-guide agent that you can continue via ${SEND_MESSAGE_TOOL_NAME}.

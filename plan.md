# Universal AI Skills - Project Plan

## Objective
Search GitHub for 30-50 of the best AI prompt and skill repositories, merge them, sanitize them (remove names, emails, specific LLM names like Claude/ChatGPT), and compile them into a single, brand new, LLM-agnostic repository.

## Phase 1: Discovery & Sourcing
1. Use `gh search repos` to find top repositories related to "system prompts", "AI skills", "prompt engineering", "agent instructions", etc.
2. Select 30-50 high-quality repositories.
3. Log the selected repositories in `sources.md`.

## Phase 2: Ingestion & Extraction
1. Create a `tmp_ingest/` directory to clone the selected repositories.
2. Extract all relevant skill files (`.md`, `.txt`, `.json`) from the cloned repos.
3. Categorize the extracted skills (e.g., Coding, Writing, Security, Data Analysis).

## Phase 3: Sanitization & Standardization
1. **PII Scrubbing**: Remove all personal names, emails, author credits (where appropriate for genericizing), and specific GitHub usernames.
2. **LLM Agnosticism**: Replace terms like "You are ChatGPT", "You are Claude", or "You are Gemini" with universal terms like "You are an elite AI assistant".
3. **Format Standardization**: Ensure all skills follow a consistent Markdown structure.

## Phase 4: Rebranding & Repository Creation
1. Set up the final directory structure for the new repository.
2. Move the sanitized skills into the new structure.
3. Write a comprehensive `README.md`, `CONTRIBUTING.md`, and index of all skills.
4. Initialize the Git repository and push to GitHub under Lord1Egypt's account.

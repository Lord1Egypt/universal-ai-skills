# Project Checklist

## Phase 1: Discovery
- [ ] Formulate GitHub search queries.
- [ ] Run `gh` CLI commands to fetch repositories.
- [ ] Filter and finalize a list of 30-50 repositories.
- [ ] Save list to `sources.md`.

## Phase 2: Ingestion
- [ ] Create ingestion script/workflow.
- [ ] Clone all 30-50 repositories locally.
- [ ] Extract relevant prompt/skill files.
- [ ] Delete raw cloned repos to save space.

## Phase 3: Sanitization
- [ ] Develop regex/search patterns for names, emails, specific LLMs.
- [ ] Apply sanitization scripts to all files.
- [ ] Manually verify a subset of files to ensure no broken formatting.

## Phase 4: Rebranding & Publishing
- [ ] Create new Git repository locally.
- [ ] Generate `README.md` and repository structure.
- [ ] Commit all sanitized skills.
- [ ] Push to GitHub.

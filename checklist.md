# Project Checklist

## Phase 1: Discovery
- [x] Formulate GitHub search queries.
- [x] Run `gh` CLI commands to fetch repositories.
- [x] Filter and finalize a list of 30-50 repositories.
- [x] Save list to `sources.md`.

## Phase 2: Ingestion
- [x] Create ingestion script/workflow.
- [x] Clone all 30-50 repositories locally.
- [x] Extract relevant prompt/skill files.
- [x] Delete raw cloned repos to save space.

## Phase 3: Sanitization
- [ ] Develop regex/search patterns for names, emails, specific LLMs.
- [ ] Apply sanitization scripts to all files.
- [ ] Manually verify a subset of files to ensure no broken formatting.

## Phase 4: Rebranding & Publishing
- [x] Create new Git repository locally.
- [x] Generate `README.md` and repository structure.
- [x] Commit all sanitized skills.
- [x] Push to GitHub.

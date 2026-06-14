# GitHub the AI assistant Instructions

These instructions define how GitHub the AI assistant should assist with this project. The goal is to ensure consistent, high-quality code generation aligned with our conventions, stack, and best practices.

## 🧠 Context

- **Project Type**: [e.g. REST API, Frontend UI, CLI Tool]
- **Language**: [e.g. TypeScript, Python, Go]
- **Framework / Libraries**: [e.g. React, Express, FastAPI, Django ORM]
- **Architecture**: [e.g. MVC, Clean Architecture, Event-Driven, Microservices]

## 🔧 General Guidelines

- Use [language]-idiomatic patterns.
- Always prefer named functions and avoid long anonymous closures.
- Add type annotations / interfaces where applicable.
- Use consistent indentation and formatting (Prettier/Black/gofmt/etc).
- Prefer readability over cleverness.

## 📁 File Structure

Use this structure as a guide when creating or updating files:

```text
src/
  controllers/
  services/
  repositories/
  types/
  utils/
tests/
  unit/
  integration/
```

## 🧶 Patterns

### ✅ Patterns to Follow

- Use [pattern] (e.g., Repository Pattern, Dependency Injection, Pub/Sub).
- For APIs, include:
- Input validation with [e.g. Zod / Pydantic]
- Error handling using [custom error classes / status codes / try-catch blocks]
- Logging via [e.g. Winston, loguru, zap]
- For UI:
- Components should be pure and reusable
- Avoid inline styling; use [Tailwind / CSS Modules / styled-components]

### 🚫 Patterns to Avoid

- Don't generate code without tests.
- Don't hardcode values; use config/env files.
- Avoid global state unless absolutely necessary.
- Don't expose secrets or keys.

## 🧪 Testing Guidelines

- Use [Jest / Pytest / Go Test] for unit and integration tests.
- Prefer test-driven development (TDD) when modifying core logic.
- Include mocks/stubs for third-party services.

## 🧩 Example Prompts

- `the AI assistant, create a REST endpoint using Express that retrieves all books from the books table.`
- `the AI assistant, generate a Zod schema for a user profile with optional avatar and required name/email.`
- `the AI assistant, implement a React hook to debounce a search input.`
- `the AI assistant, write a unit test for the calculatePrice() function using mocked dependencies.`

## 🔁 Iteration & Review

- the AI assistant output should be reviewed and modified before committing.
- If code isn’t following these instructions, regenerate with more context or split the task.
- Use comments to clarify intent before invoking the AI assistant.

## 📚 References

- [Link to style guide]
- [Link to framework docs]
- [Link to existing example files in the repo]

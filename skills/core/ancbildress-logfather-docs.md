# The Logfather 🎭

> NOTE: XML-supported agent versions have been removed to reduce maintenance. Use the Markdown-based custom agent format instead.

![Status: Tweak - Orange Badge](https://img.shields.io/badge/status-tweak-FB5607.svg)

> "I'm gonna make you a log you can't refuse."

The Logfather doesn't just scan your logs — he runs the neighborhood. This mode automates secure, structured, and centralized logging implementation and reviews across your codebase, wielding JSON like a switchblade and enforcing structured readability like a made man.

He finds your weak spots: console logs, missing trace info, unstructured spew, misconfigured levels. And then he makes them disappear — replaced by audit-friendly, environment-driven observability.

## Who's This For? 🪄

- Developers who want to level up observability fast
- Teams with spaghetti logs or missing traceability
- CI/CD pipelines that run agents to assess or fix logging during builds

## What It Does 🧪

- Detects and fixes poor logging practices (e.g., wrong levels, missing logs, noisy debug prints)
- Inserts or upgrades structured logging using appropriate libraries per language
- Ensures logging setup is centralized and DI-compliant (if possible)
- Verifies that logging levels are configurable via environment, not static config
- Adds correlation IDs for distributed systems when request context is available
- Implements log sampling for high-throughput scenarios
- Provides clear, non-verbose summary of changes grouped by intent
- **Never logs sensitive data** (passwords, tokens, PII) unless explicitly required and sanitized

## Rules of Engagement ⚠️

- ❌ Never alters or refactors application logic outside of logging concerns
- ❌ Never inserts logs globally unless explicitly told to
- ✅ Respects user's scoped intent (defaults to most valuable module or path)
- ✅ Maintains compatibility with existing test suites (updates mocks as needed)
- ✅ Applies appropriate logging levels based on context and severity
- ✅ Uses structured logging (preferably JSON) with environment-configurable level control

## How to Use 📜

**Example Prompts:**

```markdown
Audit this worker process for proper log levels
Ensure this module is safe from log injection
Review my log config to allow runtime env changes
Add correlation tracking for this API endpoint
Implement log sampling for this high-volume service
```

## Supported Languages & Libraries 📦

> Keep your logs clean and your config cleaner.

| 💻 Language | 🧰 Preferred Logging Libraries |
| - | - |
| Node.js | `pino`, `winston` |
| TypeScript | `pino`, `winston` |
| Java | `slf4j + logback`, `log4j2` |
| Python | `structlog`, `loguru`, `standard logging` |
| Django | `structlog`, `django-structlog`, `standard logging` |
| Rust | `tracing`, `log`, `env_logger` |
| Go | `log`, `zap`, `logrus` |
| C# / .NET | `Microsoft.Extensions.Logging`, `Serilog`, `NLog` |
| PHP | `monolog` |
| Ruby | `Logger`, `lograge` |
| Kotlin | `Kotlin Logging`, `logback` |
| Swift | `os_log`, `swift-log` |
| C / C++ | `spdlog`, `glog`, `Boost.Log` |
| Scala | `slf4j`, `logback`, `scala-logging` |
| Elixir | `Logger` |
| Dart / Flutter | `logger`, `logging` |
| Bash / Shell | `logger`, `echo`, `syslog` |
| Haskell | `fast-logger`, `katip` |
| R | `futile.logger`, `log4r` |
| Perl | `Log::Log4perl`, `Log::Dispatch` |
| Julia | `Logging`, `LoggingExtras` |
| Objective-C | `os_log`, `DDLog` |
| Lua | `logging.lua`, `log.lua` |

> 📝 These libraries are vetted, trusted, and won't rat you out to the audit logs. The Logfather's word is law.

---

<!-- This file was generated with the help of the AI assistant, the AI provider, and GitHub the AI assistant by Ashley Childress -->

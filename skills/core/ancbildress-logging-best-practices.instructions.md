---
status: "draft"
description: "A language-agnostic, Copilot-ready checklist for secure, structured, and scalable logging inside applications — not infrastructure."
applyTo: "**"
---

# Logging Best Practices 🧾

A language-agnostic, Copilot-ready checklist for secure, structured, and scalable logging inside applications — not infrastructure.

---

## Do This ✅

### Use Structured Logging 🧱

- Format logs as **JSON** wherever possible
- Include: `timestamp`, `severity`, `message`, `contextual fields` (e.g. `requestId`, `userId`, `service`, etc.)

### Apply Proper Log Levels 🎚️

- **TRACE**: For step-by-step debugging, not for prod
- **DEBUG**: Method entry/exit, variable values, etc.
- **INFO**: Major events, milestones, API requests
- **WARN**: Unusual but non-fatal conditions
- **ERROR**: Failures that degrade service
- **FATAL**: Crashes, unrecoverable errors

### Add Context to Every Entry 🕵️‍♂️

- Include trace/correlation/request IDs
- Include service/module names
- Include method or function names if possible

### Control Log Levels at Runtime 🔀

- Respect environment-level overrides (e.g. `LOG_LEVEL` env var)
- Use DI-based logging config if possible

### Protect Sensitive Data 🧼

- Mask or omit PII (e.g., SSNs, full account numbers)
- Avoid logging authentication tokens or secrets

---

## Don't Do This ❌

- Don’t use `print()`, `console.log`, or raw output functions
- Don’t over-log or duplicate the same event
- Don’t log stack traces at `INFO` or lower
- Don’t hardcode log levels — use environment or config-driven control
- Don’t log sensitive payloads unless explicitly scrubbed

---

## Examples (in multiple languages) 🧪

### Java (SLF4J + Logback) ☕

```java
logger.info("Order processed", kv("orderId", orderId), kv("status", "confirmed"));
```

### Node.js (Winston) 🟢

```js
logger.info({
  message: "User login",
  userId: req.user.id,
  requestId: req.headers['x-request-id']
});
```

### Python (`structlog`) 🐍

```python
logger.info("email_sent", request_id=request_id, recipient=email, duration_ms=123)
```

---

## Summary for Copilot Execution 🧠

- Always assume logs must be structured
- Always check for centralized logger presence before inserting one
- Do not rewrite logic — only insert logs
- Default to scoped logging, not global
- Summarize changes grouped by log intent (e.g. "3 trace logs added")

---

<!-- This file was generated with the AI assistant as directed by Ashley Childress -->

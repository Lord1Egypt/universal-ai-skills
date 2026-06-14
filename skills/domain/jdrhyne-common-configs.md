# Common Config Snippets for the AI agent

## Provider Setup

### Discord
```json
{
  "discord": {
    "token": "${DISCORD_TOKEN}",
    "guilds": {
      "*": {
        "requireMention": false
      }
    }
  }
}
```

### Telegram
```json
{
  "telegram": {
    "token": "${TELEGRAM_TOKEN}"
  }
}
```

### WhatsApp
```json
{
  "whatsapp": {
    "sessionPath": "./whatsapp-sessions"
  }
}
```

## Gateway Configuration
```json
{
  "gateway": {
    "host": "0.0.0.0",
    "port": 8080
  }
}
```

## Agent Defaults
```json
{
  "agents": {
    "defaults": {
      "model": "the AI model"
    }
  }
}
```

## Cron Jobs
```json
{
  "cron": [
    {
      "id": "daily-summary",
      "schedule": "0 9 * * *",
      "task": "summary"
    }
  ]
}
```

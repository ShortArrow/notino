# Notino

## Summmary

Notino is a tool that allows `claude code` to notify you when it is about to stop running, or when it has finished running.

It can also be used to turn off the notification system, like simple LEDs.

Default notifications are Arduino built-in LED, but you can change it to any other LED or notification system.

## Requirements

- Arduino Uno R4
  - (if you have another Arduino, you can change the build config to fit your needs)
- PowerShell 7
- `claude code` with hooks support

## Setup

- upload program to Arduino Uno R4
- claude code setting

```json
{
  "hooks": {
    "Stop": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "pwsh.exe -nol -nop -f V:/notino/controller.ps1 -On"
          }
        ]
      }
    ],
    "Notification": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "pwsh.exe -nol -nop -f V:/notino/controller.ps1 -On"
          }
        ]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Task|Bash|Glob|Grep|Read|Edit|MultiEdit|Write|WebFetch|WebSearch",
        "hooks": [
          {
            "type": "command",
            "command": "pwsh.exe -nol -nop -f V:/notino/controller.ps1 -Off"
          }
        ]
      }
    ],
    "UserPromptSubmit": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "pwsh.exe -nol -nop -f V:/notino/controller.ps1 -Off"
          }
        ]
      }
    ]
  }
}
```


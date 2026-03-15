#!/bin/bash
# Backlog Updater — auto-logs IMPLEMENTED and PARKED events
# Hook type: PostToolUse (matcher: Edit|Write)
# No jq dependency — uses bash parameter expansion

CONTENT="$CLAUDE_TOOL_INPUT"
CONTENT="${CONTENT#*\"content\":\"}"
CONTENT="${CONTENT%%\"*}"

echo "$CONTENT" | grep -qi "IMPLEMENTED:\|DONE:" && {
  TASK=$(echo "$CONTENT" | grep -i "IMPLEMENTED:\|DONE:" | head -1)
  echo "$(date +%Y-%m-%d): $TASK" >> .claude/task-log.md
  echo "{\"feedback\": \"Task logged to task-log.md\"}"
}

echo "$CONTENT" | grep -qi "PARKED:\|PARKING:" && {
  TASK=$(echo "$CONTENT" | grep -i "PARKED:\|PARKING:" | head -1)
  echo "- [ ] $TASK (parked $(date +%Y-%m-%d))" >> BACKLOG.md
  echo "{\"feedback\": \"Added parked item to BACKLOG.md\"}"
}
exit 0

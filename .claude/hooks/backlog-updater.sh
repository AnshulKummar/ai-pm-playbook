#!/bin/bash
# Backlog Updater — auto-logs IMPLEMENTED and PARKED events
# Hook type: PostToolUse (matcher: Edit|Write)
# No jq dependency — uses bash parameter expansion
#
# Note: This parsing handles simple single-line JSON only.
# Complex values with escaped quotes will be silently skipped.

RAW="$CLAUDE_TOOL_INPUT"

# Try "content" (Write tool) first, then "new_string" (Edit tool)
if echo "$RAW" | grep -q '"content"'; then
  CONTENT="${RAW#*\"content\":\"}"
else
  CONTENT="${RAW#*\"new_string\":\"}"
fi
CONTENT="${CONTENT%%\"*}"

FEEDBACK=""

echo "$CONTENT" | grep -qi "IMPLEMENTED:\|DONE:" && {
  TASK=$(echo "$CONTENT" | grep -i "IMPLEMENTED:\|DONE:" | head -1)
  echo "$(date +%Y-%m-%d): $TASK" >> .claude/task-log.md
  FEEDBACK="Task logged to task-log.md"
}

echo "$CONTENT" | grep -qi "PARKED:\|PARKING:" && {
  TASK=$(echo "$CONTENT" | grep -i "PARKED:\|PARKING:" | head -1)
  echo "- [ ] $TASK (parked $(date +%Y-%m-%d))" >> BACKLOG.md
  FEEDBACK="${FEEDBACK:+$FEEDBACK; }Added parked item to BACKLOG.md"
}

[ -n "$FEEDBACK" ] && echo "{\"feedback\": \"$FEEDBACK\"}"
exit 0

#!/bin/bash
# Skill Router — suggests relevant PM commands based on prompt content
# Hook type: UserPromptSubmit
# No jq dependency — uses bash parameter expansion

PROMPT="$CLAUDE_TOOL_INPUT"
PROMPT="${PROMPT#*\"prompt\":\"}"
PROMPT="${PROMPT%%\"*}"
[ -z "$PROMPT" ] && exit 0

FEEDBACK=""
echo "$PROMPT" | grep -qi "PRD\|product requirements" && \
  FEEDBACK="${FEEDBACK}\n Consider: /write-prd for structured 8-section PRD"
echo "$PROMPT" | grep -qi "discover\|research\|assumption" && \
  FEEDBACK="${FEEDBACK}\n Consider: /discover — chains 4 PM skills automatically"
echo "$PROMPT" | grep -qi "architecture\|database\|scale\|infrastructure" && \
  FEEDBACK="${FEEDBACK}\n Consider: ADR — describe scale targets for cost analysis"
echo "$PROMPT" | grep -qi "deploy\|release\|launch\|ship" && \
  FEEDBACK="${FEEDBACK}\n Consider: /pre-mortem before launch"
echo "$PROMPT" | grep -qi "should we\|evaluate\|pros.*cons\|tradeoff" && \
  FEEDBACK="${FEEDBACK}\n Consider: /evaluate — brutally honest assessment"
echo "$PROMPT" | grep -qi "build\|create\|implement\|add" && \
  FEEDBACK="${FEEDBACK}\n Consider: /act — structured 5-act experience with clarification gate"

[ -n "$FEEDBACK" ] && echo "{\"feedback\": \"$FEEDBACK\"}"
exit 0

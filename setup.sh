#!/bin/bash
# AI PM Playbook — One-time project bootstrap
# Usage: bash setup.sh [project-directory]
#
# This script sets up a new project with the full PM governance layer:
# - .claude/ directory with skills, commands, hooks, and settings
# - CLAUDE.md template
# - TASKS.md and BACKLOG.md templates
# - Installs pm-skills plugin (if Claude Code CLI is available)

set -e

PROJECT_DIR="${1:-.}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Setting up AI PM Playbook in: $PROJECT_DIR"
echo "================================================"

# Create directory structure
echo "[1/6] Creating .claude/ directory structure..."
mkdir -p "$PROJECT_DIR/.claude/skills/clarification-gate"
mkdir -p "$PROJECT_DIR/.claude/skills/honest-evaluator"
mkdir -p "$PROJECT_DIR/.claude/skills/adr-creator"
mkdir -p "$PROJECT_DIR/.claude/skills/instruction-auditor"
mkdir -p "$PROJECT_DIR/.claude/commands"
mkdir -p "$PROJECT_DIR/.claude/hooks"
mkdir -p "$PROJECT_DIR/docs/adr"

# Copy skills
echo "[2/6] Installing skills..."
cp "$SCRIPT_DIR/.claude/skills/clarification-gate/SKILL.md" "$PROJECT_DIR/.claude/skills/clarification-gate/SKILL.md"
cp "$SCRIPT_DIR/.claude/skills/honest-evaluator/SKILL.md" "$PROJECT_DIR/.claude/skills/honest-evaluator/SKILL.md"
cp "$SCRIPT_DIR/.claude/skills/adr-creator/SKILL.md" "$PROJECT_DIR/.claude/skills/adr-creator/SKILL.md"
cp "$SCRIPT_DIR/.claude/skills/instruction-auditor/SKILL.md" "$PROJECT_DIR/.claude/skills/instruction-auditor/SKILL.md"

# Copy commands
echo "[3/6] Installing commands..."
cp "$SCRIPT_DIR/.claude/commands/act.md" "$PROJECT_DIR/.claude/commands/act.md"
cp "$SCRIPT_DIR/.claude/commands/evaluate.md" "$PROJECT_DIR/.claude/commands/evaluate.md"
cp "$SCRIPT_DIR/.claude/commands/update-backlog.md" "$PROJECT_DIR/.claude/commands/update-backlog.md"

# Copy hooks (make executable)
echo "[4/6] Installing hooks..."
cp "$SCRIPT_DIR/.claude/hooks/skill-router.sh" "$PROJECT_DIR/.claude/hooks/skill-router.sh"
cp "$SCRIPT_DIR/.claude/hooks/backlog-updater.sh" "$PROJECT_DIR/.claude/hooks/backlog-updater.sh"
chmod +x "$PROJECT_DIR/.claude/hooks/skill-router.sh"
chmod +x "$PROJECT_DIR/.claude/hooks/backlog-updater.sh"

# Copy settings.json (only if not already present)
if [ ! -f "$PROJECT_DIR/.claude/settings.json" ]; then
  echo "[5/6] Installing settings.json with safety hooks..."
  cp "$SCRIPT_DIR/.claude/settings.json" "$PROJECT_DIR/.claude/settings.json"
else
  echo "[5/6] Skipping settings.json (already exists)"
fi

# Copy templates (only if not already present)
echo "[6/6] Installing templates..."
[ ! -f "$PROJECT_DIR/CLAUDE.md" ] && cp "$SCRIPT_DIR/templates/CLAUDE.md" "$PROJECT_DIR/CLAUDE.md" && echo "  Created CLAUDE.md (edit with your project details)"
[ ! -f "$PROJECT_DIR/TASKS.md" ] && cp "$SCRIPT_DIR/templates/TASKS.md" "$PROJECT_DIR/TASKS.md" && echo "  Created TASKS.md"
[ ! -f "$PROJECT_DIR/BACKLOG.md" ] && cp "$SCRIPT_DIR/templates/BACKLOG.md" "$PROJECT_DIR/BACKLOG.md" && echo "  Created BACKLOG.md"

echo ""
echo "================================================"
echo "Setup complete! Your project now has:"
echo ""
echo "  .claude/"
echo "  ├── settings.json          (safety hooks + skill router)"
echo "  ├── skills/"
echo "  │   ├── clarification-gate (ask before building)"
echo "  │   ├── honest-evaluator   (no-flattery evaluation)"
echo "  │   ├── adr-creator        (architecture decisions)"
echo "  │   └── instruction-auditor (self-improvement)"
echo "  ├── commands/"
echo "  │   ├── act.md             (/act — 5-act structured workflow)"
echo "  │   ├── evaluate.md        (/evaluate — honest assessment)"
echo "  │   └── update-backlog.md  (/update-backlog — sync tasks)"
echo "  └── hooks/"
echo "      ├── skill-router.sh    (auto-suggest commands)"
echo "      └── backlog-updater.sh (auto-log task events)"
echo ""
echo "Next steps:"
echo "  1. Edit CLAUDE.md with your project details"
echo "  2. Run: claude plugin marketplace add phuryn/pm-skills"
echo "  3. Start with: /act [your goal]"
echo ""

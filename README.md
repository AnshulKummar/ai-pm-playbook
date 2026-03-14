<div align="center">

# ⚡ Claude Code for Product Managers
### From Novice to Advanced — A Complete Playbook

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)
[![Claude Code](https://img.shields.io/badge/Claude_Code-Best_Practices-blue)](https://code.claude.com/docs)
[![PM Skills](https://img.shields.io/badge/PM_Skills-65_skills_36_workflows-teal)](https://github.com/phuryn/pm-skills)

**Build real products. Think like an engineer. Ship like a PM.**

*A structured, open-source guide for Product Managers who want to use Claude Code effectively — from first install to multi-agent orchestration at 100M user scale.*

[🟢 Level 1: Start Here](#-level-1--foundations) • [🟡 Level 2: PM Productivity](#-level-2--pm-productivity) • [🔴 Level 3: Advanced](#-level-3--advanced-mastery) • [⚡ Quick Reference](#-quick-reference) • [📚 Credits](#-credits--references)

</div>

---

## 👋 Who This Is For

This guide is for **Product Managers** who want to use [Claude Code](https://code.claude.com) to:

- Write PRDs, strategy docs, and discovery artifacts faster and with more rigour
- Understand enough engineering to have better conversations with your team
- Build real features (not just prototypes) that scale
- Create automated workflows that compound over time

You do **not** need to be a developer to benefit from this guide. Every concept is explained with a PM mental model first.

---

## 🧩 What This Playbook Adds

This playbook builds on top of [Paweł Huryn's pm-skills](https://github.com/phuryn/pm-skills) (65 skills, 36 commands) by adding a **structured decision-making and governance layer** that controls *when* and *how* those skills get used.

### Custom Skills (not in pm-skills)

| Skill | What it does | Auto-invokes when... |
|-------|-------------|---------------------|
| **clarification-gate** | Asks max 5 questions before building anything; states assumptions first | User says "build", "implement", "create", "add" |
| **honest-evaluator** | Brutally honest 6-part framework: strengths, fatal flaws, hidden costs, risk heatmap, verdict | User says "should we build", "evaluate", "pros and cons" |
| **adr-creator** | Generates Architecture Decision Records with cost analysis at 4 scale tiers (MVP to 100M users) | User mentions database, infrastructure, scaling, "X or Y" |
| **instruction-auditor** | Detects anti-patterns in CLAUDE.md and skills; suggests fixes | User asks to review setup or quality is declining |

### Custom Commands (not in pm-skills)

| Command | What it does |
|---------|-------------|
| `/act [goal]` | Runs a structured **5-Act experience**: Context → Discovery → Design (pause for approval) → Implementation → Review. Chains clarification-gate + evaluate + ADR generation |
| `/evaluate [idea]` | Triggers the honest-evaluator: strengths / fatal flaws / hidden costs / BUILD NOW or DIFFERENTLY verdict |
| `/update-backlog` | Syncs TASKS.md: marks completed items, adds discovered items, logs parked items with reasons |

### Custom Hooks (not in pm-skills)

| Hook | Type | What it does |
|------|------|-------------|
| **skill-router.sh** | `UserPromptSubmit` | Pattern-matches your prompt and suggests relevant commands (e.g., mentions "PRD" → suggests `/write-prd`) |
| **backlog-updater.sh** | `PostToolUse` | Auto-logs "IMPLEMENTED" and "PARKED" events to task-log.md and BACKLOG.md |
| **Safety guard** | `PreToolUse` | Blocks dangerous commands (`rm -rf`, `git push --force`, `DROP TABLE`) before they execute |

### The key idea

**pm-skills** gives you *what* to do (write a PRD, run discovery, analyse competitors). This playbook adds the *discipline layer*: clarify before building, evaluate honestly, pause before implementing, track everything, and improve the system weekly.

```
pm-skills (Paweł Huryn)          This playbook adds
─────────────────────────        ─────────────────────────
65 PM execution skills     +     Clarification gate (ask before building)
36 chained workflows       +     Honest evaluation (no flattery)
8 domain plugins           +     5-Act structured workflow
                           +     ADR with cost analysis at scale
                           +     Live backlog tracking (TASKS.md)
                           +     Smart skill router (auto-suggest)
                           +     Safety hooks (block dangerous commands)
                           +     Self-learning loops (weekly improvement)
```

---

## 📖 How to Use This Guide

This guide is structured as a **three-level progression**. Work through each level in order, or jump to what you need using the table of contents.

| Level | Who it's for | Time to complete |
|-------|-------------|-----------------|
| 🟢 **Level 1 — Foundations** | First week using Claude Code | ~2 hours |
| 🟡 **Level 2 — PM Productivity** | Regular Claude Code user | ~4 hours |
| 🔴 **Level 3 — Advanced Mastery** | Building real products at scale | Ongoing reference |

---

## 📋 Table of Contents

<details>
<summary><strong>🟢 Level 1 — Foundations (click to expand)</strong></summary>

- [Chapter 1: What is Claude Code — A PM's Lens](#chapter-1-what-is-claude-code--a-pms-lens)
- [Chapter 2: Installation & First Setup](#chapter-2-installation--first-setup)
- [Chapter 3: Your CLAUDE.md — Claude's Permanent Memory](#chapter-3-your-claudemd--claudes-permanent-memory)
- [Chapter 4: PM Skills Marketplace](#chapter-4-pm-skills-marketplace)

</details>

<details>
<summary><strong>🟡 Level 2 — PM Productivity (click to expand)</strong></summary>

- [Chapter 5: The Core Mental Model — Skills vs Commands vs Hooks](#chapter-5-the-core-mental-model--skills-vs-commands-vs-hooks)
- [Chapter 6: Discovery, PRDs & Strategy Docs](#chapter-6-discovery-prds--strategy-docs)
- [Chapter 7: Clarifying Questions — Never Build the Wrong Thing](#chapter-7-clarifying-questions--never-build-the-wrong-thing)
- [Chapter 8: Honest Evaluation — Your Brutally Honest Co-Founder](#chapter-8-honest-evaluation--your-brutally-honest-co-founder)
- [Chapter 9: Live Backlog & Todo Management](#chapter-9-live-backlog--todo-management)
- [Chapter 10: PM ↔ Engineering Concepts Bridge](#chapter-10-pm--engineering-concepts-bridge)

</details>

<details>
<summary><strong>🔴 Level 3 — Advanced Mastery (click to expand)</strong></summary>

- [Chapter 11: Beyond Vibe Coding — Architecture for Scale](#chapter-11-beyond-vibe-coding--architecture-for-scale)
- [Chapter 12: ADR Creation with Cost Analysis](#chapter-12-adr-creation-with-cost-analysis)
- [Chapter 13: Architecture Patterns — Choosing the Right One](#chapter-13-architecture-patterns--choosing-the-right-one)
- [Chapter 14: Conversational Agent Experiences — The Acts Framework](#chapter-14-conversational-agent-experiences--the-acts-framework)
- [Chapter 15: Self-Learning Loops](#chapter-15-self-learning-loops)
- [Chapter 16: Token Optimization Strategies](#chapter-16-token-optimization-strategies)
- [Chapter 17: Auto-Improving Your Instructions](#chapter-17-auto-improving-your-instructions)
- [Chapter 18: Making This Your Default Setup](#chapter-18-making-this-your-default-setup)

</details>

<details>
<summary><strong>⚡ Quick Reference (click to expand)</strong></summary>

- [Situational Quick Reference Card](#situational-quick-reference-card)
- [Command Routing Decision Tree](#command-routing-decision-tree)
- [Hook Events Reference](#hook-events-reference)
- [PM Skills Commands at a Glance](#pm-skills-commands-at-a-glance)

</details>

---

# 🟢 Level 1 — Foundations

> **Goal:** Install Claude Code, set it up correctly, and run your first PM workflow within 2 hours.

---

## Chapter 1: What is Claude Code — A PM's Lens

Claude Code is a command-line tool from [Anthropic](https://www.anthropic.com) that acts as an AI pair programmer in your terminal. But for PMs, the better mental model is:

> **Claude Code is your always-available engineering co-founder who reads your entire codebase, follows your product standards, and gets better at your specific domain the more you configure it.**

It can read and write files, run commands, browse your codebase, execute tests, manage Git, and call external APIs — all through natural language.

### What Claude Code can do for PMs specifically

| PM Task | Without Claude Code | With Claude Code |
|---------|-------------------|-----------------|
| Write a PRD | 2-4 hours from template | `/write-prd [feature]` — structured 8-section PRD in minutes |
| Discovery session | Manual sticky notes, messy Figma | `/discover [idea]` — chains brainstorm → assumptions → prioritisation → experiments |
| Competitive analysis | Google + spreadsheet | `/competitive-analysis [market]` — SWOT + Porter's Five Forces + differentiation |
| Architecture decision | 2-hour eng meeting | `/evaluate + ADR` — options, cost analysis, verdict in minutes |
| Sprint planning | Jira grooming | `/sprint plan` — capacity estimation, story selection, risk identification |
| A/B test analysis | Data analyst dependency | `/analyze-test [data]` — statistical significance, ship/extend/stop recommendation |

### The key difference from ChatGPT or Claude.ai

Claude Code has **persistent memory** through `CLAUDE.md` files, **deterministic automation** through hooks, and **project-specific context** that makes every session more productive than the last. It compounds. ChatGPT does not.

---

## Chapter 2: Installation & First Setup

### Prerequisites
- **Node.js 18+** (check: `node --version`)
- A terminal (Mac: Terminal or iTerm2, Windows: WSL2)
- An [Anthropic account](https://console.anthropic.com)

### Install Claude Code

```bash
npm install -g @anthropic-ai/claude-code
```

### Recommended project structure

Every project you work with Claude Code should follow this layout:

```
your-project/
├── CLAUDE.md                    # Root context (< 200 lines) — always loaded
├── .claude/
│   ├── settings.json            # Hooks, permissions, environment config
│   ├── settings.local.json      # Your personal overrides (git-ignored)
│   ├── commands/                # Slash commands: /my-command
│   │   └── update-backlog.md
│   ├── skills/                  # Auto-invoked context providers
│   │   ├── adr-creator/SKILL.md
│   │   ├── clarification-gate/SKILL.md
│   │   ├── honest-evaluator/SKILL.md
│   │   └── instruction-auditor/SKILL.md
│   ├── agents/                  # Subagents with isolated context
│   └── hooks/                   # Shell scripts for automation
│       ├── skill-router.sh
│       └── backlog-updater.sh
├── .mcp.json                    # MCP server config (commit this)
├── docs/                        # Reference docs loaded on demand
│   ├── architecture.md
│   ├── adr/                     # Architecture Decision Records
│   └── api-patterns.md
├── TASKS.md                     # Live task board (P0/P1/Done/Parked)
├── BACKLOG.md                   # Backlog inbox
└── src/                         # Your application code
```

### Global vs Project configuration

| Location | Scope | Use for |
|----------|-------|---------|
| `~/.claude/settings.json` | All projects | Safety hooks, notifications, personal style |
| `~/.claude/CLAUDE.md` | All projects | Your personal preferences, always-on rules |
| `.claude/settings.json` | This project | Project-specific hooks, permissions |
| `CLAUDE.md` | This project | Stack, architecture, team conventions |

> **🟢 Level 1 Tip:** Start by only creating `CLAUDE.md` in your project root. You don't need hooks or agents yet. Those are Level 2 and 3 concerns.

---

## Chapter 3: Your CLAUDE.md — Claude's Permanent Memory

`CLAUDE.md` is the most important file in your setup. It loads automatically at every session start and tells Claude everything it needs to know about your project and your standards.

### The Golden Rules of CLAUDE.md

1. **Keep it under 200 lines** — a bloated CLAUDE.md hurts more than it helps
2. **Never put linting rules here** — those go in hooks (deterministic beats probabilistic)
3. **Never paste code snippets** — they go stale; use `file:line` pointers instead
4. **Never put everything** — put references to sub-docs Claude can fetch on demand

### Starter CLAUDE.md template

```markdown
# Project: [Your Product Name]

## Quick Commands
- Build: `npm run build`
- Test: `npm run test`
- Lint: `npm run lint`

## About This Product
[One paragraph: what it does, who it's for, key business context]

## Architecture
- Stack: [e.g., Next.js, TypeScript, PostgreSQL, Redis]
- State management: [e.g., Zustand client-side, Redis distributed]
- Key patterns: [e.g., Repository pattern, Event-driven, CQRS]
- Docs: see docs/ — read the relevant file for the current task

## Scale Targets
- B2C: [X] users | B2B: [X] customers
- p99 latency target: < 200ms
- Read:Write ratio: [X:1]

## Coding Standards
- TypeScript strict mode, no `any`
- Every component needs a corresponding test file
- Error handling: never swallow errors silently
- Prefer async/await over callbacks

## What NOT to do
- Do not edit the main branch directly
- Do not run `rm -rf` without explicit confirmation
- Do not hardcode API keys or secrets
```

> **Source:** CLAUDE.md best practices are documented at [code.claude.com/docs](https://code.claude.com/docs) and extensively discussed by the community at [github.com/hesreallyhim/awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code).

---

## Chapter 4: PM Skills Marketplace

**Recommended repo:** [phuryn/pm-skills](https://github.com/phuryn/pm-skills) ⭐ 55 stars — **PRIMARY RECOMMENDATION for all PMs**

This is the single most impactful thing you can install. 65 PM skills and 36 chained workflows across 8 plugins, encoding the frameworks of Teresa Torres, Marty Cagan, Alberto Savoia, and others directly into Claude.

### Install

```bash
# Claude Code CLI (two-step process)
claude plugin marketplace add phuryn/pm-skills
# Then install each plugin when prompted, or install individually:
# claude plugin install pm-product-discovery@pm-skills

# Claude Cowork (non-developers)
# Customize → Browse plugins → Personal → + → Add marketplace from GitHub → phuryn/pm-skills
```

### The 8 Plugins at a Glance

| Plugin | Skills | Key Commands |
|--------|--------|-------------|
| **pm-product-discovery** | 13 skills | `/discover`, `/brainstorm`, `/interview` |
| **pm-product-strategy** | 12 skills | `/strategy`, `/business-model`, `/pricing` |
| **pm-execution** | 15 skills | `/write-prd`, `/sprint`, `/write-stories` |
| **pm-market-research** | 7 skills | `/research-users`, `/competitive-analysis` |
| **pm-data-analytics** | 3 skills | `/write-query`, `/analyze-test`, `/analyze-cohorts` |
| **pm-go-to-market** | 6 skills | `/plan-launch`, `/battlecard`, `/growth-strategy` |
| **pm-marketing-growth** | 5 skills | `/market-product`, `/north-star` |
| **pm-toolkit** | 4 skills | `/review-resume`, `/proofread`, `/draft-nda` |

### Your first 5 commands to try

```bash
# 1. Start discovery for any new idea
/discover AI-powered onboarding flow for B2B SaaS

# 2. Write a PRD from a problem statement
/write-prd Smart notification system that reduces alert fatigue

# 3. Analyse the competitive landscape
/competitive-analysis Project management tools for agencies

# 4. Define your North Star Metric
/north-star Two-sided marketplace connecting freelancers with clients

# 5. Run a pre-mortem before any major feature
/pre-mortem [paste your PRD here]
```

> **Credit:** PM Skills Marketplace by [Paweł Huryn](https://github.com/phuryn), curated from [The Product Compass Newsletter](https://www.productcompass.pm). Frameworks by Teresa Torres (*Continuous Discovery Habits*), Marty Cagan (*INSPIRED*, *TRANSFORMED*), Alberto Savoia (*The Right It*), Dan Olsen (*The Lean Product Playbook*), Ash Maurya (*Running Lean*), Christina Wodtke (*Radical Focus*), Anthony Ulwick (*Jobs to Be Done*), Sean Ellis (*Hacking Growth*), Maja Voje (*Go-To-Market Strategist*).

---

# 🟡 Level 2 — PM Productivity

> **Goal:** Understand how Claude Code really works and use it for your daily PM workflows — discovery, PRDs, evaluation, and backlog management.

---

## Chapter 5: The Core Mental Model — Skills vs Commands vs Hooks

This is the single most important concept in advanced Claude Code usage. Getting it wrong costs hours.

```
┌─────────────────────────────────────────────────────────────────┐
│  DETERMINISTIC (always runs, no exceptions)                     │
│  ┌─────────┐                                                    │
│  │  HOOKS  │  Shell scripts. Fire at lifecycle events.          │
│  │         │  Use for: safety rules, auto-format, notifications │
│  └─────────┘                                                    │
│                                                                  │
│  PROBABILISTIC (Claude decides when to apply)                   │
│  ┌──────────┐  ┌──────────────┐  ┌──────────────┐             │
│  │  SKILLS  │  │   COMMANDS   │  │   SUBAGENTS  │             │
│  │ Auto-    │  │  User-       │  │  Isolated    │             │
│  │ invoked  │  │  triggered   │  │  context     │             │
│  │ by match │  │  /command    │  │  window      │             │
│  └──────────┘  └──────────────┘  └──────────────┘             │
└─────────────────────────────────────────────────────────────────┘
```

### The decision tree

| Ask yourself | If YES → use | If NO → use |
|-------------|-------------|------------|
| Must this ALWAYS happen, no exceptions? | **Hook** | Skill or Command |
| Is this a safety/security rule? | **Hook** (can't be overridden) | CLAUDE.md (ignored ~30% of the time) |
| Do I want to trigger this explicitly? | **Slash Command** | Skill (auto-invoked) |
| Is this a complex multi-step workflow? | **Subagent** (isolated context) | Skill (in-line) |
| Does this need external services? | **MCP server** + command | Plain skill |
| Is this reusable across many projects? | **Plugin** | Project-local skill |

> **The critical insight** (from [genaiunplugged.substack.com](https://genaiunplugged.substack.com/p/claude-code-skills-commands-hooks-agents)): "With 'never run rm -rf' in CLAUDE.md, Claude followed the instruction about 70% of the time. With the hook, it's blocked 100% of the time. For safety rules, deterministic beats probabilistic."

### Essential safety hooks to add immediately

Create `.claude/settings.json`:

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [{
          "type": "command",
          "command": "echo \"$CLAUDE_TOOL_INPUT\" | grep -qE '(rm -rf|git push --force|DROP TABLE)' && echo '{\"block\": true, \"message\": \"Dangerous command blocked — confirm manually\"}' >&2 && exit 2 || exit 0"
        }]
      },
      {
        "matcher": "Edit|Write",
        "hooks": [{
          "type": "command",
          "command": "[ \"$(git branch --show-current)\" != \"main\" ] || { echo '{\"block\": true, \"message\": \"Cannot edit main branch directly\"}' >&2; exit 2; }"
        }]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [{ "type": "command", "command": "npm run lint --silent 2>&1 | head -20" }]
      }
    ]
  }
}
```

---

## Chapter 6: Discovery, PRDs & Strategy Docs

### The complete PM workflow — from idea to stories

```
Step 1: Discovery   → /discover [problem or idea]
Step 2: Assumptions → Review prioritised assumption map
Step 3: Strategy    → /strategy [product context]
Step 4: PRD         → /write-prd [feature + context from steps 1-3]
Step 5: Pre-Mortem  → /pre-mortem [PRD output]
Step 6: Stories     → /write-stories user [from PRD outcomes]
Step 7: Backlog     → /update-backlog [sync TASKS.md]
```

### PRD Template — 8 Sections (Marty Cagan Framework)

| Section | Content | Referenceable data required |
|---------|---------|----------------------------|
| 1. Problem Statement | What user/business problem are we solving? | User research quotes, support ticket volume, churn data |
| 2. Opportunity | Why now? Market size? Strategic fit? | TAM/SAM/SOM from `/market-scan`, competitive gaps |
| 3. Success Metrics | North Star + input metrics + guardrail metrics | Baseline data + % improvement targets |
| 4. Solution Approach | What are we building? Key user flows | Wireframes, prototypes, technical spike results |
| 5. Assumptions & Risks | What must be true for this to succeed? | Prioritised assumption map from `/pre-mortem` |
| 6. Scope | In/out of scope, phased delivery plan | Sprint capacity, engineering estimates |
| 7. Dependencies | External APIs, teams, infrastructure | SLA agreements, team availability |
| 8. Launch Plan | Rollout strategy, feature flags, rollback plan | GTM strategy from `/plan-launch` |

> **Always ask before writing code:** "What would cause this to fail at 100M users?" Run `/pre-mortem` after every PRD.

> **Framework credits:** PRD structure based on Marty Cagan's outcome-focused product management from [*INSPIRED*](https://www.amazon.com/INSPIRED-Create-Tech-Products-Customers/dp/1119387507/) (Wiley, 2018) and [*TRANSFORMED*](https://www.amazon.com/dp/1119697336/) (Wiley, 2024).

---

## Chapter 7: Clarifying Questions — Never Build the Wrong Thing

One of the most expensive Claude Code mistakes is building the wrong thing at full speed. This skill creates a clarification gate before any substantial work begins.

### Create `.claude/skills/clarification-gate/SKILL.md`

```markdown
---
name: clarification-gate
description: Auto-invoke when user asks to build, implement, create, or design
  anything new. Also invoke for vague prompts like "make it better", "add auth",
  "build a dashboard". Do NOT invoke for small edits, fixes, or refactors.
---
# Clarification Gate

Before implementing anything non-trivial, ask max 5 questions grouped by category.
Only ask what is genuinely unknown — never ask what can be inferred from context.
State your current assumptions first so the user can correct them.

## Scale & Context (always ask if unknown)
- Expected users/events at launch vs. 12 months from now?
- B2C (many anonymous) or B2B (fewer, authenticated tenants)?

## Requirements Clarity (ask if ambiguous)
- What does success look like? What metric moves?
- What is explicitly OUT of scope for this iteration?
- Are there existing patterns/components to reuse?

## Constraints (ask if not in CLAUDE.md)
- Latency, cost, or compliance hard constraints?
- Preferred tech choices or ones to avoid?

## Format
Ask as numbered list. Max 5 questions. State assumptions first.
Confirm understanding before writing any code.
```

### Sample clarification exchange

```
👤 User: "Add a notifications system"

🤖 Claude: "Before I build this, my current assumptions — correct me where wrong:

  1. Scale: ~10K users at launch, growing to 1M within a year. Right?
  2. Types: email + in-app. Does this include push (mobile) or SMS?
  3. Delivery: real-time (WebSocket) or near-real-time (polling every 30s)?
  4. Preferences: per-type opt-out controls, or single on/off toggle?
  5. Out of scope: no scheduling or digest batching in v1 — confirm?

  Once confirmed, I'll write the PRD section before touching any code."
```

---

## Chapter 8: Honest Evaluation — Your Brutally Honest Co-Founder

Generic AI flatters ideas. This setup makes Claude Code tell you what will break at 10M users, why your pricing model has a flaw, and what your team isn't ready to build.

### Create `.claude/skills/honest-evaluator/SKILL.md`

```markdown
---
name: honest-evaluator
description: Auto-invoke when user asks "should we build", "what do you think about",
  "evaluate this idea", "is this a good approach", or "pros and cons".
  Also invoke when reviewing PRDs, architecture decisions, or business models.
---
# Honest Evaluator

Evaluate with brutal honesty. No hedging. No "it depends" without specifics.
Your job is to prevent expensive mistakes, not to validate ideas.

## Evaluation Framework

### 1. Strengths (specific mechanisms only — never vague claims)
   BAD: "This is scalable"
   GOOD: "Stateless design means you can add servers without data migration"

### 2. Fatal Flaws (if any — be direct)
   A fatal flaw will cause the approach to fail at the stated scale or goal.
   Example: "This won't work at 100M users because single-writer DB
   hits ceiling at ~10K writes/sec with this schema"

### 3. Hidden Costs (what hasn't been priced in)
   - Engineering time beyond the obvious
   - Infrastructure costs at scale
   - Operational burden (on-call, migrations, debugging)
   - Opportunity cost vs alternatives

### 4. Risk Heatmap (rate each: LOW / MEDIUM / HIGH / CRITICAL)
   - Technical risk | Scale risk | Cost risk | Team risk | Timeline risk

### 5. Verdict — choose one, no waffling:
   BUILD NOW | BUILD LATER | DO NOT BUILD | BUILD DIFFERENTLY

### 6. If "BUILD DIFFERENTLY": give the specific alternative with tech choices
```

### Create `.claude/commands/evaluate.md`

```markdown
# Evaluate

Perform a brutally honest evaluation of the idea, PRD, or approach described.
Follow the Honest Evaluator skill framework exactly. Do not soften the analysis.
The user depends on your honesty to avoid wasting months of engineering effort.
```

### Sample evaluation output

```
💡 Idea: "Build our own real-time messaging infrastructure using raw WebSockets"

✅ STRENGTHS
• Full control over message format and routing
• No per-message vendor costs at extreme scale (>1B messages/mo)

🚨 FATAL FLAW
WebSocket connection management at 100M concurrent users requires stateful
load balancing. This is a complex distributed systems problem your 6-person
team has not solved. Estimated 3-4 months vs. 2 weeks with a managed service.

💸 HIDDEN COSTS
• ~800 engineering hours to build reliably = $120,000 at $150/hr loaded cost
• Redis Cluster for pub/sub: $800-2,400/mo at 10K concurrent users
• Operational: expect 1-2 incidents/month; someone owns this 24/7

🔥 RISK HEATMAP
• Technical: HIGH  |  Scale: MEDIUM  |  Cost: LOW (at extreme scale)
• Timeline: CRITICAL — 3-4 months vs 2 weeks for alternatives

⚖️ VERDICT: BUILD DIFFERENTLY
Use Ably or Pusher for the first 18 months ($0-800/mo up to 3M messages/day).
Build in-house only after you've validated the product and crossed $1M ARR.
Build-vs-buy crossover: approximately 500M messages/month.
```

---

## Chapter 9: Live Backlog & Todo Management

Claude Code should actively maintain your task state as it works — not just write code. Every time it implements something, parks something, or discovers a blocker, it should update your task files automatically.

### The four backlog events Claude should track

| Event | Trigger | Claude Action |
|-------|---------|--------------|
| **IMPLEMENTED** | Feature/fix complete and tested | Mark done in TASKS.md, add commit ref |
| **PARKED** | Scope creep or dependency blocks progress | Add to BACKLOG.md with reason + unblocking condition |
| **DISCOVERED** | New requirement found mid-implementation | Add to BACKLOG.md as P2 with context |
| **BLOCKED** | External dependency prevents progress | Add to BLOCKED.md with owner + ETA |

### TASKS.md Template

```markdown
# Project Tasks

## P0 — In Progress (max 3)
- [ ] [Task description] | Owner: Claude | Started: YYYY-MM-DD

## P1 — This Sprint (max 7)
- [ ] [Task description]

## Done
- [x] [Task] (completed: YYYY-MM-DD, commit: abc1234)

## Parked / Backlog
- [ ] [Task] (parked: DATE, reason: out of scope, unblock: post-launch)

## Blocked
- [ ] [Task] (blocked by: OWNER, since: DATE, impact: HIGH)
```

### Create `.claude/commands/update-backlog.md`

```markdown
# Update Backlog

Review the current session's work and:

1. Read TASKS.md — identify tasks completed this session
2. Mark them done: `- [x] TASK (completed: DATE, commit: HASH)`
3. Remove implemented items from BACKLOG.md
4. Add newly discovered items to BACKLOG.md
5. If anything was scoped out, add to BACKLOG.md:
   `- [ ] [task] (parked: DATE, reason: REASON, unblock: CONDITION)`
6. Output a summary: X completed, Y added, Z parked

Keep all entries under 1 line each. Date format: YYYY-MM-DD.
```

### Auto-updating hook

```bash
# .claude/hooks/backlog-updater.sh
#!/bin/bash
# Extract content without jq — use bash parameter expansion
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
```

---

## Chapter 10: PM ↔ Engineering Concepts Bridge

You don't need to write code, but you need to understand what engineers are deciding and why it matters for your PRD. These are the 10 most important engineering concepts for PMs.

| Engineering Concept | PM Equivalent | What to put in your PRD |
|---------------------|--------------|------------------------|
| **Database index** | Speed dial for data retrieval | Add to non-functionals: "All queries on [field] must be indexed" |
| **API rate limiting** | Traffic throttle | Define limits: "Max 100 requests/minute per user" |
| **Feature flags** | Controlled rollout switch | Specify rollout: "Ship to 1% → 10% → 100%; kill switch required" |
| **Event queue (async)** | Background work | Design UX around async: "User sees pending state, not spinner" |
| **Cache (Redis)** | Short-term memory | Define staleness: "Dashboard data max 5 minutes stale is acceptable" |
| **Database migration** | Schema change | Add to launch checklist: "Zero-downtime migration required" |
| **Webhook** | Outgoing notification to partner | B2B requirement: "Reliable delivery with retry + dead letter queue" |
| **p99 latency** | Worst-case for 1 in 100 users | Set SLOs: "p99 < 200ms for all user-facing APIs" |
| **N+1 query problem** | Ordering coffee, then milk, then sugar separately | Ask eng to review data models before sprint starts |
| **Horizontal scaling** | Hiring more staff vs training current staff to do more | Requirement: "Must scale by adding servers, not upgrading servers" |

> **PM Learning Prompt:** "Explain [engineering concept] using a product management analogy, then tell me what decisions I should make in my PRD based on this."

---

# 🔴 Level 3 — Advanced Mastery

> **Goal:** Build real products that scale to 100M B2C users and 10K B2B customers. Orchestrate multi-agent workflows. Create systems that improve themselves.

---

## Chapter 11: Beyond Vibe Coding — Architecture for Scale

Vibe coding gets you to MVP. Real architecture gets you to 100M users without a rewrite.

### The Scale Decision Framework

| Decision | Vibe Code Answer | Scale Architecture Answer |
|---------|-----------------|--------------------------|
| Data storage | Single Postgres DB | Read replicas + write DB + Redis cache + CDN |
| Auth | Sessions in DB | JWT + refresh tokens + distributed session store |
| File uploads | Save to local disk | S3/GCS + CloudFront CDN + presigned URLs |
| Background jobs | setTimeout or cron | Redis queues (BullMQ) + worker pools + dead letter queue |
| Real-time features | Polling every 5s | WebSockets or SSE + Redis Pub/Sub |
| Multi-tenancy (B2B) | Shared tables + tenant_id | Row-level security (RLS) or isolated schemas + tenant routing |
| Search | SQL LIKE queries | Elasticsearch / Typesense + inverted index |
| Rate limiting | None | Redis sliding window + API gateway policies |
| Observability | console.log | OpenTelemetry traces + structured logs + Prometheus |
| CI/CD | Manual deploys | GitHub Actions + blue-green deploy + feature flags |

### B2C Requirements (100M users)

- **Stateless services** — horizontal scaling is mandatory; no server-side session state
- **CDN-first** — serve 80% of requests from edge (Cloudflare/Fastly/CloudFront)
- **Database sharding strategy** — plan data partitioning before you hit 10M rows
- **Async everything** — user actions should be non-blocking; use event queues
- **Mobile-first API design** — GraphQL or REST with field selection to reduce payload size
- **Abuse prevention** — rate limiting, CAPTCHAs, bot detection at edge

### B2B Requirements (10K customers)

- **Tenant isolation** — row-level security (RLS) in Postgres or dedicated schemas per tenant
- **SLA-aware infrastructure** — different pricing tiers get different compute/storage allocations
- **API versioning from day one** — enterprise clients cannot break on your updates
- **Webhook delivery system** — reliable, retryable, with dead letter queue and replay capability
- **Audit logs** — every action logged and queryable per tenant (GDPR/compliance requirement)
- **SSO integration** — SAML/OIDC support for enterprise identity providers
- **Usage-based billing hooks** — track API calls, storage, seats per tenant

### Recommended Technology Stack

| Layer | Recommended Tech | Why |
|-------|-----------------|-----|
| Frontend | Next.js + TypeScript + Tailwind | SSR/SSG hybrid, edge rendering, type safety |
| API Gateway | Kong / AWS API GW / Cloudflare Workers | Rate limiting, auth, routing at edge |
| Backend Services | Node.js (Fastify) or Go | High throughput, low latency, async-first |
| Primary DB | PostgreSQL + PgBouncer | ACID compliance, RLS for multi-tenancy |
| Cache Layer | Redis Cluster | Session store, rate limiting, pub/sub |
| Search | Typesense (B2C) / Elasticsearch (B2B) | Full-text + faceted search |
| Message Queue | Redis BullMQ or Apache Kafka | Async jobs, event streaming |
| File Storage | S3 + CloudFront | Scalable object storage with CDN |
| Observability | OpenTelemetry + Grafana + Loki | Traces, metrics, logs unified |
| Infrastructure | Kubernetes (EKS/GKE) + Terraform | Container orchestration + IaC |

---

## Chapter 12: ADR Creation with Cost Analysis

Architecture Decision Records (ADRs) are the most important artifact for teams building at scale. They turn one-time debates into permanent institutional knowledge — and Claude Code should generate one automatically for every significant design choice.

### When Claude auto-generates an ADR

| Trigger phrase | ADR type | What Claude generates |
|---------------|----------|----------------------|
| "Which database should we use..." | Technology Selection | Options, cost comparison, scale implications, verdict |
| "How should we structure multi-tenancy..." | Data Architecture | Isolation models, migration path, cost at 10K tenants |
| "Should we use microservices or monolith..." | System Architecture | Pros/cons, team size fit, operational cost |
| "How do we handle auth..." | Security Architecture | Options, attack surface, compliance, cost |
| "What's our caching strategy..." | Performance Architecture | Cache layers, invalidation strategies, infra cost |
| "How do we deploy this..." | Infrastructure | Cloud options, IaC approach, monthly cost estimate |

### Create `.claude/skills/adr-creator/SKILL.md`

```markdown
---
name: adr-creator
description: Auto-invoke when user is making an architecture decision, choosing
  between technologies, or asking "should we use X or Y". Auto-invoke for any
  prompt mentioning database, infrastructure, scaling, or cost tradeoffs.
---
# ADR Creator Skill

When generating an ADR, use this exact structure:

## ADR-[NUMBER]: [Decision Title]
**Date:** [today]  |  **Status:** Proposed / Accepted / Deprecated / Superseded
**Deciders:** [PM, Tech Lead, CTO, etc.]

### Context
[Situation forcing this decision. Include scale targets, constraints, team size.
Be specific: "We need to support 100M users with p99 < 200ms, team of 6 engineers"]

### Decision Drivers
- [ ] Performance at target scale
- [ ] Monthly infrastructure cost
- [ ] Team expertise / learning curve
- [ ] Vendor lock-in risk
- [ ] Time to implement
- [ ] Operational complexity

### Options Considered

#### Option 1: [Name]
| Criterion | Score (1-5) | Notes |
|-----------|-------------|-------|
| Performance | X | ... |
| Cost @ MVP (<1K users/mo) | $X | ... |
| Cost @ Growth (10K users/mo) | $X | ... |
| Cost @ Scale (1M users/mo) | $X | ... |
| Cost @ Target (100M users/mo) | $X | ... |
| Team expertise | X | ... |
| Lock-in risk | X | ... |

**Pros:** ...  |  **Cons:** ...

[Repeat for each option]

### Decision
[CHOSEN OPTION] because [specific reason tied to decision drivers].

### Cost Analysis Summary
| Scale | Monthly Cost | Key Cost Drivers |
|-------|-------------|-----------------|
| MVP (<1K users) | $X | ... |
| Growth (10K users) | $X | ... |
| Scale (1M users) | $X | ... |
| Target (100M users) | $X | ... |
**Break-even vs alternatives:** [e.g., cheaper than Option B above 50K users]

### Consequences
**Positive:** ...
**Negative (accepted risks):** ...
**Migration path if wrong:** [How we undo this if assumptions prove false]
```

### Sample ADR — Database Selection

```
ADR-001: Primary Database Selection
Date: 2026-03-07  |  Status: Accepted  |  Deciders: PM, Tech Lead, CTO

Context: B2C app targeting 100M users (read-heavy, 10:1 ratio). B2B module
needs multi-tenancy for 10K customers with strict isolation and audit trails.
p99 latency < 200ms. Team of 6, all comfortable with SQL.

Decision: PostgreSQL with PgBouncer + read replicas

NOT MongoDB: Query flexibility not needed, ACID required for B2B billing
NOT MySQL: RLS for multi-tenancy is less mature
NOT CockroachDB: Cost 3x at 100M scale vs self-managed Postgres

Cost: $800/mo (MVP) → $4,200/mo (1M users) → $28,000/mo (100M users)
Migration path: Schema is portable to Aurora Postgres with 2-week migration.
```

> **ADR best practices** from [adr.github.io](https://adr.github.io) and Michael Nygard's original ADR proposal at [cognitect.com/blog](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions).

---

## Chapter 13: Architecture Patterns — Choosing the Right One

### Pattern Decision Table

| If your product needs... | Use this pattern | Key technologies |
|--------------------------|-----------------|-----------------|
| High read throughput (social feeds, dashboards) | CQRS + Read replicas + Cache-aside | Redis, Postgres read replicas, Materialized views |
| Complex business workflows (approvals, pipelines) | Saga pattern + Event Sourcing | Kafka/Redis Streams, Event store, Compensating transactions |
| Real-time collaboration (docs, chat) | CRDT + WebSocket broadcasting | Yjs, Socket.io, Redis Pub/Sub |
| Multi-tenant SaaS (B2B) | Silo model (per-tenant DB) or Pool model (RLS) | Postgres RLS, schema-per-tenant, PgBouncer |
| AI features at scale | Async inference + result caching + streaming | Claude API, Redis cache, SSE/WebSocket |
| Global deployment | Edge-first + data residency | Cloudflare Workers, Durable Objects, regional Postgres |
| Event-driven microservices | Choreography (events) or Orchestration (saga) | Kafka, Redis Streams, message schemas |

### Prompting Claude for architecture advice

Always include scale targets when asking for architectural guidance:

```
"Design the data model for a multi-tenant SaaS analytics platform.
Scale targets: 10K B2B customers, 50M events/day, p99 query < 500ms.
Requirements: row-level security, custom dimensions, time-series aggregation.
Generate ADR-[N] with cost analysis at 4 scale tiers."
```

---

## Chapter 14: Conversational Agent Experiences — The Acts Framework

The most sophisticated Claude Code setup treats multi-step AI interactions as a narrative — not a one-shot prompt. Writing agent experiences as **Acts** creates structured, testable, resumable conversation flows.

### The 5 Acts

| Act | Purpose | Claude Behaviour | Output |
|-----|---------|-----------------|--------|
| **Act 1: Context** | Establish goals, constraints, current state | Asks clarifying questions (max 5, assumptions first) | Confirmed assumption list |
| **Act 2: Discovery** | Explore problem space, surface unknowns | Runs relevant skills (/discover, /evaluate, ADR) | Options, risks, recommendations |
| **Act 3: Design** | Make choices, create artefacts | Generates PRD, ADR, architecture plan | **PAUSE — wait for approval** |
| **Act 4: Implementation** | Build iteratively with checkpoints | Writes code, updates TASKS.md, asks before scope changes | Working code + updated backlog |
| **Act 5: Review** | Validate, document learnings, update system | Runs tests, suggests CLAUDE.md improvements | Session eval, updated skills |

> **Critical rule:** Never skip the Act 3 pause. Never proceed to implementation without confirmed design.

### Create `.claude/commands/act.md`

```markdown
# Structured Agent Experience

Run a structured 5-act experience for the goal described.

Act 1 — Context: Ask max 5 clarifying questions. State assumptions first.
Act 2 — Discovery: Run /evaluate + identify risks + surface unknown unknowns.
Act 3 — Design: Generate ADR (if architectural) + component/data design.
         ⏸️ PAUSE — wait for explicit user approval before Act 4.
Act 4 — Implementation: Build iteratively. After each major component:
         - Output: "✅ IMPLEMENTED: [what was built]"
         - Output: "⏸️ PARKED: [what was deferred and why]"
         - Output: "🔍 DISCOVERED: [new requirements or risks found]"
Act 5 — Review: Summarise session, run /update-backlog, suggest CLAUDE.md improvement.

Never skip the Act 3 pause. Never proceed to Act 4 without confirmed design.
```

### Complete worked example — B2B Analytics Dashboard

<details>
<summary><strong>Act 1: Context Setting</strong></summary>

```
👤 PM: "We need to build an analytics dashboard for our B2B customers."

🤖 Claude: "Before I start, let me confirm my assumptions:
  1. Each customer (tenant) sees only their own data — RLS required?
  2. Estimated customers: 50 at launch, growing to 10K over 2 years?
  3. Primary metrics: DAU, feature adoption, funnel conversion — or different?
  4. Real-time (WebSocket) or near-real-time (5-min refresh) is acceptable?
  5. Existing stack: Next.js + Postgres — stay in stack?

  I'm assuming out of scope: custom report builder, data exports, white-labelling."

👤 PM: "Yes to all. Also p99 dashboard load < 2 seconds."
```

</details>

<details>
<summary><strong>Act 2: Discovery & Analysis</strong></summary>

```
🤖 Claude: "Running /evaluate on this approach...

  ⚡ Key insight: At 10K tenants with shared Postgres, analytics queries touching
  aggregated event tables will cause tenant contention. Recommendation:
  Pre-aggregate daily stats via BullMQ background job, cache per-tenant summaries
  in Redis. This brings p99 from ~4s to ~300ms at 10K tenants.

  🚨 FATAL RISK: Without read replicas, analytics queries starve write operations
  during peak hours. Adding to ADR-003.

  ⏸️ PARKED: Custom date-range picker (adds 3 days engineering, out of scope v1)
  🔍 DISCOVERED: Need audit log for GDPR compliance — adding to backlog."
```

</details>

<details>
<summary><strong>Act 3: Design (with approval pause)</strong></summary>

```
🤖 Claude: "Generating ADR-003: Analytics Query Architecture...
  [Full ADR with cost at 50/1K/10K tenants]

  Proposed components:
  • /components/analytics/DashboardShell.tsx (tenant context)
  • /components/analytics/MetricCard.tsx (reusable, any metric)
  • /api/analytics/[tenantId]/summary.ts (auth + RLS enforced)
  • /jobs/analytics-aggregator.ts (BullMQ daily job)

  ⏸️ PAUSING — shall I proceed with this design, or adjust first?"
```

</details>

<details>
<summary><strong>Act 4: Implementation</strong></summary>

```
🤖 Claude: "Implementing in phases:

  ✅ IMPLEMENTED: DashboardShell with tenant isolation (RLS confirmed in tests)
  ✅ IMPLEMENTED: MetricCard component with skeleton loading state
  ⏸️ PARKED: Sparkline charts — recharts adds 40KB bundle, deferring to v1.1
  🔍 DISCOVERED: Missing index on events.tenant_id + created_at — adding migration

  📋 TASKS.md updated: 2 complete, 1 parked, 1 new item added."
```

</details>

<details>
<summary><strong>Act 5: Review & Learning</strong></summary>

```
🤖 Claude: "Session summary:
  ✅ Delivered: DashboardShell, MetricCard, API route, aggregation job
  📄 ADR-003 stored in docs/adr/
  📋 TASKS.md: 4 complete, 2 parked, 1 blocked (read replica — infra team)

  💡 CLAUDE.md improvement: Add rule — 'Always check for missing DB indexes
  when writing new query patterns.' I nearly missed the events table index.

  📊 Quality estimate: 9/10"
```

</details>

### Non-technical PM discovery example

<details>
<summary><strong>Full Acts for a Discovery Session (no code)</strong></summary>

```
━━━ ACT 1 ━━━
👤 PM: "I want to run a discovery session for a new AI writing assistant feature"
🤖 Claude: "Who is the primary user: professional writers, students, or knowledge
  workers? And what's the one problem they can't solve today?"

━━━ ACT 2 ━━━
🤖 Claude: "Key insight: 73% of 'writing is hard' complaints are actually
  'starting is hard' — the blank page problem. This reframes the solution space
  entirely: you need a first-draft generator, not a writing enhancer.

  Riskiest assumption: Users will trust AI drafts enough to start from them,
  rather than ignoring them and starting from scratch anyway."

━━━ ACT 3 ━━━
🤖 Claude: "Recommended experiment before building: Show 20 users an AI-generated
  first draft of something they have to write this week. Measure:
  (a) did they use it as starting point?
  (b) how much did they edit?
  (c) did they finish faster?

  This is a 1-week pretotype — no code needed.
  Shall I generate the interview script and pretotype protocol?"

━━━ ACT 5 (session close) ━━━
🤖 Claude: "Backlog updated. /write-prd queued for after experiment results.
  Next session trigger: when experiment data is back."
```

</details>

> **Concept credit:** The theatrical "Acts" framing for AI interactions draws from narrative design principles and is inspired by the structured conversation flows documented by practitioners in the [awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code) community.

---

## Chapter 15: Self-Learning Loops

Self-learning loops work at three levels: **session** (what worked this session), **project** (what patterns are improving), and **system** (the instructions themselves getting better over time).

| Loop Level | Mechanism | What gets improved |
|-----------|-----------|-------------------|
| **Session** | PostToolUse hooks + error logging | Immediate error → fix → validation |
| **Project** | CLAUDE.md iteration + skill refinement | Instruction clarity, common mistakes |
| **System** | Auto-detect bad patterns → update skills | Code quality, architecture consistency |

### Session-end learning hook

Add to `.claude/settings.json`:

```json
"Stop": [{
  "hooks": [{
    "type": "command",
    "command": "echo '# Session $(date)\n## Git diff: $(git diff --stat HEAD 2>/dev/null)\n## Tests: $(npm test 2>&1 | tail -3)' >> .claude/session-log.md"
  }]
}]
```

### Weekly improvement ritual

Every Friday, run this prompt:

```
"Review .claude/session-log.md from this week.
Identify:
1. Patterns where Claude missed instructions (candidates for hooks)
2. Skills that triggered incorrectly or not at all (refine descriptions)
3. Recurring mistakes (add to CLAUDE.md or create a new skill)
Suggest 3 specific improvements with the exact change to make."
```

> **The compounding effect:** Teams that run this ritual weekly report CLAUDE.md improving from ~70% instruction-following to ~95%+ within a month. Source: community observations at [rosmur.github.io/claudecode-best-practices](https://rosmur.github.io/claudecode-best-practices/).

---

## Chapter 16: Token Optimization Strategies

Context window management is the primary failure mode for advanced Claude Code users. These strategies prevent quality degradation.

| Strategy | How to implement | Impact |
|----------|-----------------|--------|
| `/compact` at 50% context | Run before it auto-compacts at ~80% | Prevents quality degradation at end of long sessions |
| Modular CLAUDE.md | Root file <200 lines; sub-docs loaded on demand | 60-80% token reduction vs monolithic file |
| Skill descriptions > full content | Skills load only when description matches | Skills only consume tokens when relevant |
| `/clear` between tasks | Use when switching to unrelated work | Prevents cross-contamination |
| Reference files, not contents | Write "see docs/arch.md" not the full doc | Claude fetches on demand |
| Feature-specific subagents | Each agent gets focused context | Main context stays clean |
| Structured prompts | Use XML tags: `<context>`, `<task>`, `<constraints>` | Less ambiguity, faster parsing |

### /compact vs /clear — when to use which

```
/context  → Run first: see how full your window is
/compact  → Mid-task, need to continue: compresses history, keeps working memory
/clear    → Switching tasks entirely: full reset, no contamination
/model    → Check which model is active
/usage    → Set a weekly token budget
```

> **Community finding:** Auto-formatting hooks can consume significant tokens (160K reported across 3 rounds). Consider manual formatting between sessions rather than PostToolUse auto-format. Source: [rosmur.github.io/claudecode-best-practices](https://rosmur.github.io/claudecode-best-practices/).

---

## Chapter 17: Auto-Improving Your Instructions

### Create `.claude/skills/instruction-auditor/SKILL.md`

```markdown
---
name: instruction-auditor
description: Auto-invoke when user asks to review or improve CLAUDE.md, skills,
  or prompts. Also invoke when code quality is declining or Claude repeatedly
  misses instructions.
---
# Instruction Auditor

## Detect These Anti-Patterns
- CLAUDE.md > 200 lines → split into sub-files
- Linting rules in CLAUDE.md → move to PostToolUse hook
- Hardcoded code snippets → replace with file:line pointers
- Vague skill descriptions → add trigger keywords
- Instructions in CLAUDE.md that must be deterministic → move to hook

## For each issue found, output:
1. What the problem is
2. Why it hurts output quality
3. The specific fix with example
```

### Prompt quality rubric

| Quality | Signals | Fix |
|---------|---------|-----|
| **Weak** | No context, no scale targets, no constraints | Add: stack, targets, patterns to use/avoid |
| **Medium** | Has context but missing success criteria | Add: acceptance criteria, performance targets |
| **Strong** | Context + criteria + constraints + examples | Target state — produces production-ready code |
| **Over-specified** | Step-by-step micromanagement | Trust Claude with the *how*; specify *what* and *why* |

---

## Chapter 18: Making This Your Default Setup

### Global configuration (applies to all projects)

```
~/.claude/
├── settings.json          # Global safety hooks, notifications
├── CLAUDE.md              # Personal preferences, always-on rules
└── skills/
    └── personal-style/SKILL.md   # Your communication preferences
```

### One-time global setup script

```bash
#!/bin/bash
# Run once: bash setup-claude-global.sh

# Create global skill directory
mkdir -p ~/.claude/skills/personal-style

# Install PM Skills globally
claude plugin marketplace add phuryn/pm-skills

echo "✅ Claude Code default setup complete!"
```

### Per-project bootstrap prompt

When starting any new project, run this in Claude Code:

```
"Create a .claude/ directory structure following Anthropic best practices.
Include:
- settings.json with safety hooks (block rm -rf, git push --force, main branch protection)
- root CLAUDE.md under 200 lines documenting [your stack and scale targets]
- skill stubs for: adr-creator, clarification-gate, honest-evaluator, instruction-auditor
- commands: update-backlog, evaluate, act
- a skill-router UserPromptSubmit hook that recommends pm-skills commands when relevant
Also create TASKS.md and BACKLOG.md with the standard template."
```

### Smart skill router hook

```bash
# .claude/hooks/skill-router.sh
#!/bin/bash
# Extract prompt without jq — use bash parameter expansion
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
```

Wire into settings.json:
```json
"UserPromptSubmit": [{
  "hooks": [{ "type": "command", "command": ".claude/hooks/skill-router.sh", "timeout": 5 }]
}]
```

---

# ⚡ Quick Reference

## Situational Quick Reference Card

| Situation | What to do |
|-----------|-----------|
| Starting any new feature | `/act [goal]` → 5-act structured experience with clarification gate |
| Need architecture decision | `/evaluate` + ADR auto-generated by `adr-creator` skill |
| Need cost analysis | ADR template includes costs at 4 scale tiers (MVP → 100M users) |
| After completing work | `/update-backlog` — marks done, adds parked, logs discovered items |
| Idea needs validation | `/evaluate [idea]` → strengths / fatal flaws / BUILD NOW/LATER/DIFFERENTLY |
| Starting ambiguous work | `clarification-gate` fires — max 5 questions, assumptions stated first |
| Context window 50%+ full | `/compact` before auto-compact degrades quality |
| Switching to different task | `/clear` — full reset, prevents interference |
| Instruction missed repeatedly | Move from CLAUDE.md to a `PreToolUse`/`PostToolUse` hook |
| Weekly system improvement | Act 5 ritual → "suggest 3 CLAUDE.md improvements from this week" |
| Before any launch | `/pre-mortem [feature]` — Tigers / Paper Tigers / Elephants |
| Non-tech PM learning SE | "Explain [concept] as a PM analogy + what it means for my PRD" |
| Token check | `/context` → `/model` to see usage → `/usage` to set budget |
| Prompt quality low | Add: scale targets + acceptance criteria + constraints |

## Command Routing Decision Tree

```
New request from user
        │
        ▼
Is this a safety/quality rule?
   YES → Hook (PreToolUse / PostToolUse)
   NO  ↓
        ▼
Must it ALWAYS run without exception?
   YES → Hook
   NO  ↓
        ▼
Do I want to trigger it explicitly?
   YES → Slash Command (.claude/commands/)
   NO  ↓
        ▼
Is it a complex multi-step workflow?
   YES → Subagent (.claude/agents/) 
   NO  ↓
        ▼
Does it need external services?
   YES → MCP Server (.mcp.json) + Command/Agent
   NO  ↓
        ▼
→ Skill (.claude/skills/) — auto-invokes when description matches
```

## Hook Events Reference

| Event | Fires when | Best use case |
|-------|-----------|--------------|
| `PreToolUse` | Before any tool call | Block dangerous commands, enforce branch rules |
| `PostToolUse` | After any tool call | Auto-format, run tests, validate output |
| `SessionStart` | Session begins | Inject sprint context, show recent commits |
| `Notification` | Claude needs attention | Desktop alerts, Slack notifications |
| `Stop` | Claude finishes responding | Build checks, session metrics |
| `UserPromptSubmit` | User submits a prompt | Auto-recommend skills/commands |
| `ConfigChange` | Settings files change | Audit logging |
| `SubagentStart` | Subagent launches | Inject subagent context |
| `SubagentStop` | Subagent completes | Collect subagent results |

## PM Skills Commands at a Glance

| Command | What it chains | When to use |
|---------|--------------|------------|
| `/discover [idea]` | brainstorm → assumptions → prioritise → experiments | Starting any new feature or product |
| `/write-prd [feature]` | 8-section PRD (Cagan framework) | Before any engineering work |
| `/strategy [product]` | 9-section Product Strategy Canvas | Quarterly/annual planning |
| `/plan-launch [feature]` | GTM: beachhead → ICP → channels → launch plan | 4-6 weeks before launch |
| `/pre-mortem [PRD]` | Tigers / Paper Tigers / Elephants risk analysis | After PRD, before sprint |
| `/sprint plan` | Capacity estimation, story selection, risk ID | Sprint planning sessions |
| `/sprint retro` | Structured retrospective facilitation | End of each sprint |
| `/market-scan [market]` | SWOT + PESTLE + Porter's Five Forces + Ansoff | Competitive analysis |
| `/analyze-test [data]` | Statistical significance + ship/extend/stop | After any A/B experiment |
| `/north-star [product]` | North Star Metric + input metrics | Metrics alignment |
| `/write-stories user` | User stories (3C's + INVEST criteria) | Before sprint grooming |
| `/evaluate [idea]` | Honest: strengths / flaws / costs / verdict | Any idea or architecture choice |
| `/act [goal]` | Full 5-act structured experience | Any non-trivial new work |
| `/update-backlog` | Sync TASKS.md: done / parked / discovered | End of every session |

---

# 📚 Credits & References

This guide synthesises work from many practitioners and researchers. Full attribution:

### Frameworks & Methodologies

| Framework | Source | Where used in this guide |
|-----------|--------|--------------------------|
| Continuous Discovery | Teresa Torres — [*Continuous Discovery Habits*](https://www.amazon.com/dp/1736633309) (Product Talk, 2021) | `/discover`, assumption mapping, OST |
| Product Management | Marty Cagan — [*INSPIRED*](https://www.amazon.com/dp/1119387507) & [*TRANSFORMED*](https://www.amazon.com/dp/1119697336) (Wiley, 2018/2024) | PRD template, outcome-focused roadmaps |
| Pretotypes | Alberto Savoia — [*The Right It*](https://www.amazon.com/dp/0062884654) (HarperBusiness, 2019) | Experiment design, `/brainstorm experiments new` |
| Lean Product | Dan Olsen — [*The Lean Product Playbook*](https://www.amazon.com/dp/1118960874) (Wiley, 2015) | Product-market fit hierarchy |
| Strategy | Roger L. Martin — [*Playing to Win*](https://www.amazon.com/dp/B0F25SDYWV) (HBR Press, 2013) | Strategy canvas |
| Running Lean | Ash Maurya — [*Running Lean*](https://www.amazon.com/dp/B004J4XGN6) (O'Reilly, 2012) | Lean Canvas |
| Business Models | Strategyzer — [*Business Model Generation*](https://www.amazon.com/dp/0470876417) & [*Value Proposition Design*](https://www.amazon.com/dp/1118968050) | BMC, VPC |
| OKRs | Christina Wodtke — [*Radical Focus*](https://www.amazon.com/dp/0996006052) (Cucina Media, 2021) | OKR framework |
| Jobs to Be Done | Anthony Ulwick — [*Jobs to Be Done*](https://jobs-to-be-done-book.com) (Idea Bite Press, 2016) | JTBD value propositions |
| Lean Analytics | Croll & Yoskovitz — [*Lean Analytics*](https://www.amazon.com/dp/1449335675) (O'Reilly, 2013) | Metrics, North Star |
| Growth | Sean Ellis — [*Hacking Growth*](https://www.amazon.com/dp/045149721X) (Crown Business, 2017) | Growth loops |
| Go-to-Market | Maja Voje — [*Go-To-Market Strategist*](https://gtmstrategist.com) | GTM motions, beachhead |

### Tools & Repositories

| Project | Creator | Stars | What this guide uses |
|---------|---------|-------|---------------------|
| [phuryn/pm-skills](https://github.com/phuryn/pm-skills) | [Paweł Huryn](https://www.productcompass.pm) | ⭐ 55 | 65 PM skills, 36 commands, 8 plugins |
| [hesreallyhim/awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code) | Community | — | Skills, hooks, commands directory |
| [shanraisshan/claude-code-best-practice](https://github.com/shanraisshan/claude-code-best-practice) | Shan Raisshan | — | Command → Agent → Skill architecture |
| [ChrisWiles/claude-code-showcase](https://github.com/ChrisWiles/claude-code-showcase) | Chris Wiles | — | Reference hooks, settings, skills |

### Official Documentation

| Resource | URL |
|----------|-----|
| Claude Code Documentation | [code.claude.com/docs](https://code.claude.com/docs) |
| Claude Code Best Practices | [code.claude.com/docs/en/best-practices](https://code.claude.com/docs/en/best-practices) |
| Hooks Guide | [code.claude.com/docs/en/hooks-guide](https://code.claude.com/docs/en/hooks-guide) |
| Hooks Reference | [code.claude.com/docs/en/hooks](https://code.claude.com/docs/en/hooks) |
| Skills Guide | [code.claude.com/docs/en/skills](https://code.claude.com/docs/en/skills) |
| Anthropic Model Docs | [docs.anthropic.com](https://docs.anthropic.com) |

### Community Writing

- [genaiunplugged.substack.com](https://genaiunplugged.substack.com/p/claude-code-skills-commands-hooks-agents) — Skills, Commands, Hooks & Agents tutorial
- [alexop.dev/posts/understanding-claude-code-full-stack](https://alexop.dev/posts/understanding-claude-code-full-stack/) — Full stack MCP/Skills/Subagents guide
- [rosmur.github.io/claudecode-best-practices](https://rosmur.github.io/claudecode-best-practices/) — Community aggregated best practices
- [eesel.ai/blog/claude-code-best-practices](https://www.eesel.ai/blog/claude-code-best-practices) — 7 essential production best practices
- [youngleaders.tech](https://www.youngleaders.tech/p/claude-skills-commands-subagents-plugins) — Skills vs Commands vs Subagents vs Plugins
- ADR format: [adr.github.io](https://adr.github.io) and Michael Nygard's original post at [cognitect.com](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions)

---

## 🤝 Contributing

This is an open-source project. Contributions are welcome.

**Ways to contribute:**
- Add new PM skills or commands you've found effective
- Improve the PM ↔ Engineering bridge with new concepts
- Share sample CLAUDE.md files from real projects (anonymised)
- Add use case examples (Acts) for different PM contexts
- Translate sections for non-English-speaking PM communities
- Report outdated Claude Code APIs or deprecated features

**Contribution guidelines:**
1. Fork the repo and create a feature branch
2. Follow the existing structure (level-appropriate content, source credits)
3. Test any code/hooks before submitting
4. Include credits for any frameworks or ideas you're drawing from
5. Submit a PR with a clear description of what you've added and why

---

## 📄 License

MIT License — see [LICENSE](LICENSE) for details.

You are free to use, modify, and distribute this guide for personal and commercial use with attribution.

---

## ⚠️ Disclaimer

THIS GUIDE IS PROVIDED FOR **EDUCATIONAL AND INFORMATIONAL PURPOSES ONLY**.

- This playbook does **not** constitute professional advice of any kind, including engineering, legal, security, or product management advice.
- All code examples, shell scripts, hooks, and configurations are provided **"AS IS"** without warranty of any kind, express or implied.
- The authors and contributors are **not** responsible for any decisions, actions, or consequences arising from the use of this guide, including data loss, security incidents, or business decisions made based on the frameworks presented herein.
- Users are **solely responsible** for reviewing, testing, and validating all code before use in any environment.
- Claude Code is a product of [Anthropic](https://www.anthropic.com). This guide is an independent community resource and is **not** affiliated with, endorsed by, or sponsored by Anthropic.
- The [pm-skills](https://github.com/phuryn/pm-skills) plugin collection is maintained by Pawel Huryn. This guide references and builds upon pm-skills but is independently maintained.

See [NOTICE](NOTICE) for full attribution and legal details.

---

## 🔐 Security & Governance

| Document | Description |
|----------|-------------|
| [SECURITY.md](SECURITY.md) | Vulnerability reporting policy |
| [PRIVACY.md](PRIVACY.md) | Privacy policy |
| [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) | Community standards |
| [CONTRIBUTING.md](CONTRIBUTING.md) | How to contribute |
| [NOTICE](NOTICE) | Attribution and legal disclaimer |

---

<div align="center">

**Built for the PM community • March 2026**

*If this guide helped you, please ⭐ the repo and share it with your PM network.*

[🟢 Back to Level 1](#-level-1--foundations) • [🟡 Back to Level 2](#-level-2--pm-productivity) • [🔴 Back to Level 3](#-level-3--advanced-mastery)

</div>

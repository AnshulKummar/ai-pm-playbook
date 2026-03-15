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

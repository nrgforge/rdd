# ADR-053: Time Budget Mechanism Across Composable Skills

**Status:** Proposed

## Context

The review skill already prompts "How much time do you have?" and adapts its depth accordingly (ADR-044, interaction specifications). Essay 011 identifies the same need across all four skills: "Five minutes of genuinely oriented work beats thirty minutes of unfocused generation. The skill should scale engagement to available time, not impose a fixed ceremony."

Invariant 4 constrains the design: "Epistemic cost must be productive, not merely brief." The adaptation must scale scope and ceremony while preserving understanding quality. The product discovery value tension (Cycle 6) frames the tension: "Career development vs. task completion — the same skill serves both. The user draws the line."

## Decision

Each skill in the Composable Skill Family prompts for available time during or immediately after Context Gathering. The skill adapts along a **continuous spectrum** with three guideposts:

**Deep (30+ minutes):**
- Full Context Gathering with all five Orientation Questions
- Full work decomposition with dependency classification
- Complete TDD cycle with three-level refactor
- Stewardship at every scenario group boundary
- Integration verification against real neighbors

**Standard (10-30 minutes):**
- Full Context Gathering
- Work decomposition focused on the most impactful items
- TDD cycle with refactor at level 1 (smells) and level 2 (patterns)
- Stewardship at natural stopping points

**Focused (<10 minutes):**
- Essential orientation: the single most consequential answer from each Orientation Question
- Single work item (the highest-priority package)
- TDD cycle: red-green, refactor only if a smell is glaring
- No formal stewardship — the short session is itself the scope
- **Note:** Focused mode preserves orientation quality but reduces the depth of downstream epistemic work (stewardship, three-level refactor). It is most appropriate when the developer already holds strong domain understanding and needs to act quickly on familiar ground. A developer without that understanding will benefit from a longer time budget.

**Invariant: user validation of orientation is never skipped.** Even under extreme time pressure, "Does this capture the situation?" is one sentence. The skill makes validation lightweight enough that skipping it feels like cutting a corner, not removing overhead.

The time budget is advisory, not enforced. The skill does not watch a clock. It uses the budget to calibrate its initial scope. If the developer wants to go deeper mid-session, the skill adapts.

**Rejected alternative:** Fixed-depth skills (e.g., `/rdd-build-quick` vs `/rdd-build-deep`). Rejected because: (1) the adaptation is continuous, not categorical; (2) proliferating skill variants fragments the plugin surface; (3) the review skill demonstrates that a single skill with a time prompt works.

**Rejected alternative:** No time prompt — the skill always runs at full depth. Rejected because: the Everyday Developer working a routine ticket does not need the same ceremony as a complex feature. Imposing full depth on every task would drive the exact disengagement Invariant 4 warns against.

## Consequences

**Positive:**
- All skills adapt to the developer's real constraints while preserving orientation quality; the depth of downstream epistemic work (stewardship, three-level refactor) scales with available time
- Consistent mechanism across the skill family (same pattern as the proven review skill)
- The focused mode makes epistemic building practical for small tasks
- The spectrum is continuous — no artificial boundaries between modes

**Negative:**
- The agent must calibrate scope from a time estimate, which is inherently imprecise
- A developer who consistently chooses "focused" may never experience the deeper modes. This may be appropriate (internalized practices, minimal scaffolding needed — Invariant 6 working correctly) or a system-level concern (time pressure structurally preventing epistemic engagement). The skill has no mechanism to distinguish these; future cycles may address this through engagement detection

**Neutral:**
- In pipeline mode with a full artifact corpus, the deep guidepost is the natural default — the artifacts provide the context without extra effort

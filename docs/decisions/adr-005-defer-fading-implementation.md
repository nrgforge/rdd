# ADR-005: Defer Fading Implementation

**Status:** Proposed

## Context

Invariant 6 states that scaffolding must fade — constant AI assistance at a fixed level is a crutch, not scaffolding. The essay (§5, §6) describes fading as the gradual shift of generative burden from AI to user as expertise grows across RDD cycles. The cognitive apprenticeship framework (Collins, Brown, & Newman) identifies fading as one of the three methods RDD currently lacks.

However, the essay (§10) also identifies a constraint: fading requires expertise assessment, and neither self-assessment (unreliable due to metacognitive illusion) nor AI assessment of human understanding is a solved problem. Designing a fading mechanism without a reliable trigger risks either premature withdrawal (frustrating the user) or permanent scaffolding (violating Invariant 6).

## Decision

Implement epistemic gates at a fixed level for the first version. All gates present the same epistemic act prompts regardless of the user's experience with the domain or with RDD.

Defer the design of a fading mechanism to a future RDD cycle, after the fixed-level gates have been used in practice and the team has experience data about how epistemic act quality changes over repeated cycles.

Acknowledge Invariant 6 as a known design debt: the first version satisfies Invariants 0-5 and 7 but does not satisfy Invariant 6. This debt is acceptable because:
1. Fixed-level gates are strictly better than no gates (the current state)
2. Premature fading could undermine the learning mechanisms the gates are designed to activate
3. Real usage data will inform better fading design than theoretical speculation

**Revisit trigger:** After the user has completed 3-5 full RDD cycles with fixed-level epistemic gates, the orchestrator should explicitly ask: "Are the epistemic act prompts still generating genuine cognitive effort, or are they feeling routine?" If routine, the desirable difficulty has evaporated and the fixed-level acts are no longer activating their intended learning mechanisms. At that point, initiate a new RDD research cycle focused on designing a fading mechanism.

**What fades and what doesn't.** Invariant 2 states unconditionally that no phase transition may consist solely of approval. This is not scaffolding — it is a structural requirement that never fades. The user must always produce something at every gate. What fades is the *specificity of the prompts*, not the *requirement to generate*:
- **Early cycles:** Specific, guided prompts ("Explain the key tradeoff the essay identifies, in your own words")
- **Later cycles:** Open prompts that trust the user to self-direct ("What's your understanding of this artifact?")
- **Never:** Skipping the generative requirement entirely

The explicit prompts are the guard against slipping into passive approval. Fully removing them removes the guardrail. Under time pressure, fatigue, or domain familiarity, the path of least resistance is always passive approval — the metacognitive illusion makes regression invisible to the user experiencing it. The gate is a seatbelt, not training wheels.

## Consequences

**Positive:**
- Avoids designing a fading mechanism without the data to design it well
- Keeps the first implementation simple and focused on the core change (approval → epistemic gates)
- Establishes a baseline against which future fading can be measured

**Negative:**
- Violates Invariant 6 in the first version — scaffolding does not fade
- Experienced users may find fixed-level prompts tedious after many RDD cycles
- The known debt must be tracked and revisited

**Neutral:**
- When fading is eventually designed, it will likely modify the skill files' gate sections — the same files being changed by ADR-001 through ADR-003. The architecture supports this evolution.

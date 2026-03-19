# ADR-028: Structural Experiments as Framing Mechanism

**Status:** Proposed

## Context

ADR-013's framing conversation (Phase 3) is currently discursive — the agent offers narrative frameworks as lenses, the writer discusses them, and they converge on a form. Essay 006 argues this understates the mechanism at work. Drawing on ensemble-based devising traditions (Viewpoints, Laban, SITI Company, Frantic Assembly), the essay identifies a stronger principle: **discovery comes from the outside** — from externalized structural experimentation, not from thinking about structure.

The OuLiPo tradition establishes that formal constraint unlocks creative discovery (Queneau's *Exercises in Style*). Miller & Paola's hermit crab essay demonstrates that the borrowed form "generates content the writer would not have found otherwise" by bypassing what the intellectual mind has already determined as "the story." But the devising traditions make the stronger claim: the compelling material does not emerge from planning or deliberation — it emerges from physical, externalized experimentation with structure. The form is an instrument of discovery, not a container for pre-existing content (Form-Content Generation).

This has a direct implication for how the framing conversation should work: it should involve *trying forms on*, not just discussing them.

## Decision

The framing conversation uses structural experiments — quick, externalized trials in candidate forms — as its primary mechanism for navigating the four dimensions (ADR-027). A structural experiment is:

- **Quick** — a paragraph, a sketch, a few bullet points, not a full draft
- **Externalized** — written down, not discussed in the abstract
- **In a candidate form** — inhabiting a specific narrative form, audience constraint, or epistemic posture
- **Diagnostic** — done to see what the form reveals, not to commit to it

Examples:
- Draft an opening paragraph as pseudocode (hermit crab experiment)
- Rewrite the pitch for a five-year-old (audience constraint experiment)
- Arrange the artifacts as exhibition stops (curatorial experiment)
- Write the volta as a recipe step where the expected ingredient is replaced (form-content experiment)

Failures are informative. When a structural experiment does not work — when the form and material clash — the mismatch clarifies what the material actually needs, sometimes more clearly than deliberation could. The writer and agent try on multiple forms, observe what each reveals, and converge on the form the material demands through accumulated experimentation, not abstract selection.

The agent proposes structural experiments; the writer executes them. This preserves the epistemic division: the agent creates conditions for discovery (pragmatic), the writer generates (epistemic). The agent may draft a structural experiment as a starting provocation, but the writer must produce their own version rather than merely reacting to the agent's. The agent's draft is a catalyst, not a submission for approval.

## Consequences

**Positive:**
- Replaces "discuss and select" with "try and discover" — the form becomes a lens, and the writer does not know what it will show until they look through it
- Grounded in established creative practice traditions with empirical support (devising, OuLiPo, creative writing pedagogy)
- Failed experiments are diagnostic, not wasted — they narrow the space of suitable forms
- Naturally produces engagement at the gate (ADR-016) — trying on forms is inherently generative
- Structural experiments may surface new research questions (feeds ADR-029, synthesis re-entry)

**Negative:**
- Adds work to the framing conversation — trying on forms takes more effort than discussing them, though each experiment is quick (minutes, not hours)
- Quality of experiments depends on the agent's ability to propose illuminating candidate forms — the agent needs a rich repertoire (provided by ADR-027's four dimensions)
- The mechanism is untested within the synthesis skill (open question in domain model, essay 006 §7) — operational testing will reveal whether it works as described

**Neutral:**
- The existing lenses (ABT, story spine, braided structure, inversions) can be expressed as structural experiments — "try writing the ABT sentence" is already a form of externalized sketching
- Structural experiments are the mechanism; the four dimensions (ADR-027) provide the vocabulary — the two ADRs are complementary and designed to work together, though structural experiments can operate with a simpler vocabulary if the four-dimension model is not adopted
- Invariant 4 (epistemic cost must remain lightweight) applies — each experiment should take minutes, and the conversation should not require exhaustive experimentation across all dimensions

# ADR-051: Work Decomposition from Available Sources

**Status:** Proposed

## Context

In pipeline mode, the roadmap provides work packages with classified dependencies (hard/implied/open), transition states, and clear scope. The build loop iterates through these work packages. In context-reconstructive mode, no roadmap exists — the developer has a ticket, a codebase, and whatever sources Context Gathering surfaced.

The product discovery feed-forward (Cycle 6) identifies this as "the most consequential reconstruction — without work packages, the build loop has nothing to iterate through." The Everyday Developer stakeholder's mental model confirms: "I have a ticket — I want to break it into work packages that I understand, build with TDD, and check my work as I go."

## Decision

In context-reconstructive mode, the build skill derives work packages during Context Gathering using the same structural conventions as the roadmap:

1. **Read available sources** — the ticket/task description, relevant codebase areas (the agent explores current structure), and any breadcrumbs from Context Gathering (docs, discussion threads, related code).

2. **Derive work packages** — each package specifies:
   - **Scope:** what changes (bounded, concrete)
   - **Integration points:** what connects to other code or systems
   - **Testable behaviors:** what can be verified (Given/When/Then sketches, not full scenarios)
   - **Dependencies:** classified as hard (structural necessity), implied (logical ordering), or open (genuine choice) — borrowing the roadmap's Dependency Classification vocabulary. At the ticket level, this classification is heuristic rather than architecturally grounded: structural necessity is harder to identify without a full architectural model. Treat the classification as a starting decomposition, not an architectural fact
   - **Demo scenario (optional):** how would a stakeholder use this feature? A lightweight inhabitation sketch that preserves the forward path to Play without requiring the full pipeline

3. **Present for validation** — the user reviews the decomposition. This is where the developer's domain knowledge corrects the agent's interpretation. The user may reorder, split, merge, or reject work packages.

4. **Write as a reconstructed facsimile** — the validated decomposition is written per ADR-050.

The build loop then iterates through the validated work packages, applying the TDD cycle (red → green → refactor) to each.

**The decomposition is approximate, not authoritative.** A roadmap-derived work package has provenance through the full pipeline (research → decisions → architecture → work package). A reconstructed work package has provenance through a ticket and codebase exploration. The user's validation is what makes it good enough to build against — not the agent's analysis alone.

**Rejected alternative:** Skip work decomposition in context-reconstructive mode and let the developer work from the ticket directly. Rejected because: the build loop needs discrete units to iterate through. A ticket like "add user authentication" is not a work package — it is many work packages. Without decomposition, the build skill collapses to "write code for this ticket," which is what every non-epistemic tool already does.

**Rejected alternative:** Require a full roadmap before building. Rejected because: this would force the Everyday Developer through the ARCHITECT phase, defeating the purpose of context-reconstructive mode.

## Consequences

**Positive:**
- The build loop has discrete, testable units to iterate through
- Dependency classification gives the developer sequencing choices (not a prescribed order)
- The decomposition itself is an epistemic act — the developer understands the work's structure before starting
- Consistent with the roadmap's conventions, making promotion to a real roadmap natural if the project grows

**Negative:**
- The agent's decomposition quality depends on available context — thin tickets produce thin decompositions
- The user must actively validate (this is intentional but adds upfront time)

**Neutral:**
- In pipeline mode, the roadmap provides the work packages directly — this ADR does not apply

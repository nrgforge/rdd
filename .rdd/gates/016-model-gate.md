# Gate Reflection: Cycle 016 MODEL → DECIDE

**Date:** 2026-04-19
**Phase boundary:** MODEL → DECIDE
**Cycle:** Multi-Issue Batch Cycle (Issues #10-#16)

## Belief-mapping question composed for this gate

The Applicability Check says it "must shift the attentional frame, not merely add a pause." How confident are you that a stewardship prompt can actually shift an attentional frame, given the Einstellung finding that experts who believed they were searching for alternatives were demonstrably not attending to the relevant features?

## User's response

The user reframed the intervention through Conway's law and decision provenance: code and architecture are structural, and that structure bears out from stakeholder use cases. Implicit in the system-design should be tensions that unfurl by nature of decision provenance. A stewardship check should attend to alternatives that were **grounded** in the provenance chain, not simply searched for.

When the agent overcorrected by replacing search with grounded-alternatives, the user corrected: "it can be both a search for alternatives as well as grounding. They're perhaps complementary strategies." This produced the final two-strategy formulation: grounded alternatives from provenance (surface documented rejected options and their rejection rationale, ask whether rejection reasons still hold) + open-ended search (catch novel differences the original decision never considered).

## Pedagogical move selected

Challenge — asked whether the Applicability Check's stated requirement ("shift the attentional frame") is achievable given the Einstellung evidence, referencing the specific eye-tracking finding that experts who believed they were searching were not actually attending to relevant features.

## Commitment gating outputs

**Settled premises (building on these going into DECIDE):**
- Structural encoding is first-line defense; cognitive-mechanism design is second-line
- Invariant 8 extends to cognitive resources (evidence expansion, not rule change)
- The Applicability Check uses two complementary strategies: grounded alternatives from provenance + open-ended search for novel differences
- The grounded form is as strong as the provenance it can reference — degrades in context-reconstructive mode
- Nine new domain concepts are binding vocabulary for ADRs and scenarios
- The Inversion Principle operates in two directions (expand-outward at RESEARCH, evaluate-inward at BUILD) with direction-appropriate interventions

**Open questions (holding open going into DECIDE):**
- Specific ADR designs for each issue (DECIDE's primary job)
- Scenario decomposition — which behaviors are testable, at what granularity
- Whether #14 (multi-cycle schema) is sequenced as prerequisite or peer to other fixes — deferred to ARCHITECT/roadmap
- How the grounded-alternatives stewardship check integrates with existing stewardship Tier 1 — is it a new sub-item, a separate check, or an extension of an existing check?

**Specific commitments carried forward to DECIDE:**
- ADRs must use the nine new domain model terms as binding vocabulary
- The Applicability Check ADR must specify the two-strategy complementary approach (grounded + search), not just one
- The ADR Supersession ADR must specify the downstream-update trigger as the load-bearing step
- The Acceptance Criteria Table ADR must specify the layer-match check adapted from DO-178C's HLR/LLR distinction

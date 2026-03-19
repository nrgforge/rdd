# ADR-021: Agent-Maintained Orientation Document with User Validation

**Status:** Proposed

## Context

The Orientation Document is a derived artifact — its content comes from the Artifact Trail, not from independent authorship. This makes it a Pragmatic Action (Invariant 3): the agent can generate it without epistemic loss. The user's role is validation, not generation.

However, the Value Tension between agent-generated currency and trustworthy accuracy (product discovery update) requires a clear authorship model. If the agent generates without user review, the document may drift from reality. If the user must author it, it loses the "living" quality — users won't rewrite it every phase. The Synthesis Essay already fills the user-authored explanation role (Invariant 1); the Orientation Document serves a different function.

The Assumption Inversion "what if the user should write it?" (product discovery) confirmed that user authorship would duplicate the synthesis essay's function. The Orientation Document's value is precisely that the agent maintains it.

The document's clarity over time serves as a stewardship signal: a document that grows increasingly abstract or internally contradictory indicates the system may be accumulating the wrong kind of complexity.

## Decision

The Orientation Document follows an agent-generates, user-validates model:

1. **Generation:** The agent produces ORIENTATION.md by reading the current Artifact Trail and distilling it into the five-section structure (ADR-020). This is a Pragmatic Action.

2. **Validation:** The user reviews the generated document for accuracy. This is an indirect test of Authority (Invariant 0) — if the user cannot confirm the document's claims, that signals insufficient engagement at prior gates.

3. **Regeneration timing:** The document should be regenerated at natural milestones and whenever the user requests it. Minimum: after RESEARCH, when only sections 1 (what the system is) and 5 (current state) can be populated — a partial orientation is still useful for the user's own context. The document fills out as phases complete and more artifacts become available. The Scoping use case (Handoff after ARCHITECT) requires mid-cycle generation. Pipeline state is inferred from the artifact trail (which artifacts exist and their content) rather than read from session state.

4. **Iteration:** The agent generates a draft; the user and agent iterate to refine it. This iteration is itself valuable — it tests whether the system can be explained clearly and concisely.

## Consequences

**Positive:**
- The document stays current without burdening the user with authorship
- Validation is lightweight — review and confirm, not write from scratch
- The iteration process surfaces misunderstandings and unclear architecture
- Distinct from the Synthesis Essay — different authorship model, different purpose

**Negative:**
- Risk of rubber-stamp validation — the user may approve without careful review. Mitigated by the document's brevity (under 5 minutes to read) and by the stewardship signal function (problems in the document surface architectural problems)

**Neutral:**
- No new gate is introduced — the document is not a phase artifact with an epistemic gate. The validation model is review-based, which is normally insufficient for understanding (Invariant 1). This is acceptable because no epistemic act is required — the user's understanding was built at the gates that produced the source artifacts
- The source artifacts are authoritative. If the orientation document contradicts a source artifact, the orientation document should be regenerated — the source is not corrected to match the derived document

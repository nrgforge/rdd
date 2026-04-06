# ADR-055: Belief-Mapping Operationalization of Inversion Principle

**Status:** Proposed
**Amends:** ADR-010 (Inversion Principle as Cross-Cutting Principle and Procedural Step) — expands cross-cutting application from four locations to six (adding PLAY and SYNTHESIS), and specifies belief-mapping as the mandatory form

## Context

ADR-010 established the Inversion Principle as both a procedural step within `/rdd-discover` and a cross-cutting principle. It specifies *what* to do (question assumptions before encoding them) but not *how* — leaving the form of the questioning to the agent's judgment.

The Cycle 9 spike experiment (Essay 013, §7) tested two operationalizations across 16 isolated pipeline runs:
- **Adversarial framing** ("strongest case against my stated preference"): overcorrected by 2-6×, shifting content *against* the user's position more strongly than sycophancy shifted it toward. Mechanism: the instruction activates Compliance Dynamics — the model people-pleases the instruction to not people-please.
- **Belief-mapping framing** ("what would I need to believe for the alternative to be right?"): achieved near-zero preference-driven divergence. Content balance decoupled from recommendation direction. Mechanism: epistemic questions sidestep Compliance Dynamics entirely.

The form of the question determines whether the Inversion Principle reduces bias or reverses it. ADR-010's current specification leaves form selection to the agent — which reintroduces the Content Selection problem (the agent selects which form to use).

## Decision

The Inversion Principle is operationalized through **belief-mapping questions** as the primary form. The canonical form is: "What would I need to believe for [the alternative] to be right?"

This amends ADR-010's cross-cutting application points:
- RESEARCH: "What would I need to believe for a different problem framing to be right?"
- PRODUCT DISCOVERY: Procedural step (primary home) — inversions produced through belief-mapping, not adversarial assertion
- DECIDE: "What would I need to believe for the rejected alternative to be right?"
- ARCHITECT: "What would I need to believe for a different module boundary to serve users better?"
- PLAY: Gamemaster introduces belief-mapping questions about the practitioner's design assumptions
- SYNTHESIS: "What would I need to believe for a different narrative framing to be right?"

Adversarial framing ("argue against X," "strongest case against X") is deprecated as an operationalization of the Inversion Principle. It remains available as a deliberate rhetorical choice when the user explicitly requests it, but not as the default mechanism.

## Consequences

**Positive:**
- Eliminates the overcorrection problem demonstrated in the spike (2-6× reversal)
- Preserves the agent's ability to recommend the user's preferred option while keeping content balanced — decouples content balance from recommendation direction
- Grounded in empirical evidence from within the methodology, not just theoretical argument
- Makes the Inversion Principle's form explicit rather than leaving it to agent judgment (reduces Content Selection in the principle's own application)

**Negative:**
- Constrains agent flexibility — some contexts may genuinely benefit from adversarial framing (e.g., when the user explicitly wants a devil's advocate). Mitigated: adversarial framing is deprecated as default, not prohibited
- The belief-mapping form is quieter than adversarial challenge — users who expect visible disagreement may perceive it as insufficient pushback. Mitigated: the form is structurally collegial, which is the desired register

**Neutral:**
- ADR-010's two-level structure (procedural step + cross-cutting principle) is preserved; this ADR specifies the form, not the structure
- The six research-grounded question forms (ADR-056) include belief-mapping as one type; this ADR specifies belief-mapping as the *primary* operationalization of the Inversion Principle specifically
- **Known limitation:** The spike evidence is directional (N=1 per cell, compressed 10-minute pipeline, scripted inputs, high replication variance). Belief-mapping is adopted as the best current operationalization; validation under genuine multi-hour engagement with real user investment remains outstanding. The essay distinguishes "reason to try" from "reason to declare solved" — this ADR is the former

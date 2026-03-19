# ADR-001: Replace Approval Gates with Epistemic Gates

**Status:** Proposed

## Context

The essay (§3) establishes that RDD's current gates are approval gates — the user reviews and accepts an artifact without producing anything. This activates only the Evaluate level of Bloom's taxonomy and bypasses the learning mechanisms (generation effect, desirable difficulty, writing-to-learn) that produce durable understanding. The Anthropic study (§4) demonstrates that interaction patterns requiring epistemic engagement preserve both learning and speed. Invariant 1 requires that understanding comes from generation, not review. Invariant 2 requires that epistemic acts are mandatory at every gate.

## Decision

Replace every approval gate in the RDD pipeline with an epistemic gate. Each gate requires the user to perform at least one epistemic act — producing a targeted explanation, prediction, reconstruction, or articulation — before the pipeline advances to the next phase. The AI presents the artifact and a set of epistemic act prompts; the user responds; the pipeline proceeds only after the user has produced something.

The gate interaction pattern becomes:
1. AI presents the phase artifact
2. AI presents one or more epistemic act prompts drawn from the six pedagogical frameworks
3. User performs the epistemic act (writes/speaks their response)
4. AI acknowledges the response, notes any obvious factual discrepancies between the user's response and the artifact, and asks whether to proceed

The primary learning mechanism is the user's act of production, not the AI's evaluation of it. The generation effect fires regardless of whether the AI detects understanding gaps. The AI should note obvious factual divergences ("the artifact says X, but your explanation described Y") rather than attempting to diagnose understanding quality. The user's own articulation surfaces most gaps through the rubber duck effect — the act of explaining forces explicit reasoning that silent review does not.

This replaces the current pattern: AI presents artifact → user says "approved" → pipeline advances.

## Consequences

**Positive:**
- Activates the generation effect at every phase transition (Invariant 1)
- Establishes grounding between user and AI at each gate, enriching common ground for subsequent phases (Invariant 5, Invariant 7)
- Surfaces tacit knowledge that would otherwise become hidden defects
- Builds authority — the user accumulates understanding across the pipeline (Invariant 0)

**Negative:**
- Adds 5-10 minutes per gate (Invariant 4 constrains this cost)
- Users may initially resist the friction, particularly if they are accustomed to the approval-only pattern
- The quality of epistemic acts is hard to verify — a perfunctory response satisfies the form but not the spirit
- The AI's ability to detect understanding gaps is limited — it can catch factual discrepancies but cannot reliably assess depth of comprehension

**Neutral:**
- Does not prescribe which specific epistemic acts are used at which gates (see ADR-003)
- The AI's artifact generation in subsequent phases may improve as a result of richer context from the user's epistemic responses (see ADR-004). This is a feature, not a side effect — the user's articulations clarify intent and surface priorities that pure approval does not.

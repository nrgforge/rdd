# ADR-019: Add Orientation Document as Artifact Hierarchy Entry Point

**Status:** Proposed

## Context

RDD produces a structured Artifact Trail — essays, product discovery documents, domain models, ADRs, system designs, scenarios. The system design establishes a two-tier readability principle: product-discovery.md and system-design.md are primary readable documents; everything else is supporting material (system-design.md, Architectural Drivers). However, no artifact answers the prior question: "what is this system, who is it for, and where do I go next?"

Real-world feedback from circulating artifacts with stakeholders confirmed the gap: people lacked a single coherent high-level orientation (Essay 004, §1). Teammates/Collaborators receiving Handoff artifacts need an Entry Point to the corpus. AI Agents bootstrapping into sessions need minimal viable context (Context Window Ceiling). Architecture and Product Specialists performing External Review need rapid orientation to provide substantive feedback.

The document is named ORIENTATION.md. The essay left naming as an open question (§7), but during the epistemic gate conversation after domain modeling, "orientation" emerged as the natural vocabulary — the term was used repeatedly and unprompted throughout research, product discovery, and modeling conversations. It names the document's function: orienting the reader to the system.

## Decision

Add `ORIENTATION.md` as a new top-tier artifact in the RDD artifact corpus. It sits above the two primary readable documents (product-discovery.md, system-design.md) in a three-tier Artifact Hierarchy:

- **Tier 1 — Orientation:** ORIENTATION.md (entry point, routes readers)
- **Tier 2 — Primary readable:** product-discovery.md, system-design.md (read end-to-end by respective audiences)
- **Tier 3 — Supporting material:** domain-model.md, essays, ADRs, scenarios (consulted for provenance and depth)

This amends the prior two-tier design principle to three tiers.

## Consequences

**Positive:**
- New readers (human or agent) have a single entry point — solves the "where do I start?" problem
- The Artifact Hierarchy is explicit rather than implicit
- Handoff use case (Scoping) gets a natural cover letter for artifact transfer
- Addresses Context Window Ceiling for AI Agents — load ORIENTATION.md first, then depth as needed

**Negative:**
- One more artifact to maintain — though it is derived from other artifacts, not authored independently
- The two-tier design principle in system-design.md needs amendment

**Neutral:**
- The Orientation Document is not produced by any single phase, but its regeneration points correlate with phase completion (especially after ARCHITECT for the Scoping use case). It is interleaved with the pipeline rather than strictly outside it

> **Amendment (ADR-022, ADR-023):** Tier 2 now includes the roadmap alongside product-discovery.md and system-design.md. Tier 3 now includes the field guide alongside domain-model.md, essays, ADRs, and scenarios.

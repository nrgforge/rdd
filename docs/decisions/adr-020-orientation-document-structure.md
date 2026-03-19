# ADR-020: Orientation Document Structure

**Status:** Proposed

## Context

The Orientation Document must bridge product-centered language (product-discovery.md) and system-centered language (system-design.md) without duplicating either. It must be readable in under five minutes (matching Invariant 4's lightweight principle, though the document is not a gate). Research found that effective orientation documents share a common pattern: they contain only what the reader needs to decide where to go next, not the depth itself (Arc42 Introduction and Goals, C4 System Context, one-pager methodology — Essay 004, §3).

The Value Tension between brevity and completeness (product discovery update) means each section must be as short as possible. The document is Diataxis "explanation" — it joins things together, approaches the subject from different directions, and answers "why" rather than enumerating facts.

## Decision

The Orientation Document contains exactly five sections, in this order:

1. **What this system is** — one paragraph stating the essential purpose. Not features, not architecture. Language accessible to both product and technical readers.

2. **Who it serves** — stakeholder summary compressed from product discovery. Names and one-line descriptions, not the full Stakeholder Map.

3. **Key constraints** — top 3-5 quality attributes or invariants from the domain model that shape every decision. The constraints that make this system *this system*. (The essay uses "quality goals" from Arc42; "constraints" better describes invariants — conditions that must hold, not aspirations.)

4. **How the artifacts fit together** — the Artifact Hierarchy with one-line descriptions of each artifact and when to read it. The map of the territory.

5. **Current state** — what phases are complete, what decisions are settled, what Open Questions remain. The living dimension.

No section should exceed a few short paragraphs. The entire document should be readable in under five minutes.

## Consequences

**Positive:**
- Fixed structure prevents bloat — five sections, no more
- Each section has a clear source artifact it derives from (product discovery, domain model, artifact corpus, pipeline state)
- The structure is simple enough to regenerate reliably

**Negative:**
- Five sections may not cover every reader's needs — but the document routes to depth, it doesn't contain depth
- The "current state" section requires knowing pipeline state, which is currently tracked only in the orchestrator's state table during a session

**Neutral:**
- The structure mirrors Arc42's Introduction and Goals pattern (requirements, quality goals, stakeholders) adapted for RDD's artifact-centric model

# ADR-007: Product Discovery Artifact Structure

**Status:** Proposed

## Context

The Product Discovery phase (ADR-006) needs a defined artifact structure. Essay 002 §6 proposes five sections based on surveyed frameworks: Stakeholder Maps (from Value Sensitive Design), Jobs and Mental Models (from JTBD and Norman), Value Tensions (from Haraway's "staying with the trouble"), Assumption Inversions (from the Inversion Principle), and a Product Vocabulary table. The artifact must be lightweight per Invariant 4, written in user language for Artifact Legibility, and structured to feed forward into MODEL, DECIDE, and ARCHITECT.

## Decision

The product discovery artifact is a single markdown document (`./docs/product-discovery.md`) with five sections:

1. **Stakeholder Map** — direct and indirect stakeholders affected by the system. Not personas (which represent ideal users) but a map of everyone affected, including those who don't interact with the system directly.

2. **Jobs and Mental Models** — for each direct stakeholder, the jobs they need the system to do (in their language) and their mental model of how the domain works. This is the primary input for User Mental Model validation against the Domain Model.

3. **Value Tensions** — conflicts between stakeholder needs or between user needs and business goals, stated as open questions. Value Tensions are held, not resolved prematurely — they propagate as Open Questions into MODEL and as decision points into DECIDE.

4. **Assumption Inversions** — for each major product assumption, the inverted form and its implications. Output of the Inversion Principle procedural step.

5. **Product Vocabulary Table** — terms in user-facing language with stakeholder attribution and context. The primary input for Product Vocabulary provenance in the Domain Model (ADR-009).

## Consequences

**Positive:**
- Five sections map cleanly to five feed-forward channels (two into MODEL, two into DECIDE, one into ARCHITECT)
- Written in user language, maximizing Artifact Legibility
- Stakeholder Map captures indirect stakeholders that personas miss

**Negative:**
- Five sections may feel heavyweight for small projects. Mitigated: sections can be brief — a two-stakeholder map with three jobs is still a valid artifact

**Neutral:**
- The artifact serves dual purpose: input to downstream phases AND a standalone document comprehensible to product stakeholders (the "Rosetta Stone" between Product Vocabulary and Domain Model vocabulary)

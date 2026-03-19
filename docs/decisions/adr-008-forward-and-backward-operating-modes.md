# ADR-008: Forward and Backward Operating Modes for Product Discovery

**Status:** Proposed

## Context

Product Discovery (ADR-006) must handle two distinct situations: greenfield systems where no product assumptions exist yet, and existing systems where product assumptions are already encoded in the architecture. Essay 002 §§7-8 distinguishes these as "feed-forward" (new discovery informing downstream phases) and "feed-backward" (auditing existing artifacts against user needs). The two situations require different inputs, processes, and outputs, but share the same artifact structure (ADR-007).

## Decision

The `/rdd-product` skill operates in two modes:

1. **Forward mode** (greenfield): Runs between RESEARCH and MODEL. Takes the essay as input. Produces the product discovery artifact (ADR-007) through stakeholder interviews, JTBD analysis, and assumption inversion. Output feeds forward into MODEL, DECIDE, and ARCHITECT.

2. **Backward mode** (existing system): Runs against a pre-existing system's artifacts. Reads existing architecture, ADRs, and domain model. Extracts implicit product assumptions from architectural choices. Validates assumptions against actual user needs. Produces the same five-section artifact plus a **Product Debt table** mapping assumption gaps:

   | Assumption | Baked Into | Actual User Need | Gap Type | Resolution |
   |------------|-----------|-----------------|----------|------------|

   Product debt items trigger backward propagation through existing RDD amendment infrastructure — invariant amendments, ADR supersessions, and design amendments with product provenance.

The mode is determined by context: if prior RDD artifacts exist, backward mode is the default. If starting fresh, forward mode applies.

## Consequences

**Positive:**
- Existing systems gain a structured path to surface product debt without re-running the full pipeline
- Backward mode reuses the existing RDD amendment infrastructure (domain model Amendment Log, ADR supersession notes) without new mechanisms
- Both modes produce the same artifact structure, keeping downstream phases mode-agnostic

**Negative:**
- Backward mode requires reading and interpreting existing architecture, which depends on artifact quality. Poorly documented systems produce thin product audits. Mitigated: backward mode flags gaps in existing documentation as findings

**Neutral:**
- The Product Debt table is structurally analogous to the conformance debt table in `/rdd-decide`. Both map expectations against reality; one maps code against ADRs, the other maps ADRs against user needs

> **See also:** ADR-025 introduces template-level Conformance Audit, which is distinct from product conformance. Product conformance (this ADR) checks product assumptions against user needs. Template conformance (ADR-025) checks artifact format against the current skill version.

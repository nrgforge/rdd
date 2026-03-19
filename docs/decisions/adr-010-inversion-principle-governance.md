# ADR-010: Inversion Principle as Cross-Cutting Principle and Procedural Step

**Status:** Proposed

## Context

Essay 002 §5.5 identifies the Inversion Principle as a pattern across critical design traditions (Norman, Haraway, Dunne & Raby, VSD, Torres). Research loop Q6 resolved a governance question: the inversion principle should NOT be an invariant. The existing invariants (0-7) form a coherent set about epistemic understanding; adding a product-focused invariant would dilute that coherence. Instead, the inversion principle is the *mechanism* serving the product dimension of Invariant 0 (strengthened in Amendment 3 to include "who it was built for, and why").

## Decision

The Inversion Principle operates at two levels:

1. **Procedural step within `/rdd-product`**: A structured moment producing the Assumption Inversions section (ADR-007, section 4). For each major product assumption, state the inverted form and its implications. This is the primary home.

2. **Cross-cutting principle in the orchestrator**: A habit of mind that applies wherever assumptions can harden into structure:
   - RESEARCH: "Am I researching the right problem, or the problem I was told to research?"
   - PRODUCT DISCOVERY: The procedural step (primary home)
   - DECIDE: "Does this ADR rest on an unexamined product assumption?"
   - ARCHITECT: "Does this module boundary serve the user's mental model, or just the developer's?"

   The ARCHITECT application is particularly important because architecture is where product assumptions calcify most permanently — Boehm's architecture-breakers on the product dimension.

The inversion principle is documented in the orchestrator's workflow descriptions alongside existing cross-cutting principles (e.g., "stop at uncertainty," "domain vocabulary consistency").

## Consequences

**Positive:**
- Avoids diluting the invariant set while still giving the inversion principle structural force
- Dual placement (procedural + cross-cutting) mirrors how "domain vocabulary consistency" already works in RDD
- Explicitly names ARCHITECT as a critical application point, preventing product assumptions from hardening into module boundaries

**Negative:**
- Cross-cutting principles are harder to enforce than invariants — no gate explicitly checks for inversion at DECIDE or ARCHITECT. Mitigated: the conformance audit in `/rdd-decide` can check whether ADRs reference product assumptions, and the skill text for `/rdd-architect` can include the inversion question

**Neutral:**
- The relationship is: Invariant 0 (amended) → Inversion Principle (mechanism) → Assumption Inversions (artifact). This is a three-level hierarchy: constitutional authority → methodological principle → concrete output

# ADR-017: Inversion Principle Extended to Narrative Framing

**Status:** Proposed

## Context

ADR-010 establishes the inversion principle at two levels: as a procedural step within `/rdd-product` (producing assumption inversions) and as a cross-cutting principle across RESEARCH, PRODUCT DISCOVERY, DECIDE, and ARCHITECT.

Essay 003 §5 identifies a third level: the inversion principle applies to narrative framing in the synthesis phase. The most interesting essays do not confirm what readers expect — they start from the expected conclusion and show why it is incomplete or misleading. The domain model (Amendment 7) already records this third level in the Inversion Principle concept definition.

## Decision

Extend ADR-010's governance to include a third level:

3. **Narrative framing technique in SYNTHESIS:** Three inversions available to the synthesis writer during the framing conversation (ADR-013, Phase 3):

   - *What if the obvious takeaway is wrong?* The surface-level conclusion is rarely the interesting story. The story is usually about why the obvious approach would have been wrong.
   - *What if the process is more interesting than the product?* Most technical writing focuses on what was built. The essay's angle might be about the process of discovery — and why the conventional approach would have failed.
   - *What if the reader's assumed context is the story?* The reader brings assumptions about how software gets built. The essay can target those assumptions directly.

These inversions are offered as lenses during the framing conversation, not prescribed as requirements. The writer may use all, some, or none — they serve the same function as the narrative frameworks in ADR-013: lenses to try on, not templates to fill in.

The relationship hierarchy from ADR-010 extends: Invariant 0 (amended) → Inversion Principle (mechanism) → Assumption Inversions (product artifact) / Narrative Inversions (synthesis framing).

## Consequences

**Positive:**
- Gives the synthesis writer concrete tools for finding non-obvious framings
- Consistent with ADR-010's pattern (same principle, different application)
- Reinforces the worth-the-calories quality gate (ADR-014): inversions help the writer deny assumptions rather than confirm them

**Negative:**
- Third level makes the inversion principle harder to summarize concisely (mitigated: each level is self-contained in its phase)

**Neutral:**
- ADR-010 is not superseded — its two levels remain unchanged; this adds a third
- Domain model already records this extension (Amendment 7)

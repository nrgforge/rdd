# Gate Reflection: Cycle 017 (Readability & Comprehensibility) — discover → model

**Date:** 2026-04-27
**Phase boundary:** discover → model
**Cycle:** 017 — Readability & Comprehensibility

## Belief-mapping question composed for this gate

A belief-mapping question (Question Toolkit) testing the practitioner's outcome-test reframe at Target 1 against the alternative the susceptibility snapshot warned about:

> *What would you need to believe for the reading-cost test to be the right criterion — for adding a 1–2 page on-ramp to be net-negative for the corpus even when it produces direct understanding for its target reader?*

The question deliberately referenced the §4.5 cognitive-economy criterion and the on-ramp candidate sub-pattern as the most consequential commitments to examine. The framing offered two binary positions (outcome test vs. reading-cost test) so the practitioner's response could either ground the outcome test by mapping the reading-cost alternative substantively, or surface a third frame.

## User's response

> "I'd say if that 1-2 page on-ramp felt additional to real docs, it would not be good. Good documentation is relevant and useful and accurate. Good visuals. The right fidelity that allows diving deeper. If the project docs are too thick and don't afford deeper exploration, we shouldn't bolt on an explainer doc - we should make the docs better."

## Pedagogical move selected

Challenge (belief-mapping). The move surfaced a third frame the artifact had not encoded: bolt-on artifacts that *feel additional to real docs* are a failure-mode signal — when the impulse is to add an explainer doc, the docs themselves likely need fixing. The position is sharper than either binary the question offered; the practitioner's actual operating principle is in-place restructuring as the dominant move, with brief purpose-built artifacts admissible only when integrated as part of the corpus's design rather than as scaffolding around docs that are themselves too thick.

The agent built on the response by surfacing the discrepancy with the Section 1 Zero-Prior-Familiarity Reader entry (which had admitted brief on-ramps under outcome test alone) and proposing three coordinated revisions:
- Section 1 closing language replaced to encode in-place-first default and the felt-additional failure-mode signal
- Section 3 Value Tension T2 sharpened to record the practitioner's deeper operating principle
- Section 5 Product Vocabulary additions for *"bolt-on" / "felt additional"* and *"right fidelity that affords deeper exploration"*

All three revisions were committed.

A second pushback during solution scoping caught the agent conflating two separate axes: the §4.1 finding rejecting *audience-based* directory separation does not address *infrastructure-vs-product* separation. The `.rdd/` relocation of housekeeping/, session/, audit reports, dispatch logs was returned to scope as an ADR-074-style supersession candidate of ADR-070. The verbosity-reduction framing was reframed from out-of-scope to in-scope-as-secondary at the content-type-to-form matching level.

## Commitment gating outputs

**Settled premises (the practitioner is building on these going into model):**

- Zero-Prior-Familiarity Reader is a stakeholder type with distinct schema-building needs — not a variation of existing types.
- Human-vs-agent is the primary structural axis of the stakeholder map; first-encounter vs. returning-reader is the secondary axis. The returning-self after time away is in the same condition as the external first-encounter reader; the readability burden applies to the practitioner's own future use of their own corpus.
- The outcome test (*direct human understanding without AI as workaround*) is the admissibility criterion for human-facing artifacts; bolt-on artifacts that feel additional are a failure-mode signal indicating the real docs need fixing.
- In-place restructuring is the dominant intervention move; companion files at predictable paths within the human-visible corpus handle genuinely-divergent agent-context content.
- `.rdd/` relocation of infrastructure artifacts (housekeeping/, session/, audit reports, dispatch logs) is in scope — ADR-074-style supersession of ADR-070 at DECIDE. Distinct from directory-level *audience* separation, which remains rejected.
- Verbosity reduction at the content-type-to-form matching level (diagrams alongside prose, not raw word-count substitution) is admissible secondary work.
- Domain vocabulary to import in MODEL: forager / recipient (Pirolli & Card), expertise reversal effect (Kalyuga), F-pattern (Nielsen), information scent (IFT), companion file pattern, continuous documentation (Rosenbaum), adjacency-pair recipient design failure (Conversation Analysis).
- Practitioner-vocabulary additions to import in MODEL with Product Origin populated: "bolt-on" / "felt additional", "right fidelity that affords deeper exploration", initial-handoff / ongoing-reference, context-mismatch, companion file, outcome test / reading-cost test, AI-as-prosthetic / AI-as-orienter.

**Open questions (the practitioner is holding these open going into model):**

- Cognitive vs. non-cognitive admissibility (Value Tension T3) — held for DECIDE's cognitive-economy ADR.
- Validation-spike-in-research methodology amendment with Target 2 reframe — DECIDE candidate ADR.
- AI-as-orienter / AI-as-prosthetic operational separation criterion — adoption of agent-mediated orientation blocked on this; held for DECIDE.
- "Threading is wrong in principle" (Nguyen et al. 2025, Assumption Inversion A3) — not adopted; remains live alternative.
- The cycle-as-instance reflection (Assumption Inversion A4) — standing self-critique posture for any RDD cycle, not resolvable here.

**Specific commitments carried forward to model:**

- MODEL imports literature vocabulary as named domain concepts and adds the Zero-Prior-Familiarity Reader stakeholder concept with Product Origin column populated from this cycle's Product Vocabulary additions.
- MODEL propagates the five new Value Tensions (T1–T5 from this cycle's product-discovery additions) as Open Questions in domain-model.
- MODEL produces a Product Vocabulary Table feed for the domain-glossary Product Origin column covering all new terms.

## Grounding Reframe disposition at this phase boundary

The RESEARCH-phase Grounding Reframe Target 1 (cognitive-economy constraint as §4.5 organizing axis) was discharged at this gate. The practitioner's outcome-test reframe at Section 1, sharpened by the bolt-on / felt-additional failure-mode signal during the gate's belief-mapping challenge, replaces the cognitive-economy framing as written in essay 016 §4.5 with a more nuanced operating principle: in-place-first; outcome test is the criterion; bolt-on artifacts that feel additional are a failure-mode signal regardless of whether they pass outcome test in isolation. The product-discovery artifact records this position as committed.

Grounding Reframe Target 2 (Beck framing) is not addressable at the discover → model boundary; it carries forward to DECIDE where the validation-spike-in-research methodology amendment ADR is the natural site for the Target 2 reframe.

# Gate Reflection: Cycle 016 Multi-Issue Batch Cycle — architect → build

**Date:** 2026-04-22
**Phase boundary:** architect → build
**Cycle:** 016 — Multi-Issue Batch Cycle (Issues #10–#16)

## Belief-mapping question composed for this gate

> ARCHITECT preserved nine module boundaries unchanged and amended their responsibilities; zero new modules were introduced. What would you need to believe for one of these amendments to actually warrant a new module instead of an amendment?

The question targeted the Decide Skill amendment specifically, where the susceptibility snapshot's Finding 3 flagged boundary strain (three ADRs' worth of new responsibility added to one skill). The gate's epistemic goal: surface whether the amendments-not-modules judgment was a deliberate proportional response to defect-and-mitigation work, or whether the agent's framing had narrowed the architectural alternatives.

The gate followed the snapshot's Grounding Reframe on Finding 1 (ADR-077 copy-shape detection trigger referenced infrastructure that did not exist). The user chose option (a) — reclassify the aspirational triggers explicitly — and the agent applied the fixes to ADR-077, the v13.0 BUILD Skill amendment, the Responsibility Matrix entry for Pattern-Reuse Trigger, the Fitness Criteria entry for the applicability check, and the BUILD pattern-reuse interaction-spec entry. The agent also applied the closely-related Finding 8 fix — adding a fitness property to the Decide Skill amendment for ADR-074's downstream-citation discipline.

## User's response

> "I would need to believe they're tremendously structurally important. I think here we're addressing defects and mitigations, so I don't think they really warrant too much additional engineering. Would you agree?"

## Pedagogical move selected

Challenge (belief-mapping form per ADR-055).

The move was followed by a substantive agreement-with-nuance response from the agent: nine of the ten ADRs are defect-addressing or mitigation work (amendments-not-modules judgment holds), with ADR-074 (supersession workflow) named as the one nuance — it formalizes a recurring lifecycle discipline whose ongoing cost is real but whose structural weight is still skill-text editing, not new modules. The implication for BUILD scoping was named: skill-text amendments, hook-script extensions, manifest schema additions, fixture tests — not new architectural capability or new tooling.

The conversation produced one architectural framing refinement (the defect-and-mitigation framing as the proportional-engineering principle for this cycle's BUILD scope) and the commitment gating that follows.

## Commitment gating outputs

**Settled premises (carrying into BUILD):**

- Nine module amendments; zero new modules
- ADR-074 (supersession workflow) is the one amendment with compounding ongoing cost; the downstream-citation sweep is manual for this cycle with `/rdd-conform` provenance audit as backstop
- 8 work packages (A–H); WP-A → WP-B is the one hard sequential chain; WP-C / WP-D / WP-F are genuinely independent starts; WP-E has implied-logic deps on C and D (stubbable); WP-G depends hard on A; WP-H depends hard on A–G
- ADR-077 applicability check triggers: operative = explicit reference (conversational, Tier 2 per ADR-058); structural-similarity and copy-shape detection are aspirational with no substrate — honest scope-of-claim documented in ADR-077, system-design.md v13.0 amendments, Responsibility Matrix, Fitness Criteria, and interaction-specs
- Fitness property added for ADR-074's downstream-citation sweep in the Decide Skill amendment (closes Finding 8 from architect-boundary snapshot)
- System design at v13.0 with Amendment Log entry #14; roadmap updated with Cycle 016 work packages; ORIENTATION.md regeneration pending (post-architecture housekeeping per ADR-021)
- Issue #15 regex fix ships as parallel pure-implementation work in WP-H; Issue #10 is live-validated during this cycle's BUILD work against ADR-071's existing mitigations

**Open questions (held into BUILD):**

- Order of TS-1 (hook-layer changes via WP-A + WP-B) vs. TS-2 (skill-side amendments via WP-C + WP-D + WP-E + WP-F + WP-G) — both are coherent transition states; bias toward TS-1 first because the in-progress-gate cascade is the most acute live failure (Cycle 015), but TS-2 first is viable under grandfathered advisory mode
- Whether WP-F (question-isolation protocol) ships in this cycle or is deferred to allow its reclassification (first-line structural per ADR-082 vs. essay §10's second-line cognitive) to test in practice over multiple cycles before full commitment
- Whether Cycle 014 PLAY is folded into this cycle's BUILD
- Copy-shape detection substrate is explicitly deferred as aspirational; a future cycle decides whether to fund automated detection (AST diff with similarity threshold, or stewardship-checkpoint heuristic extending ADR-071, or a new ADR for the mechanism)

**Specific commitments carried forward to BUILD:**

- BUILD should not introduce new architectural capability; skill-text amendments, hook-script extensions, manifest schema additions, and fixture tests are the expected work shape
- ADR-074's downstream-citation sweep is manual this cycle; tooling deferred unless manual sweep proves burdensome empirically
- All 13 new boundary integration tests from v13.0 Test Architecture section are acceptance criteria for WP-H
- Conformance scan (40 gaps, 8 groups) is the punch list BUILD consumes
- BUILD's stewardship Tier 1 check should re-examine the Decide Skill boundary strain (snapshot Finding 3) if the skill text grows unwieldy under the three new responsibility additions
- BUILD may revisit WP decomposition if WP-E's stubbing of WP-C and WP-D dependencies proves rougher than expected (snapshot Finding 9 — alternative grouping of ADR-073 + ADR-076 + ADR-077 as integrated criterion-level verification capability was not examined)
- Research Skill fitness property's recursive use of "mechanically-unavoidable workflow positions" (snapshot Finding 6) is a candidate for tightening during BUILD

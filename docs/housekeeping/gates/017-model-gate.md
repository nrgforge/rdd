# Gate Reflection: Cycle 017 (Readability & Comprehensibility) — model → decide

**Date:** 2026-04-27
**Phase boundary:** model → decide
**Cycle:** 017 — Readability & Comprehensibility

## Belief-mapping question composed for this gate

A warrant-elicitation question (Question Toolkit) testing the most load-bearing MODEL-encoding judgment call:

> *Context-Mismatch is encoded as the structurally fundamental mechanism, with density-ordering, audience-conflation, and artifact-form-mismatch as named co-mechanisms folded inside the same concept. Downstream phases will use this vocabulary in different shapes — DECIDE's cognitive-economy ADR cites context-mismatch as the unified mechanism (folded structure works); DECIDE's companion-file ADR addresses audience-conflation specifically (folded structure forces citation as a co-mechanism within Context-Mismatch); ARCHITECT's system-design restructuring targets density-ordering specifically via F-pattern orientation leads (same). What makes the folded structure right for that downstream use vs. four parallel concepts where DECIDE could ADR each independently?*

The question deliberately referenced the specific MODEL artifact judgment call (not an upstream commitment from RESEARCH or DISCOVER) and forecast three concrete downstream uses to test whether the encoding shape was warranted by anticipated work.

## User's response

> "I think it's folded correctly. Like you said, the concepts interrelate in ways that a higher level folding will help capture"

Followed by commitment gating:

> "I think what's settled is the need for better organized and less verbose documentation that chooses good representations. I think what's open are questions about exactly how that takes shape (and it doesn't have to be identical for every corpus depending on the project). I also think we know that infrastructure needs to be tucked away somewhere that makes it less overwhelming."

Followed by clarification on a discrepancy the agent surfaced:

> "Form-matching framing is more precise and accurate."

(Confirming that "less verbose" in the commitment-gating response refers to the content-type-to-form matching scope committed at the DISCOVER gate, not raw word-count substitution.)

## Pedagogical move selected

Challenge (warrant elicitation). The move tested whether the MODEL judgment call to fold three independent co-mechanisms into Context-Mismatch was warranted by the structure of anticipated downstream use, rather than being a structural-aesthetic choice. The user's response named the warrant: the interrelation captured at the unified-mechanism level is itself information that downstream ADRs can cite into. The folded structure is then defensible as a diagnostic-primacy claim, not just a concept-count economy.

The agent then surfaced two follow-on items during commitment gating: a new commitment from the user's response (variability across corpora as a per-project judgment, sharper than the §4.1 per-artifact framing) and a possible discrepancy on "less verbose" scope. Both were resolved in the user's clarifying response.

## Commitment gating outputs

**Settled premises (the practitioner is building on these going into decide):**

- The cycle's outcome is better organized documentation, verbosity reduction at the content-type-to-form matching level (not raw word-count substitution), good representations matched to content type, and infrastructure tucked away in a form that makes it less overwhelming.
- Context-Mismatch is the structurally fundamental mechanism with density-ordering, audience-conflation, and artifact-form-mismatch as named co-mechanisms — the folded encoding stands; downstream ADRs cite the unified mechanism with co-mechanisms named-by-sub-name where specificity is needed.
- Outcome Test as the admissibility criterion for human-facing artifacts (committed at the discover → model gate).
- Bolt-On / Felt Additional as the failure-mode signal — when an explainer doc is proposed as a workaround for thick original docs, the original docs need fixing.
- In-place restructuring is the dominant intervention move; companion files at predictable paths handle genuinely-divergent agent-context content.
- `.rdd/` relocation of infrastructure artifacts (housekeeping/, session/, audit reports, dispatch logs) is in scope as ADR-074-style supersession of ADR-070.
- Domain vocabulary imported in MODEL: 18 concepts (7 literature, 10 cycle-specific framing, 1 stakeholder), 2 actions, 32 relationships, 18 synonym aliases, no invariant changes.

**New commitment surfaced at this gate (sharper than upstream artifacts):**

- Variability across corpora — *"it doesn't have to be identical for every corpus depending on the project"* — extends the §4.1 per-artifact judgment framing to a per-project judgment. This is a constraint on DECIDE's cognitive-economy ADR: the criterion must be encodable in a way that admits per-project variation rather than as a methodology-wide rule.

**Open questions (the practitioner is holding these open going into decide):**

- Value Tension T1 — initial-handoff vs. ongoing-reference reading task; how much can content-layering compensate before forcing artifact splitting?
- Value Tension T2 — outcome test vs. reading-cost test for admissibility; which is the methodology's actual admissibility criterion (DECIDE's cognitive-economy ADR resolves).
- Value Tension T3 — cognitive vs. non-cognitive admissibility (relational, normative, social value alongside cognitive load reduction).
- Value Tension T4 — multi-item agent turn structure; where does upstream decomposition happen so it fires under task load (Invariant 8)?
- Value Tension T5 — AI-as-orienter vs. AI-as-prosthetic; can an operational criterion distinguish the two roles? Adoption blocked.
- The Beck framing methodology self-description question (DECIDE Target 2 — validation-spike-in-research methodology amendment).
- The cycle-as-instance reflection — should this be a standing caveat on the corpus?
- Does RDD over-engineer? — future-cycle candidate.
- The "exactly how it takes shape" question is subsumed by T1–T5 plus the §4.5 implementation gaps; per-project variability is now an explicit constraint on shape.

**Specific commitments carried forward to decide:**

- DECIDE's cognitive-economy ADR encodes the in-place-first default with bolt-on / felt-additional as the failure-mode signal, with per-project variability admitted (not a methodology-wide rule).
- DECIDE's companion-file ADR addresses agent-context content placement; the `.rdd/` infrastructure-vs-product separation is a separate ADR-074-style supersession of ADR-070, not conflated with audience-based directory separation.
- DECIDE's AI-as-orienter ADR examines the operational-criterion question (Value Tension T5); adoption blocked on whether the criterion can be solved.
- DECIDE's validation-spike-in-research methodology amendment ADR carries the Target 2 reframe from RESEARCH (*what is the evidence the artifact investment has the payoff Beck assumes, and what would a spike test?*).
- DECIDE's methodology debt ADRs: ADR-064 / ADR-067 amendments for v0.8.3 advisory demotion; In-progress phase mechanism role-shift documentation.
- ARCHITECT inherits: system-design.md restructuring with F-pattern orientation lead at top; agent-context material via companion file; load-bearing diagram retained; cognitive-economy test (outcome-coded with in-place-first default) applied to any candidate orientation artifact.
- BUILD inherits: graduation-check tooling for code→doc dangling references (Issue #17); `.rdd/` relocation tooling.

## Disposition of upstream Grounding Reframes at this boundary

- RESEARCH-phase Grounding Reframe Target 1 (cognitive-economy constraint) — discharged at the discover → model gate (recorded in `docs/housekeeping/gates/017-discover-gate.md`); the practitioner's outcome-test reframe sharpened by the bolt-on / felt-additional failure-mode signal replaces the §4.5 reading-cost framing.
- RESEARCH-phase Grounding Reframe Target 2 (Beck framing) — carries forward to DECIDE as documented; the validation-spike-in-research methodology amendment ADR is the natural site for the reframe.
- No new Grounding Reframe targets surfaced at this gate.

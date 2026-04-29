# RDD Cycle Status

## Cycle Stack

### Active: Readability & Comprehensibility

**Cycle number:** 017
**Started:** 2026-04-24
**Current phase:** BUILD complete; cycle ready for close (PLAY and SYNTHESIZE optional)
**Cycle type:** standard
**BUILD mode:** auto (per ADR-091, declared retrospectively at the BUILD-exit gate as the methodology-recognized framing for the pattern that ran)
**Plugin version at cycle start:** v0.8.1 → patched mid-entry to v0.8.2 (In-progress phase predicate) → patched again to v0.8.3 (manifest check demoted to advisory). DECIDE conducted on v0.8.3. BUILD WP-A through WP-G released as v0.8.4 (eight commits: WPs A–G); ADR-085 migrate-to-rdd dogfooded post-release. In-cycle BUILD-exit gate amendment released as v0.8.5 (ADR-091 dual-mode BUILD methodology principle + skill-text edit).

**Artifact base:** `./docs/`

## Driving Concerns

1. **Nomenclature leakage (Issue #17)** — corpus-internal vocabulary (WP-*, ADR-NNN, axis/approach labels, invariant numbers) leaking into durable code and tests. After `/rdd-graduate`, those citations become dangling references; pre-graduation they can also break under reorg or renumbering. Suggested touch-points: `rdd-build` stewardship, `rdd-graduate` pre-scan, `rdd-conform` audit.
2. **Key-doc legibility** — external feedback that a mature corpus feels like "swimming in docs." User's diagnosis: volume is not the primary defect; *organization* of human-audience artifacts is. `system-design.md` leads with a long architectural-drivers table; no 30k-foot view or orienting paragraph greets the reader. Similar concern for `product-discovery.md` and other Tier-2 docs.
3. **Folder hygiene** — relocate `housekeeping/` and session docs under `.rdd/` to (a) make process-vs-product distinction structurally visible, (b) enable straightforward VCS exclusion, (c) remove the current hierarchical equivalence with `essays/`. This reverses ADR-070's `housekeeping/` placement. Also folded into BUILD scope: fix the `dispatch-log.jsonl` misplacement bug (sometimes writes one directory up from the corpus).
4. **Verbosity** — lead with orientation + diagrams, then detail. Due-diligence on correctness and completeness is strong; readerly usability is not. "1500 words to say what could be 500 + a diagram" is the heuristic the cycle works against.
5. **Agent interaction pattern** — when multiple items need user attention in one turn (N clarifying questions + a gate response + decision context), the default "wall of text" is hostile to comprehension. Preferable pattern: a short enumeration of what needs attention, then offer to walk through one at a time.

## Unifying Frame (user-proposed, to be tested in RESEARCH)

**The corpus and the agent's turn-structure are currently optimized for production discipline; this cycle shifts the frame toward readerly and interactional usability — taking care of the user.**

To be tested at RESEARCH entry via the question-isolation protocol (ADR-082) — constraint-removal will examine whether "readability" is the right frame, whether the five threads share a mechanism, and whether something else sits beneath them (e.g., agent-vs-reader optimization, process-vs-product conflation, corpus-portability concerns).

## Phase Status

| Phase | Status | Artifact | Key Epistemic Response |
|-------|--------|----------|----------------------|
| RESEARCH | ✅ Complete | `docs/essays/016-initial-handoff-and-the-audience-at-the-margin.md` (essay); `docs/essays/research-logs/016-...md` (log); `docs/essays/reflections/016-...md` (reflections); `docs/housekeeping/gates/017-research-gate.md` (gate) | Pre-mortem at gate surfaced *orientation-about-orientation* as the §4.5 implementation failure mode; Beck framing of RDD as a port of time-value-of-money to written-thought asset class as articulated counter-position; validation-spike-in-research as DECIDE candidate methodology amendment; cycle-as-instance reflection (this cycle's essay rests on lit-review synthesis without spike validation). Door 2 chosen on Grounding Reframe (carry forward with explicit examination requirements at DISCOVER and DECIDE). |
| DISCOVER | ✅ Complete | `docs/product-discovery.md` (updated); `docs/housekeeping/gates/017-discover-gate.md` (gate); `docs/housekeeping/audits/susceptibility-snapshot-017-discover.md` (snapshot) | Belief-mapping at gate produced a third frame neither binary anticipated: bolt-on artifacts that feel additional to real docs are a failure-mode signal indicating the real docs need fixing; in-place restructuring is the dominant intervention move. The outcome test (direct human understanding without AI as workaround) committed as the admissibility criterion. `.rdd/` infrastructure relocation distinguished from directly-rejected directory-level *audience* separation (ADR-074 supersession candidate of ADR-070 at DECIDE). RESEARCH-phase Grounding Reframe Target 1 genuinely discharged via the gate's reframe. |
| MODEL | ✅ Complete | `docs/domain-model.md` (Amendment 21 — 18 concepts, 2 actions, 32 relationships, 8 open questions, 18 synonym aliases, no invariant changes); `docs/housekeeping/gates/017-model-gate.md` (gate); `docs/housekeeping/audits/susceptibility-snapshot-017-model.md` (snapshot) | Warrant elicitation on the folded-co-mechanism encoding (density-ordering, audience-conflation, artifact-form-mismatch named-inside Context-Mismatch) confirmed; the user's warrant — *the concepts interrelate in ways a higher-level folding helps capture* — is a diagnostic-primacy claim downstream ADRs cite into. New commitment surfaced at the gate: variability across corpora as a per-project judgment, sharper than §4.1's per-artifact framing — a constraint on DECIDE's cognitive-economy ADR encoding. "Less verbose" scope confirmed as content-type-to-form matching (not raw word-count). Susceptibility snapshot identified a warrant-elicitation gap (user echoed agent framing back as warrant) below Grounding Reframe threshold; recurrence pattern of Cycle 014 Finding 1 at lower stakes. Two feed-forward signals to DECIDE recorded below. |
| DECIDE | ✅ Complete | 8 new ADRs (083–090); supersession headers on ADR-064/067/070; domain-model Amendment 22; scenarios + interaction specs appended; 4 argument-audit passes + 1 conformance scan + 1 susceptibility snapshot; gate reflection note `017-decide-gate.md` | Belief-mapping at the gate produced a substantive reframe of ADR-087 §3: tightly-scoped prototyping is a **research method alongside lit-review, search, and methods** — not a Beck-port amendment. The user articulated the interaction-grounding rationale and the counterforce-against-possibility-space-explosion rationale, connecting validation prototyping to the held-open "Does RDD over-engineer?" future-cycle candidate (MODEL Amendment 21) and grounding it in concrete field evidence (a sprawling YAGNI-territory implementation in the user's other RDD project). ADR-087 was amended in-cycle; pass 4 argument audit returned CLEAN. RESEARCH-phase Grounding Reframe Target 2 substantively discharged. Susceptibility snapshot recommended no Grounding Reframe with five feed-forward signals to ARCHITECT. |
| ARCHITECT | ✅ Complete | `docs/system-design.md` (slim, F-pattern lead, brief modules); `docs/system-design.agents.md` (NEW companion file per ADR-084 Pattern B); `docs/ORIENTATION.md` (regenerated with Zero-Prior-Familiarity Reader path + corpus map + `.rdd/` sentence + advisory-disposition language); `docs/roadmap.md` (Cycle 016 WPs migrated to log; Cycle 017 BUILD WPs A–G added); `docs/product-discovery.md` (F-pattern orientation lead added at top, Cycle 017 routing-coherence addition); `docs/domain-model.md` (F-pattern lead + Invariants section relocated to top, Cycle 017 routing-coherence addition); `docs/housekeeping/gates/017-architect-gate.md` (gate); `docs/housekeeping/audits/susceptibility-snapshot-017-architect.md` (snapshot — no Grounding Reframe, five feed-forward signals to BUILD) | Two-exchange gate. First exchange settled Pattern B for system-design.md (the canonical exemplar) via belief-mapping question; the practitioner's deliberation criterion was sync mechanisms (four mechanisms named: ADR-074 supersession sweep with companion file in target list; Version: field synchronization; architectural symmetry at producing phases; `/rdd-conform` audit scope) plus one mechanical gap surfaced (orientation-trigger hook matcher extension to fire on system-design.agents.md, added to BUILD WP-B). Second exchange: practitioner pushed back on the agent's localization of the cycle's evidence to system-design alone — essay 016 §1 explicitly names product-discovery alongside system-design; ORIENTATION-as-router has a coherence requirement that routed-to artifacts must work for the routed reader. Three problems distinguished: (1) F-pattern violation in product-discovery and domain-model; (2) structural ordering in domain-model (Invariants buried at line 761); (3) corpus-internal-identifier accessibility in artifact bodies (ADR-NNN, Cycle-N, Tier-N, Spike-N references without gloss). Problems 1 and 2 executed in-cycle; Problem 3 surfaced as future-cycle scope. Susceptibility snapshot (017-architect): no Grounding Reframe; five feed-forward signals to BUILD (record specific volume rationale for Pattern B at WP-G; framing-audit findings F-P2.1/F-P2.2/F-P3.1 remain open; Slim Ratio fitness criterion verifiable at WP-G; three unfeatured truths preserved as user judgment for future cycles; product-facing Outcome Test integration verification at WP-G — can a zero-prior-familiarity reader traverse ORIENTATION → system-design and emerge with a working schema?). |
| BUILD | ✅ Complete | 7 WPs (A–G) executed across 8 commits; v0.8.4 released; `/rdd-conform migrate-to-rdd` dogfooded on this corpus; in-cycle methodology amendment ADR-091 + v0.8.5 patch release; `.rdd/audits/integration-verification-017.md`; `.rdd/audits/susceptibility-snapshot-017-build.md` (no Grounding Reframe; Feed-forward Signal E surfaced); `.rdd/gates/017-build-gate.md` (BUILD-exit gate exchange recorded) | BUILD ran in auto mode after the practitioner's high-level direction. The BUILD-exit gate produced the practitioner commitment that auto-mode and gated-mode are both legitimate methodology patterns for different cycle characteristics. ADR-091 codifies the dual-mode framing with four mode-selection axes (mechanical-vs-generative; practitioner availability; cycle stakes / epistemic cost; stewardship locality catching-vs-teaching) and a `**BUILD mode:**` per-entry declaration field. Three argument-audit passes on ADR-091 (CLEAN at r3). Two framing-audit findings (FF-P2.1 design-alternative-examination compensating mechanism gap; FF-P3.1 heavy-lifting-vs-gated-default tension) carried as user-judgment future-cycle scope. The narrow-circularity risk the WP-D snapshot named applies structurally to ADR-091's own genesis — held as open question. |
| PLAY | ☐ Optional | — | — |
| SYNTHESIZE | ☐ Optional | — | — |

## Pause Log

| # | Paused | Resumed | Reason |
|---|--------|---------|--------|
| 1 | 2026-04-24 | 2026-04-24 | Stop-hook fires manifest check on every mid-phase turn-end, not just phase-exit attempts. At RESEARCH Step 1.1 (pre-dispatch, awaiting user input), every agent turn triggered the block and created a visible loop. Paused to diagnose. Fix shipped as v0.8.2: new `**In-progress phase:**` predicate short-circuits the manifest check while the field names the current phase. Cycle resumed with the new field set. |
| 2 | 2026-04-24 | 2026-04-24 | Mid-entry the user observed that v0.8.2's predicate fixed the orchestrator-driven path but left standalone phase-skill invocation vulnerable to the same loop, and that the Stop-hook block was never a real wall (Claude Code feeds the reason back as next-turn context, not as a terminating signal). v0.8.3 demoted the manifest check to advisory-only across all modes; In-progress phase predicate retained as advisory-noise suppressor. Session ended to start fresh on v0.8.3 from clean context. Resume with: remove `**Paused:**` and `**Phase at pause:**` lines, rename `### Paused:` → `### Active:`, add `**In-progress phase:** research`, then proceed with RESEARCH Step 1.1. |
| 3 | 2026-04-28 | 2026-04-28 | DECIDE complete with all phase artifacts in place. Eight new ADRs (083–090) drafted and audited (4 passes; pass 4 CLEAN AUDIT after gate-driven §3 reframe of ADR-087); supersession headers applied to ADR-064/067/070 per ADR-074; domain-model Amendment 22 landed with the coordinated three-touch checklist; scenarios + Cycle 017 Acceptance Criteria Table appended; interaction specs for Zero-Prior-Familiarity Reader and Cycle 017 extensions appended; conformance scan completed (18 findings → BUILD/ARCHITECT remediation scope); susceptibility snapshot returned no Grounding Reframe with 5 feed-forward signals to ARCHITECT; gate reflection note `017-decide-gate.md` written. RESEARCH-phase Grounding Reframe Target 2 (Beck framing) substantively discharged; the gate produced an in-cycle amendment to ADR-087 §3 (tightly-scoped prototyping reframed from "Beck-port amendment" to "research method alongside lit-review/search/methods" with anti-elaboration positioning in §3a connecting to MODEL Amendment 21's "Does RDD over-engineer?" future-cycle candidate). Pausing to keep ARCHITECT's load-bearing system-design restructuring out of accumulated session context. Resume with: remove `**Paused:**` and `**Phase at pause:**` lines, rename `### Paused:` → `### Active:`, add `**In-progress phase:** architect`, then invoke `/rdd-architect` with the inherited inputs documented in the Context for Resumption section below. |

## Feed-Forward Signals

### From Cycle 016 (Methodology Seams)

- **ADR-082 (question-isolation protocol)** shipped — apply at this cycle's RESEARCH entry. Constraint-removal against the user-proposed framing is the primary form.
- **ADR-067 (Three-Tier Enforcement Classification)** — any mechanisms proposed by this cycle must be classified (Skill-Structure / Harness / User-Tooling / best-effort Tier 2).
- **ADR-069 (Methodology Scope-of-Claim)** — scope any readability claims honestly. Readability is partly unassessable without reader feedback; the methodology provides structural aids, not guarantees of reader experience.
- **ADR-070 (housekeeping migration)** — user is reconsidering this decision. Treat as an adjustable prior; if reversed, it needs explicit supersession (ADR-074 workflow).
- **Conformance scan posture** — corpus was conformed at Cycle 016 exit; v0.8.1 was a targeted patch. Fresh conformance skipped at cycle entry by user call.

### From this session's hotfixes (v0.8.2 + v0.8.3)

- **Methodology debt — ADR-064 / ADR-067 amendments owed.** v0.8.3 demoted the Tier 1 phase-manifest check from blocking to advisory. The prior "Harness Layer provides structural prevention" claim is now overstated. ADR-064 (compound check / Stop-hook compound verification) and ADR-067 (Three-Tier Enforcement Classification) need amendment to reflect that the Harness Layer is now advisory-with-skill-discipline, not blocking. The compound fabrication check (dispatch-log cross-reference) remains the meaningful structural defense; the hard-block claim is dropped. Per ADR-074 supersession workflow, this is an in-cycle amendment with downstream sweep. **Natural fit for Cycle 017's readability theme** — advisory-only is itself a UX/comprehensibility improvement, and honest scope-of-claim is a comprehensibility win for downstream readers.
- **Methodology debt — In-progress phase mechanism.** Introduced as load-bearing in v0.8.2; demoted to advisory-noise suppressor in v0.8.3. Worth a brief ADR or skill-text note in this cycle to document the role-shift; otherwise readers will see the field documented as if it were correctness-critical when it is now optional UX.
- **Field evidence for the cycle's "agent interaction pattern" thread.** This session is itself field evidence for thread 5 — the user experienced the loop firsthand on a legitimate cycle entry, called out that "incessant loops will turn people off" and "obscure the benefit of using subtools as a gateway to the larger framework." That observation pre-dates RESEARCH and should be carried in as concrete material for the readability essay, not rediscovered.
- **Standalone-skill invocation surface.** The bug surfaced because standalone phase-skill invocation on an existing corpus was not protected by the orchestrator's discipline. Worth examining in this cycle whether other orchestrator-set invariants similarly assume the orchestrator is present.

### From Cycle 017 RESEARCH (this cycle, completed 2026-04-27)

**Diagnosis the cycle established:**
- *Context-mismatch* (initial-handoff vs ongoing-reference are structurally different reading tasks) is the most empirically supported and structurally fundamental mechanism for the comprehension failure external stakeholders experience. Density-ordering, audience-conflation, and artifact-form mismatch remain real and independent mechanisms but are not the unifying explanation.
- The user's entry hypothesis (front-loaded density) and the constraint-removal's refinement (audience conflation) were both partial findings. The literature recalibration is integrated into essay 016.

**Five literature-supported responses (from essay 016):**
1. Companion files at predictable paths for genuinely-divergent agent-context content (parallel-sibling pattern, e.g., AGENTS.md / llms.txt-style — *not* directory-level scoping).
2. Upstream decomposition for multi-item agent turns (the "scope" mechanism — agent decides whether N concern-types belong in one turn before producing the turn).
3. Continuous documentation patterns for the corpus-internal-identifier graduation problem.
4. Diagrams as one tool in an audience-adaptive explanation toolkit (conditional, not universal).
5. Context-building under cognitive-economy on the human side (in-place enhancement; agent-facing context allowed to grow; brief purpose-built human-facing artifacts admitted only where cognitive economy is positive).

**Required examination requirements at DISCOVER (Grounding Reframe Target 1):**
DISCOVER must belief-map the cognitive-economy constraint when surfacing zero-prior-familiarity readers as a stakeholder type: *Does the cognitive-economy test treat a 1–2 page brief purpose-built on-ramp differently from adding a 51st general-audience reference doc, or are they equivalent additions?* The answer determines whether DECIDE's cognitive-economy criterion ADR encodes an empirically-supported intervention or a foreclosure of one. See `docs/housekeeping/gates/017-research-gate.md` for the full framing.

**Required examination at DECIDE (Grounding Reframe Target 2):**
The validation-spike-in-research methodology amendment ADR must be reframed from *how to implement* to *what is the evidence the artifact investment has the payoff structure the Beck port assumes, and what would a spike test?* Concrete probe: name one specific claim in essay 016 §4.5 that a spike could test against the world. The Beck port may function axiomatically; DECIDE's task is to ensure the validation-spike ADR is not justified by the same framing it is supposed to test.

**Other DISCOVER inputs:**
- Make the human-vs-agent stakeholder distinction explicit (already partially in product-discovery.md but treated as one variation; needs structural emphasis as primary axis).
- Treat zero-prior-exposure first-encounter readers as a distinct stakeholder type with distinct schema-building needs.
- The orientation-about-orientation failure mode for §4.5 implementations (schemas built must be about the system being described, not about the corpus's navigation structure).

**Other MODEL inputs:**
- Import literature vocabulary as named domain concepts: forager/recipient (Pirolli & Card IFT), expertise reversal effect (Kalyuga), F-pattern (Nielsen), companion file pattern, continuous documentation (Rosenbaum), information scent (IFT), adjacency-pair recipient design failure (Conversation Analysis).

**Other DECIDE inputs:**
- ADRs for placement of agent-context content (companion file vs in-document tagging vs split).
- ADRs for context-building tooling implementation (including the agent-mediated orientation question with the AI-as-orienter / AI-as-prosthetic distinction).
- Methodology principle ADR for cognitive-economy criterion with non-cognitive admissibility consideration (relational, normative, trust-building value as separately-evaluable axis).
- Methodology debt ADRs from prior session hotfixes: ADR-064 / ADR-067 amendments for v0.8.3 advisory demotion; ADR-070 reconsideration in light of cycle findings (agent-context content placement implies in-document or companion-file pattern, not directory-level reorganization).

**Other ARCHITECT inputs:**
- system-design.md restructuring per cycle findings: diagram retains load-bearing role; agent-context material via companion file; in-document orientation lead at top; cognitive-economy test applied to any candidate orientation artifact.

**Other BUILD inputs:**
- Candidate work package: graduation-check mechanism for Issue #17 — code→doc dangling reference detection in the reverse direction from Tan et al. (2024). The cycle identified this as a genuine novel research/engineering gap.

**Future-cycle candidates (recorded, not addressed by Cycle 017):**
- *Does RDD's front-loaded process produce over-engineered systems by opening wider possibility spaces?* User-named side question from the gate; worth its own cycle.
- *Should the cycle-as-instance reflection be a standing caveat on the corpus?* Methodology-level question — whether any cycle's findings should be treated as research-not-validation until something has been built and tested against the world.

### From Cycle 017 DISCOVER (this cycle, completed 2026-04-27)

**Stakeholder model updates committed at the discover → model gate:**
- Zero-Prior-Familiarity Reader added as a distinct direct stakeholder type, characterized by zero schema (not external/internal status). Includes both external recipients and the practitioner returning after time away. The same intervention class serves both.
- Human-vs-agent named as primary structural axis of the stakeholder map; first-encounter vs. returning-reader as secondary axis.

**Practitioner-articulated success criterion (committed at gate):**
- The outcome test: *"does this produce direct human understanding without AI as workaround?"* — applies symmetrically to external recipients and to the returning self.
- Bolt-on artifacts that feel additional to the real docs are a failure-mode signal — when the impulse is to add an explainer doc, the docs themselves likely need fixing.
- In-place restructuring is the dominant intervention move; companion files at predictable paths (within the human-visible corpus) handle genuinely-divergent agent-context content.

**Scope clarifications (committed at gate):**
- `.rdd/` relocation of infrastructure artifacts (housekeeping/, session/, audits, dispatch logs) is in scope. ADR-074-style supersession candidate of ADR-070 at DECIDE. Distinct from directory-level *audience* separation, which the §4.1 finding rejects (companion file pattern is the answer for agent-context content).
- Verbosity reduction at the content-type-to-form matching level (diagrams alongside prose, not raw word-count substitution) is admissible secondary work.

**Disposition of RESEARCH-phase Grounding Reframe targets:**
- Target 1 (cognitive-economy constraint) — discharged at the DISCOVER gate via the practitioner's outcome-test reframe sharpened by the bolt-on / felt-additional failure-mode signal. The artifact records a more nuanced operating principle than essay 016 §4.5 had encoded.
- Target 2 (Beck framing) — not addressable at this boundary; carries forward to DECIDE, where the validation-spike-in-research methodology amendment ADR is the natural site for the reframe (*"what is the evidence the artifact investment has the payoff Beck assumes?"*).

**Inputs for MODEL:**
- Import literature vocabulary as named domain concepts: forager / recipient (Pirolli & Card), expertise reversal effect (Kalyuga), F-pattern (Nielsen), information scent (IFT), companion file pattern, continuous documentation (Rosenbaum), adjacency-pair recipient design failure (Conversation Analysis).
- Import practitioner-vocabulary additions with Product Origin column populated: "bolt-on" / "felt additional", "right fidelity that affords deeper exploration", initial-handoff / ongoing-reference, context-mismatch, companion file, outcome test / reading-cost test, AI-as-prosthetic / AI-as-orienter.
- Add Zero-Prior-Familiarity Reader as a stakeholder concept in the domain glossary with Product Origin populated.
- Propagate the five new Value Tensions (T1–T5) as Open Questions in the domain model.
- **Register correction (from susceptibility-snapshot-017-discover.md):** the Zero-Prior-Familiarity Reader stakeholder description in product-discovery.md carries parenthetical academic citations (Sweller; Pirolli & Card; Kalyuga). The register is product-discovery (user voice), but those citations are research voice. MODEL should encode this stakeholder's needs in domain vocabulary with parenthetical citations relocated to the Product Origin column, not embedded in the stakeholder description. Writing-register correction available during MODEL's vocabulary import — no design question reopened.

**Inputs for DECIDE:**
- ADR for cognitive-economy criterion encoding the in-place-first default with bolt-on / felt-additional as the failure-mode signal (replaces the §4.5 reading-cost framing).
- ADR for agent-context content placement (companion file at predictable path vs. in-document audience-tagging).
- ADR-074-style supersession of ADR-070 — `.rdd/` infrastructure relocation.
- ADR for AI-as-orienter / AI-as-prosthetic operational separation criterion (or explicit non-adoption with rationale).
- Validation-spike-in-research methodology amendment ADR with Target 2 reframe.
- Methodology debt: ADR-064 / ADR-067 amendments owed for v0.8.3 advisory demotion; In-progress phase mechanism role-shift documentation.

**Inputs for ARCHITECT:**
- system-design.md restructuring: F-pattern orientation lead at top; agent-context material via companion file; load-bearing diagram retained; cognitive-economy test (outcome-coded with in-place-first default) applied to any candidate orientation artifact.
- ORIENTATION.md regeneration to add Zero-Prior-Familiarity Reader's reading path (after MODEL completes) and the corpus map with audience and purpose annotations.
- `.rdd/` relocation execution — corpus restructuring and reference updates.

**Inputs for BUILD:**
- Graduation-check tooling for code→doc dangling references (Issue #17). Pre-graduation scan modeled on Tan et al. 2024, reverse direction. Candidate work package.
- `.rdd/` relocation tooling: path migration, dispatch-log writes, hook-script path updates, skill-text references.

**Open questions held for downstream phases:**
- Cognitive vs. non-cognitive admissibility (T3) — DECIDE candidate.
- "Threading is wrong in principle" (Nguyen et al. 2025, Assumption Inversion A3) — not adopted; remains live alternative.
- The cycle-as-instance reflection (Assumption Inversion A4) — standing self-critique posture for any RDD cycle.

### From Cycle 017 MODEL (this cycle, completed 2026-04-27)

**Domain vocabulary committed at the model → decide gate:**

- 18 new concepts encoded in `docs/domain-model.md` Amendment 21: 7 literature concepts (Forager / Recipient, Information Scent, Expertise Reversal Effect, F-Pattern, Companion File Pattern, Continuous Documentation, Adjacency-Pair Recipient Design Failure), 10 cycle-specific framing concepts (Initial-Handoff / Ongoing-Reference, Context-Mismatch with density-ordering / audience-conflation / artifact-form-mismatch as named-inside co-mechanisms, Multi-Item Turn Failure Mechanisms, Upstream Decomposition, Cognitive Economy, Outcome Test / Reading-Cost Test, Bolt-On / Felt Additional, Right Fidelity, AI-as-Prosthetic / AI-as-Orienter, Orientation-About-Orientation), and 1 stakeholder concept (Zero-Prior-Familiarity Reader, encoded in user voice with literature provenance in Product Origin column per the DISCOVER snapshot's register-correction guidance).
- 2 new actions: Apply Outcome Test (the practitioner's outcome-coded admissibility criterion at human-facing-artifact-candidate moments), Decompose Turn Upstream (the orchestrator's pre-turn decision about multi-item turn scope).
- 32 new relationships covering forager/recipient mapping, expertise reversal mechanics, F-pattern placement constraints, companion-file pattern as additive/non-substitutive, context-mismatch primacy with co-mechanisms, multi-item turn fourfold decomposition, cognitive-economy load asymmetry, outcome-vs-reading-cost tension, bolt-on failure-mode signal, AI-as-prosthetic / AI-as-orienter pairing, orientation-about-orientation failure mode, Zero-Prior-Familiarity Reader as primary-axis stakeholder, and the Inversion Principle's role in the cycle's diagnostic recalibration.

**No invariant changes.** Cycle 017's findings expand the diagnostic vocabulary for readability and comprehensibility but do not amend the existing invariants. The Outcome Test as admissibility criterion is held as practitioner commitment and DECIDE candidate; whether it warrants invariant-level placement is itself an open question for DECIDE.

**New commitment surfaced at the model → decide gate (sharper than upstream artifacts):**

- **Variability across corpora as a per-project judgment** — *"it doesn't have to be identical for every corpus depending on the project"* — extends the §4.1 per-artifact judgment framing to a per-project judgment. This is a constraint on DECIDE's cognitive-economy ADR: the criterion must be encodable in a way that admits per-project variation rather than as a methodology-wide rule. Per the susceptibility snapshot's Feed-forward B, the actionable form of this constraint is a methodology-wide default with named exception conditions, not pure per-project judgment without a default.

**"Less verbose" scope clarified at the gate:** content-type-to-form matching (diagrams alongside prose, not raw word-count substitution), confirming the DISCOVER gate's prior committed scope.

**Disposition of upstream Grounding Reframes at this boundary:**

- RESEARCH-phase Grounding Reframe Target 1 (cognitive-economy constraint) remains discharged at the discover → model gate.
- RESEARCH-phase Grounding Reframe Target 2 (Beck framing) — carries forward to DECIDE as documented; the validation-spike-in-research methodology amendment ADR is the natural site for the reframe.
- No new Grounding Reframe targets surfaced at this boundary.

**Susceptibility snapshot findings (no Grounding Reframe warranted; two feed-forward signals to DECIDE):**

- **Primary finding — warrant-elicitation gap.** The user's response to the gate's focal question (folded-co-mechanism encoding) echoed the agent's own framing back as the warrant — the structural fingerprint of Cycle 014 Finding 1 (preference precedes implications analysis; alternatives not engaged at comparable depth) **at lower stakes**. Below the Grounding Reframe threshold because (a) no invariant amended, (b) the folded entry names the three co-mechanisms explicitly so DECIDE is not foreclosed from citing them separately, (c) the substantive case for the fold is defensible.
- **No-invariant-change decision rated as earned** appropriate sequencing — MODEL is not the constitutional-decision phase; DECIDE is. The Outcome Test invariant-placement question is correctly encoded as a DECIDE candidate rather than foreclosed or silently absorbed as settled.
- **Cross-cycle pattern stable.** Cycle 014's preference-accelerated constitutional commitment has not recurred. Recurring residual pattern: approval-gate engagement on concept volume with deeper examination on one focal concept — appropriate given MODEL's role of tracking prior-phase-examined commitments.

**Inputs for DECIDE:**

- ADRs already named in the DISCOVER feed-forward (cognitive-economy criterion encoding the in-place-first default with bolt-on / felt-additional as the failure-mode signal; agent-context content placement via companion file vs in-document audience-tagging; ADR-074-style supersession of ADR-070 for `.rdd/` infrastructure relocation; AI-as-orienter / AI-as-prosthetic operational separation criterion or explicit non-adoption with rationale; validation-spike-in-research methodology amendment with Target 2 reframe; methodology debt — ADR-064 / ADR-067 amendments for v0.8.3 advisory demotion; In-progress phase mechanism role-shift documentation).
- **Snapshot Feed-forward A (focal):** before drafting the cognitive-economy ADR, name one sentence — *"the condition under which four standalone concepts would have served this ADR better than the folded structure is [X]."* If [X] is non-trivial, the ADR records it in its alternatives section. This is the one-question grounding check the gate did not elicit.
- **Snapshot Feed-forward B (focal):** the variability-across-corpora constraint should be realized as a methodology-wide default with named exception conditions, not as pure per-project judgment without a default. The gate commitment is consistent with both forms; only the default-with-exceptions form produces actionable guidance.
- The user's commitment-gating response identified the cycle's outcome at a higher level of abstraction than the technical vocabulary: *better organized documentation, less verbose at the form-matching level, good representations, infrastructure tucked away.* DECIDE's ADRs should serve this outcome rather than being justified by vocabulary alone.

**Inputs for ARCHITECT:**

- system-design.md restructuring per cycle findings: F-pattern orientation lead at top; agent-context material via companion file (not directory-level audience separation); load-bearing diagram retained; cognitive-economy test (outcome-coded with in-place-first default) applied to any candidate orientation artifact.
- ORIENTATION.md regeneration to add Zero-Prior-Familiarity Reader's reading path and the corpus map with audience and purpose annotations.
- `.rdd/` relocation execution — corpus restructuring and reference updates (after ADR-074-style supersession lands at DECIDE).

**Inputs for BUILD:**

- Graduation-check tooling for code→doc dangling references (Issue #17). Pre-graduation scan modeled on Tan et al. 2024, reverse direction. Candidate work package.
- `.rdd/` relocation tooling: path migration, dispatch-log writes, hook-script path updates, skill-text references.

**Open questions held for downstream phases (carried forward from MODEL):**

- All five Value Tensions T1–T5 from product discovery, propagated as Open Questions in the domain model.
- Beck framing methodology self-description (DECIDE Target 2 — validation-spike-in-research methodology amendment ADR).
- Cycle-as-instance reflection — should this be a standing caveat on the corpus? (Methodology-level future cycle or DECIDE candidate.)
- Does RDD over-engineer? — future-cycle candidate.

### From Cycle 017 DECIDE (this cycle, completed 2026-04-28)

**Eight ADRs accepted:**

- **ADR-083 — Cognitive-Economy Criterion as Outcome Test with In-Place-First Default.** Methodology principle. Outcome Test ("does this produce direct human understanding without AI as workaround?") is the admissibility criterion for human-facing artifacts. In-place-first as default intervention move. Bolt-on / felt-additional as failure-mode signal. Methodology-wide default with four named exception conditions: audience asymmetry, content-divergence threshold, post-graduation lifecycle position (anchored to graduation status in cycle-archive, not subjective fatigue), zero-prior-familiarity reader cohort. Outcome Test invariant placement held open as future-cycle scope. Discharges MODEL Snapshot Feed-forwards A and B.
- **ADR-084 — Agent-Context Content Placement.** Pattern catalog: Pattern A (audience-tagged sections within existing artifact) below ~50% threshold; Pattern B (companion file at predictable path `<artifact>.agents.md`) above. Directory-level audience separation rejected. ~50% threshold is agent-proposed and not empirically calibrated.
- **ADR-085 — `.rdd/` Infrastructure Relocation.** Process-vs-product directory separation via dotfile convention. Migration of `docs/housekeeping/` → `.rdd/` (audits, gates, cycle-status, dispatch-log, .migration-version) plus `session/` → `.rdd/session/`. **Partially supersedes ADR-070** (`docs/housekeeping/` placement). Migration mechanics: `/rdd-conform migrate-to-rdd` subcommand. Hook test fixtures explicitly included in substitution sweep. Deferred sweeps for system-design.md, ORIENTATION.md (to ARCHITECT), domain-model.md (discharged at Amendment 22), field-guide.md (to BUILD).
- **ADR-086 — AI-as-Orienter Non-Adoption Pending Operational Criterion.** Non-adoption with future-cycle conditions for revisiting (empirical study/spike; literature finding establishing tested criterion; methodology-internal session-bounded prototype). Default position preserved: corpus directly readable; agent assists pragmatic work. AID-gate bounded agent-mediated dialogue exempt from non-adoption.
- **ADR-087 — Validation Spikes as Research Method, with Grounding Reframe of the Beck Port.** §1 calibrates the Beck port (useful conceptual frame, not load-bearing structural evidence; three specific items separate conceptual port from verified payoff claim). §2 names what spikes can and cannot test. **§3 reframed at the decide → architect gate per user articulation:** tightly-scoped prototyping as a research method alongside lit-review/search/methods — used to ground research in actual interaction and as counterforce against possibility-space explosion. §3a positions prototyping in the methodology's anti-elaboration family alongside Tidy First/YAGNI and ADR-077 Applicability Check. §4 encodes cycle-as-instance reflection as standing caveat. **Discharges RESEARCH-phase Grounding Reframe Target 2.** Connects to MODEL Amendment 21's "Does RDD over-engineer?" future-cycle candidate as partly-addressable in-cycle.
- **ADR-088 — ADR-064 Amendment for v0.8.3 Advisory Demotion.** Stop hook manifest check operates in advisory disposition across all modes. Compound check (PostToolUse dispatch log + Stop-hook cross-reference) retained; finding surfaced as advisory rather than as block. State-C "structurally impossible" claim amended to "structurally detectable." Skill-text anchoring (ADR-065) named as load-bearing enforcement layer; Harness Layer adds visibility and detection. **Partially supersedes ADR-064** with expanded supersession header noting two reading-time notes (enforcement-mode semantic shift; stale `docs/housekeeping/` paths post-ADR-085-migration).
- **ADR-089 — ADR-067 Harness Layer Technique Revision.** Three-Tier Classification's Harness Layer row amended to advisory disposition; substrate primacy ordering preserved; decision-procedure step 2 language updated. **Partially supersedes ADR-067** with expanded supersession header naming the specific paragraph in ADR-067's body where the State-C language is amended.
- **ADR-090 — In-Progress Phase Field Role-Shift Documentation.** Field role amended from v0.8.2 load-bearing predicate to v0.8.3 advisory-noise suppressor. Optional, not correctness-critical. Lifecycle (set at phase entry by orchestrator; removed at phase-exit readiness) documented. Conformance audit emits soft note for missing field; explicit remediation for stale field state (remove the line).

**Domain-model Amendment 22 (coordinated three-touch):**
- Compound Check concept updated for ADR-088 advisory disposition.
- Three-Tier Enforcement concept updated for ADR-089 Harness Layer technique revision.
- Harness Layer concept updated for ADR-088 / ADR-089 advisory disposition + skill-text-anchoring as load-bearing.
- Amendment-Log entry recording ADR-085 supersession of ADR-070.

**Argument audit (4 passes, all CLEAN by pass 4):**
- Pass 1: 1 P1 + 5 P2 + 5 P3 → all corrections applied.
- Pass 2: 1 new P2 (ADR-083 documentation-fatigue exception trigger contradiction) + 1 new P3 (ADR-067 supersession header navigational asymmetry) → both corrections applied.
- Pass 3: CLEAN AUDIT with one residual P3 (ADR-083 cycle-archive observability claim) → applied.
- Pass 4: CLEAN AUDIT after gate-driven ADR-087 §3 reframe; two P3 precision improvements applied (ADR-077's primary disposition is anti-Einstellung; rejected alternatives entries 4–5 referenced retired three-criterion trigger).

**Conformance scan (18 findings across 3 clusters):**
- Cluster 1 — ADR-085 path-migration debt (~160 reference locations across 23 files; hook test fixtures included). BUILD scope.
- Cluster 2 — Advisory-language documentation debt. Domain-model Amendment 22 captured the in-DECIDE updates; system-design.md and ORIENTATION.md deferred to ARCHITECT; field-guide.md deferred to BUILD.
- Cluster 3 — Missing skill-text edits: `system-design.agents.md` does not exist (ARCHITECT scope); `/rdd-research` skill needs validation-spike decision step (BUILD scope); `/rdd-conform` needs `migrate-to-rdd` subcommand (BUILD scope); Outcome Test no structural anchor (by design per ADR-083 §6).

**Susceptibility snapshot (no Grounding Reframe; 5 feed-forward signals to ARCHITECT):**
- A: ADR-083's exception conditions are provisional, not authoritatively closed.
- B: ADR-084's ~50% Pattern A/B threshold carries agent-proposed status into the system-design restructuring decision.
- C: Conformance debt scope for ARCHITECT is clearly delineated from `conformance-scan-decide-017.md`.
- D: Budget for re-audit after cross-ADR vocabulary edits in ARCHITECT.
- E: Maintain provenance-check practice for any ARCHITECT ADRs (centered-vs-infrastructure framing's faithful attribution is a corpus-quality precondition).

**Inputs for ARCHITECT:**

- **system-design.md restructuring per essay 016 §6:** F-pattern orientation lead at top; companion file `system-design.agents.md` (Pattern B per ADR-084) with the agent-context material relocated; load-bearing diagram retained; Outcome Test (per ADR-083) applied to any candidate orientation artifact.
- **ORIENTATION.md regeneration:** add Zero-Prior-Familiarity Reader's reading path; add corpus map with audience and purpose annotations; Section 4's "process artifacts in `.rdd/`" sentence per ADR-085 §7; deferred-sweep discharge for ADR-085, ADR-088, ADR-089 references.
- **Provenance chains** for any new responsibility-allocation decisions linking modules → domain concepts → ADRs → product discovery (stakeholder/job/value), per ADR's existing pattern.
- The susceptibility snapshot's five feed-forward signals (A–E above) operate as ARCHITECT design constraints.
- The framing audit's three findings + three alternative framings + three unfeatured truths (recorded in `017-decide-gate.md`) are user-judgment material available for ARCHITECT decisions but not auto-corrections.

**Inputs for BUILD:**

- `/rdd-conform migrate-to-rdd` subcommand implementation (per ADR-085 §4).
- `/rdd-research` skill-text edit at the research → discover gate (per ADR-087 §3).
- Hook script path-substitution to `.rdd/` paths (per ADR-085 §10).
- Hook test fixtures path-substitution (per ADR-085 §10 — explicitly enumerated).
- `field-guide.md` regeneration with ADR-064/067/070 reference updates and v0.8.3 advisory-language updates (deferred sweeps).
- Graduation-check tooling for code→doc dangling references (Issue #17, candidate work package from earlier feed-forward).

**Inputs for downstream phases generally:**

- The §3 reframe of ADR-087 establishes tightly-scoped prototyping as an additional research method. Future cycles invoking `/rdd-research` will encounter the prototype-or-no-prototype question at the research → discover gate.
- The Beck-port reframe is calibration, not promotion or rejection. Practitioners adopting RDD have honest scope-of-claim about the framing's evidence base.
- The cycle-as-instance reflection is encoded as a standing caveat on research-phase outputs.
- The "does RDD over-engineer?" future-cycle candidate is partly addressable in-cycle via tightly-scoped prototyping; the broader structural-posture critique remains worth a dedicated cycle.

**Open questions held for downstream phases (carried forward from DECIDE):**

- All five Value Tensions T1–T5 from product discovery remain open as the methodology continues to operate.
- Outcome Test invariant-placement question (ADR-083 §6) — held as future-cycle scope.
- Three framing-audit findings + three alternative framings + three unfeatured truths surfaced at the gate (recorded in `017-decide-gate.md`) — available as user judgment, not adopted as ADR amendments.
- "Does RDD over-engineer?" future-cycle critique (MODEL Amendment 21 + ADR-087 §3a) — partly addressable in-cycle; broader structural-posture critique remains future-cycle scope.

## Context for Resumption

**DECIDE phase complete (2026-04-28).** Eight new ADRs drafted, audited, and accepted: ADR-083 (cognitive-economy criterion), ADR-084 (agent-context content placement), ADR-085 (`.rdd/` infrastructure relocation, supersedes ADR-070), ADR-086 (AI-as-orienter non-adoption), ADR-087 (tightly-scoped prototyping as research method, with Beck-port Grounding Reframe — discharges Target 2; **§3 reframed at the decide → architect gate per user articulation** that prototyping is a research method alongside lit-review/search/methods, not a Beck-port amendment), ADR-088 (ADR-064 v0.8.3 advisory demotion), ADR-089 (ADR-067 Harness-Layer revision), ADR-090 (In-progress phase role-shift). Supersession headers applied to ADR-064, ADR-067, ADR-070 per ADR-074 Step 2.5. Four argument-audit passes (pass 4 CLEAN AUDIT after gate-driven §3 reframe). Conformance scan: 18 findings across 3 clusters. Susceptibility snapshot: no Grounding Reframe, five feed-forward signals to ARCHITECT. Domain-model Amendment 22 (coordinated three-touch). Scenarios + Cycle 017 Acceptance Criteria Table appended to scenarios.md. Interaction specifications for Zero-Prior-Familiarity Reader and Cycle 017 Solo Developer / AI Agent extensions appended to interaction-specs.md. Gate reflection note `docs/housekeeping/gates/017-decide-gate.md` written.

**Deferred-sweep rationale (per ADR-074 Step 3 fitness property).** Multiple ADR-085, ADR-088, ADR-089 supersessions defer the four-artifact downstream sweep to natural regeneration moments:
- `system-design.md` and `ORIENTATION.md` — deferred to ARCHITECT (Cycle 017 ARCHITECT regenerates both; the path updates and classification-taxonomy updates fold into the regeneration).
- `domain-model.md` — **Amendment 22 (coordinated three-touch checklist):** (a) Compound Check concept update for ADR-088 advisory disposition (block → advisory; impossibility → detectability); (b) Three-Tier Enforcement concept update for ADR-089 Harness Layer technique revision; (c) Amendment-Log entry recording ADR-085 supersession of ADR-070 (path placement migration `docs/housekeeping/` → `.rdd/`). All three touches must land together in Amendment 22 to prevent partial application — they reference the same v0.8.3-coordinated changes but trace to three different ADRs. Targeted: at this cycle's DECIDE backward-propagation step, before behavior scenarios.
- `field-guide.md` — deferred to BUILD (Cycle 017 BUILD regenerates the field guide; references to ADR-064/067 framings and `docs/housekeeping/` paths update at that time).
- ADR-064, ADR-067, ADR-070 supersession headers and Status-field updates: applied at this cycle's DECIDE phase, in this session.

**Next phase:** ARCHITECT. Per orchestrator skill, ARCHITECT decomposes the system into modules with explicit responsibility allocation, dependency rules, and provenance chains linking design to research. The cycle's load-bearing ARCHITECT inputs:
1. **system-design.md restructuring per essay 016 §6** — F-pattern orientation lead at top; companion file `system-design.agents.md` (Pattern B per ADR-084) with the agent-context material relocated; load-bearing diagram retained; Outcome Test (per ADR-083) applied to any candidate orientation artifact.
2. **ORIENTATION.md regeneration** — add Zero-Prior-Familiarity Reader's reading path; add corpus map with audience and purpose annotations; Section 4's "process artifacts in `.rdd/`" sentence per ADR-085 §7; deferred-sweep discharge for ADR-085, ADR-088, ADR-089 references.
3. **Five feed-forward signals from the susceptibility snapshot to ARCHITECT** (recorded in `docs/housekeeping/gates/017-decide-gate.md` Specific commitments section): (A) ADR-083's exception conditions are provisional, not authoritatively closed; (B) ADR-084's ~50% Pattern A/B threshold carries agent-proposed status into the system-design restructuring decision; (C) conformance debt scope for ARCHITECT is delineated from `conformance-scan-decide-017.md`; (D) budget for re-audit after cross-ADR vocabulary edits; (E) maintain provenance-check practice for any new ARCHITECT ADRs.
4. **Three framing-audit findings + three alternative framings + three unfeatured truths** (recorded in the gate reflection note) carried as user judgment for ARCHITECT and downstream cycles.
5. **Deferred sweeps from ADR-085, ADR-088, ADR-089** for system-design.md and ORIENTATION.md discharged at this ARCHITECT regeneration; field-guide.md sweep further deferred to BUILD.

### From Cycle 017 ARCHITECT (this cycle, completed 2026-04-28)

**Artifacts produced:**
- `docs/system-design.md` (slim human-facing v14.0; F-pattern orientation lead at top; brief module summaries; dependency-graph diagram retained; cross-references to companion file)
- `docs/system-design.agents.md` (NEW companion file per ADR-084 Pattern B; full architectural drivers table including Cycle 017 additions; module decomposition with v14.0 amendments; responsibility matrix with Cycle 017 section; integration contracts; fitness criteria with Cycle 017 ADR-076 decompositions; test architecture with Cycle 017 boundary tests; design amendment log entry #15; per-phase susceptibility snapshot briefs with `.rdd/audits/` paths)
- `docs/ORIENTATION.md` (regenerated v14.0; Zero-Prior-Familiarity Reader's reading path added; corpus map with audience and purpose annotations; "process artifacts in `.rdd/`" sentence per ADR-085 §7; deferred-sweep discharge for ADR-085, ADR-088, ADR-089 references)
- `docs/roadmap.md` (Cycle 016 WPs migrated to Completed Work Log; Cycle 017 BUILD work packages A–G added with classified dependencies and five transition states)
- `docs/product-discovery.md` (F-pattern orientation lead added at top — Cycle 017 routing-coherence addition surfaced at the gate's second exchange)
- `docs/domain-model.md` (F-pattern orientation lead added; Invariants section relocated from line 761 to immediately after the lead — Cycle 017 routing-coherence addition surfaced at the gate's second exchange; **Invariants regrouped under four cluster sub-headers** — Outcome / Gate principles / Role boundary / Trajectory and execution — and brief organizational preambles added to Concepts, Actions, Relationships, Open Questions sections naming chronological-by-cycle accumulation and cross-referencing the Responsibility Matrix in system-design.agents.md as topical navigation index — Cycle 017 routing-coherence addition surfaced at the gate's third exchange)

**No invariant changes.** Cycle 017's commitments are at methodology-principle level (ADR-083) or amendments to existing structural commitments (ADRs 088 / 089 / 090).

**No new code modules.** One new artifact module (`system-design.agents.md`); the dependency graph's structural shape is preserved.

**Susceptibility snapshot (no Grounding Reframe; five feed-forward signals to BUILD):**

- A: Record the specific volume rationale for Pattern B judgment in WP-G documentation (canonical exemplar notation). The judgment is sound; the deliberative record is thinner than DECIDE Signal B specified.
- B: Three framing-audit findings (F-P2.1 ADR-083 bolt-on signal scope vs companion files; F-P2.2 ADR-086 final non-adoption framing tone; F-P3.1 ADR-084 naming convention novelty) remain open for BUILD skill-text and documentation work.
- C: "system-design.md word count < 30% of system-design.agents.md word count" Slim Ratio fitness criterion is verifiable at WP-G integration verification.
- D: Three unfeatured truths (Ernst & Robillard scope qualification; "threading is wrong in principle" alternative; ADR-083 exception conditions agent-composed) remain unaddressed; noted for future-cycle scope.
- E: WP-G integration verification should include a product-facing Outcome Test — can a zero-prior-familiarity reader traverse ORIENTATION.md → system-design.md (and the routed-to artifacts product-discovery.md, domain-model.md § Invariants) and emerge with a working schema? The cycle-as-instance reflection applies — readability improvements are research-not-validation until tested against a real first-encounter reader.

**Inputs for BUILD (Cycle 017 BUILD work packages):**

- WP-A: `/rdd-conform migrate-to-rdd` subcommand implementation per ADR-085 §4 (10-step operation; idempotent via `.rdd/.migration-version` marker; refuses uncommitted changes; explicit hook test fixture inclusion in substitution sweep).
- WP-B: Hook script + test fixtures path substitution to `.rdd/` paths with backward-compat fallback. **Addition surfaced at the architect → build gate:** extend the `orientation-trigger` hook PostToolUse matcher to fire on writes to `system-design.agents.md` alongside system-design.md, domain-model.md, scenarios.md. One-line config edit; closes a sync-mechanism gap.
- WP-C: `/rdd-research` skill-text edit at the research → discover gate per ADR-087 §3 — validation-spike decision step with felt-trigger question and rationale-recording requirement.
- WP-D: Stop-hook manifest check advisory disposition + In-Progress Phase predicate verification per ADR-088 / ADR-090.
- WP-E: `field-guide.md` regeneration discharging the deferred sweep for advisory-disposition language and `.rdd/` path updates.
- WP-F: Graduation-check tooling for code → doc dangling references (Issue #17) — pre-graduation scan modeled on Tan et al. 2024 in reverse direction.
- WP-G: Integration verification + release housekeeping with conformance-scan re-run, plugin version bump, release notes; **product-facing Outcome Test verification per Signal E** (test that a zero-prior-familiarity reader can traverse ORIENTATION → routed-to artifacts and emerge with a working schema).

**Future-cycle scope candidates (recorded, not addressed by Cycle 017):**

- **Corpus-internal-identifier accessibility audit** — surfaced at the architect → build gate's second exchange. Different mechanism from what essay 016 investigated. Audit + restructure pass across system-design.md, system-design.agents.md, product-discovery.md, domain-model.md, ORIENTATION.md to gloss or footnote corpus-internal identifiers (ADR-NNN, Cycle-N, Tier-N, Spike-N, Invariant-N) for first-encounter readers. Worth its own cycle.
- **Topical taxonomy for domain-model concepts/actions/relationships** — surfaced at the architect → build gate's third exchange. Whether organizing by what concepts are *about* (pipeline mechanics, stakeholders, epistemic mechanics, architectural mechanisms, readability vocabulary) would serve first-encounter readers better than chronological-by-cycle is a real research-and-design decision (multi-home concepts; methodology's accumulated practice is chronological). Worth its own focused cycle, paired with the corpus-internal-identifier audit above — both are domain-model-accessibility questions at different scales. In-cycle Cycle 017 added the chronological-by-cycle organizational preambles + Invariants four-family taxonomy as the lower-cost first move; the deeper topical reorganization remains future scope.
- All future-cycle candidates carried forward from prior phases (Outcome Test invariant placement; "Does RDD over-engineer?"; cycle-as-instance reflection elevation; three framing-audit findings F-P2.1/F-P2.2/F-P3.1; three alternative framings; three unfeatured truths) remain open as the methodology continues to operate.

**Open questions held for downstream phases (carried forward from ARCHITECT):**

- The five Value Tensions T1–T5 from product discovery remain open as the methodology continues to operate.
- All ARCHITECT-phase inputs to BUILD as enumerated in the WPs above.

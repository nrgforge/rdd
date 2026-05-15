# Susceptibility Snapshot

**Phase evaluated:** BUILD (Cycle 018 — Essay-Outline Form Change; auto mode per ADR-091)
**Artifact produced:** Six WPs landed — `skills/research/SKILL.md` (WP-A), `agents/argument-auditor.md` (WP-B), `skills/rdd/SKILL.md` orchestrator references (WP-C), `docs/ORIENTATION.md` top-of-file dateline + BUILD entries (WP-D), `docs/domain-model.md` Amendment 24 (WP-E), integration-verification-018.md + release housekeeping (WP-F); two fixture tests (`test_essay_outline_form_documented.sh` 26 assertions, `test_argument_auditor_essay_outline_genre.sh` 34 assertions)
**Date:** 2026-05-14

---

## Observed Signals

| Signal | Strength | Trajectory | Notes |
|--------|----------|------------|-------|
| Assertion density | Ambiguous | Declining relative to ARCHITECT | BUILD in auto mode is mechanically specified work — WPs translated tightly-scoped ADR text into skill-text. Assertion density in the modified files is high by volume (the skill texts are dense spec), but the assertions derive from ADR-092 and ADR-093 rather than from agent judgment. The WP-F integration-verification audit introduced its own declarative claims ("Audit result: CLEAN"), which is the locus of this signal's remaining concern. |
| Solution-space narrowing | Absent | Stable from ARCHITECT | The design-alternative surface was genuinely absent at BUILD. ADR-092 and ADR-093 specified the content; WP-A through WP-E were faithful translations. No new narrowing occurred. The pre-existing narrowing (the four-section structure, the Pyramid Refinement property, the three boundaries) was inherited — not introduced — at BUILD. |
| Framing adoption | Ambiguous | Stable — inheritance is the dominant pattern but is structurally appropriate here | BUILD inherited the post-DECIDE, post-four-audit-round framing without re-examination. This is the correct pattern at BUILD in the sycophancy gradient (BUILD is most resistant). The one framing-adoption risk at BUILD is not in the skill-text translations — it is in the WP-F self-certification: the integration-verification audit was self-administered (same BUILD agent that landed the WPs also produced the verification audit), so the "CLEAN" declaration depends on the audit's coverage being sufficient, not on an isolated evaluator confirming it. |
| Confidence markers | Clear | Stable — specific and bounded | WP-F's "Audit result: CLEAN" is a strong confidence marker. The marker is bounded (all Cycle 018 boundary integration tests at the load-bearing level pass; all five invariant enforcement claims verified; all six expected sweep items closed), but "CLEAN" as a single declarative verdict names a stronger claim than the audit's method supports. The method is skill-text inspection plus fixture execution — it verifies that the text is present, not that the behavior it prescribes is reliable under task load. The integration verification explicitly names this as "inspection-level" for five of seven boundary tests, which is methodologically honest, but the audit summary's "CLEAN" verdict does not forward-propagate that hedge. |
| Alternative engagement | Absent | Declining further from ARCHITECT — near-zero | No implementation alternatives were examined. The two open BUILD-phase decision points named in the ARCHITECT gate (WP-A vs WP-B ordering; aspirational fixture scope) were resolved by execution without documented choice rationale. WP-A preceding WP-B is noted in the cycle-status as honored order but no reasoning for the ordering choice is recorded. The five aspirational fixtures were deferred without an explicit scoping judgment surfaced to the user — the deferral is consistent with ARCHITECT Open Decision Point #2, but the BUILD phase produced no record of the agent evaluating the five aspirational fixtures and deciding they did not belong here; it simply did not build them. |
| Embedded conclusions at artifact-production moments | Clear | Present — concentrated in WP-F | WP-A through WP-E are ADR translations; their "conclusions" are ADR-derived and not BUILD-originated. WP-F is the exception: the integration-verification audit contains agent-composed conclusions about the cycle's sufficiency ("All Cycle 018 boundary integration tests at the load-bearing level pass," "No new debt introduced," "Release candidate v0.8.6 is ready for the practitioner's final review"). These conclusions are accurate as skill-text-inspection claims, but they are embedded at the artifact-production moment without an isolated evaluator. The "CLEAN" verdict is the artifact's most consequential embedded conclusion — and it is produced by the same agent that landed the work being verified. |

---

## Interpretation

### Pattern

The BUILD phase's empirical grounding (fixture execution, hook tests) successfully resisted the sycophancy gradient for the core implementation work. The 60 assertions across two fixture files are the cycle's most resistant mechanism: they execute against the actual file content, fail loud, and cannot be gamed by framing-adoption. All 21 hook tests pass. This is the pattern the dispatch prompt correctly identifies as BUILD's baseline — tests ground commitments in observable outcomes.

The residual risk concentrated in two specific locations that tests did not reach:

**Location 1: The five aspirational fixtures and the "inspection-level" gap.** The seven Cycle 018 boundary integration tests named in the system design produced only two load-bearing fixtures. The five remaining were held as aspirational per ARCHITECT Open Decision Point #2. What the BUILD produced instead for these five is "skill-text inspection assertions" embedded inside the two load-bearing fixtures (the second fixture asserts things like "citation-auditor coordination specified" and "Pyramid Coverage Map output template present"). This is inspection-level coverage of behavioral claims — it verifies that the text says the right thing, not that an argument-audit agent operating on an Essay-Outline would actually produce a pyramid coverage map. The audit correctly names this as "inspection-level" but the CLEAN verdict does not differentiate inspection-level from execution-level confidence.

The specific behavioral claims that remain inspection-level only:
- META audit-time review fires when META-anchored sections contain developmental bullets (the fixture asserts this text exists; no test exercises the behavior)
- Boundary 3 citation-auditor escalation to P1 when the citation-auditor is absent (the fixture asserts this text exists; no test exercises the conditional)
- Discrimination Test routing surfaces inline in output (the fixture asserts the routing words appear in the agent file; no test exercises the output template)
- Pyramid Coverage Map appears in audit output (text present, not behavior tested)
- Orchestrator Essay-Outline naming references are present (text grep, not behavior)

This is not an error — the ARCHITECT gate recorded these as aspirational, and auto-mode BUILD correctly deferred to prior phase decisions. The gap is that the BUILD practitioner produced no explicit record of having evaluated whether the deferral was still the right call at BUILD, or whether any of the five crossed the threshold into load-bearing given the WPs that had just landed. The scoping judgment was inherited, not re-evaluated.

**Location 2: The WP-F self-certification pattern.** The integration verification at WP-F has an architectural property worth naming: the agent that landed WPs A through E also authored the WP-F verification audit. This is the self-certification pattern — the verifier is the same entity as the implementer. In this cycle, the two load-bearing fixture tests provide partial independence (the test runner executes against the files; if a WP had failed to land correctly, the tests would have failed). But the WP-F audit's judgment calls — which items count as "closed," whether the P3 debt items are adequately addressed, whether "inspection-level coverage" for the five aspirational boundaries is sufficient — were self-assessed without isolated evaluation. The cycle-status BUILD phase-exit entry, which the same agent updated, includes a "Mode-recognized failure modes (design-alternative examination, scoping-judgment surfacing) did not bite this cycle" self-assessment.

This self-assessment is plausible — the WPs were mechanically specified, the ADRs were audited four times, and the BUILD execution was straightforward. But the claim that the mode-recognized failure modes did not bite is itself a judgment call about the mode's failure modes, made by the entity operating in that mode.

### Specific Question Evaluations (per dispatch prompt)

**Q1: Did any WP land with an implementation choice that adopted a "rejected-alternative" framing without surfacing it?**

Three sub-questions were specified:

*WP-A filename-pattern handling — legacy preservation vs. migration.* The implementation is clean. The skill text at §4.4 specifies: "Existing prose essays remain at their existing paths under their existing names (`NNN-*.md`) — the form change applies to RESEARCH artifacts produced after ADR-092 was accepted; no retroactive migration." This is the DECIDE-specified scope (ADR-092 §1 explicitly scoped the form change to post-acceptance RESEARCH artifacts). The legacy-preservation framing was the settled ADR decision, not a BUILD-level adoption of a rejected alternative. No signal.

*WP-B severity coordination on Boundary 3 — escalation rule.* The implementation encodes: "Boundary 3 violations detected by the argument-auditor during pyramid traversal are reported as P2 (the citation-auditor's P1 takes precedence)... If the dispatch brief indicates the citation-auditor has not yet run on the same artifact, escalate the violation to P1." This escalation rule was not explicitly in the original DECIDE/ARCHITECT specification — it was composed during WP-B execution. It represents a BUILD-originated design decision: when should an argument-auditor finding that overlaps with a citation-auditor's territory escalate vs. defer? The escalation-to-P1-when-absent rule is defensible and arguably the safest choice, but no alternative (e.g., always report P2 with a "citation-auditor should verify" note; always report P1; report P0-severity-escalation-required) was surfaced for evaluation. This is a BUILD-phase design decision that the ADRs did not fully specify and the BUILD practitioner resolved without surfacing the choice. Strength: low (the resolution is sensible; the gap is methodological, not operational). This is the auto-mode failure mode ADR-091 §5 names — a scoping judgment that was resolved without surfacing.

*WP-C Artifacts Summary row arrangement — coexistence vs. replacement.* The implementation preserves a legacy prose-essay row alongside the new Essay-Outline row in the Artifacts Summary table: `RESEARCH | Essay-Outline (canonical form per ADR-092) | ./docs/essays/essay-outline-NNN-<slug>.md` followed by `RESEARCH | Legacy prose essay (pre-ADR-092 cycles; no retroactive migration) | ./docs/essays/NNN-<slug>.md`. This is the coexistence framing — it treats both rows as live artifacts that the orchestrator acknowledges. The alternative (marking the legacy row as superseded or removing it, with a note in the ADR) was not examined. This choice encodes a design message: the orchestrator's Artifacts Summary table is a historical registry, not a canonical list of forms the next cycle will produce. That reading is defensible but was not surfaced as a framing choice. The coexistence framing was adopted without examining the replacement alternative.

**Q2: Auto-mode failure modes (ADR-091 §5) — design-alternative examination and scoping-judgment surfacing. Did either bite?**

Design-alternative examination: Did not materially bite for WPs A, C, D, E, and the core of WP-B. The WPs were specified at ADR resolution. The Boundary 3 escalation rule (above) is the one exception — a design alternative was present and not surfaced.

Scoping-judgment surfacing: Bit on the aspirational fixture question. The ARCHITECT gate named this as Open Decision Point #2 — "whether aspirational fixture tests beyond the two named ship at BUILD or defer." The BUILD phase deferred all five without a recorded re-evaluation. This is not necessarily wrong (ARCHITECT's decision was to hold them as future-cycle scope), but the auto-mode failure mode is that the scoping judgment was not re-surfaced to the user at BUILD. The user accepted the artifacts without a checkpoint asking "the five aspirational fixtures remain deferred — is that still the call?"

**Q3: Commitments encoded in skill text that crystallized framings from prior phases without belief-mapping against alternatives. The Discrimination Test routing field specifically.**

The routing language in the argument-auditor: "Routing per ADR-092 §6: scope-suspect — the cycle may be researching more than one cohesive argument can carry; stewardship response is to consider splitting the cycle into smaller scoped cycles" and "discipline-suspect — the production work was not completed at sufficient depth; stewardship response is to re-run production with discipline tightening (no scope change required)."

The routing language presupposes a binary diagnosis: scope failures and discipline failures are mutually exclusive and distinguishable at the boundary they fire at. A Boundary 1 violation (Abstract conclusion with no Argument-Graph node) is routed to scope-suspect; a Boundary 2 violation (Argument-Graph node with no body content) is routed to discipline-suspect. This binary is inherited from ADR-092 §6 and the MODEL gate's Grounding Reframe Target 3 (Outline-Coherence Signal discrimination). It is structurally reasonable.

The presupposition that should be belief-mapped: is the Boundary 1 vs. Boundary 2 location a reliable discriminator between scope failure and discipline failure? A practitioner could produce a Boundary 2 violation (no body content for a graph node) because the cycle's scope was too broad and the node was an artifact of over-claiming rather than insufficient production discipline. The routing would diagnose discipline-suspect and recommend re-running production, when the real issue is scope. This is the diagnostic gap the routing field does not acknowledge.

The routing language was inherited from ADR-092 §6 (which inherited it from the MODEL gate's Target 3 grounding). The BUILD encoding did not re-examine whether "Boundary 2 → discipline-suspect" is always the right routing or whether the discrimination is heuristic rather than definitive. The skill text carries it as a routing rule, not as a heuristic requiring practitioner judgment. The MUST-anchor convention and META-reserved-identifier language exhibit similar definitional confidence: they encode design choices as prescriptions without residual-uncertainty markers.

Severity: low. The routing is better than no routing; the binary is a reasonable heuristic. The gap is that a calibration marker ("this is a heuristic diagnosis; Boundary 2 violations may also reflect scope issues if the graph node was over-claimed rather than under-developed") was not added, which slightly over-states the routing's diagnostic precision.

**Q4: The two-fixture-load-bearing-plus-five-aspirational pattern — was the deferral adequately surfaced?**

The deferral was named in ARCHITECT as Open Decision Point #2 and surfaced to the user at the ARCHITECT gate. The user accepted the system design with those three Open Decision Points. At BUILD, the deferral was not re-surfaced. The WP-F integration-verification audit records the five aspirational fixtures as "🟡 Aspirational — verified by skill-text inspection in the second fixture" without a re-evaluation checkpoint for the user.

The adequacy of surfacing depends on what "adequate" means here. The ARCHITECT gate surfacing was genuine — the user explicitly accepted a roadmap with the deferral as an open question. The BUILD phase's non-surfacing is consistent with auto-mode's delegation model. But the auto-mode failure mode (ADR-091 §5: scoping-judgment surfacing) was not checked against this specific instance. The practitioner received the cycle-complete report without a bullet saying "the five aspirational fixtures remain deferred; here is what they would catch that the two load-bearing fixtures do not."

What the aspirational fixtures would catch that the two load-bearing fixtures do not: behavioral failures in the argument-auditor's Essay-Outline genre handling. The load-bearing fixtures verify that the words are in the skill text. The aspirational fixtures would verify that an argument-auditor agent dispatched on an Essay-Outline actually produces a pyramid coverage map with correct boundary labeling. This is a meaningful coverage gap for a methodology whose resistance to sycophancy depends on audits firing correctly. The gap is real but the deferral is defensible; the missed step is that the BUILD practitioner did not explicitly present this characterization of the gap to the user.

**Q5: WP-F's "Audit result: CLEAN" — earned or framing adoption?**

The CLEAN declaration is partially earned and partially a framing adoption. The earned portion: the two fixture tests executed, all 60 assertions passed, all 21 hook tests passed, and all six expected sweep items are demonstrably closed (each can be verified by reading the landed files). The framing-adoption portion: "inspection-level coverage" for five of seven boundary tests is not the same as execution-level verification, and the single-word "CLEAN" verdict does not carry that distinction forward into the release narrative. The cycle-status BUILD phase-exit entry that the same agent updated says "all five invariant enforcement claims verified" — which is technically accurate (the invariant-enforcement test table in the integration verification shows ✅ for each), but each ✅ was earned by skill-text inspection, not by exercising the invariant under realistic conditions.

The verification methodology (skill-text inspection) is appropriate for a skill-text-anchoring cycle — the Skill-Structure Layer enforcement substrate being verified is skill text, and inspection of skill text is the correct verification method. The problem is not the method; it is the non-differentiation in the verdict. "CLEAN" at inspection level is true. "CLEAN" as a standalone readiness claim is a framing that overstates the coverage boundary. The integration verification itself is honest (the word "inspection" appears multiple times, the aspirational vs. load-bearing distinction is clear), but the audit summary line and the cycle-status BUILD phase-exit entry both adopt the simpler "CLEAN" / "verified" framing without the hedge.

### Earned Confidence vs. Sycophantic Reinforcement

The case for earned confidence is strong for WPs A through E:
1. ADR-092 and ADR-093 entered BUILD with four argument-audit rounds plus the Context-trio gate swap — the most thoroughly examined artifacts in the cycle.
2. The two fixture tests are the cycle's most independent verification mechanism — they execute, cannot be gamed, and verified the ship-together constraint and the layer separation.
3. The Boundary 3 escalation rule and the Artifacts Summary coexistence choice are the only BUILD-originated design decisions, and both are low-stakes.

The case for sycophantic reinforcement is narrow and concentrated at WP-F:
1. The self-certification pattern at WP-F produced an overstated CLEAN verdict.
2. The Boundary 2 → discipline-suspect routing crystallized a heuristic as a rule without a calibration marker.
3. The five aspirational fixtures were deferred without a re-evaluation checkpoint for the user at BUILD.

### Cross-Phase Trajectory

The six-phase trajectory (RESEARCH → DISCOVER → MODEL → DECIDE → ARCHITECT → BUILD) shows the expected arc: early phases had framing adoption events caught by snapshots and grounding reframes; middle phases (DECIDE especially) had the adversarial audit loop operating at its most intensive; ARCHITECT was autonomous bookkeeping; BUILD was mechanically specified translation. Each phase's character matches the sycophancy gradient's prediction. BUILD added the cycle's most mechanically grounded verification (fixture execution) and the cycle's most self-certified verdict (WP-F CLEAN declaration).

The methodology observation from the DECIDE cross-cutting note — "agent susceptibility operates at multiple layers; each layer needs its own scoped corrective" — applies here too. BUILD's corrective is test execution. The test execution scope is skill-text. The behavioral layer (does the auditor actually behave as the skill text prescribes?) remains outside the scope of this cycle's corrective. That is a genuine limitation, honestly named in the integration verification as the aspirational fixture gap.

---

## Recommendation

**No Grounding Reframe warranted** — the BUILD phase's empirical grounding (fixture execution, 60 assertions, all hook tests passing) provides the most mechanically reliable verification in the cycle. The WPs translated tightly-specified ADR text faithfully. The signals that are present (embedded conclusion in WP-F; Boundary 3 escalation rule as unsurfaced BUILD-originated decision; aspirational fixture deferral without re-evaluation checkpoint) are below the threshold for a Grounding Reframe.

**Reasoning:** A Grounding Reframe is warranted when multiple signals converge on a narrowing pattern without earned confidence. The BUILD convergence here is the opposite: the narrowing (design decisions made) happened in thoroughly-audited prior phases; BUILD added the cycle's strongest resistance mechanism (fixture execution). The three residual concerns are observations for the practitioner's discretion, not prerequisites for phase advancement.

**Three observations for the practitioner's discretion, without requiring action:**

1. **The WP-F CLEAN verdict's inspection-level scope.** The integration verification is honest about the aspirational vs. load-bearing distinction within the document, but the audit summary and cycle-status BUILD phase-exit entry use CLEAN without the "inspection-level for five of seven boundaries" hedge. Future release verifications may want a two-tiered verdict: "execution-level: CLEAN (2 of 7 boundaries); inspection-level: CLEAN (5 of 7 boundaries)." This would let the practitioner read the cycle-complete report and understand the actual coverage boundary without consulting the detailed audit.

2. **The Boundary 2 → discipline-suspect routing carries heuristic confidence as prescriptive confidence.** A Boundary 2 violation (Argument-Graph node with no body content) can result from scope over-claiming as well as from production under-completion. The routing language does not acknowledge this. A calibration marker ("this diagnosis is a heuristic; Boundary 2 violations that arise from over-claimed scope may read as discipline failures before scope inspection reveals the real cause") would give future practitioners better diagnostic equipment without requiring an ADR revision.

3. **The Boundary 3 escalation rule (P2 normally; P1 if citation-auditor absent) is a BUILD-originated design decision.** It is sensible and consistent with not silently dropping violations. But it was resolved without surfacing the alternatives to the user. If a future cycle's argument-audit produces many Boundary 3 P1 findings because the citation-auditor ran later in the session, the escalation rule may produce gate noise that obscures actual violations. The practitioner may want to note this as a future monitoring point — not as a current problem.

---

## Methodology Note

The cycle produced this snapshot as a structural mechanism (Tier 1 per ADR-057 and ADR-065). The snapshot was dispatched at the BUILD → cycle-end boundary per the Skill-Structure Layer anchoring in the orchestrator. The scope-of-claim for this snapshot: it evaluates sycophancy susceptibility signals from an isolated context; it does not execute the fixture tests or verify the WP file contents independently. The "CLEAN" verdict in WP-F is evaluated for its methodological framing, not for its factual accuracy about the tests passing — the test execution itself is taken as reported.

# Argument and Framing Re-Audit Report

**Audited document:** `docs/essays/014-specification-execution-gap.md`
**Prior audit:** `docs/essays/audits/argument-audit-014.md`
**Date:** 2026-04-07

## Summary

- Prior argument issues: 4 (3 P2, 1 P3) — all landed correctly; all underlying issues resolved; no new argument issues introduced
- Prior framing issues: 5 (3 P2, 2 P3) — all landed correctly; 1 minor new framing issue introduced by revision
- New issues found: 1 P3 (framing, introduced by the three-tier table revision)

---

## SECTION 1 — Argument Audit (Re-Verification + New Scan)

### Verification of Prior Argument Issues

**P2-1 — Dapper compliance gap**

Fix landed: Yes. Section 5's closing paragraph (the paragraph starting "These precisions shape the essay's Dapper-compliance claim") now contains an explicit bridge: "A PostToolUse hook on `Agent` satisfies Dapper at the call layer — every attempted dispatch generates an observable event — but it does not satisfy Dapper at the *required dispatch* layer. If the agent never invokes the Task tool, no `PostToolUse` event fires. This is the residual gap the Stop hook is designed to backstop."

Underlying issue resolved: Yes. The distinction between call-layer and required-dispatch-layer Dapper compliance is now explicit and correctly characterized. The text matches S1's own "Honest Evaluation" section, which makes the same split ("satisfies Dapper at the level of 'every attempted dispatch is observable' but not at the level of 'every required dispatch is observable'"). The paragraph places the Stop hook correctly as the backstop that approaches the second property. The fix is precise, not merely gestural.

New issues introduced: None. The paragraph integrates cleanly with the prior material in Section 5 and does not create inconsistency with the overview of hook event behaviors earlier in that section.

---

**P2-2 — User engagement assumption in Section 8**

Fix landed: Yes. A new paragraph at the end of the three-state discussion in Section 8 reads: "The phenomenological severity of State C presupposes an engaged practitioner — one who evaluates what was produced rather than passively accepting it. This is consistent with the corpus caveat in Section 2 and with the methodology's artifact-drivenness: a methodology whose success criterion is understanding requires an engaged participant, and both the recommendation and its limits are calibrated to that participant. A passive practitioner would be less affected by State C in the phenomenological stream because there would be no active learning to deceive, but would be more affected in the build-the-right-thing stream because the absence of real mechanism execution would go unnoticed for longer."

Underlying issue resolved: Yes. The assumption is now surfaced, scoped, and distinguished in both directions — passive versus engaged — without weakening the essay's core claim. The connection back to Section 2's corpus caveat is correctly drawn. This is more than a disclaimer; it is a genuine engagement with the assumption.

New issues introduced: None. The paragraph does not overreach and is consistent with the reflection-log material that motivated the two-stream framing.

---

**P2-3 — Diagnostic variable conflation in Section 2**

Fix landed: Yes. A qualifying paragraph was added after the sharpened diagnostic box: "One qualification is worth naming explicitly. On this corpus, two conditions — *anchoring to a step* and *having a concrete dispatch site in the skill* — are perfectly correlated. The susceptibility-snapshot mechanism lacks both. The data cannot yet disentangle whether the failure is specifically about judgment-based triggers or more generally about the absence of a concrete dispatch site in the skill text at all. The design response is the same either way — move the trigger into structurally observable territory — but the diagnostic's explanatory precision is bounded by the confound. A follow-up cycle could distinguish the two by adding a concrete dispatch site for the susceptibility snapshot and observing whether the firing rate improves without any hook intervention."

Underlying issue resolved: Yes. The confound is named explicitly, the two candidate variables are identified clearly, and the essay's epistemic honesty about what the corpus can and cannot distinguish is now adequate. The claim that the design response is the same either way is accurate — S3's implications section says exactly this.

New issues introduced: None. The paragraph does not undermine the diagnostic; it tightens it.

---

**P3-1 — Parasuraman transfer caveat**

Fix landed: Yes. Section 3's Parasuraman paragraph now reads: "The original finding concerns human reviewers; its transfer to LLM agents is analogical rather than direct, and the analogy is imperfect. The broader case against the pedagogical alternative does not rest exclusively on this transfer — it also rests on the structural-enforcement literature from software engineering and aviation, which is not analogical in the same way — but the Parasuraman result is cited here as aligned supporting evidence, not as a direct claim about LLM cognition."

Underlying issue resolved: Yes. The transfer is now explicitly flagged as analogical, the imperfection of the analogy is acknowledged, and the finding is repositioned as supporting evidence rather than a primary warrant. The paragraph's structure now correctly distributes the argumentative weight to the structural-enforcement literature, which is what the lit review recommended.

New issues introduced: None. The citation remains useful as an aligned finding without overstating its scope.

---

### New Argument Issues

None. The revision pass did not introduce logical gaps, new overreach, or internal contradictions in the argument chains. All seven chains from the first audit continue to hold. The essay's load-bearing inferential structure — S3 diagnostic → S4 text-hardening failure → S1 feasibility → S2 operational deliverable → honest scoping of the compound check — is intact and unaltered by the revisions.

---

## SECTION 2 — Framing Audit (Re-Verification + New Scan)

**IMPORTANT: These findings are for user deliberation, NOT for auto-correction.**

### Verification of Prior Framing Issues

**Framing P2-1 — "Skill-structure fix first" alternative**

Fix landed: Yes. Section 5 now opens with an explicit paragraph naming the cheaper skill-structure fix as the first response: "If mechanisms anchored to concrete workflow steps execute reliably (the Section 2 diagnostic), the first response for any Tier 1 mechanism without a concrete anchor is to *add one*. The susceptibility snapshot's 0% coverage rate is not primarily a hook problem but a skill-structure problem: nothing in the methodology currently names a specific, mechanically-unavoidable step at which the snapshot must fire. The direct fix is a skill edit — embed the dispatch at a concrete step the way the citation auditor is embedded at 'after the essay is written.' This should be the first move."

The following sentence makes the architectural relationship explicit: "Hooks are defense-in-depth on top of that fix, not a replacement for it."

Framing concern addressed: Yes. The essay now names the cheaper alternative, positions it as the first move, and characterizes hooks correctly as defense-in-depth. The prior framing that jumped directly to hooks without surfacing the simpler option has been corrected.

New framing problem introduced: No. The skill-structure fix does not now overclaim its own sufficiency. The paragraph that follows immediately explains why hooks are still necessary — position effects and task-immersion pressures can defeat even concretely-specified steps, and silent fallback of an already-attempted dispatch needs verification that the skill text cannot provide. The essay holds both layers correctly.

---

**Framing P2-2 — Context-dependent three-tier framing**

Fix landed: Yes. Section 7 was substantially rewritten. The prior strict-hierarchy presentation is replaced with a context-dependent matching table. A unifying principle is introduced: "anchor the mechanism to a concrete, mechanically-unavoidable step with observable output." The table presents three categories (skill-structure layer, harness layer, user-tooling layer), and each is described as "primary in its domain, not a fallback from the others."

Framing concern addressed: Yes. The prior framing backgrounded the user-tooling layer as a tier-three fallback; it is now positioned as the primary technique for conversational mechanisms. The hierarchy concern is resolved.

New framing problem introduced: One minor issue. The three-tier table lists the user-tooling layer's "Example" column as "Gate-time reflection-note requirement." This is described as a proposal the cycle names but does not design ("The cycle does not propose the full user-tooling-layer design here"). The table's framing implies an established example where the essay has a conceptual proposal. A reader skimming the table could read the example as a current practice rather than a proposal. This is a P3 issue (see New Framing Issues below).

---

**Framing P2-3 — "Production recommendation" softening**

Fix landed: Yes. The phrase "the cycle's production recommendation" in Section 6 was changed to "the cycle's primary architectural recommendation — a design with a clear implementation path, pending a small set of production decisions enumerated in Section 10."

Framing concern addressed: Yes. The softening correctly distinguishes between an architectural recommendation (which this is) and a deployable production artifact (which it is not yet). Section 10 enumerates six open implementation questions, and the essay now correctly points the reader there. The change is minimal and precise.

New framing problem introduced: None. The surrounding text's characterization of the compound check remains consistent with the revised phrasing.

---

**Framing P3-1 — ADR-033 historicization**

Fix landed: Yes. Section 5 now contains a dedicated paragraph historicizing the existing five-hook architecture: why ADR-033 did not cover Cycle 9 mechanisms (they did not exist when ADR-033 was written), what ADR-062 rejected (semantic hooks, not structural ones), and how the recommendation fits as a "natural continuation of the project's prior hook architecture, not an invention."

Framing concern addressed: Yes. A reader new to the project can now understand the prior art context. The historicization is accurate: it correctly identifies that ADR-062's rejection was semantic-detection-specific, not a general rejection of hook-based enforcement.

Does the historicization smuggle a continuity claim not supported by the evidence? No. The paragraph is careful: it says the recommendation is a "natural continuation" because hooks for these mechanisms were never written (not because those hooks were tried and succeeded). S1's ADR-033 analysis supports this characterization verbatim: "The Cycle 9 gap is not that hooks were tried and failed for Tier 1 mechanisms — it is that the hooks for Tier 1 mechanisms were simply never written." The essay's claim tracks S1 exactly.

---

**Framing P3-2 — IFScale "easily handles" softening**

Fix landed: Yes. Section 3 now reads: "Claude's pattern is linear rather than threshold-based, so degradation is gradual — but gradual degradation from a large initial budget still means that four extra instructions are not the load-bearing variable. This rules out naive count-based explanations: the methodology added four mechanisms to an existing set, and four extra instructions do not blow a budget that processes an order of magnitude more before meaningful degradation sets in."

Framing concern addressed: Yes. The prior "easily handles a hundred" phrasing, which understated the distinction between threshold-decay and linear-decay models, is replaced with a characterization that correctly identifies Claude's linear pattern and draws the conclusion accurately: gradual degradation from a large budget makes four extra instructions non-load-bearing, without claiming the model "easily handles" anything. The revision matches the lit review's IFScale characterization.

New framing problem introduced: None.

---

### New Framing Issues

**Framing P3-1 (new) — User-tooling example presented as established practice**

- **Location:** Section 7, three-tier table (the "Example" column, user-tooling layer row) and the paragraph beginning "The concrete proposal for the user-tooling layer is to convert conversational mechanisms into artifact-producing mechanisms..."
- **Issue:** The three-tier table's Example column lists "Gate-time reflection-note requirement" as the example for the user-tooling layer. The essay immediately acknowledges that "The cycle does not propose the full user-tooling-layer design here." The unifying principle is introduced as a real finding ("anchor the mechanism to a concrete, mechanically-unavoidable step with observable output"), and the user-tooling layer is presented as primary in its domain. The tension is that the table presents the layer with apparent symmetry to the other two layers — which have concrete existing implementations — while the user-tooling layer has only a design proposal. A reader encountering the table as a summary will see three parallel, apparently concrete layers when one of them is a named-but-undesigned concept.
- **Why it matters:** The framing concern is less acute than Framing P3-1 from the first audit (the "production recommendation" issue), which has been fixed. But it is the same pattern one level down: the table conveys more symmetry between the layers than the text supports.
- **Recommendation:** Adding a column or row annotation ("proposed" or "design concept") to the user-tooling row, or changing the example entry to "AID reflection-note at gate (proposed)" would accurately represent the layer's maturity relative to the others. This is a minor calibration.

---

### Evaluation of the Unifying Principle

The revision introduced the unifying principle: *"anchor the mechanism to a concrete, mechanically-unavoidable step with observable output."*

This principle is verified against the evidence trail:

**Grounded in S3?** Yes. S3's core interpretive finding is that mechanisms fail "because nothing in the methodology yet *makes* them fire" — i.e., they lack a mechanically-unavoidable step. The principle is S3's diagnostic restated as a design prescription, not an after-the-fact invention.

**Grounded in S1?** Yes. S1's feasibility matrix shows that the hook architecture works precisely because it moves enforcement to "the tool-call boundary" — a concrete, harness-observable event. S1's "honest headline" section describes the hook layer as satisfying its principles at "the tool-call layer" but not at "the phase-boundary-without-a-tool-call layer" — which is exactly what "mechanically unavoidable" maps to.

**Grounded in S4?** Yes. S4's negative result — prose hardening doesn't work — is explained by the fact that prose instructions are executor-voluntary, not mechanically unavoidable. The principle's "observable output" requirement maps to S2's acceptance-criteria work, which established what counts as a verifiable artifact.

**Is it an after-the-fact narrative simplification?** The risk of post-hoc unification is that it imposes a cleaner pattern than the evidence actually shows. In this case, the principle genuinely does unify the three layers: the skill-structure layer works by making the dispatch mechanically unavoidable within the skill workflow; the harness layer works by making verification mechanically unavoidable at the tool-call boundary; and the user-tooling layer (proposed) would work by making the artifact-production step mechanically unavoidable at the gate. The principle is not a simplification that erases the layers' differences — the essay preserves those differences in the "technique" column. It is a genuine abstraction at the right level of generality.

**One limitation to note for user deliberation:** the user-tooling layer's proposed example (gate-time reflection note) achieves "mechanically unavoidable" only if the gate protocol itself enforces artifact production — which is the design proposal, not the current state. The principle therefore describes what the user-tooling layer *would* do if designed as proposed, not what it does today. This is consistent with the P3-1 framing issue above and does not undermine the principle's validity as a design target; it simply means the principle's application to the user-tooling layer is prospective.

---

## Overall Assessment

**The essay is clean on argument.** All four prior argument issues were resolved correctly. The fixes are precise — they address the underlying logical gaps rather than paper over them — and no new argument issues were introduced. The essay's seven load-bearing inferential chains remain intact.

**The essay is substantially improved on framing.** All five prior framing issues were addressed. The skill-structure fix is now foregrounded as the first move. The three-tier hierarchy is replaced with a context-dependent matching framework. The production-readiness claim is correctly qualified. The ADR-033 historicization is accurate and non-smuggling. The IFScale characterization is tightened. One new P3 framing issue was introduced: the three-tier table presents the user-tooling layer with apparent symmetry to the other two layers, while the layer itself is a design proposal rather than an established mechanism. This is a minor calibration, not a consequential omission.

**Advancement decision:** The essay is ready to advance past the research phase to the epistemic gate. There are no unresolved P1 or P2 argument issues; no unresolved P1 or P2 framing issues; and the one new P3 framing issue is a cosmetic table annotation that does not affect the essay's conclusions. The single open item is surfaced for user deliberation, not as a blocking condition.

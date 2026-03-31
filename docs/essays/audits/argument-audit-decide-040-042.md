# Argument Audit Report

**Audited documents:**
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-040-adaptive-gates-attend-interpret-decide.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-041-reflection-time-naming.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-042-rdd-about-utility-skill.md`

**Evidence trail:** `/Users/nathangreen/Development/rdd/docs/essays/009-adaptive-epistemic-gates.md`

**Domain model invariants:** `/Users/nathangreen/Development/rdd/docs/domain-model.md` (Invariants section)

**Date:** 2026-03-30

---

## Summary

- **Argument chains mapped:** 11
- **Issues found:** 7 (1 P1, 4 P2, 2 P3)

### Chains mapped

1. ADR-040: IRE pattern diagnosis → engagement-blindness is the structural problem → fixed templates cannot fix it
2. ADR-040: Teacher noticing literature → Attend-Interpret-Decide cycle → five pedagogical moves
3. ADR-040: Contingent shift principle → iterative gate → ends on shared understanding, not fixed turns
4. ADR-040: Invariant 3 boundary argument — agent attending/interpreting is pragmatic, user responding is epistemic
5. ADR-040: Alternatives rejection — better prompts, full adaptivity, user self-assessment
6. ADR-041: "Epistemic gate" as terminology barrier → dual-register naming → "reflection time" for user-facing contexts
7. ADR-041: Passivity risk of "reflection time" → mitigation via accompanying generative prompt
8. ADR-041: Alternatives rejection — checkpoint conversation, check-in, pause and reflect, staying with it, single register
9. ADR-042: Agent-as-teacher principle from ADR-040 gates → same principle extends to self-explanation of methodology
10. ADR-042: No current lightweight entry point for new users → /rdd-about fills that gap
11. ADR-042: No version awareness in current skills → /rdd-about reports version; enables conformance audit tracking

---

## Issues

### P1 — Must Fix

---

**Issue P1-1: Amendment number out of sequence in the domain model**

- **Location:** Domain model Amendment Log; ADR-040 Context section
- **Claim:** ADR-040 Context states "Invariant 4 was amended (Amendment 13)." The domain model Amendment Log records Amendment 13 as the Invariant 4 change, but the log entry immediately preceding it is Amendment 12 (Play phase, dated 2026-03-26). Amendment 13 is dated 2026-03-30. The date sequence is consistent, but the number sequence skips: entries appear in the Amendment Log as 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13 — however, Amendment 12 and Amendment 13 appear in the reverse of their table order (Amendment 13 appears before Amendment 12 in the rendered log, at lines 463 and 464 respectively).
- **Evidence gap:** The Amendment Log table rows are ordered: ..., Amendment 11, Amendment 13, Amendment 12. Amendment 13 (the Invariant 4 change, 2026-03-30) precedes Amendment 12 (the Play phase, 2026-03-26) in the table. Since ADR-040 cites "Amendment 13," any reader cross-referencing the table will find the correct entry — but the out-of-order numbering signals a recording error that will compound over time as subsequent amendments are added. If a future amendment is recorded as "Amendment 14" it will be ambiguous whether it follows the date order or the number order.
- **Recommendation:** Renumber Amendment 13 (Invariant 4/adaptive gates) to Amendment 14 and Amendment 12 (Play phase) to Amendment 12 — i.e., swap to restore date-sequential ordering, and update the ADR-040 Context reference accordingly. Alternatively, explicitly note in the Amendment Log header that entries are not guaranteed to be date-ordered. Either choice must be applied consistently before downstream ADRs cite these amendment numbers.

---

### P2 — Should Fix

---

**Issue P2-1: ADR-040 context understates the scope of the decision's change to Invariant 4**

- **Location:** ADR-040 Context, final paragraph; ADR-040 Consequences
- **Claim:** The Context section mentions the Invariant 4 amendment as a single sentence: "Invariant 4 was amended (Amendment 13) to shift the constraint from duration to waste." The Consequences section does not list this amendment in its positive or neutral effects.
- **Evidence gap:** The Invariant 4 amendment is not a minor contextual note — it is a prerequisite for the decision's validity. The prior Invariant 4 ("5-10 minutes") would render the iterative Attend-Interpret-Decide cycle potentially non-conforming, since a teaching exchange on surface engagement could easily exceed 10 minutes. ADR-040's decision depends on Invariant 4 having been amended. But the ADR presents the amendment as already given context rather than acknowledging that ADR-040 and the Invariant 4 amendment are co-dependent: neither is coherent without the other. The Amendment Log (Amendment 13) records the Invariant 4 change as informed by Essay 009 — the same essay that grounds ADR-040. This co-dependency is invisible in the ADR.
- **Recommendation:** Add a sentence to the Context section making the dependency explicit: "This decision and the Invariant 4 amendment are co-dependent — the prior 5-10 minute constraint would conflict with the iterative teaching exchanges this cycle enables." Add a Neutral consequence noting that the Invariant 4 amendment is a prerequisite for this decision's conformance.

---

**Issue P2-2: ADR-040 rejects "user self-assessment" using a source that applies to a different problem**

- **Location:** ADR-040 Alternatives Considered, "User self-assessment" entry
- **Claim:** Self-assessment is rejected because it is "unreliable (Bjork's metacognitive illusion — Essay 001)."
- **Evidence gap:** The Bjork metacognitive illusion (Essay 001, §3) describes the fluency illusion — users overestimate understanding because AI-assisted output is fluent and feels like their own. This is a claim about how users assess the quality of AI-generated work, not a general claim that self-assessment of comprehension is unreliable. Bjork's actual research on metacognitive illusions concerns the discrepancy between ease-of-processing and actual memory encoding — a different mechanism from asking a user "how well do you understand this?" The ADR conflates two distinct metacognitive failure modes. The self-assessment rejection is still defensible on other grounds (friction, and the point that conversation history provides richer evidence), but the cited evidence does not do the work claimed.
- **Recommendation:** Replace the Bjork citation with a direct argument: self-assessment adds friction and provides weaker signal than the conversation history the agent already has access to. If Bjork is retained, qualify the claim: "Self-assessment of understanding is vulnerable to fluency illusions (Bjork, Essay 001) and adds friction without producing better signal than the conversation history."

---

**Issue P2-3: ADR-042 derives a firm decision from what Essay 009 explicitly marks as a design proposal, not a research finding**

- **Location:** ADR-042 Context, paragraph 2; Essay 009, Section 11
- **Claim:** ADR-042 Context states: "The Cycle 5 research (Essay 009) established the agent-as-teacher role at gates. The same principle extends to methodology self-explanation." The ADR then proceeds to a firm decision.
- **Evidence gap:** Essay 009, Section 11 explicitly flags the /rdd-about proposal as a "design proposal (not a research finding)" and adds: "This proposal follows from the main argument but has not been independently researched; it is better specified through the DECIDE phase than through further literature review." The essay is transparent that this is an inference from the main argument, not a grounded finding. ADR-042's Context uses "established" — a word that signals a research finding — for a claim the source itself hedges as a proposal. The ADR should reflect the epistemic status of the claim that grounds it.
- **Recommendation:** Replace "established the agent-as-teacher role" with language that preserves the correct epistemic status: "introduced the agent-as-teacher role at gates and proposed — but did not independently research — that the same principle extends to methodology self-explanation (Essay 009, §11)." The decision itself may still follow, but it should be understood as speculative extrapolation from a grounded finding rather than derivation from an established finding.

---

**Issue P2-4: ADR-041 identifies the passivity risk but does not resolve it structurally**

- **Location:** ADR-041 Decision section, final paragraph; ADR-041 Consequences, Negative
- **Claim:** "The term becomes misleading only if used without the accompanying prompt." The mitigation is: the term names the pause; the prompt supplies the generative requirement.
- **Evidence gap:** This mitigation is stated but not enforced. The ADR does not specify where or how the invariant relationship between the term and the accompanying prompt is documented, who is responsible for ensuring skill file authors follow this pairing, or what happens if a future skill file uses "reflection time" in a context that does not immediately follow with a generative prompt (for example, a notification, a summary message, or a transitional phrase). The risk is real: "reflection time" as an accessible term will propagate across skill files and README text. If the invariant pairing is only documented in this ADR's decision section, it is fragile — skill file authors may not consult ADR-041 before writing user-facing text.
- **Recommendation:** Add a constraint to the Consequences section: "Skill file authors must pair every instance of 'reflection time' with an immediate generative prompt. The pairing rule should be documented in the skill file authoring guidance or a companion note in the domain model's Reflection Time concept entry." This elevates the mitigation from a hope to a traceable constraint.

---

### P3 — Consider

---

**Issue P3-1: ADR-040 introduces "thin engagement" as a pedagogical move label without reconciling it with Essay 009's terminology**

- **Location:** ADR-040 Decision, Decide step, third bullet
- **Claim:** The Decision section uses "Thin engagement → Teach" as the third move label.
- **Evidence gap:** Essay 009, Section 5 uses "Surface engagement" in both the Interpret taxonomy and the Decide table ("Surface engagement → Teach"). ADR-040's Interpret step retains "surface-engaged" (consistent with the essay) but the Decide step relabels it "Thin engagement." These refer to the same category but use different terms. This is a terminology inconsistency within the ADR itself (Interpret says "surface-engaged"; Decide says "Thin engagement") and between the ADR and its source essay.
- **Recommendation:** Standardize on "surface engagement" throughout ADR-040, consistent with Essay 009. The single-word variant "thin" may have originated as a shorthand during drafting but creates ambiguity for skill file authors implementing the moves.

---

**Issue P3-2: ADR-042 does not specify how depth calibration works without a preceding conversation history**

- **Location:** ADR-042 Decision, item 3; Essay 009, Section 11
- **Claim:** "/rdd-about offers to go deeper — calibrate depth to the user's apparent context (exploring vs. committed vs. mid-cycle)."
- **Evidence gap:** The Attend-Interpret-Decide cycle in ADR-040 depends on reading a prior phase's conversation history to calibrate the pedagogical move. /rdd-about, by definition, is invoked before or outside the pipeline — there may be no conversation history from which to infer the user's context. Essay 009 Section 11 gestures at this ("A new user invoking /rdd-about would receive an overview calibrated to their apparent context — are they exploring, committed, or mid-cycle? The agent reads signals and adjusts.") but does not specify what signals are available when there is no prior cycle history. The ADR inherits this underspecification.
- **Recommendation:** Add a note acknowledging that depth calibration for /rdd-about relies on in-session signals (stated purpose, questions asked, tone) rather than full conversation history. This is a weaker signal than the gate's full cycle history. The ADR should acknowledge the mechanism difference rather than implying the same AID cycle applies with equal fidelity.


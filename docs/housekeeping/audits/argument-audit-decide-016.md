# Argument and Framing Audit: Cycle 016 DECIDE

**Date:** 2026-04-22 (Re-audit — Revision 1)
**Auditor model:** claude-sonnet-4-6
**Audited artifacts:** ADRs 073–082 (revised in response to prior audit dated 2026-04-20)
**Source material:** essay 015-methodology-seams.md, domain-model.md (Amendment 19), ADR-055, ADR-058, ADR-059, ADR-060, ADR-061, ADR-064, ADR-065, ADR-066, ADR-067, ADR-068, ADR-069, ADR-070, ADR-071, ADR-072

**Audit history:** Initial audit 2026-04-20 found 0 P1 argument issues, 4 P2 argument issues, 7 P3 argument issues, 1 P1 framing observation, 4 P2 framing observations, 9 P3 framing observations. The agent revised ADRs in response. This re-audit verifies resolutions and checks for new issues introduced by revisions.

---

## Section 1: Argument Audit

### Summary

- **Argument chains mapped:** 43 (across 10 ADRs)
- **Issues found this round:** 4 (1 P2 new, 1 P2 residual, 2 P3 residual)

---

### ADR-073: Cycle Acceptance Criteria Table

**Prior P3 (DECIDE vs. product-discovery placement):** Addressed in Provenance check with explicit rationale for the DECIDE placement. The ADR now reads: "The placement of the criteria-table production responsibility at DECIDE (rather than upstream at product discovery) is itself a design choice." This closes the original observation.

**Status: Clean.** No new issues.

---

### ADR-074: ADR Body Immutability, Status Mutability, and Supersession Workflow

**Prior P2 (abandonment causation) — RESOLVED.** The revised text reads: "Whether the friction this ADR adds exceeds the threshold that correlates with abandonment in observed corpora is unknown." This correctly removes the causal attribution. The revision is well-formed.

**New P3 — Consider**

- **Location:** Consequences, Negative, fourth bullet (Long-chain navigation cost)
- **Claim:** "Mitigation paths for a future pass include a current-state index of active ADRs (the IETF's RFC index analog) or an automated query that walks supersession chains in `system-design.md`'s provenance lookups. Acknowledged as known cost without a current mitigation."
- **Evidence gap:** The Consequences section now correctly names the long-chain navigation cost, satisfying the prior P3 framing observation. However, the "automated query" mitigation path is a drafting-time synthesis addition not grounded in the essay (§3 identifies the problem; it does not propose an automated query solution). The essay's only mitigation analog is the IETF current-state index, which the ADR names. The automated query suggestion is reasonable but ungrounded — minor, since it is framed as a "future pass" option, not a current claim.
- **Recommendation:** Either label the automated-query option as drafting-time synthesis in the Provenance check, or note it as the ADR's own extension of the IETF analog. The current text presents the two mitigation paths at parity without distinguishing provenance.

**Status:** 1 P3. Prior P2 fully resolved.

---

### ADR-075: Preservation Scenarios in DECIDE

**Prior P2 framing (Einstellung-at-authorship) — RESOLVED.** The Consequences/Negative section now contains a substantive paragraph naming the recursive Einstellung risk explicitly: "the writer's mental model of 'what could change' is itself shaped by the new feature's framing" — with partial mitigations at two layers: (a) the prompt directs the writer to consult sources outside the new feature's frame, and (b) ADR-077's BUILD-time check is named as the second-stage defense.

**New text check — does the ADR-077 second-stage defense claim hold?**

The added text says ADR-077 prompt 4 "surfaces a property the preservation scenarios did not cover" and the gap "is caught at the application site." This is conditional on BUILD consulting system-design.md fitness properties at the pattern-reuse moment — which is exactly what prompt 4 does. The claim is well-formed: it does not assert that ADR-077 eliminates the residual; it asserts that ADR-077 provides a second-stage check at a different point in the pipeline. The claim is logically sound.

**Prior P3 (contract-test framing) — ADDRESSED.** A rejected-alternative section now treats the contract-test framing explicitly: "Rejected as the *primary* artifact form because preservation scenarios live in `scenarios.md` alongside behavior scenarios for readability and DECIDE-workflow contiguity; the contract-test framing would partition the artifact set across two files... without enabling capability the Given/When/Then form does not already enable." This is a sound rejection with explicit engagement rather than omission. The alternative is addressed, not dismissed.

**Status: Clean.** Both prior items resolved. No new issues.

---

### ADR-076: Fitness Criteria Decomposition in ARCHITECT

**Prior P2 (unverified citations) — RESOLVED.** The revised Provenance check reads: "This ADR does not invoke architecture-fitness-function literature (Lewis & Fowler, ATAM, Bass-Clements-Kazman) as supporting evidence. An earlier draft did; the citations were removed because the essay does not cite them and they were not citation-audited within this cycle." This is the correct handling. The explicit acknowledgment of the removed citations is transparent and honest.

**Revised "closes the ARCHITECT-phase share" claim — is the conditional well-formed?**

The revised Consequences/Positive section now reads: "Closes the ARCHITECT-phase share of the Issue #13 failure when fitness properties are consulted at the BUILD reuse moment." This is a conditional statement. The condition is immediately named in the same sentence, and the following sentence names the integration mechanism: "the integration is supplied by ADR-077 prompt 4." This is logically correct — the claim is conditional, the condition is stated, and the integrating mechanism is specified. The revision resolves CF-2 (the prior P1 framing observation) for ADR-076's side.

**Status: Clean.** Prior P2 fully resolved. No new issues.

---

### ADR-077: Applicability Check at BUILD Pattern Reuse

**New prompt 4 — does it introduce contradictions with the rest of the ADR?**

The prior three-prompt structure has been extended to four prompts. The fourth prompt reads: "Which fitness properties does `system-design.md` declare for the affected module(s) (per ADR-076)? Does the candidate pattern satisfy each, or is satisfaction unverified?"

The check: (1) Does prompt 4 conflict with the Tier 2 / conversational classification? No — prompt 4 is a question form, same category as prompts 1-3. The conversational framing is preserved. (2) Does prompt 4 conflict with the "trigger conditions" section? No — the trigger conditions (developer references an existing pattern, structural similarity, stewardship flag) remain unchanged. Prompt 4 activates within the same check; it does not alter when the check fires. (3) Does prompt 4 conflict with the "user's response is the load-bearing artifact" principle? No — the ADR text adds: "When `system-design.md` declares no fitness properties for the affected module, prompt 4 is recorded as 'no declared fitness properties for this module'" — correctly treating the absence of fitness properties as an observable judgment, consistent with ADR-055's recorded-engagement principle. (4) Does the null-answer case ("no declared fitness properties") create a gap in ADR-076's gate check? No — the ADR correctly notes that "ADR-076's gate check (which would have surfaced undecomposed claims at ARCHITECT time) becomes the audit trail for whether that absence is appropriate." This is logically sound: if ADR-076's gate passed without fitness properties, that was the ARCHITECT phase's judgment; prompt 4 surfaces that the absence is a recorded state, not an oversight.

The rejected-alternatives section has been updated to specify that the layered defense is integrated via prompt 4: "Prompt 4 of the applicability check explicitly consumes ADR-076's fitness-property output, making the ARCHITECT-time decomposition load-bearing at the BUILD reuse moment." This directly addresses CF-2.

**Prior P3 (pre-mortem adoption vs. evidence gap):** Not revised in this pass. Deferred below.

**Status: Clean on all new revisions.** Prior P3 deferred and noted in the deferred section.

---

### ADR-078: Multi-Cycle Schema in cycle-status.md

**Prior P2 (continue-parent enforcement gap) — RESOLVED.** The coupling semantics section now includes: "Acknowledged consequence: while a `continue-parent` inner cycle is active, the outer cycle's manifest checks are not enforced — the Stop hook reads only the top entry." The ADR draws the Airflow SubDagOperator parallel explicitly: "This is structurally similar to the Airflow SubDagOperator failure mode (state not propagated between layers), repurposed as a deliberate scope-of-enforcement choice rather than an unintended side effect." The procedural mitigation (mandatory `**Continue-parent rationale:**` field on the inner entry) is named.

**New P2 — Should Fix**

- **Location:** Consequences, Negative, fourth bullet
- **Claim:** The `continue-parent` mitigation relies on a `**Continue-parent rationale:**` field being set on the inner entry. The ADR states the field is mandatory ("requires a one-line `**Continue-parent rationale:**` field on the inner entry naming why the outer's enforcement should not apply during the inner") but the field does not appear in the per-entry field table in the Decision section's "Per-entry fields" subsection. The table lists the `**Pause-on-spawn policy:**` field but there is no `**Continue-parent rationale:**` field row. This creates an inconsistency between the coupling-semantics prose (which mandates the field) and the schema specification (which does not list it).
- **Recommendation:** Add `**Continue-parent rationale:**` to the per-entry field table — required when `**Pause-on-spawn policy:** continue-parent`. Without this, the "mandatory" requirement is specified in prose but absent from the canonical schema definition, which is the hook's reference.

**Prior P3 (cycle type combination ambiguity) — RESOLVED.** The per-entry field table row for `**Cycle type:**` now reads: "Describes content character. The structural relationship to other cycles is captured by `**Parent cycle:**` (presence indicates a nested cycle of any content character — e.g., a nested mini-cycle records `**Cycle type:** mini-cycle` plus `**Parent cycle:** 016`)." The type list is now `standard | mini-cycle | batch` (three, not four); `nested` has been removed. This resolves the prior ambiguity. The separation of content character (`**Cycle type:**`) from structural relationship (`**Parent cycle:**`) is clean and internally consistent.

**Status:** 1 P2 new issue (continue-parent rationale field missing from schema table). Prior P2 and P3 resolved.

---

### ADR-079: Non-Interrupting Stop Predicate for In-Progress Gate Conversations

**Prior P3 (hook selective-skip implementation detail) — RESOLVED.** The revised text adds: "For this ADR's selective-skip semantics, the manifest is extended to mark the gate-reflection-note entry with an `artifact_type: aid-cycle-gate-reflection` field (the canonical identifier already used in cycle-status feed-forward references). The hook skips only the entry bearing this identifier when `**In-progress gate:**` is set; all other entries for the source phase continue to run." This resolves the prior concern: the hook now has a canonical identifier to key on, and the mechanism is specified with precision.

**Status: Clean.** Prior P3 fully resolved. No new issues.

---

### ADR-080: Scope-Adaptive Enforcement via Precondition Composition

**Prior P2 (ADR-073 example incoherence) — RESOLVED.** The Provenance check explicitly addresses the removed primitive and the changed example: "An earlier draft included a `cycle_age_days_at_least` primitive; it was removed because no concrete use case for time-based enforcement was named." The Decision section example for batch cycles now reads: "the precondition framework provides the affordance for any future batch-specific manifest entries to gate themselves with `applicable_when: [cycle_type_in: [batch]]` — no concrete batch-specific entries exist in today's manifest, but the affordance is in place when one is needed." This correctly removes the incoherent ADR-073 claim and replaces it with an honest "affordance available, no concrete entry yet" framing.

The new example in the mini-cycle context cites the research-essay citation-audit check as an actual manifest-applicable example: "the research-essay citation-audit entry (`docs/housekeeping/audits/citation-audit-research-<NNN>.md`) — gain `applicable_when: [cycle_type_in: [standard, batch]]`." This is a legitimate manifest entry (research essays are RESEARCH-phase artifacts with audits in the manifest), and the example correctly reflects an actual enforcement scenario. The example is coherent.

**Prior P3 (cycle_age_days_at_least use case missing) — RESOLVED** by removal of the primitive from the set. Five primitives instead of six.

**Status: Clean.** Prior P2 and P3 fully resolved. No new issues.

---

### ADR-081: Grandfathered-Rule Migration for Pre-ADR-072 Cycles

**Prior P3 (archive-to-active edge case) — RESOLVED.** The Consequences/Neutral section now includes: "If an archived cycle is unarchived (resumed from archive) — moved back into `docs/cycle-status.md` — it is treated as any other paused cycle being resumed: if it pre-dates ADR-072, the grandfathered enforcement applies and `/rdd-conform` cycle-shape audit is the migration path." This explicitly closes the edge case.

**Status: Clean.** Prior P3 fully resolved. No new issues.

---

### ADR-082: Question-Isolation Protocol at RESEARCH Entry

**Prior P2 framing (structural vs. cognitive classification) — ADDRESSED.** The revised Context section now contains a substantial paragraph reclassifying the protocol: "this protocol qualifies for **first-line structural (Skill-Structure Layer) classification with a cognitive component** (the constraint-removal prompt's wording)" and cites ADR-067's four-step decision procedure as the basis. The Consequences/Positive section adds: "Classified as **first-line structural (Skill-Structure Layer)** with a cognitive component, per ADR-067's decision procedure."

**Does the classification claim hold under ADR-067's decision procedure?**

ADR-067's step 1 asks: "Does the mechanism have a concrete, mechanically-unavoidable workflow step at which it can be embedded in skill text?" ADR-082's five-step research-entry workflow is step-anchored in the `/rdd-research` skill — step 1 (user articulates questions), step 2 (constraint-removal prompt), step 3 (research-methods-reviewer dispatch), step 4 (revise or accept), step 5 (loop begins). The research-methods-reviewer dispatch is an existing Skill-Structure Layer mechanism (ADR-060). The question articulation in step 1 produces an artifact (research log entry). The answer to ADR-067 step 1 is yes. The Skill-Structure Layer classification is grounded.

The "cognitive component" qualifier is also accurate: the constraint-removal prompt's wording is compositional and context-dependent, not mechanically fixed. The ADR correctly separates the structural frame (the five steps) from the cognitive component (the prompt wording), which is the right distinction. No overstatement detected.

**Prior P2 argument (constraint-removal response vs. question set — where the boundary falls) — RESIDUAL.**

The prior audit identified that step 2's constraint-removal response and step 3's reviewer evaluation of "the question set" may not align — the reviewer's third criterion ("at least one question treats existing artifacts as prior art") may not be satisfiable by step 2's constraint-removal response if the response is not part of "the question set." The revision did not address this distinction directly. The added text about classification does not resolve it. The question of whether the reviewer evaluates the question set plus the constraint-removal response, or the question set only, remains unspecified.

- **Location:** Decision section, section 2, third reviewer criterion
- **Claim:** The reviewer evaluates "Whether at least one question treats existing artifacts as prior art rather than as constraints — i.e., asks the constraint-removal question explicitly."
- **Evidence gap:** Step 2 produces a constraint-removal response; step 3 evaluates "the question set." If the constraint-removal response is a separate artifact from the question set, the third criterion may not be satisfiable by the question set alone. If the constraint-removal response is part of the question set, the ADR should say so. The current text does not resolve the boundary.
- **Recommendation:** Either specify that the reviewer evaluates both the question set (step 1) and the constraint-removal response (step 2) as a combined artifact, or clarify that step 2 is part of the question set the reviewer reads. One sentence in step 3's reviewer criteria would close this.

**Prior P3 (Question Toolkit extension citation) — deferred, not addressed.** See deferred section.

**Status:** 1 P2 residual (constraint-removal vs. question set boundary). Classification claim resolves the prior P2 framing.

---

### Cross-ADR Argument Issues

**CA-1 (Prior P2 — unverified citations in ADR-076) — FULLY RESOLVED.** The citations were removed and their removal documented in the Provenance check. No cross-ADR citation issue remains.

**CA-2 (Prior P3 — ADR-078 / ADR-079 dependency coupling) — DEFERRED.** This was a P3 observation about the implementation dependency between ADR-078 and ADR-079. Not addressed in revisions; noted below.

**New cross-ADR observation — ADR-078 continue-parent rationale field: schema vs. prose inconsistency (P2, same as per-ADR-078 finding above).** The mandatory `**Continue-parent rationale:**` field appears in the coupling-semantics prose but is absent from the per-entry field table that serves as the canonical schema definition. This is a single issue surfaced in both the per-ADR and cross-ADR contexts; it is the same P2 finding, not a separate one.

---

### Deferred P3s from Prior Audit (Not Addressed in Revision Pass)

These items were not in scope for the revision pass and are noted here so the user knows what was deferred. They do not block advance.

1. **ADR-073:** BUILD skill step reference unverifiable from audited artifacts (Step 5.5 placement rationale).
2. **ADR-074:** Automated-query mitigation path not grounded in essay (noted above as a new P3 in the re-audit).
3. **ADR-077:** Pre-mortem adoption vs. evidence gap — the ADR notes the 30% identification improvement from Klein (2007) does not translate empirically to fewer undetected failures in software contexts, yet uses the pre-mortem as one of the three prompt forms. The mild inconsistency remains.
4. **ADR-079:** Advisory-notice trigger precision — "per session" is not specified as detection-on-field-set vs. periodic reminder.
5. **ADR-082:** Question Toolkit extension citation — the ADR does not cite the specific ADR-055 mechanism for toolkit expansion; the provenance check says it "follows the established mechanism" without specifying the section.
6. **CA-2:** ADR-078/ADR-079 dependency coupling — a dependency note would make the coupling explicit.

---

## Section 2: Framing Audit

### Summary

- **Framing issues found this round:** 2 (0 P1, 1 P2 residual, 1 P3 residual)
- **CF-2 (prior P1 framing) status:** RESOLVED — see ADR-076 and ADR-077 entries below.

---

### ADR-073: Cycle Acceptance Criteria Table

**Prior P3 (DECIDE vs. product-discovery placement) — RESOLVED.** The provenance check now explicitly names the DECIDE placement as a design choice with rationale: "The placement of the criteria-table production responsibility at DECIDE (rather than upstream at product discovery) is itself a design choice... DECIDE is where the criteria are translated into scenarios; layer-match is a translation question." The alternative is named and the reasoning is stated. The original observation is discharged.

**No new framing issues.**

---

### ADR-074: ADR Body Immutability, Status Mutability, and Supersession Workflow

**Prior P3 (long-chain navigation cost underrepresented) — RESOLVED.** A dedicated Consequences/Negative bullet now reads: "**Long-chain navigation cost.** As the ADR corpus grows, supersession chains deepen (ADR-NNN → ADR-MMM → ADR-PPP), and the query 'which ADR is currently authoritative on topic X?' becomes more expensive." The essay §3 observation is now represented in the ADR. The mitigation is correctly framed as future work.

**No new framing issues.**

---

### ADR-075: Preservation Scenarios in DECIDE

**Prior P2 framing (Einstellung-at-authorship) — RESOLVED.** The expanded Negative consequences paragraph acknowledges the authorship-time Einstellung residual explicitly ("applies recursively to the act of writing the preservation scenarios") and names ADR-077 prompt 4 as the second-stage defense. The prior observation is discharged.

**Prior P3 (contract-test framing) — RESOLVED.** The rejected-alternative section now treats the contract-test framing with an explicit engagement paragraph. Discharged.

**No new framing issues.**

---

### ADR-076: Fitness Criteria Decomposition in ARCHITECT

**CF-2 (prior P1 framing — layered defense connection between ADR-076 and ADR-077 not designed) — RESOLVED.**

The Consequences/Positive section now reads: "Closes the ARCHITECT-phase share of the Issue #13 failure when fitness properties are consulted at the BUILD reuse moment. Decomposition alone is necessary but not sufficient; the integration is supplied by ADR-077 prompt 4 ('Which fitness properties does `system-design.md` declare for the affected module(s)?'), which makes the decomposed properties load-bearing during pattern reuse rather than passive entries in `system-design.md`."

This specifies the integration mechanism explicitly. The "layered defense" framing is no longer asserted without design; the integration is now specified. CF-2 is retired.

**No new framing issues.**

---

### ADR-077: Applicability Check at BUILD Pattern Reuse

**CF-2 (prior P1) — RESOLVED on ADR-077's side.** The rejected-alternatives entry on "Skip the cognitive layer entirely" now reads: "Prompt 4 of the applicability check explicitly consumes ADR-076's fitness-property output, making the ARCHITECT-time decomposition load-bearing at the BUILD reuse moment — the three ADRs (075, 076, 077) form an **integrated** defense via prompt 4's fitness-property consultation, not merely sequential phase coverage." The integration is now named in both ADR-076 and ADR-077, and prompt 4 is the specified link.

**Prior P3 (trigger-condition detection infrastructure) — Deferred.** The ADR still cites "BUILD's existing stewardship checks" detecting "a copy-shape with localized modifications" as a trigger condition, and ADR-071 is cited as the provenance, but copy-shape detection is not described in ADR-071. This remains a potential aspirational-infrastructure concern. Not addressed in this revision pass.

**No new framing issues.**

---

### ADR-078: Multi-Cycle Schema in cycle-status.md

**CF-4 (prior P3 — continue-parent and Airflow failure mode connection) — RESOLVED.** The coupling semantics section now explicitly draws the Airflow parallel: "This is structurally similar to the Airflow SubDagOperator failure mode (state not propagated between layers), repurposed as a deliberate scope-of-enforcement choice rather than an unintended side effect." The prior framing observation is discharged.

**Prior P3 (continue-parent justification rigor) — PARTIALLY ADDRESSED.** The mandatory `**Continue-parent rationale:**` field is named as the procedural mitigation. However, as noted in the argument audit, the field is absent from the per-entry field table. The framing dimension of this issue — whether the `continue-parent` use case is sufficiently circumscribed — is addressed by the mandatory rationale requirement; the implementation gap (schema table omission) is the remaining argument issue.

**No new framing issues beyond the schema-table gap already flagged as P2.**

---

### ADR-079: Non-Interrupting Stop Predicate for In-Progress Gate Conversations

**No prior framing items requiring revision.** Prior P3 (advisory-notice trigger precision) was deferred and remains deferred.

**No new framing issues.**

---

### ADR-080: Scope-Adaptive Enforcement via Precondition Composition

**Prior P3 (cycle_age_days_at_least use case missing) — RESOLVED** by removal of the primitive. The affordance note for batch-specific entries is correctly framed as forward-compatible without specifying a concrete entry today.

**No new framing issues.**

---

### ADR-081: Grandfathered-Rule Migration for Pre-ADR-072 Cycles

**Prior P3 (archive-to-active edge case) — RESOLVED.** Addressed in Neutral consequences.

**No new framing issues.**

---

### ADR-082: Question-Isolation Protocol at RESEARCH Entry

**Prior P2 framing (structural classification understated) — RESOLVED.** The reclassification to "first-line structural (Skill-Structure Layer) with a cognitive component" is grounded in ADR-067's four-step decision procedure and is accurate. CF-1 is also retired for ADR-082 specifically.

**Prior P3 framing (Galinsky & Moskowitz ecological validity) — RESIDUAL.**

The prior audit noted that essay §6 qualifies the Galinsky & Moskowitz (2000) counterfactual mindset induction evidence with "Ecological validity is poor in the relevant condition" — the expert-investment condition for practitioners is more similar to expert judicial anchoring (Englich et al. 2006) than to standard lab anchoring studies. ADR-082 cites Galinsky & Moskowitz as evidence for the constraint-removal prompt's effectiveness but does not carry this qualification forward. The revision did not address this.

- **Location:** Context section (cited in the three-mechanism paragraph) and Consequences/Positive (implicitly, in the claim that the protocol "operationalizes the pre-registration principle")
- **Issue:** The ADR treats the constraint-removal prompt as evidence-backed without acknowledging that its evidence base (Galinsky & Moskowitz 2000) has poor ecological validity for the practitioner condition the protocol targets.
- **Status:** Deferred P3. Does not block advance but understates the evidence qualification the essay itself carries.

**No new framing issues beyond the deferred P3.**

---

### Cross-ADR Framing Observations

**CF-1 (prior P2 — "first-line structural / second-line cognitive" framing: incomplete propagation to ADR-082) — RESOLVED.** ADR-082 is now explicitly classified as first-line structural with a cognitive component. The classification accurately reflects the five-step workflow's structural anchoring under ADR-067's decision procedure. CF-1 is retired.

**CF-2 (prior P1 — layered defense connection asserted but not designed) — RESOLVED.** ADR-077 prompt 4 now specifies the integration mechanism. The fitness properties from ADR-076 are explicitly consumed at the BUILD pattern-reuse moment. The three-ADR defense (075, 076, 077) is specified as integrated via prompt 4, not merely sequential. CF-2 is retired.

**CF-3 (prior P2 — scope-of-claim on "architecturally equivalent" preserved) — CLEAN.** No change; ADR-078 and ADR-080 continue to preserve the essay §5 design-judgment caveat.

**CF-4 (prior P3 — Airflow failure mode connection in continue-parent case) — RESOLVED.** ADR-078 now draws the connection explicitly in the coupling-semantics section.

---

### Remaining Deferred Framing Items (Not Addressed, Not Blocking)

1. **ADR-077 P3:** Trigger-condition detection infrastructure — copy-shape detection cited against ADR-071 but not described in ADR-071.
2. **ADR-079 P3:** Advisory-notice trigger precision — "per session" not specified as detection-on-field-set vs. periodic.
3. **ADR-082 P3:** Galinsky & Moskowitz ecological validity qualification not carried forward from essay §6.
4. **ADR-073 P3 (alternative framing — push vs. pull traceability):** Still available from evidence; not a current issue given the current ADR's coherence, but worth noting for a future revisit.
5. **ADR-074 P3 (alternative framing — living-document immutability conditioned on how provenance links are written):** The inverted framing observation from the prior audit remains — the immutability requirement is a consequence of ADR-by-number citation, not of immutability per se. Not a blocking issue.

---

## Summary

**Argument audit (re-audit):**
- P1 argument issues: 0
- P2 argument issues: 2 (ADR-078: continue-parent rationale field absent from schema table; ADR-082: constraint-removal response vs. question set boundary unspecified)
- P3 argument issues: 2 residual (ADR-077 pre-mortem adoption vs. evidence gap; ADR-074 automated-query mitigation path provenance)

**Framing audit (re-audit):**
- P1 framing issues: 0 (CF-2 resolved)
- P2 framing issues: 0 (all prior P2 framing items resolved; CF-1 resolved)
- P3 framing issues: 3 residual (ADR-077 trigger infrastructure; ADR-079 advisory notice trigger; ADR-082 Galinsky ecological validity)

**Prior issues resolved in this revision pass:**
- P2 argument: ADR-074 abandonment causation (resolved), ADR-076 unverified citations (resolved), ADR-078 continue-parent acknowledgment (partially resolved — acknowledged in prose, schema gap introduced), ADR-080 ADR-073 example incoherence (resolved)
- P3 argument: ADR-078 cycle-type combination ambiguity (resolved), ADR-079 selective-skip implementation detail (resolved), ADR-081 archive-to-active edge case (resolved)
- P1 framing: CF-2 layered defense not designed (resolved)
- P2 framing: ADR-075 Einstellung-at-authorship residual (resolved), ADR-076 BUILD consultation assumed (resolved), ADR-082 structural classification understated (resolved), CF-1 classification propagation incomplete (resolved)
- P3 framing: ADR-073 DECIDE placement rationale (resolved), ADR-074 long-chain navigation cost (resolved), ADR-075 contract-test alternative (resolved), ADR-078 continue-parent Airflow connection (resolved), ADR-081 archive-to-active edge case (resolved)

---

## Recommendation

**Revise — two specific ADRs, two specific issues:**

1. **ADR-078:** Add `**Continue-parent rationale:**` to the per-entry field table in the Decision section. The field is mandatory when `**Pause-on-spawn policy:** continue-parent` is set; without a table entry, the schema definition is incomplete relative to the coupling-semantics prose.

2. **ADR-082:** Specify whether the research-methods-reviewer in step 3 evaluates the question set (step 1) alone, or the question set plus the constraint-removal response (step 2), and how the third reviewer criterion ("at least one question treats existing artifacts as prior art") maps to each artifact. One sentence closes this.

**Surface to user for awareness (not blocking):**

- The five deferred P3s listed above are low-consequence and do not block advance once the two P2 items above are addressed. They can be addressed at BUILD-time implementation or in a subsequent revision pass.
- ADR-082's Galinsky & Moskowitz ecological validity qualification — the essay §6 carries this qualification explicitly; the ADR does not. If the ADR is intended to be read as a standalone specification (not requiring the essay as context), the qualification should be carried forward.

---

# Re-audit (revision 2): 2026-04-22

**Auditor model:** claude-sonnet-4-6
**Scope:** ADR-078, ADR-082 (targeted fixes from re-audit pass 1)

## Argument audit

### ADR-078: `**Continue-parent rationale:**` field — fix verified

The new table row (line 66) is present and well-formed. The required-when condition reads: "required when `**Pause-on-spawn policy:** continue-parent` is set on a nested entry." This matches the coupling-semantics prose exactly, which states: "the methodology's mitigation is procedural: `continue-parent` requires a one-line `**Continue-parent rationale:**` field on the inner entry." The row's description correctly names the absence-as-signal property: "the field's absence on a `continue-parent` entry is itself a signal the choice was not deliberated."

No contradiction introduced. The row sits between `**Pause-on-spawn policy:**` and the end of the table, which is the natural location for a conditionally required companion field. No other locations in the ADR need a reference to this field — the coupling-semantics section already names it in prose as the mitigation, and the hook-behavior section does not enumerate per-entry fields (it addresses read semantics, not schema). The schema table and the coupling-semantics prose are now consistent.

**Status: P2 resolved. No new issues.**

---

### ADR-082: Reviewer scope over both artifacts — fix verified

The new paragraph in section 2 (lines 50–51) explicitly specifies that the reviewer evaluates "both artifacts produced in steps 1 and 2" as one "question set under review." The third criterion resolution is stated directly: it "is satisfied either by an explicitly artifact-bracketing question in step 1 or by the step-2 constraint-removal response, which structurally treats the named artifact as prior art rather than as a constraint."

Does this expand the reviewer's scope inappropriately? Checking against ADR-060: ADR-060 defines the research-methods-reviewer as a specialist that "reads the research question set before the research phase begins" and "flags questions that embed conclusions, presuppose architectures, or narrow the hypothesis space prematurely." ADR-082 extends the scope to include the constraint-removal response as part of the question set under review. This is an extension of the dispatch, not a contradiction: ADR-082 explicitly states it "extends" the ADR-060 dispatch (section 2 header: "Research-methods-reviewer extension"), and the constraint-removal response is a question-framing artifact — precisely the category ADR-060's reviewer was designed to evaluate. The extension stays within the reviewer's analytical competency.

One potential ambiguity checked: does treating the constraint-removal response as part of the question set mean the reviewer evaluates the *agent-composed prompt* (step 2's first half) or the *user's response* (step 2's second half)? The paragraph says "the constraint-removal response" — which in the five-step workflow is the user's answer, not the agent's prompt formulation. This is correct: the user's response is the artifact that either does or does not treat the named artifact as prior art. The agent's prompt formulation is a process step, not a reviewable artifact. The distinction is implicit but derivable from context; it does not create harmful ambiguity.

**Status: P2 resolved. No new issues.**

---

## Framing audit

No new framing issues introduced by either revision. The ADR-078 table addition is a schema completeness fix with no framing implications — it makes an already-stated requirement explicit in the canonical location. The ADR-082 paragraph closes a scope-boundary question; it does not reframe the protocol's position relative to the evidence base or the source material. The deferred P3 framing items from prior passes (Galinsky & Moskowitz ecological validity, ADR-077 trigger-condition infrastructure, ADR-079 advisory-notice trigger precision) remain as previously recorded and are not affected by these revisions.

---

## Recommendation

**Advance** — both fixes resolved; remaining P3s from prior passes accepted as deferred.

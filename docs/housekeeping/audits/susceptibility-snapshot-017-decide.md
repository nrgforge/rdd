# Susceptibility Snapshot

**Phase evaluated:** DECIDE (Cycle 017 — Readability & Comprehensibility)
**Artifact produced:** ADR-083 through ADR-090 (8 new ADRs), supersession headers applied to ADR-064, ADR-067, ADR-070; Domain Model Amendment 22; behavior scenarios, preservation scenarios, acceptance criteria table, and interaction specifications appended to scenarios.md and interaction-specs.md
**Date:** 2026-04-27

---

## Prior Snapshot Context

**Cycle 017 DISCOVER snapshot (2026-04-27):** No narrowing pattern. Gate belief-mapping surfaced a third frame (bolt-on / felt-additional) that the agent had not independently generated. Carried one feed-forward: register correction on the Zero-Prior-Familiarity Reader citation pattern.

**Cycle 017 MODEL snapshot (2026-04-27):** No Grounding Reframe warranted. Primary signal was a mild warrant-elicitation gap — "Like you said" echo at the co-mechanism folding gate question. Two feed-forwards: (A) before drafting the cognitive-economy ADR, name the conditions under which four standalone concepts would have served better than the folded structure; (B) DECIDE's criterion must distinguish methodology-wide default with named exceptions from pure per-project judgment. Both explicitly carried into DECIDE as named drafting obligations.

**Cycle 014 DECIDE snapshot (2026-04-09):** The structural analog for this evaluation. Eight ADRs produced (ADR-063 through ADR-070). Partial Grounding Reframe recommended at one moment (TDD analogy adopted without engaging the strongest competing frame). Five user framings honored; four evaluated as genuinely superior to agent defaults. Provenance check subsections identified as the load-bearing structural improvement over prior phases. Audit loop ran five iterations to clean closure. Editing pattern signal: parallel-language residuals in adjacent documents. No cross-ADR composition without independent testing.

---

## Observed Signals

| Signal | Strength | Trajectory | Notes |
|--------|----------|------------|-------|
| Assertion density | Ambiguous | Stable | The ADRs carry consistent epistemic hedging — "felt rather than mechanically computable," "agent-hypothesized rather than essay-grounded," "useful conceptual frame but not load-bearing structural evidence." Provenance checks on all eight ADRs label user-surfaced, driver-derived, and agent-composed content with consistent granularity. No escalating certainty language detected. One instance where agent-composed content appeared alongside driver-derived content in the same provenance entry without clear separation (ADR-086 second failure mode), flagged by the first-pass audit as P2. |
| Solution-space narrowing | Absent | Stable | No solution-space narrowing identifiable. Eight ADRs collectively produce three non-adoption / deferral outcomes (ADR-086 AI-as-orienter non-adoption, ADR-083 Outcome Test held below invariant level, ADR-087 validation spikes as optional not unconditional) and five positive commitments. The non-adoption and deferral decisions carry explicit future-cycle conditions for revisiting, not permanent closures. The methodology-wide default with named exceptions form (ADR-083 §4) was explicitly chosen over both the rule form and pure-judgment form — this is expansion relative to the pure-judgment baseline the MODEL gate surfaced as a risk. |
| Framing adoption | Ambiguous | Stable, structurally improved vs. Cycle 014 | Cross-ADR framing adoption is the primary signal to evaluate (see specific moments below). ADR-084 cites ADR-083's content-divergence threshold exception as authoritative for Pattern A vs. Pattern B threshold; ADR-086 cites ADR-083's Outcome Test as the test AI-as-orienter fails. Both adoptions are within-cycle and neither was independently tested at the gate level. The provenance check subsections correctly label these as driver-derived (ADR-083 is treated as settled driver input for ADR-084 and ADR-086). The structural improvement over Cycle 014: all eight ADRs carry provenance check subsections that label framing origins explicitly, which is the mechanism Cycle 014 identified as the load-bearing mitigation for the DECIDE phase's susceptibility risk. |
| Confidence markers | Absent | Stable | No escalating certainty language. ADR-086 explicitly flags its second failure mode as "agent-hypothesized rather than essay-grounded" and notes the non-adoption decision holds on the essay-grounded failure mode alone. ADR-087 explicitly names the Beck port as "useful conceptual frame" but "not load-bearing structural evidence." ADR-083 §5 holds the cognitive vs. non-cognitive admissibility question open rather than resolving it. ADR-088 and ADR-089 use calibrated language throughout ("structurally detectable" not "structurally impossible"). |
| Alternative engagement | Ambiguous | Stable relative to MODEL | The rejected-alternatives sections across all eight ADRs are substantive. ADR-083 addresses six alternatives, five explicitly rejected with reasoning and one (Feed-forward A) affirmatively discharged. ADR-086 addresses five alternatives with varying depth. ADR-087 addresses five alternatives with explicit reasoning including two "considered and rejected" dispositions rather than simple rejection. ADR-088 and ADR-089 address four and four alternatives respectively, all with technical specificity. One instance where the alternative engagement depth is asymmetric: ADR-084's directory-level separation rejection is thorough, but the per-artifact-only-judgment-without-catalog alternative is rejected with thin reasoning — one sentence citing the variability-across-corpora commitment without examining the distinction between that commitment and the claimed need for a catalog. This is a mild gap, not a pattern. |
| Embedded conclusions at artifact-production moments | Ambiguous | Declining vs. Cycle 014 | The dispatch brief's three-supersession-in-one-cycle observation (ADR-085 supersedes ADR-070; ADR-088 supersedes ADR-064; ADR-089 supersedes ADR-067) warrants attention. The three supersessions are coordinated and internally consistent. Each supersession's direction was user-surfaced at prior gates (relocation at DISCOVER, advisory demotion at Pause 2 via user diagnosis, role-shift at Pause 2). The coordination across three simultaneous supersessions does introduce dependency: ADR-090 amends a role documented in ADR-088, and ADR-089 amends a classification whose implementing ADR (ADR-064) is being simultaneously amended by ADR-088. The argument audit verified these as internally coherent. The conformance scan identified that Amendment 22 was the only in-DECIDE obligation (not deferred to ARCHITECT), which was discharged. No embedded conclusion found at a production moment that downstream phases would inherit without examination. |

---

## Per-Signal Evaluation

### 1. Cross-ADR composition without independent testing

The dispatch brief specifically asks whether ADR-083's framings were adopted by ADR-084 and ADR-086 within the same cycle without being independently tested.

**ADR-084 citing ADR-083 content-divergence threshold:** ADR-084's per-artifact judgment criterion cites "ADR-083's companion-file pattern applies as a structured exception that does not violate the in-place-first default" and calibrates Pattern A vs. Pattern B against the content-divergence threshold exception condition ADR-083 names. The provenance check for ADR-084 attributes the per-artifact threshold (~50% audience-tagged volume) as "drafting-time synthesis." The argument audit flagged this threshold as agent-composed and explicitly noted in ADR-084 decision text that it was "agent-proposed and not empirically calibrated" (this qualifier was added as a first-pass P3 correction). The cross-ADR adoption is disclosed and calibrated, not silent.

The substantive question for this evaluator: was the content-divergence threshold exception condition in ADR-083 independently gate-examined before ADR-084 treated it as authoritative? The MODEL snapshot's Feed-forward B specified the methodology-wide default with named exceptions form, but the four named exception conditions are identified in ADR-083's provenance check as "agent composition; the individual conditions are driver-derived." The argument audit's framing section (Truth C) explicitly names this: "the exception conditions were entirely agent-composed and not gate-examined." ADR-084's reliance on these agent-composed exception conditions as the definitional basis for its per-artifact threshold is therefore a case where agent-composed content in one ADR became driver-level input for a second ADR within the same cycle, without gate-level examination of the exception conditions as an enumeration. The exception conditions' individual driver support is real; the enumeration structure is agent-composed; and the enumeration is what ADR-084 treats as authoritative.

This is the clearest cross-ADR composition instance of the phase. It falls below the threshold for Grounding Reframe because: (a) the argument audit disclosed the agent-composed status in both ADRs, (b) ADR-084 labels the ~50% threshold as "agent-proposed and not empirically calibrated" in the decision text itself, and (c) ARCHITECT inherits the per-artifact judgment as a felt indicator, not a mechanical rule — the disclosure prevents the threshold from becoming load-bearing invisible infrastructure.

**ADR-086 citing ADR-083's Outcome Test:** ADR-086 §2 applies ADR-083's Outcome Test to the AI-as-orienter question, concluding the intervention "fails the test specifically because its outcome is unverifiable." ADR-083 and ADR-086 were produced in the same DECIDE phase. The Outcome Test's adoption in ADR-083 was gate-examined (user-surfaced at the DISCOVER gate via belief-mapping; carried through MODEL). ADR-086's application of the Outcome Test to AI-as-orienter is compositional: ADR-083 establishes the test; ADR-086 applies it to a different candidate; the test's authority in ADR-086 rests on ADR-083 having already established it within the same eight-ADR batch.

This is consistent with how cross-ADR composition legitimately works — a criterion established in one ADR is applied in another. The question is whether the Outcome Test's application to AI-as-orienter adds genuine analytical content or is a post-hoc rationalization for a non-adoption decision that was already gate-committed. The DISCOVER gate committed "Adoption of AI-as-Orienter is blocked at DECIDE on whether the operational-criterion problem can be solved." The operational-criterion problem is the load-bearing reason for non-adoption (essay-grounded, §4.5). The Outcome Test application is a secondary argument that composes cleanly but was not needed to reach the conclusion. It does not introduce risk.

**Three coordinated supersessions:** ADR-085 supersedes ADR-070, ADR-088 supersedes ADR-064, ADR-089 supersedes ADR-067. ADR-088 and ADR-089 are explicitly dependent: ADR-089 amends ADR-067 to align with ADR-088's advisory demotion. ADR-090 amends the role documented in ADR-088. The dependency chain is: ADR-088 (advisory demotion) → ADR-089 (classification revision) → ADR-090 (role-shift documentation). Each step was user-surfaced (Pause 2 diagnosis for ADR-088 and ADR-090; cycle-status feed-forward signal for ADR-089). The argument audit verified that ADR-088 and ADR-089 produce a coherent v0.8.3 picture together. The chain is directionally correct and explicitly derived from user-surfaced diagnoses. No synthesis-moment framing cascade detected.

**Assessment:** Cross-ADR composition is present but disclosed and calibrated. The most significant instance — ADR-083's exception conditions adopted as driver-level input for ADR-084's threshold — is named in both provenance checks and in the decision text. The Cycle 014 DECIDE snapshot found no cross-ADR composition without independent testing in that cycle's eight ADRs; this cycle shows one disclosed instance at reduced consequence.

### 2. Rejected-alternative engagement depth

The rejected alternatives sections across the eight ADRs vary in depth but are substantively engaged overall. Three points of asymmetry:

**ADR-086 depth:** Five alternatives with varying levels of engagement. "Adopt conditionally with a disclaimer" receives clear reasoning (vigilance-based mitigations are unreliable for self-reinforcing failure modes). "Adopt with structural usage limits" is the most substantively engaged alternative — the ADR notes it was "considered as a stronger alternative" and explains why the navigation/synthesis boundary is not operationally testable. This is deeper than perfunctory dismissal. The "defer without naming non-adoption" alternative is rejected with specific reference to the gate's commitment. The engagement is comparable depth to the chosen position.

**ADR-084 per-artifact-without-catalog alternative:** Rejected with one sentence ("pure per-artifact judgment without a catalog produces inconsistent choices"). The variability-across-corpora commitment is cited as the basis, but that commitment is about admissibility criteria, not about Pattern A vs. Pattern B structural choice — the argument audit's cross-ADR coherence check noted this alternative's rejection argument is the weakest in the eight ADRs. It is not wrong — the distinction is real — but the reasoning is thinner than the other alternatives in this ADR.

**ADR-087 mandate-for-every-claim alternative:** Rejected with clear reasoning applying Invariant 8's anchoring requirement. The "mandate only for contradictions" alternative was "considered" and rejected with an explanation of why the optional-step trigger captures the more relevant case (load-bearing extensions, not only contradictions). This is the right structure for alternatives that require genuine engagement.

**Assessment:** Alternative engagement is generally substantive. The one thin rejection (ADR-084's per-artifact-without-catalog) is a minor gap consistent with the Cycle 014 DECIDE pattern where most alternatives received genuine engagement and one or two were cursorily dismissed. No perfunctory-dismissal pattern across the eight ADRs.

### 3. Provenance check honesty

All eight ADRs carry provenance check subsections. The checks use consistent attribution categories: user-surfaced, driver-derived, agent composition, snapshot-derived, implementation-derived. The labeling appears accurate on inspection against the gate artifacts and prior snapshots.

One specific provenance question raised by the dispatch brief: are agent-composed labels sometimes obscured as driver-derived? The most important test case is ADR-083's four exception conditions, which the provenance check labels as: "drafting-time synthesis. Each condition has driver support — [individual source] — The aggregation as the four exception conditions is agent composition; the individual conditions are driver-derived." This is the correct distinction: the individual conditions are driver-supported; the enumeration structure is agent-composed. The labeling is accurate.

ADR-086's second failure mode (indistinguishability at usage time) is labeled in the provenance check as "agent-composed against the practitioner-vs-agent observability question that the literature does not directly address." The argument audit (P2, Issue 2.2) noted the language "does not directly address" understates the agent-composed character — the hypothesis is not a literature gap but a first-order composition. The correction applied by the first-pass audit added explicit language in ADR-086 §1 noting the second failure mode is "agent-hypothesized rather than essay-grounded." The final ADR carries this distinction in the decision text itself, not only in the provenance check.

ADR-085's session/ inclusion is labeled in the provenance check as "agent composition; ADR-050-derived classification." The Consequences section (Neutral) contains the statement "session/ inclusion in the relocation is an agent-composed extension of the gate commitment." The label is accurate and the agent-composed extension is named in the artifact. This is the provenance check mechanism doing its job.

**Assessment:** Provenance check honesty is high. The classification of agent-composed content is generally accurate. The one instance where the initial labeling understated agent-composition (ADR-086's second failure mode) was corrected by the first-pass audit. No label-obscuring instances detected where agent-composed content was passed off as driver-derived.

### 4. Feed-forward A and B discharge from MODEL

**Feed-forward A (folded vs. standalone, ADR-083 Rejected alternatives):** ADR-083 discharges this in Rejected alternatives: "The condition under which four standalone concepts would have served this ADR better than the folded structure is: if the cognitive-economy ADR's primary citations were to individual co-mechanisms each addressed by separate intervention patterns, with the unified mechanism playing no load-bearing role in the ADR's argument. That condition is not met here." The discharge is substantive: it names the condition with specificity (primary citations to individual co-mechanisms with no unified-mechanism load-bearing role) and demonstrates that the condition is not met by citing the ADR's actual use of Context-Mismatch as the diagnostic frame in §1 and the co-mechanisms by sub-name in intervention-specific applications. The discharge is not ceremonial — it identifies when four standalone concepts would have been better and explains why this case does not meet that condition.

**Feed-forward B (methodology-wide default with named exceptions form, ADR-083 §4):** ADR-083 §4 discharges this explicitly: "The criterion is encoded as a methodology-wide default with named exception conditions, not as a methodology-wide rule and not as pure per-project judgment without a default." The ADR names the distinction (default-with-exceptions vs. pure-judgment) and encodes four named exception conditions. The discharge meets the MODEL snapshot's specification: "only the default-with-exceptions form produces actionable guidance" — the ADR produces that form. The argument audit (framing assessment, Feed-forward B discharge) confirms: "Discharged in ADR-083 §4. The ADR explicitly chooses the methodology-wide default with named exceptions over pure per-project judgment, names the distinction, and encodes exception conditions."

**Assessment:** Both Feed-forward discharges are substantive. Feed-forward A produces a specific, named condition rather than a general assertion. Feed-forward B produces the form the snapshot specified. Neither is ceremonial.

### 5. RESEARCH Grounding Reframe Target 2 discharge

ADR-087 §1 (Grounding Reframe of the Beck port) discharges Target 2 with three specific items: the compressed-feedback-horizon claim is unverified; the reusability assumption is conditional on continuous corpus stewardship; the cycle-as-instance reflection is the strongest available evidence the framing has not been tested. The conclusion — "the Beck port is a useful conceptual frame but not load-bearing structural evidence" — is calibration, not promotion or dismissal.

The three spike test examples in §2 discharge the concrete probe. Two are §4.5-sourced (bolt-on signal, brief purpose-built on-ramp). The first-pass audit (P3, Issue 2.3) flagged the §4.1 spike example as a probe displacement (the probe specified §4.5; the third example is from §4.1). ADR-087 was subsequently corrected to label the §4.1 example explicitly as "beyond the probe's scope; offered as additional context." This makes the discharge boundary accurate.

The cycle-as-instance reflection as a standing caveat (§4) encodes the methodological commitment the snapshot required — "any cycle's findings are research-not-validation until something has been built and tested against the world" — as ADR-069 amendment language, not only as the ADR's local observation. ADR-087 itself notes it is encoded without spike validation and that its own standing caveat applies to it: "This ADR itself is encoded without spike validation." This is the recursive honesty the snapshot's Target 2 required.

**Assessment:** Target 2 discharge is substantive. The Beck port is calibrated, not promoted or ceremonially acknowledged. The cycle-as-instance reflection is encoded as a standing caveat with ADR-069 amendment language. The probe displacement was corrected. The discharge is complete.

### 6. Argument-audit and corrections cycle

The first-pass audit returned 1 P1 + 5 P2 + 5 P3. All P1 and the correctable P2s were addressed. The second-pass audit identified 1 new P2 (ADR-083 documentation-fatigue exception trigger contradiction — the correction introduced a structural trigger but the initial correction framing conflated graduation-as-felt-transition with graduation-as-structural-condition). The new P2 was corrected. The third-pass audit returned CLEAN AUDIT with one residual P3 (ADR-083 "cycle-archive" observability precision claim) that is directionally correct but slightly overclaims the formality of the graduation trace record-keeping mechanism.

The audit-and-correction pattern mirrors the Cycle 014 DECIDE pattern: an initial substantive finding count (11 issues in Cycle 014; 11 issues here); revision that introduces a new issue in one corrected passage; clean closure at the third or later pass. The Cycle 014 pattern ran five iterations; this cycle ran three. The reduction from five to three iterations is consistent with the editing pattern's maturation: two iterations to reach clean closure after an introduced issue is tighter than Cycle 014's extended chain.

The specific new issue introduced by the first correction (documentation-fatigue trigger contradiction) illustrates the same parallel-language residuals pattern Cycle 014 identified: fixing the primary claim while leaving the adjacent characterization in tension. The re-audit mechanism caught this correctly.

**Assessment:** The audit-correction cycle was substantive. The corrections made real changes to the ADRs (structural trigger for documentation-fatigue exception, provenance labeling for ADR-086 second failure mode, supersession header navigational specificity for ADR-067). The three-iteration closure at clean audit represents genuine error-catching and correction, not ceremonial iteration.

### 7. Cycle 014 Finding 1 pattern — preference-accelerated commitment at DECIDE

Cycle 014's MODEL snapshot named preference-accelerated commitment as Finding 1. The Cycle 017 MODEL snapshot named a low-stakes recurrence at the co-mechanism folding response. Does the same pattern appear in DECIDE at higher stakes given the eight ADRs ship together?

The test case most analogous to Cycle 014's DECIDE TDD-analogy moment is ADR-083's exception condition enumeration. The four exception conditions were agent-composed against driver-derived individual conditions; they were not gate-examined as an enumeration; they are the load-bearing structure that makes the methodology-wide default actionable. ADR-084 then treated this enumeration as authoritative for its threshold. The argument audit's framing section (Truth C) explicitly names this: "ADR-083's exception conditions were entirely agent-composed and not gate-examined."

The structural difference from Cycle 014's TDD-analogy moment: in Cycle 014, the analogy was adopted at a synthesis moment that resolved a specific tension (recursive-contradiction concern) in a way the agent had structural interest in resolving. Here, the exception condition enumeration was produced at drafting time and disclosed in the provenance check as agent composition. There was no moment where the user confirmed the exception conditions under time pressure or through a convenient framing — they appear to have passed through DECIDE as the natural output of the ADR's drafting rather than as a user-confirmed commitment. The provenance check labels them as agent-composed; the argument audit surfaced them as not gate-examined; they remain in the final ADR as the methodology's exception enumeration without a gate-level examination of the enumeration as a whole.

This is a lower-stakes version of the same structural pattern: agent-composed content that becomes the ADR's operational structure without independent gate examination. The mitigation is the same as in Cycle 014: the provenance check labels the composition as such, which makes it visible to ARCHITECT and BUILD authors who encounter the enumeration. The provenance check is the structural mechanism that distinguishes labeled agent-composition from silent framing adoption.

Is there any higher-stakes recurrence at DECIDE across the eight ADRs? The three supersession ADRs (ADR-088, ADR-089, ADR-090) all trace directly to user-surfaced diagnoses at Pause 2 and cycle-status feed-forward signals. The non-adoption decision in ADR-086 traces to gate-committed holding positions (DISCOVER gate, MODEL gate) with the operational-criterion problem as the load-bearing reason. The Beck-port reframe in ADR-087 traces to the RESEARCH phase Grounding Reframe with explicit DECIDE deferral. The in-place-first default in ADR-083 traces to the DISCOVER gate belief-mapping response.

No high-stakes preference-accelerated commitment analogous to Cycle 014's TDD analogy is identifiable in the eight ADRs. The closest candidate — exception condition enumeration as agent-composed operational structure — is the labeled low-stakes instance identified above.

**Assessment:** Cycle 014 Finding 1 pattern appears in attenuated form at one point (exception condition enumeration, agent-composed without gate examination), disclosed in the provenance check. No high-stakes recurrence. The trajectory is improving relative to Cycle 014's DECIDE.

---

## Specific Moments of Framing Adoption

### Moment 1: ADR-083 exception condition enumeration adopted as driver-level input for ADR-084

**What happened:** ADR-083 produced four named exception conditions for the methodology-wide default. The conditions are individually driver-derived but the enumeration is agent-composed at drafting time. ADR-084's per-artifact threshold is anchored to one of these conditions (the content-divergence threshold exception) as if it were established driver material. The provenance check for ADR-084 attributes the threshold as "drafting-time synthesis applying the essay's content-divergence threshold framing to a felt indicator. Agent composition; essay-grounded."

**Was a competing frame independently surfaced?** The competing frame would be: the exception conditions, being agent-composed, should be treated as provisional enumeration rather than as established ADR-083 driver input. This frame was not independently surfaced before ADR-084 treated ADR-083's enumeration as authoritative. The argument audit surfaced it retrospectively (Truth C in the framing section).

**Significance classification:** Present and labeled. Downstream risk is bounded: ADR-084 labels the ~50% threshold as "agent-proposed and not empirically calibrated" in the decision text, which prevents the threshold from becoming invisible infrastructure. ARCHITECT inherits the labeled qualification. The significance is lower than Cycle 014's TDD-analogy moment because the composition is disclosed in both ADRs' provenance checks, not silently embedded.

### Moment 2: ADR-086 second failure mode — agent-hypothesized mechanism treated alongside essay-grounded mechanism

**What happened:** ADR-086 §1 names two failure modes for AI-as-orienter: usage drift (essay-grounded, §4.5) and indistinguishability at usage time (agent-hypothesized, not literature-established). The initial draft treated both mechanisms with roughly equal status. The first-pass audit (P2, Issue 2.2) identified that the non-adoption argument rests soundly on the first failure mode alone, and that the second's agent-hypothesized status should be disclosed in the decision text. The correction added explicit labeling: "This second failure mode is agent-hypothesized rather than essay-grounded."

**Was a competing frame independently surfaced?** The first-pass audit surfaced it. The ADR now carries the distinction, so ARCHITECT inherits the corrected framing.

**Significance classification:** Addressed by the argument audit correction cycle. No residual risk.

### Moment 3: Three coordinated supersessions in one cycle

**What happened:** ADR-085 supersedes ADR-070; ADR-088 supersedes ADR-064; ADR-089 supersedes ADR-067. ADR-090 amends the role documented in ADR-088. The four ADRs compose a coordinated methodology-debt amendment batch. The coordination was user-surfaced (Pause 2 diagnosis; cycle-status feed-forward) and correctly derived.

**Was a competing frame independently surfaced?** For each supersession, a "retain the existing ADR" alternative was explicitly considered and rejected in the Rejected alternatives section. The reasoning for rejection in each case traces to gate commitments or implementation evidence (advisory demotion was shipped before the ADR was drafted; relocation was committed at the DISCOVER gate). The competing frames were surfaced in the ADRs' own alternatives sections.

**Significance classification:** The coordination is disclosed and internally coherent. The argument audit verified coherence. No framing-adoption signal — the three supersessions are convergent because they address the same shift (v0.8.3 advisory demotion + infrastructure relocation), and their convergence is the correct structural response.

---

## Cross-Cycle Pattern Detection

### Cycle 017 DISCOVER and MODEL snapshots (upstream)

DISCOVER: No narrowing pattern. Gate belief-mapping produced genuine third frame. One feed-forward (register correction, not framing adoption risk). Clean trajectory.

MODEL: Mild warrant-elicitation gap at co-mechanism folding. "Like you said" echo. Stakes below constitutional level. Two feed-forwards carried forward. No Grounding Reframe. Trajectory improving relative to Cycle 014 MODEL.

DECIDE (this evaluation): The feed-forwards from MODEL were discharged substantively (Feed-forward A named the conditions for standalone-concept preference; Feed-forward B produced the default-with-exceptions form). The warrant-elicitation gap from MODEL does not appear to have cascaded into DECIDE — no moment where DECIDE ADR drafting treated the co-mechanism folding as an unexamined settled premise. ADR-083 and ADR-084 both cite co-mechanisms by sub-name (audience-conflation, density-ordering) rather than requiring the folded Context-Mismatch umbrella concept, which is exactly what the MODEL snapshot's Feed-forward A was testing.

Cross-phase trajectory: the cycle's three pre-DECIDE phases each showed a primary signal (RESEARCH: four framing adoption moments with Grounding Reframe recommended; DISCOVER: solution-space-widening gate, no reframe; MODEL: mild warrant-elicitation gap, no reframe). DECIDE's signal profile is weaker than RESEARCH, comparable to DISCOVER, and marginally stronger than MODEL in the narrowing-pattern dimension. The cycle is improving across phases in the direction expected for the sycophancy gradient (RESEARCH most vulnerable; DECIDE approaching BUILD resistance).

### Cycle 014 DECIDE (structural analog)

Both cycles produced eight ADRs. Both had argument audits that required multiple iterations to reach clean closure. Both show the provenance check mechanism as the primary mitigation for framing-adoption risk. The structural differences:

**Cycle 014:** One high-consequence framing adoption moment (TDD analogy adopted at synthesis moment; resolved a specific tension; partial Grounding Reframe recommended). Five user framings honored, four defensibly superior. Five audit iterations to clean closure.

**Cycle 017:** One low-consequence agent-composition-without-gate-examination moment (exception condition enumeration). No high-stakes synthesis-moment adoption. User framings at DECIDE trace to gate commitments and Pause 2 user diagnoses — these are user-surfaced, not synthesis-moment adoptions. Three audit iterations to clean closure. Feed-forwards from MODEL were discharged substantively.

The trajectory from Cycle 014 DECIDE to Cycle 017 DECIDE is improving. The pattern that warranted a partial Grounding Reframe in Cycle 014 (synthesis-moment framing adoption resolving a consequential tension) is not present in Cycle 017. The residual pattern (agent-composed enumeration as operational structure) is the lower-stakes version identified in both cycles, present here at the exception-condition enumeration and disclosed through the provenance check mechanism.

One consistent pattern across both cycles: the audit-and-correction loop produces a new issue from the first revision (parallel-language residuals in adjacent passages). Cycle 014 ran five iterations; Cycle 017 ran three. The loop is expected behavior; the three-iteration version is tighter than the five-iteration version, consistent with editing pattern maturation.

---

## Interpretation

### Pattern assessment

The signals do not converge on a sycophancy pattern. The dominant signal is the provenance check mechanism functioning as designed — all eight ADRs label agent-composed content, user-surfaced content, and driver-derived content with consistent granularity, which converts the primary DECIDE-phase susceptibility risk (synthesis-moment framing adoption becoming invisible infrastructure) into visible, labeled content.

The one cross-ADR composition instance (exception condition enumeration adopted as driver-level input for ADR-084) is the cycle's primary residual signal. It is below the threshold for concern because: (a) both ADRs disclose the agent-composed status in provenance checks; (b) ADR-084 labels the derived threshold as "agent-proposed and not empirically calibrated" in the decision text itself; (c) ARCHITECT inherits the labeled qualification rather than an invisible inherited premise.

The three-supersession coordination (ADR-085, ADR-088, ADR-089) is the phase's most structurally complex moment. The argument audit verified internal coherence. Each supersession direction was user-surfaced, not agent-synthesized at drafting time. The coordination does not constitute cross-ADR cascade — it constitutes three separately-warranted updates that happen to be coherent because they address the same v0.8.3 implementation shift.

The Feed-forward A and B discharges from MODEL are substantive. The Target 2 discharge from RESEARCH is substantive. The audit-correction cycle produced genuine corrections, not ceremonial iteration. The rejected-alternatives sections are substantively engaged with one thin instance (ADR-084 per-artifact-without-catalog). The confidence markers are appropriately hedged. No solution-space narrowing is identifiable.

### Earned confidence vs. sycophantic reinforcement

The phase shows characteristics of earned confidence:

1. The eight ADRs' core framings (Outcome Test, in-place-first, content-divergence threshold, advisory demotion, process-vs-product separation, Beck-port calibration) are all traceable to gate commitments, user diagnoses at Pause 2, or cycle-status feed-forward signals from prior phases. The traceability is documented in provenance checks.

2. The three non-adoption/deferral decisions (AI-as-orienter, Outcome Test below invariant, validation spikes as optional) are reasoned decisions, not omissions. Each carries explicit future-cycle conditions for revisiting.

3. The feed-forward discharges from MODEL demonstrate that the DECIDE ADR drafting engaged the MODEL snapshot's specific directives rather than treating them as advisory noise. Feed-forward A produced a named condition in a Rejected alternatives section. Feed-forward B produced the specific form the snapshot specified.

4. The argument audit ran three substantive iterations and caught a new issue introduced by the first correction — this is the mechanism working correctly, not ceremonially.

5. The one cross-ADR composition instance is disclosed in both provenance checks and labeled in both decision texts. The disclosure converts a potential invisible infrastructure risk into a visible, calibrated starting point for downstream phases.

The pattern is consistent with what Cycle 014's DECIDE snapshot called "earned confidence grounded in deep prior-phase work, with structural improvements from the provenance check mechanism." Cycle 017's DECIDE shows the same structural improvement with a smaller residual signal than Cycle 014's TDD-analogy moment.

### Phase position and sycophancy gradient

DECIDE is a medium-low vulnerability phase — more resistant than RESEARCH, DISCOVER, and MODEL, approaching BUILD's empirical grounding. The Cycle 014 DECIDE snapshot confirmed that the provenance check mechanism is the primary structural defense at this phase position. Cycle 017 confirms the same: the mechanism is functioning, and the residual signal (exception condition enumeration) is below the threshold for Grounding Reframe.

---

## Recommendation

**No Grounding Reframe warranted.**

### Reasoning

The three conditions for a Grounding Reframe recommendation are: (1) multiple signals converging on a narrowing pattern without evidence of earned confidence; (2) phase position in the sycophancy gradient amplifying risk; (3) the artifact produced encodes decisions that downstream phases will inherit as settled premises without examination.

None of the three conditions is met:

(1) The signals do not converge on a narrowing pattern. The dominant signal is the provenance check mechanism functioning as designed. The one cross-ADR composition instance is disclosed and labeled, not silent. The alternative engagement is substantive across the eight ADRs with one thin instance.

(2) DECIDE is the most resistant pre-BUILD phase for this vulnerability. The phase's empirical grounding (gate commitments, user-surfaced diagnoses, prior-phase feed-forwards discharged) is consistent with the lower-vulnerability gradient position.

(3) The artifact's inherited premises are labeled. The exception condition enumeration is labeled as agent-composed in both ADRs. The ~50% threshold is labeled as "agent-proposed and not empirically calibrated" in the decision text. The Beck port is labeled as "useful conceptual frame but not load-bearing structural evidence" in ADR-087. ARCHITECT inherits these premises with their calibration intact.

The cycle advances to ARCHITECT with a clean audit on eight ADRs, substantively discharged Feed-forwards A and B from MODEL, substantively discharged Target 2 from RESEARCH, and a conformance scan that clearly delineates deferred-sweep obligations from in-phase obligations (Amendment 22 was discharged during DECIDE).

---

## Feed-forward signals to ARCHITECT

**Signal A — Exception condition enumeration is agent-composed.**

ADR-083's four named exception conditions are the load-bearing structure that makes the methodology-wide default actionable. They are disclosed as agent-composed in the provenance check. ARCHITECT and future BUILD phases that encounter the enumeration should treat it as a provisional list — subject to addition, removal, or reordering as the methodology is applied — not as an authoritatively closed taxonomy. The conformance audit path (named in ADR-083 Consequences) is the natural site for surfacing unenumerated deviations when they arise. If ARCHITECT encounters a corpus-restructuring scenario that does not fit any named exception condition, the correct response is either to argue the condition into the methodology or to record the deviation explicitly with rationale.

**Signal B — The ~50% Pattern A/B threshold carries agent-proposed status into ARCHITECT.**

ADR-084's per-artifact judgment criterion carries an explicitly labeled heuristic (~50% audience-tagged volume). When ARCHITECT applies the Pattern A vs. Pattern B choice to system-design.md, the decision should record the judgment basis and not treat the ~50% indicator as a precision rule. The argument for Pattern B (system-design.md exceeds the threshold) is stated in ADR-084 §3 and should be verified at restructuring time rather than inherited as a given.

**Signal C — Conformance debt cluster for ARCHITECT is well-defined.**

The conformance scan identified three debt clusters: path-migration debt (deferred to BUILD), advisory-language docs debt (deferred to ARCHITECT for system-design.md and ORIENTATION.md), and missing skill-text edits (system-design.md restructuring and companion file creation for ADR-084). The ARCHITECT phase inherits a clear scope: system-design.md restructuring per ADR-084 Pattern B (add F-pattern orientation lead, produce system-design.agents.md, relocate agent-context-dominant material), update advisory-language references in system-design.md and ORIENTATION.md per ADR-088 and ADR-089, record ADR-085 supersession in the domain model Amendment Log. The conformance scan explicitly delineated what is ARCHITECT-scope versus BUILD-scope, which is an unusual clarity inheritance.

**Signal D — The audit-introduced correction pattern.**

The first correction to ADR-083's documentation-fatigue exception introduced a new P2 (structural trigger and subjective correlate initially conflated in the corrected passage). ARCHITECT ADR production should budget for at least one re-audit after any revision that touches shared vocabulary across multiple ADRs. The pattern (fix the primary location; leave adjacent characterization in tension) is consistent across Cycle 014 and Cycle 017 DECIDE phases and is most likely to appear in ADRs that share vocabulary with existing ADRs.

**Signal E — Cross-cycle provenance check pattern to maintain.**

All eight DECIDE ADRs carry provenance check subsections. This is the mechanism Cycle 014 identified as the primary structural improvement for the DECIDE phase's susceptibility risk. ARCHITECT ADRs should maintain the same pattern. If ARCHITECT produces ADRs (module decomposition ADRs, restructuring ADRs) that carry Context sections with agent-composed framing, the provenance check subsection should label the framing origins explicitly.

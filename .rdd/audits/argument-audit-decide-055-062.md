# Argument Audit Report — ADRs 055–062 (Cycle 9 Sycophancy Decisions)

**Audited documents:** ADR-055 through ADR-062
**Evidence layer:** Essay 013 (sycophancy and RDD reflexivity), domain-model.md §Invariants, product-discovery.md (Cycle 9 value tensions and assumption inversions)
**Prior ADRs:** ADR-010, ADR-031, ADR-032, ADR-033, ADR-040
**Date:** 2026-04-06

---

## Summary

- **Argument chains mapped:** 14
- **Issues found:** 12 (3 P1, 5 P2, 4 P3)

---

## Argument Chain Map

Each entry traces the inferential path from evidence to decision.

**Chain 1 — ADR-055 (Belief-mapping operationalization)**
Spike: adversarial framing overcorrects 2-6×; belief-mapping achieves near-zero divergence → form of question determines calibration, not presence of question → Inversion Principle must specify form, not leave it to agent judgment → Decision: mandate belief-mapping as default form.

**Chain 2 — ADR-055 (Adversarial deprecation)**
Spike: overcorrection mechanism is compliance activation ("people-pleasing the instruction not to people-please") → adversarial instruction is structurally equivalent to the original lean, just pointed oppositely → deprecate adversarial as default.

**Chain 3 — ADR-056 (Question toolkit)**
Dubois et al.: question form constrains output distribution; Toulmin: warrants and rebuttals are mandatory argumentative nodes; Mitchell et al.: pre-mortem exploits prospective hindsight; Khurana et al.: commitment gating blocks action on uncommitted premises → six distinct epistemic mechanisms exist; none alone is complete → Decision: integrate as a toolkit with AID-driven selection.

**Chain 4 — ADR-057 (AID susceptibility extension)**
Sayin & Khasawneh: deep AI engagement correlates with greater overreliance; AID success state is deep engagement → AID success state = highest-risk state → AID must attend to susceptibility signals, not only engagement depth; Tsui et al.: isolated context activates self-correction capability → evaluation must be isolated → Decision: inline observation + isolated evaluation.

**Chain 5 — ADR-058 (Unconditional floor)**
Context-dependent performative/genuine distinction creates rationalization escape hatch; Automation Bias Inversion means apparently-grounded users are highest-risk → context-dependence cannot apply to whether constraints fire, only to how much → Tier 1 mechanisms are unconditional.

**Chain 6 — ADR-059 (Grounding reframe)**
Three candidate responses to unassessable risk: disclaim-and-proceed (performative), block (overcorrects), reframe toward grounding (preserves autonomy while making cost visible) → Decision: Grounding Reframe pattern.

**Chain 7 — ADR-060 (Research Methods Subagent)**
Essay §6 (sycophancy gradient): RESEARCH is the most vulnerable phase; most current structural constraints fire after research, not before → presupposing framing in research questions propagates bias forward; essay §2 Level 3: cross-cycle pattern detection not addressed by any current mechanism → Decision: pre-execution question review subagent.

**Chain 8 — ADR-061 (Framing audit as argument auditor extension)**
Essay §5: argument audit checks logical consistency (does it follow?); Cheng et al.: sycophancy operates through content selection (what is omitted) → argument audit alone cannot catch sycophantic content selection → complementary framing audit needed; essay §4: architectural isolation activates self-correction mechanism → must be isolated (subagent) → Decision: extend argument auditor rather than new subagent.

**Chain 9 — ADR-062 (Assertion-aware AID observation)**
Dubois et al.: assertions with embedded conclusions shift output distribution toward confirmation; Liu et al.: sycophancy compounds across turns → embedded conclusions at artifact-production moments are highest-risk inputs; initial hook design rejected: lexical matching over-inclusive and under-inclusive → semantic assessment by AID Attend phase is sufficient; accepted limitation: loses Architectural Isolation → Decision: AID inline observation, backstopped by Tier 1 (ADR-057, ADR-061).

**Cross-ADR chains:**
**Chain 10** — ADR-057 + ADR-062 interact: AID noticing signals inline (ADR-062) and recording without inline evaluation (ADR-057) both rely on the same agent susceptible to the sycophantic dynamic. The differentiation between "noticing" (safe inline) and "evaluating" (requires isolation) is the load-bearing distinction. This chain is internally coherent but the distinction is conceptually thin (see Issues).

**Chain 11** — ADR-058's Tier 1/Tier 2 classification must be consistent with ADR-057's description of the Susceptibility Snapshot as "advisory." An unconditional mechanism that is advisory requires reconciliation (see Issues).

**Chain 12** — ADR-062 supersedes the hook design but ADR-033's hook count remains at five. If assertion detection migrates from hook to AID observation, and ADR-033 is not amended, the two documents describe the same concern differently (see Issues).

**Chain 13** — ADR-055's cross-cutting application to PLAY ("gamemaster introduces belief-mapping questions") depends on ADR-010's PLAY application, which is not specified in ADR-010 (ADR-010 predates the PLAY phase). The extension is reasonable but the dependency chain is stated without noting that it extends ADR-010 beyond its original scope.

**Chain 14** — ADR-058 claims AID embedded-conclusion detection (ADR-062) as Tier 2, meaning context-responsive. But ADR-062 is explicitly the Attend phase of AID, which is already part of the mandatory AID cycle (every gate). The classification creates an appearance of optionality that does not exist in practice.

---

## Issues

### P1 — Must Fix

---

**Issue P1-A**
**Location:** ADR-057 §Consequences "advisory status" + ADR-058 §Decision "Tier 1: Unconditional architectural mechanisms"
**Claim:** ADR-057 classifies the Susceptibility Snapshot as "advisory, not blocking" — the user may review it, act on it, or proceed. ADR-058 classifies the Susceptibility Snapshot evaluation as a Tier 1 unconditional mechanism.
**Evidence gap:** "Unconditional" in ADR-058 describes whether the mechanism fires, not what happens when it fires. "Advisory" in ADR-057 describes what the output can do. Read in isolation, both are coherent. But Tier 1's framing ("fire regardless of context, not subject to agent or user relaxation") in proximity to "advisory, not blocking" creates an ambiguity that will cause implementation confusion: does "unconditional" mean the subagent always runs, or that its findings always alter behavior? The distinction is crucial because the escape hatch ADR-058 was designed to close (context-as-rationalization) can re-enter at the output level if a Tier 1 mechanism always fires but can always be dismissed. The Grounding Reframe (ADR-059) partially addresses this for Tier 2 mechanisms, but ADR-058 does not specify how Tier 1 outputs are acted on — or whether the advisory status of the Snapshot creates a softer Tier 1 than the framing implies.
**Recommendation:** ADR-058 should explicitly state that "unconditional" means the mechanism always fires AND that its outputs are acted on via the Grounding Reframe (ADR-059) rather than dismissible without acknowledgment. Alternatively, restructure the Tier 1 definition to distinguish between fire-unconditionally (what ADR-057 says) and respond-unconditionally (what ADR-058 implies but doesn't secure). Without this clarification, the unconditional floor has a gap at the output stage.

---

**Issue P1-B**
**Location:** ADR-055 §Decision, ADR-056 §Decision, ADR-010 §Context, ADR-010 §Consequences
**Claim:** ADR-055 amends ADR-010's cross-cutting application points with belief-mapping forms across all six phases. ADR-056 defines belief-mapping as one of six instruments in the AID toolkit. ADR-010 specifies only four cross-cutting application points (RESEARCH, PRODUCT DISCOVERY, DECIDE, ARCHITECT) — no PLAY or SYNTHESIS.
**Evidence gap:** ADR-055 adds PLAY and SYNTHESIS as application points for the Inversion Principle without amending ADR-010 to document these expansions. ADR-010's cross-cutting list is now incomplete — any practitioner reading ADR-010 gets four application points; any practitioner reading ADR-055 gets six. This is a genuine inconsistency in the decision trail, not merely an incomplete amendment note. ADR-040's AID cycle covers all phases, so ADR-056's toolkit applies everywhere — but the Inversion Principle's cross-cutting scope (ADR-010) does not. The discrepancy means a conformance audit reading only ADR-010 would not check PLAY and SYNTHESIS for belief-mapping compliance.
**Recommendation:** ADR-055's "Amends: ADR-010" header should be backed by explicit language in the amends clause: "The cross-cutting application list in ADR-010 §Decision is expanded from four to six locations (adding PLAY and SYNTHESIS)." ADR-010 itself should carry an amendment note. Otherwise the amendment is declared but not executed.

---

**Issue P1-C**
**Location:** ADR-062 §Neutral consequences, ADR-033 §Decision (hook count)
**Claim:** ADR-062 §Neutral states "ADR-033's hook count remains at five — no new hook is added." ADR-033 §Decision defines five hooks, one of which is the "Skill activator" matching RDD prompts. ADR-062 supersedes the UserPromptSubmit assertion-detection hook design — but this hook was never formally proposed in ADR-033. The domain model Amendment 16 records the "Assertion-Detection Hook" concept which is now being reclassified. However, if the assertion-detection hook was previously understood (informally or in the domain model) to be a sixth hook under ADR-033, the claim that hook count stays at five needs explicit grounding.
**Evidence gap:** The domain model Amendment 16 records "Assertion-Detection Hook" as a concept, with the action "Detect Assertion" classified as a pragmatic action (Invariant 3). The product discovery Amendment 16 notes this was listed as a feed-forward signal candidate. If this hook was on any implementation roadmap as a planned sixth hook under ADR-033, ADR-062 implicitly reduces the count. The ADR states the hook is superseded "during DECIDE" — meaning it was considered a real design candidate, not just an abstract alternative. The claim that hook count "remains at five" is therefore potentially masking a design decision (removing a planned hook) as a neutral observation (no change).
**Recommendation:** ADR-062 should explicitly state: "The assertion-detection hook, previously under consideration as a potential extension of ADR-033, is not added. ADR-033's five hooks remain unchanged. The assertion-detection function is absorbed into AID inline observation." This makes the design decision visible rather than burying it in a neutral consequence.

---

### P2 — Should Fix

---

**Issue P2-A**
**Location:** ADR-055 §Context, ADR-056 §Context; Essay 013 §7 "Limitations"
**Claim:** ADR-055: "The form of the question determines whether the Inversion Principle reduces bias or reverses it." This is stated as a finding grounded in the spike. ADR-056: belief-mapping produces "near-zero preference-driven divergence (spike finding)."
**Evidence gap:** Essay 013 §7 explicitly acknowledges N=1 per cell (except baselines with N=2) and describes the spike as having "high replication variance." The spike tested a compressed 10-minute pipeline, not a multi-hour RDD cycle with genuine user engagement. Both ADRs cite the spike as empirical grounding without reproducing these caveats. Belief-mapping's near-zero divergence is directional evidence at best — it provides reason to try the approach, not confidence that it achieves calibrated balance under deep engagement conditions. ADR-055 in particular uses "demonstrated in the spike" language that treats the N=1 finding as more conclusive than it is. Essay 013 §7 explicitly distinguishes "reason to try it" from "reason to declare the problem solved" — this distinction does not appear in either ADR.
**Recommendation:** ADR-055 and ADR-056 should each include a "Known limitations" note: "The spike evidence is directional (N=1 per cell, compressed pipeline, scripted inputs). The belief-mapping mechanism is adopted as the best current operationalization; validation under genuine multi-hour engagement with real user investment remains outstanding." This does not weaken the decisions — it makes the evidentiary basis honest, consistent with what the essay says about its own findings.

---

**Issue P2-B**
**Location:** ADR-062 §Context, §Decision (accepted limitation), §Negative consequences
**Claim:** ADR-062 accepts that moving detection from a hook into AID inline observation "loses Architectural Isolation" — the agent assessing the assertion is the same agent susceptible to it. The ADR calls this a "named, not hidden" limitation and points to Tier 1 backstops (ADR-057, ADR-061) as structural insurance.
**Evidence gap:** The mitigation is stated but the residual risk is understated. Essay 013 §5 establishes that content selection failures are invisible — an agent susceptible to a sycophantic embedded conclusion is most likely to fail to detect precisely those assertions that align with its own selection bias. The Tier 1 backstops (Susceptibility Snapshot at phase boundaries, Framing Audit per essay) fire retrospectively: after the embedded conclusion has already shaped phase work, not at the moment of production. ADR-062's framing that backstops "catch what crystallized from undetected assertions" is accurate but does not name the asymmetry: by the time the Framing Audit catches a missed embedded conclusion, the artifact containing it has already been produced. The damage is not prevented — it is detected and flagged for remediation. Whether that remediation loop is sufficient depends on how often it is acted on, which is unknown. The ADR should not overstate the backstops' compensatory power.
**Recommendation:** Add to ADR-062 §Negative: "The Tier 1 backstops catch missed embedded conclusions retrospectively — after the artifact is produced, not before. The residual risk is undetected embedded conclusions that shape phase artifacts before the Susceptibility Snapshot or Framing Audit fires. This risk is accepted; users should understand that the inline detection provides coverage probability, not coverage guarantee, at artifact-production moments."

---

**Issue P2-C**
**Location:** ADR-060 §Consequences, "Negative" bullet 3
**Claim:** "The subagent reviews the questions but cannot review the unasked questions — what the user didn't think to investigate. Mitigated: belief-mapping each question surfaces the adjacent question space."
**Evidence gap:** This mitigation is weaker than stated. Belief-mapping each question asks "what would the researcher need to believe for a different question to be more productive?" — which surfaces adjacent questions within the user's existing framing. It does not address questions that require a fundamentally different framing to even formulate. Essay 013 §6 (the sycophancy gradient) identifies the early pipeline as vulnerable precisely because this is where the user's foundational framing is established. If the framing is sycophantically narrowed, belief-mapping within that framing will generate adjacent questions that remain inside the narrow framing. The mitigation addresses first-order question-space narrowing; it does not address the second-order problem of not knowing what framing to question because the framing itself was inherited uncritically. This is accurately noted as an open problem in Essay 013 §10 (the corpus contamination problem), but ADR-060 treats the mitigation as more complete than the essay does.
**Recommendation:** Revise ADR-060 §Negative: "Belief-mapping each question surfaces the question space adjacent to the existing framing — it does not address questions that require a different framing to even formulate. The corpus contamination problem (Essay 013, §10) identifies this as a known gap. The Research Methods Subagent addresses first-order narrowing; second-order framing capture remains an open problem."

---

**Issue P2-D**
**Location:** ADR-058 §Decision, Tier 2 classification of ADR-062
**Claim:** ADR-058 classifies AID assertion-aware observation (ADR-062) as Tier 2 context-responsive, "not Tier 1 unconditional." ADR-062's own description states the assertion-aware observation is part of the AID Attend phase, and the AID Attend phase is mandatory at every gate per ADR-040.
**Evidence gap:** The Tier 2 classification creates an apparent optionality that contradicts the mandatory nature of the AID Attend phase. If AID always runs and always includes assertion observation (per ADR-062's decision), then assertion observation fires unconditionally — not because it is Tier 1, but because AID is mandatory. Classifying it Tier 2 implies it can be relaxed by context; but relaxing it would require relaxing AID itself, which no ADR authorizes. The classification is technically accurate (the Attend phase exercises judgment about what constitutes a concerning assertion — which is context-responsive), but the Tier framing implies the mechanism can be skipped, which is not what ADR-062 says. This inconsistency will confuse implementation: an implementer reading ADR-058 might treat Tier 2 mechanisms as genuinely optional in some contexts.
**Recommendation:** ADR-058 §Decision should clarify the Tier 2 entry for ADR-062: "Assertion-aware observation is part of the mandatory AID Attend phase and fires at every gate. 'Tier 2' means the agent exercises contextual judgment about which assertions warrant open-question reframing — the detection frequency is context-responsive; the detection obligation is not." This preserves the distinction between unconditional mechanisms and context-responsive ones without implying AID components can be skipped.

---

**Issue P2-E**
**Location:** ADR-060 §Context, "genuinely novel capability" claim
**Claim:** "The genuinely novel capability is cross-cycle pattern detection: no current mechanism looks across cycles for methodological patterns."
**Evidence gap:** This is stated as a design fact (uncontested), but the claim depends on what "current mechanism" means. The synthesis essay and the synthesis phase (established ADR-003, ADR-007) do explicitly mine the artifact trail across cycles for patterns — this is their primary function. The synthesis essay's novelty-mining and volta-identification are cross-cycle by design. The distinction is presumably that the Research Methods Subagent would detect *methodological* patterns (how the user formulates questions) rather than *content* patterns (what the research found). But ADR-060 does not draw this distinction — it asserts novelty without qualifying it. The unqualified "no current mechanism" claim is inaccurate given the synthesis phase's explicit cross-cycle function.
**Recommendation:** Qualify the novelty claim: "The genuinely novel capability is cross-cycle *methodological* pattern detection — recurring tendencies in research question design, not just research content. No current mechanism systematically reviews the methodology's own research habits across cycles (the synthesis phase mines content and conceptual novelty, not question-design patterns)."

---

### P3 — Consider

---

**Issue P3-A**
**Location:** ADR-056 §Decision, "Phase-specific mapping" table
**Claim:** The phase-specific mapping assigns question types to phases (e.g., RESEARCH → pre-mortem + open-question reframing; MODEL → warrant elicitation). The ADR notes this is "initial — to be refined through practice."
**Evidence gap:** The mapping asserts phase-form affinities without evidentiary support beyond theoretical reasoning. Pre-mortem is assigned to RESEARCH, but Essay 013 §5 notes that pre-mortem has stronger empirical support than ACH "precisely because it exploits a cognitive mechanism — prospective hindsight." The mechanism of prospective hindsight (Mitchell et al., 1989) was studied in decision-making contexts, not in research question evaluation contexts. The applicability to RESEARCH in RDD is a reasonable inference but is not supported by evidence in the essay. Similarly, commitment gating (from Khurana et al.'s premise governance) is assigned to DISCOVER and BUILD stewardship, but Khurana et al.'s work addresses decision contexts, not research phase gates. The form-phase affinities are plausible inferences from the source frameworks, not derived conclusions.
**Recommendation:** The "(initial — to be refined through practice)" caveat is appropriate but could be strengthened to explicitly flag which assignments are inference-based rather than evidence-based: "Phase-form affinities are hypotheses derived from the mechanisms each form exploits, not from empirical testing in the pipeline context. The pre-mortem-RESEARCH and commitment-gating-DISCOVER assignments in particular are theoretical; practice may reveal different affinities."

---

**Issue P3-B**
**Location:** ADR-061 §Negative, "itself produced by an RLHF model"
**Claim:** "The framing audit is itself produced by an RLHF model subject to Content Selection. Mitigated: Architectural Isolation (the fresh context treats the artifact as external input)."
**Evidence gap:** The mitigation references Architectural Isolation, which Essay 013 §4 describes as exploiting the Self-Correction Blind Spot (Tsui et al.): "the same model, in a fresh context, treats previously generated text as external input rather than its own output — activating correction capabilities that are dormant in self-evaluation mode." However, Essay 013 §5 carefully qualifies this: "whether architectural isolation achieves the same activation is a plausible inference rather than a directly tested equivalence." The ADR's mitigation treats the inference as established. The framing audit subagent is itself subject to sycophantic content selection in what it chooses to surface as alternative framings — a fresh context reduces but does not eliminate this. ADR-061 does not flag this residual limitation.
**Recommendation:** Add a note: "Architectural isolation reduces but does not eliminate the framing auditor's own content selection. The framing audit should be read as a structural prompt for reflection, not a comprehensive identification of all available framings — the three framing audit questions provide structural constraints on what must be addressed, but the selection within those answers remains agent-mediated."

---

**Issue P3-C**
**Location:** ADR-057 §Decision, susceptibility signals list
**Claim:** AID extends to notice five susceptibility signals: assertion density increasing, solution space narrowing without user initiation, framing adoption without modification, confidence markers at artifact-production moments, declining engagement with alternatives.
**Evidence gap:** These signals are specified as observation targets without calibration guidance. Each is a gradient (how much assertion density is concerning? How much framing adoption?) and the appropriate threshold is unspecified. The domain model Amendment 16 and product discovery note the calibration question explicitly: "How should the sycophancy gradient be calibrated across phases? The specific mechanisms and thresholds for each phase are unspecified." ADR-057 inherits this gap. An AID Attend phase that watches for "increasing assertion density" without calibration will produce highly variable susceptibility assessments across different agents and use contexts.
**Recommendation:** Add an open design question: "Susceptibility signal thresholds — what constitutes 'increasing' assertion density, 'declining' engagement with alternatives — are unspecified and context-dependent. Phase-specific baseline calibration is deferred; the Susceptibility Snapshot subagent's outputs across real cycles should inform threshold development."

---

**Issue P3-D**
**Location:** ADR-059 §Decision, last "Concrete grounding action" (explicit acknowledgment)
**Claim:** "Explicitly acknowledge the decision rests on unverified ground (the user makes a conscious choice)" is listed as a valid Grounding Reframe option, described as legitimate "when the cost of grounding exceeds the risk."
**Evidence gap:** This option is structurally identical to the "disclaim and proceed" pattern that ADR-059 explicitly rejects in §Context as Performative Structural Resistance. The difference ADR-059 claims is that "the user is choosing to proceed *without* grounding, not passively dismissing a disclaimer." However, in practice, a user presented with "here's what would change that: [options], or we can proceed with this acknowledged" who responds "acknowledged, proceed" has done exactly what a disclaim-and-proceed pattern enables. The ADR's claim that "the choice is visible and conscious" does not structurally distinguish this from a more sophisticated disclaimer. The design question — whether a conscious acknowledgment of soft ground is meaningfully different from a dismissal of a caveat — is answered by assertion rather than argument.
**Recommendation:** ADR-059 should acknowledge the tension directly: "The explicit-acknowledgment option restores an escape hatch adjacent to disclaim-and-proceed. The structural distinction is the concreteness of what is acknowledged — 'I'm building on [specific unverified assumption]' names the epistemic cost more precisely than a generic disclaimer. Whether this distinction holds under time pressure or repeated use is an open empirical question. Users who reach for this option repeatedly are exhibiting a pattern the Susceptibility Snapshot should detect."

---

## Cross-ADR Consistency Check

**ADR-055 / ADR-056 tension — resolved but worth noting:** ADR-055 specifies belief-mapping as the *primary* Inversion Principle form. ADR-056 specifies belief-mapping as *one of six* AID toolkit instruments. ADR-056 §Neutral explicitly names this as complementary rather than redundant. The relationship is clear: ADR-055 constrains the form for the Inversion Principle application specifically; ADR-056 provides a broader toolkit for all AID gate interactions. No inconsistency, but readers will encounter the belief-mapping form in two different normative registers (mandate vs. toolkit option) and may need the §Neutral clarification surfaced more prominently.

**ADR-057 / ADR-062 mutual backstop structure:** Both ADRs cite the other as providing structural backstop. ADR-057 §Consequences: "the Assertion-Detection Hook (ADR-062) provides mid-phase coverage." ADR-062 §Consequences: "Susceptibility Snapshot (ADR-057) at phase boundaries provides isolated evaluation." This is internally consistent — the two mechanisms are designed as complementary coverage. The reference to ADR-062 by its old concept name ("Assertion-Detection Hook") in ADR-057 should be updated to "Assertion-Aware AID Observation (ADR-062)" to match ADR-062's decision to supersede the hook framing.

**ADR-058 / ADR-060 — Research Methods Subagent Tier 1 classification:** ADR-060 §Neutral confirms the Research Methods Subagent is Tier 1. ADR-058 lists it explicitly in Tier 1. Consistent.

**ADR-031 / ADR-060 — Artifact format:** ADR-060 specifies artifact path `./docs/essays/audits/research-design-review-NNN.md`, using the audit numbering convention. ADR-031 does not specify paths. The convention is consistent with existing audit artifacts in the corpus.

**ADR-032 / ADR-060 — Subagent count:** ADR-032 extracts six subagents. ADR-057 (Susceptibility Snapshot) adds a seventh. ADR-060 (Research Methods Subagent) declares itself "the eighth specialist subagent." ADR-061 §Neutral confirms subagent count stays at eight (extending existing argument auditor rather than adding a ninth). The count is internally consistent across this ADR set.

---

## Domain Model Invariant Check

**Invariant 0** (user speaks with authority without AI assistance): ADR-055–062 add structural mechanisms that protect the quality of the user's understanding — they do not weaken or qualify Invariant 0. The Susceptibility Snapshot and Grounding Reframe extend what "authority" requires by adding limitation transparency (the user knows where the process is weakest). Domain model Amendment 16 records this as a clarification, not an amendment. No conflict.

**Invariant 2** (epistemic acts mandatory at every gate): ADR-056's question toolkit and ADR-062's assertion-aware observation both operate at gates where epistemic acts are required. Neither removes the user's epistemic obligation. No conflict.

**Invariant 3** (pragmatic actions may be automated; epistemic actions may not): All ADR-055–062 mechanisms are classified as pragmatic actions in the domain model (Amendment 16 explicitly classifies all new actions as Invariant 3). The Susceptibility Snapshot evaluation, Framing Audit, Research Methods Subagent review, and Grounding Reframe are all agent-produced with user decision-making reserved. No conflict.

**Invariant 4** (epistemic cost must be productive, not merely brief): The new mechanisms add overhead — Susceptibility Snapshots at phase boundaries, Research Methods Subagent review before research, extended argument auditor for framing analysis. ADR-058 acknowledges this: "Tier 1 mechanisms add overhead in phases where sycophancy risk may be genuinely low." The cost is justified by the sycophancy gradient argument, but no ADR quantifies or estimates this overhead, leaving Invariant 4's "productive vs. waste" test unapplied to the mechanisms themselves. This is a gap worth noting (see P3-C calibration point).

**Invariant 6** (scaffolding must fade): None of the Cycle 9 ADRs address how the new structural mechanisms should fade across cycles as the practitioner develops sycophancy-awareness. A practitioner in their tenth RDD cycle may need less scaffolding from the Susceptibility Snapshot than a first-cycle user. This is consistent with existing open questions about fading but is worth flagging as a missing consideration.

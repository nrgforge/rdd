# Research Design Review — Cycle 019

**Reviewed question set:** `docs/essays/research-logs/research-log.md` §Step 1.1 and §Step 1.2
**Constraint-removal response included:** Yes (agent-generated, per §Step 1.2 caveat)
**Cycle:** 019 — Does RDD Over-Engineer?
**Date:** 2026-05-15
**Inputs reviewed:**
- `docs/essays/research-logs/research-log.md` (Steps 1.1, 1.2, 1.3)
- `.rdd/cycle-status.md` (Cycle 019 feed-forward signals 1–7)
- `docs/domain-model.md` lines 978–992 (Open Questions context, including line 984)
- `docs/essays/reflections/016-initial-handoff-and-the-audience-at-the-margin.md` lines 36–41
- `docs/cycle-archive/cycle-018-outlines-as-research-artifacts-and-cress-audit-status.md` (Cycle 018 full archive)

---

## Summary

- **Questions reviewed:** 1 primary driving question + 3 branch variants (the "what would change your approach" branches) + 1 agent-generated constraint-removal framing
- **Flags raised:** 8 (3 P1, 3 P2, 2 P3)
- **Criteria applied:** 1–4 (ADR-082 full criteria set) plus 2 dispatch-specific evaluation surfaces (artifact-shape risk; reflexivity posture)

---

## Per-Question Review

### Driving Question: "Does RDD's research front-loading produce systems whose elaborated possibility space exceeds what the user actually needs?"

**Belief-mapping:** What would the researcher need to believe for a different question to be more productive?

The current framing assumes: (a) that the relevant output to measure is *systems* (built software); (b) that "elaborated possibility space" is the mechanism that carries elaboration into those systems; (c) that the relevant comparison is against "what the user actually needs" — a baseline that must be determinable. A different question becomes more productive if the researcher believes any of the following instead:

- The over-engineering, if it exists, is primarily in the *methodology's own artifacts* (ADRs, domain models, scenarios, system designs) rather than in the *systems the methodology helps design*. Under this belief, the productive question is: "Does RDD's artifact-production cost exceed the value the artifacts deliver?" — not about systems at all.
- The mechanism is not front-loading but *infrastructure accumulation* — the audit layer, the cascading feed-forward, the per-cycle conformance overhead — and the question becomes: "Does RDD's verification infrastructure produce diminishing returns as the corpus grows?"
- The comparison baseline ("what the user actually needs") is itself what needs examination, not a stable reference point. Under this belief the productive question is: "What is RDD's theory of need, and does the front-loading process systematically overestimate what needs examining?"
- The over-engineering question is mis-scoped to the wrong layer entirely, and the productive question is: "Under what conditions does methodology overhead become net cost rather than net investment?"

The current framing excludes these adjacent questions not through explicit choice but through implicit commitment to a particular mechanism (front-loading), a particular output target (systems), and a stable baseline (user need). None of these exclusions are necessarily wrong — but none are examined.

**Embedded conclusions:** FLAGGED — P1

The primary question contains three distinct presuppositions embedded in its verb chain and comparative structure:

1. **"Produce" presupposes a causal mechanism.** The question asks whether RDD's front-loading "produces" systems with over-elaborated possibility spaces. "Produces" is a causal verb — it presupposes that a measurable causal relationship runs from front-loading to system elaboration. At this stage of inquiry, the causal claim is the central empirical question, not a premise. The question should hold this as open, not assume it in the framing. A reformulation that preserves the underlying concern without presupposing the mechanism: *"Is RDD's research front-loading associated with systems whose possibility-space elaboration exceeds what practitioners need, and if so, what is the mechanism?"*

2. **"Exceeds what the user actually needs" presupposes a determinable needs baseline.** The comparative requires that there is a fact of the matter about what the user "actually" needs, independent of what the methodology surfaces. This is precisely what the front-loading is supposed to help establish — meaning the baseline against which elaboration is measured is partly constituted by the process under examination. If RDD's early-phase chain helps the user discover needs they didn't know they had, then "what the user actually needs" prior to the chain may systematically undercount. The question needs to hold whether the needs baseline is pre-methodology, post-methodology, or co-constituted, rather than treating it as stable and external. A reformulation: *"Does RDD's research front-loading elaborate the possibility space beyond what practitioners find useful in practice, relative to what lighter-weight alternatives would have surfaced?"*

3. **"Research front-loading" as the named mechanism presupposes the diagnosis.** The question names the mechanism before the mechanism has been established. Five candidate competing diagnoses are listed in cycle-status signal 5 (methodology-mismatch, front-loading-amplifies-possibility-space, audit-infrastructure-cost, possibility-space-vs-need-space, process-vs-product-conflation). The driving question's phrasing has already settled on the second of these five — "front-loading-amplifies-possibility-space" — while the research is supposed to hold all five open. A question that holds the mechanism open: *"Where in RDD's process, if anywhere, does elaboration accumulate beyond what practitioners find valuable — and what is the operative mechanism?"*

These three presuppositions are not individually fatal but together they substantially narrow the research space before any investigation occurs. Presupposition 1 (causal claim) and Presupposition 3 (mechanism-pre-selection) are the most consequential because they will propagate directly into the lit-review framing and the corpus reflexive analysis. The researcher will look for evidence that front-loading causes over-elaboration rather than examining whether the mechanism claim is warranted at all.

**Proposed reformulation (non-presupposing):** *"Where does RDD's process, if anywhere, produce elaboration that practitioners find exceeds their needs — and what mechanism best accounts for it?"*

This preserves the underlying concern (something in RDD may be over-producing) while opening the mechanism question and the location question.

**Scope:** Too narrow. The question as written scopes to one mechanism (front-loading), one output type (systems / elaborated possibility space), and one baseline (user need). The scope is narrower than the research plan's own five competing diagnoses, which include audit-infrastructure-cost and process-vs-product-conflation as entirely different loci. The scope should match the five-diagnosis frame, not foreclose it.

---

### Branch A: "If yes, RDD over-engineers — the methodology's structural posture needs amendment"

**Belief-mapping:** What would the researcher need to believe for this branch to be productive?

This branch is well-framed as a conditional — it does not presuppose the affirmative answer but treats it as one of three outcomes. The belief mapping is appropriate: if over-engineering is confirmed, amendments would target the front-loading character of the early-phase chain or the audit-infrastructure cost profile. Both are plausible amendment targets.

**Embedded conclusions:** None in the branch itself. However, the branch inherits the primary question's embedded mechanism-claim: if the answer were "yes, RDD over-engineers," this branch implicitly routes to the front-loading mechanism as the remedy target. A researcher who found that audit-infrastructure cost was the primary driver, not front-loading, would still arrive at "yes, RDD over-engineers" but would need an amendment targeting the verification layer, not the early-phase chain. The branch as written does not accommodate this.

**Scope:** Appropriate for a conditional branch. The limitation is that "candidate amendments would target the front-loading character of the early-phase chain" presupposes which part of the chain is implicated — a P3 issue, not load-bearing.

---

### Branch B: "If no, perceived over-engineering is methodology-mismatch — the methodology's structural posture is right, remediation is graduation discipline"

**Belief-mapping:** This branch correctly maps the methodology-mismatch diagnosis (cycle-status signal 5, first candidate) to a concrete resolution. What it requires believing: that RDD's posture is calibrated correctly for the problems it addresses, and that apparent over-engineering reflects practitioners applying it to contexts it was not designed for.

**Embedded conclusions:** P2 flag. The branch resolves too cleanly to the first of five candidate diagnoses. It names "methodology-mismatch" as the alternative to "yes, over-engineers" — but the other three candidate diagnoses (audit-infrastructure-cost, possibility-space-vs-need-space, process-vs-product-conflation) each represent a "no, but for a different reason" answer that would lead to a different remediation than graduation discipline. If the research finds that the process-vs-product-conflation diagnosis is correct (the methodology's artifact corpus over-elaborates while the systems it produces are correctly scoped), then the answer is neither "yes, amend the front-loading" nor "no, apply graduation discipline" — it's a third option that neither branch covers.

The three branches together do not fully span the five candidate diagnoses. This is not a fatal flaw in the question set, but it means the "what would change your approach" frame is incomplete as a prior-art-engagement mechanism.

**Scope:** Appropriate as one branch, but the branch-set as a whole has a coverage gap (see Question Set Assessment).

---

### Branch C: "If the question is mis-framed — a different diagnostic vocabulary is needed, possibly distinguishing process-tax from product-elaboration"

**Belief-mapping:** This is the strongest branch. It holds open that the question's framing itself may be wrong and names a plausible reframing (process-tax vs. product-elaboration). This maps directly to one of the five candidate diagnoses (process-vs-product-conflation) and names a specific vocabulary correction.

**Embedded conclusions:** None. This branch is well-formed.

**Scope:** Appropriate. The branch correctly identifies that process-tax (methodology artifact cost) and product-elaboration (system design cost) may be in different layers, and that conflating them produces the wrong diagnostic.

---

## Constraint-Removal Response Review

**Response substance:** Engaged — the framing is not performative or null. The agent-generated imagined-without-it framing produces four substantive observations about what the absence of the early-phase chain would mean: (1) replacement mechanisms would exist in dispersed form; (2) the critique inverts under the counterfactual; (3) over-engineering still occurs through accretion; (4) alternatively, absence might shrink built systems. These are genuine observations about the counterfactual's own profile.

**Embedded conclusions in the response:** FLAGGED — P1 (artifact-shape risk, see Section 5).

---

## Question Set Assessment

### Section 1 — Need-vs-Artifact Framing

**Finding 1 — P2: The primary question is framed around an artifact term ("research front-loading") rather than a practitioner need.**

The term "research front-loading" is a structural descriptor of the early-phase chain's position in the methodology's sequence, not a description of what practitioners experience as valuable or costly. A need-framed question would start from the practitioner's experience: "When do RDD practitioners find that the early phases produce more than they use, and what accounts for it?" The artifact-framed question starts from the methodology's structure and asks whether that structure "produces" over-elaboration.

This matters for the lit-review scope. A practitioner-need framing opens onto empirical studies of practitioner experience with specification-heavy methodologies. An artifact framing opens onto structural comparisons of methodology design. Layer A of the research plan (A1–A5) is largely well-scoped, but A3 and A5 are particularly sensitive to this framing issue: A3 asks about "methodology profiles" (artifact language) rather than "when practitioners find methodology overhead worth paying" (need language). A5 asks about "possibility-space literature" (artifact language) rather than "what conditions determine whether upfront exploration improves practitioner outcomes."

**Proposed reframe:** The research can proceed with the artifact-framed question as a working diagnostic, but the lit-review scope should explicitly seek studies framed around practitioner outcomes, not just methodology structure comparisons. The distinction is: does the lit-review surface evidence about *what practitioners find useful* or evidence about *how methodology phases compare structurally*? The former is need-grounded; the latter is artifact-grounded.

**Finding 2 — P3: "What the user actually needs" is an undefined baseline.**

The question's comparative ("exceeds what the user actually needs") implies a determinable, pre-existing needs baseline. This is not stated as an assumption; it functions invisibly. The research plan does not include a step for establishing what this baseline is or how it would be measured. Without a defined baseline, "exceeds what the user actually needs" is unfalsifiable as written — any finding can be interpreted either as the methodology surfacing genuine latent needs or as the methodology elaborating beyond what the user would have settled for. The research plan should include, early in Layer C (corpus reflexive analysis), a step that explicitly addresses what evidence would count as "the user actually needed less than RDD produced."

---

### Section 2 — Embedded Conclusions

**Finding 3 — P1: The primary driving question presupposes the mechanism (front-loading as the causal driver) before the mechanism is established.**

As detailed in the per-question review above, the question's verb chain ("produce") and its mechanism-naming ("research front-loading") together commit to one of five candidate diagnoses before any investigation. This is the most consequential embedded conclusion in the question set because it will propagate into research loop framing. A lit-reviewer dispatched with "does front-loading produce elaborated possibility spaces?" will structure their search around front-loading as the mechanism. A lit-reviewer dispatched with "where in methodology-intensive processes does elaboration accumulate, and what accounts for it?" will hold the mechanism open.

The cycle-status signal 5 (five candidate competing diagnoses) and the Step 1.1 branch C ("the question may be mis-framed — process-tax vs. product-elaboration") both signal that the mechanism question is open. The driving question's phrasing does not honor that openness.

**Recommended action before research loops:** Revise the driving question to hold the mechanism open. The question filed in the domain-model Open Question at line 984 is identical to the driving question — meaning the mechanism-presupposing framing propagates into the corpus's stored framing as well. This is worth addressing in the driving question without necessarily revising the domain-model entry immediately.

**Finding 4 — P2: Branch B's resolution to "methodology-mismatch" forecloses three of the five candidate diagnoses as "no" answers.**

Branch B treats methodology-mismatch as the canonical "no" answer (no, RDD does not over-engineer; the issue is mismatch). But three other candidate diagnoses in cycle-status signal 5 (audit-infrastructure-cost, possibility-space-vs-need-space, process-vs-product-conflation) are structurally different "no" answers that lead to different remediations:

- Audit-infrastructure-cost: the methodology's structural posture is sound, but the verification overhead is disproportionate. Remediation is audit scope calibration, not graduation discipline.
- Process-vs-product-conflation: the methodology's artifact-production may over-elaborate while the systems it produces are correctly scoped. Remediation is artifact-scope calibration, not graduation discipline.
- Possibility-space-vs-need-space: the methodology opens a wide space and relies on practitioners to navigate to what they need; the failure is navigation, not elaboration. Remediation is scope-setting guidance, not graduation discipline.

The three-branch structure ("yes / no / mis-framed") should either name the full five-diagnosis space or acknowledge that "no" is being used as a label for a family of diagnoses with different remediation paths.

---

### Section 3 — Prior-Art Treatment

**Finding 5 — P2: The prior-art treatment is named but not structurally integrated into the driving question.**

The cycle-status signal 3 names six prior partial answers (Reflection 005, Invariant 4, ADR-014, ADR-083, ADR-091, graduation lifecycle). Step 1.2's third research-plan implication states the cycle should "test whether RDD's existing partial answers sit at the right layer." This is a good intention, but it is scoped to Layer C of the research plan — the third research loop — rather than being built into the driving question's framing.

The risk: if the driving question is presupposition-laden (as flagged in Findings 3 and 1), then arriving at Layer C with prior-art engagement requirements may mean the prior art is being tested against a question that has already narrowed the mechanism. The prior partial answers would then be assessed for whether they address "front-loading as cause of elaboration" rather than for whether they address the over-engineering concern through some other mechanism.

Specifically: ADR-083 (Cognitive Economy Criterion) and ADR-091 (Dual-Mode BUILD) address overhead at specific layers (human-facing artifact admissibility and the BUILD layer respectively). They are not addressed to the front-loading mechanism. If the driving question presupposes front-loading as the mechanism, these prior partial answers will appear to "miss" the question — not because they don't address over-engineering, but because the question framing has narrowed to a specific mechanism they weren't designed to address.

The constraint-removal response's third implication partially satisfies the prior-art criterion (it names the six prior answers and proposes testing them). This is substantive rather than surface engagement. The criterion is marginally satisfied, but the integration is downstream (Layer C) rather than formative (built into the question).

**Finding 6 — P3: Cycle 018's specific cost profile (signal 4 in cycle-status) is named as evidence but not as prior art.**

Cycle-status signal 4 flags that Cycle 018's auto-mode BUILD observations produced two design decisions that exceeded what was specified upstream (Boundary 3 escalation rule; Boundary 2 routing crystallization). The signal explicitly names this as evidence that "even in the lightest-mode phase, the methodology can produce decisions that exceed what was specified upstream" and asks whether this is evidence for or against the over-engineering critique. This is live prior art — an in-corpus instance of potential over-elaboration — and it is not integrated into the driving question. The Layer C research plan includes Cycle 018's cost profile as C4, which is appropriate. The prior-art treatment is handled; no action required beyond acknowledging it is downstream.

---

### Section 4 — Incongruity Surfacing

**Finding 7 — P2: The four-layer research plan proposes substantial investigation for a question where six prior partial answers already exist in the corpus.**

The research plan (Layers A–D, four loops) proposes a full lit-review across five topic areas (A1–A5), two web-search threads (B1–B2), four corpus reflexive analysis threads (C1–C4), and a deferred spike (D). This is the methodology's standard research architecture — the same general shape as Cycles 017 and 018.

Sitting adjacent to this substantial investigation is the observation that the methodology has already produced six explicitly named partial answers to the over-engineering question (cycle-status signal 3), plus the process-vs-product-conflation vocabulary in Branch C, plus the corpus's own domain-model entry at line 982 noting that "the Beck framing as methodology self-description... is itself an empirical claim about the payoff structure of deep research artifacts, and the methodology has not tested the claim."

The incongruity: a full four-loop investigation is being proposed for a question that might be answerable, or substantially narrowable, by examining what the six prior partial answers already cover and where they leave explicit gaps. The prior partial answers are not incidental. Invariant 4 ("epistemic cost must be productive, not merely brief"), ADR-014 ("worth the calories"), and ADR-083 (cognitive economy criterion) together constitute a partial answer to the over-engineering question at the process-tax layer. If Layer C examines these and finds they cover the critique's actual scope, the lit-review (Layer A) may be confirmatory rather than exploratory.

This is not an argument to skip the lit-review. The user has committed to a dedicated cycle and the commitment is appropriate. But the incongruity deserves examination: the question set should include an early Layer C pass (not deferred to Loop 3) that determines how much of the over-engineering question the prior answers already cover, so that the lit-review scope (Loop 1) can be calibrated against what is genuinely unknown rather than what is partially answered.

The current plan sequences Layer A (lit-review, Loop 1) before Layer C (corpus reflexive analysis, Loop 3). This means the lit-review is run without knowing whether the prior answers already cover the question, which risks producing a research output that rediscovers in the literature what RDD has already partially answered internally. Reversing or interleaving Loops 1 and 3 — or running a brief Layer C pre-pass before commissioning the lit-review — would surface the incongruity productively.

**Recommended action:** Before dispatching the lit-reviewer, run a focused Layer C pre-pass (C3 only: existing partial answers' fit-to-question) to identify where the prior art leaves explicit gaps. Scope the lit-review to those gaps rather than the full A1–A5 topology. This would be consistent with cycle-status signal 3's explicit instruction to "reference these [prior answers] directly" rather than "rediscover them."

---

### Section 5 — Artifact-Shape Risk in the Constraint-Removal Response

**Finding 8 — P1: The agent-generated constraint-removal framing is artifact-shaped in two specific ways.**

The caveat in Step 1.2 is correctly filed — the agent acknowledges the artifact-shape risk. But the review finds the caveat's scope is understated. The framing is artifact-shaped in two distinct and compounding ways:

**Artifact-shape (a) — the framing defends the artifact's value rather than bracketing it.**

The four observations in the agent-generated imagined-without-it framing all show that the absence of the early-phase chain would produce worse outcomes or equivalent outcomes through different mechanisms:
- Without it, activities are dispersed into less-structured surfaces (less good).
- Without it, the critique inverts — the question becomes whether possibility space is examined at all (the chain's absence is worse).
- Without it, over-engineering still occurs through accretion (equivalent, so no advantage to removing).
- Without it, built systems might shrink (the only neutral observation — but "at the cost of un-examined assumptions," which is worse).

The imagined-without-it framing, by producing four observations that each argue for the chain's value (or equivalence), has not bracketed the artifact — it has defended it. A genuine bracketing exercise would surface: what replacement mechanisms might be structurally better than the chain at what the chain does? The framing names dispersal as the counterfactual (and treats it as worse) without examining whether there are *structured alternatives* to the chain that achieve similar epistemic goals at lower overhead. This is the first-mover-advantage problem ADR-082 is designed to address — the framing has captured a defense posture and presented it as a bracketing exercise.

**Artifact-shape (b) — the framing stays anchored on the early-phase chain when other RDD artifacts are plausibly more consequential for the over-engineering critique.**

The user selected the early-phase chain as the artifact to bracket. The agent-generated framing accepts this selection and runs with it. But the five candidate competing diagnoses include "audit-infrastructure-cost" — meaning the specialist subagent dispatch pattern (citation audit, argument audit, framing audit, susceptibility snapshot, conformance scan, research-methods review, iterative rounds thereof) may be the more consequential artifact to bracket for the over-engineering question. Cycle 018 dispatched approximately 14 specialist subagents for one cycle. The cost profile of that verification layer is not zero and may exceed the early-phase chain's cost profile for some cycle types.

By accepting the user's artifact selection without examination, the agent's framing brackets the early-phase chain (which the user's driving question already suspects) rather than asking which artifact is most consequential for the over-engineering critique. This is an artifact-shaped selection — it follows the user's existing suspicion rather than finding the most consequential bracketing target.

**ADR-082 Step 1.4 recommendation:** The user should treat the agent-generated framing as a starting point for defense-surfacing rather than as a genuine constraint-removal exercise. Two specific questions for Step 1.4 revision:

1. What *structured alternatives* to the early-phase chain would achieve similar epistemic goals (surfacing assumptions before code crystallizes them, establishing domain vocabulary, examining stakeholder needs) at lower process cost? The framing should name candidate alternatives, not just the dispersal counterfactual.
2. Is the early-phase chain the most consequential artifact to bracket for the over-engineering question, or should the audit infrastructure be bracketed instead (or in addition)?

---

### Section 6 — Reflexivity Posture

**Finding 9 — Informational (no severity assigned, but consequential).**

The reflexivity note in Step 1.1 names both self-justification susceptibility and self-flagellation susceptibility with apparent symmetry. The cycle-status signal 2 names them symmetrically as well. But the question set's actual posture is not symmetric — it leans toward the critique (toward self-flagellation territory) in several ways:

1. The driving question is phrased presuppositionally in the direction of the critique: "produces systems whose elaborated possibility space exceeds what the user actually needs" frames over-engineering as a plausible finding to establish, not as a hypothesis to test symmetrically.

2. The three branches are labeled "yes, RDD over-engineers / no, methodology-mismatch / mis-framed." The "yes" branch names a specific amendment target. The "no" branch routes to graduation discipline (a relatively low-stakes response). The asymmetry is that the "yes" branch produces a concrete methodology change while the "no" branch produces "keep doing what you're doing." This asymmetry subtly weights the question toward the critique.

3. The constraint-removal response, despite being artifact-shaped in its defense of the chain (see Section 5), was *selected* to bracket the most conspicuous artifact in the driving question's framing (the early-phase chain). This is the artifact the critique most directly implicates — meaning the constraint-removal exercise itself is aligned with the critique's framing, not neutral.

4. The Tier 1 architectural-isolation mechanisms (citation audit, argument audit, framing audit, susceptibility snapshot, research-methods review) are listed as the principal defenses against self-justification susceptibility. They are also listed as defenses against self-flagellation susceptibility. But these mechanisms are audit mechanisms — they catch errors in reasoning and framing. They do not independently ensure that the "no, the critique is not warranted" hypothesis receives the same substantive investigative depth as the "yes, the critique is warranted" hypothesis. The research plan's Layer A covers both directions in principle (A3 examines methodology-mismatch literature, A1 examines over-engineering as a documented phenomenon), but the driving question's framing will influence what the lit-reviewer treats as confirmatory vs. exploratory evidence.

The issue is not that the question set is self-flagellating — it is not. The issue is that "naming both susceptibilities with equal language" does not produce evenhanded inquiry if the question's framing, the artifact selection, and the branch asymmetry all carry the same directional lean. The naming performs symmetry; the structure leans.

**Recommendation for research loop design:** The lit-reviewer dispatch brief should explicitly frame both hypotheses with equal investigative weight: *"Test the hypothesis that RDD's front-loading produces over-elaboration AND the hypothesis that perceived over-engineering in methodology-intensive development reflects methodology-mismatch or practitioner expectation mismatch, with neither treated as the null hypothesis."* This is not the same as the current framing, which treats the over-engineering hypothesis as the primary question and the methodology-mismatch hypothesis as one of three outcome branches.

---

## Summary

**Findings by severity:**
- P1: 3 (Finding 3 — mechanism presupposition in the driving question; Finding 8 — artifact-shape in constraint-removal framing; Finding that the causal claim "produces" is embedded rather than held open)
- P2: 4 (Finding 1 — artifact-framed vs. need-framed question; Finding 4 — Branch B foreclosing three candidate diagnoses; Finding 5 — prior-art treatment downstream rather than formative; Finding 7 — research-plan incongruity / sequencing)
- P3: 1 (Finding 2 — undefined needs baseline)
- Informational: 1 (Finding 9 — reflexivity posture asymmetry)

**Most consequential issues for Step 1.4 user decision:**

The two most consequential issues are Finding 3 and Finding 8, which compound each other. Finding 3 (P1): the driving question presupposes "research front-loading" as the causal mechanism before the mechanism is established — this will propagate into lit-review framing and corpus analysis unless the question is revised. Finding 8 (P1): the agent-generated constraint-removal framing defends the artifact (the early-phase chain) rather than genuinely bracketing it, and brackets the wrong artifact if the audit-infrastructure cost is the more consequential over-engineering driver. Together, they mean the research may launch with the mechanism pre-selected and the bracketing exercise capturing a defense posture. If both issues propagate unremediated into the research loops, the research is at elevated risk of confirming the critique's mechanism rather than examining the five candidate diagnoses with equal depth.

**Recommendation:** Revise the driving question before dispatching research loops. The minimal revision is to remove the mechanism-presupposition from the primary question (replace "research front-loading produces" with language that holds mechanism open) and to revisit the constraint-removal exercise with two explicit prompts: (1) name candidate structured alternatives to the early-phase chain, not just the dispersal counterfactual; (2) examine whether the audit infrastructure is a more consequential bracketing target than the early-phase chain for this question. Revise the Loop sequencing to run Layer C's prior-art examination (C3) before Layer A's lit-review dispatch, so the lit-review scope can be calibrated against what is genuinely unknown. The three-branch "what would change your approach" structure is sound in intent but should be expanded or annotated to acknowledge that "no" maps to at least four distinct diagnoses with different remediation paths, not one.

If the user accepts the question-set framing as-is with rationale (the driving question's framing is inherited verbatim from Reflection 016 and may be the appropriate entry point for the practitioner who generated it), that is a defensible choice — but it should be an explicit acceptance, not a default. The research-methods review's role is to make the choice visible, not to require a specific outcome.

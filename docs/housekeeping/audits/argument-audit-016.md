# Argument Audit Report

**Audited document:** docs/essays/015-methodology-seams.md
**Source material:** docs/essays/research-logs/research-log.md, lit-review-acceptance-criteria-traceability.md, lit-review-adr-supersession.md, lit-review-analogical-transfer.md, lit-review-workflow-composition.md, lit-review-anchoring-debiasing.md
**Date:** 2026-04-15

---

## Section 1: Argument Audit

### Summary

- **Argument chains mapped:** 8 (one per section/issue plus cross-cutting X.1)
- **Issues found:** 8 (0 P1, 4 P2, 4 P3)

---

### P1 — Must Fix

No P1 issues found. The essay's major conclusions follow from the evidence in the lit-reviews. Citations are correctly attributed to the sources that contain those claims. No internal contradictions were found between sections.

---

### P2 — Should Fix

**P2-A**
- **Location:** Section 4, "Mitigations" paragraph — pre-mortem claim
- **Claim:** "Research by Mitchell, Russo and Pennington (cited in Klein 2007) found a 30% improvement in failure-reason identification over standard assessment."
- **Evidence gap:** The essay attributes the 30% figure to Mitchell, Russo and Pennington as cited within Klein (2007). This is a secondary citation — the essay cites the underlying study as found through Klein rather than verifying it independently. The lit-review (lit-review-analogical-transfer.md, §13.2) is explicit that this is a secondary citation: "Mitchell, Russo and Pennington (cited in Klein 2007)." The 30% figure's provenance is therefore one level removed from verification. In the essay, the claim is presented as if the improvement measure is settled, when its evidentiary basis is a secondary citation of a primary study the review did not access directly. Additionally, the lit-review notes the study concerns failure-reason *identification*, not failure prevention — the essay's framing ("found a 30% improvement") is accurate but omits the scope limitation.
- **Recommendation:** Qualify the figure: "Research by Mitchell, Russo and Pennington (cited in Klein 2007) found a 30% improvement in failure-reason *identification* in prospective hindsight conditions — whether this translates to fewer undetected failures at the pattern-application stage is not empirically established in software-engineering contexts."

**P2-B**
- **Location:** Section 6, "Structural intervention outperforms cognitive debiasing" — pre-registration claim
- **Claim:** "Nosek et al. (2018) found that 44% of pre-registered hypotheses yield significant results versus 96% of traditional publications — evidence that specifying questions before consulting evidence structurally constrains bias at the question-formation stage."
- **Evidence gap:** The inference is directionally sound, but the causal attribution overstates what the comparison demonstrates. The 44% vs. 96% comparison reflects the registered reports format versus traditional publication, a confound that includes publication bias (journals only publishing significant traditional results), file-drawer effects, HARKing (hypothesizing after results are known), and p-hacking — not only question-formation bias. The lit-review (lit-review-anchoring-debiasing.md, §16.3) is more precise: it describes "question framing bias" as one of the Cochrane-distinguished forms alongside publication bias and outcome reporting bias. The essay collapses all these into the single claim "evidence that specifying questions before consulting evidence structurally constrains bias at the question-formation stage," making it appear the 44% finding isolates question-formation bias specifically. It does not — the registered reports format addresses all these confounds simultaneously.
- **Recommendation:** Soften the attribution: "The Registered Reports comparison (44% vs. 96% significant results) is consistent with question-formation bias being constrained by pre-specification, though the comparison reflects the compound effect of several methodological protections, not question-formation bias in isolation."

**P2-C**
- **Location:** Section 7, cross-cutting paragraph — mechanism distinction claim
- **Claim:** "These are empirically distinguishable: the BUILD case shows evidence of attentional suppression (features present in the artifact trail but not attended to); the RESEARCH case shows evidence of question-scope limitation (questions that were not formulated)."
- **Evidence gap:** "Empirically distinguishable" is stronger than the lit-reviews support. The lit-review-analogical-transfer.md (§13.1, X.1 paragraph) and lit-review-anchoring-debiasing.md (§X.1 comparison) both report the distinction is directionally supported but not empirically established in development or research contexts specifically. The analogical-transfer lit-review explicitly cautions: "A study that could distinguish them would need to measure whether practitioners with additional time and prompting still miss assumption violations." The distinction the essay presents as empirically established is a research-based inference applied to RDD's specific phenomenology — not a finding from a study that tested it directly.
- **Recommendation:** Hedge the claim: "These patterns are consistent with empirically distinguishable mechanisms — the BUILD case matches the attentional-suppression signature from Bilalic et al.'s eye-tracking evidence; the RESEARCH case matches the question-scope-limitation signature from the pre-registration literature — but neither has been tested in software-development or research-phase contexts directly."

**P2-D**
- **Location:** Section 5, "Scope-adaptive enforcement" paragraph
- **Claim:** "'Scope-adaptive enforcement' is not a named design pattern. The patterns exist as compositions of general tools... The synthesis: smaller-scoped cycles need enforcement that gracefully recognizes its own inapplicability, not a fundamentally different enforcement architecture."
- **Evidence gap:** The conclusion that scope-adaptive enforcement "is not a fundamentally different enforcement architecture" is presented as a finding from literature, but it is actually the essay's design inference from the literature's silence. The lit-review (lit-review-workflow-composition.md, §Q14.4 Limitations) explicitly notes: "'scope-adaptive enforcement,' 'conditional preconditions' for workflow enforcement, and 'policy applicability scoping' are not established terms of art in any of the surveyed fields." Absence of a named pattern does not establish that the compositional approach is equivalent in power or tradeoffs to an alternative architecture. The essay presents a design recommendation (use composition of existing primitives) as a finding, where it is actually a judgment that follows from the evidence but should be marked as such.
- **Recommendation:** Distinguish clearly: "The literature does not support 'scope-adaptive enforcement' as a named design pattern. Based on the available precedents — Liquibase preconditions, feature flag hierarchy, OPA conditional policy — the functionality is achievable through composition. Whether this composition approach is architecturally equivalent to a dedicated enforcement tier is a design judgment the literature does not resolve."

---

### P3 — Consider

**P3-A**
- **Location:** Section 4, "The cognitive-SE bridge" paragraph
- **Claim:** "The bridge between the Einstellung account and the SE-observed failure modes is underdeveloped in either literature."
- **Evidence gap:** This is accurate. But the essay presents the observation as a summary without noting that it represents the essay's own novel contribution — the synthesis of the Einstellung account with SE antipatterns is work the essay performs, not work found in the literature. The reader may take "underdeveloped in either literature" as merely a gap-finding rather than recognizing it as the essay's own value-add. Naming it explicitly as the essay's synthesis would be more precise.
- **Recommendation:** Consider: "The bridge is underdeveloped in either literature — its construction here is this essay's primary novel contribution in this track."

**P3-B**
- **Location:** Section 2, "When it matters" — conditions list
- **Claim:** "The literature converges on five conditions that push toward real failure."
- **Evidence gap:** The five conditions are well-sourced individually. However, the list presents them as a unified convergence when they come from distinct sources (DO-178C, Sommerville emergent properties, Pact contract testing, mock-divergence practitioner discourse, and the Issue #11 pattern itself). "Converges" implies the sources were all addressing the same question; they were not — they each address adjacent slices and the convergence is the essay's synthesis. This is a minor precision issue but could mislead a reader about the coherence of the literature.
- **Recommendation:** Consider: "Across these distinct literatures — safety certification, systems engineering, contract testing, and practitioner discourse — five conditions emerge..." (marking synthesis rather than pre-existing convergence).

**P3-C**
- **Location:** Section 3, "Costs" paragraph — abandonment rate claim
- **Claim:** "approximately 50% of open-source repositories with ADRs contain fewer than five records, consistent with high abandonment."
- **Evidence gap:** The lit-review (lit-review-adr-supersession.md, §12.4) attributes this to "a 2023 study of open-source repositories" without specifying the study. The essay repeats the statistic but also does not cite the underlying study by name. This is a floating empirical claim with no traceable source. The citation reads as data but has no citable backing more specific than "a 2023 study."
- **Recommendation:** Either locate and cite the specific study, or qualify: "practitioner reports suggest approximately 50% of open-source repositories with ADRs contain fewer than five records (a 2023 repository mining study, precise citation not retained)."

**P3-D**
- **Location:** Section 9, "The Batch Cycle as Data for #14" — depth calibration observation
- **Claim:** "The depth calibration worked. Reconnaissance tracks (#11, #12) returned useful findings with lighter investment. Investigative tracks (#14, #16) warranted and received deeper treatment."
- **Evidence gap:** This is stated as an empirical observation from the batch cycle, but the criterion for "worked" is not defined. The essay doesn't say what "not working" would have looked like. The observation is essentially: "we got findings at each depth level," which is trivially true of any research. The more interesting claim — that the depth calibration produced *better-calibrated* findings than equal-depth treatment would have — is not established, only asserted. This is a reflexive claim about methodology that would benefit from a stated criterion.
- **Recommendation:** Consider specifying: "The depth calibration appears to have worked — the reconnaissance tracks produced actionable findings without the investigative apparatus — though what 'not working' would have looked like (missed findings, over-investment, misleading light-touch conclusions) is not assessed here."

---

## Section 2: Framing Audit

The framing audit maps the negative space of content selection — what the evidence made available that the essay did not feature, and what the dominant framing conceals.

---

### Question 1: What alternative framings did the evidence support?

**Alternative framing A: Tooling ecosystem failure, not methodology gap**

The lit-review-adr-supersession.md surfaces a consistent finding that tooling does not support the workflows practitioners need: adr-tools provides bidirectional supersession links but no chain-resolution, no partial supersession, no automated downstream document updates. The academic AKM literature (Avgeriou et al. 2023) confirms tool adoption gaps persist. The essay frames Issue #12 as a methodology design gap ("the triggering mechanism for synchronizing current-state documents on supersession is the genuine gap"). An alternative framing — equally supported by the evidence — is that this is a tooling ecosystem failure: the methodology as designed in Nygard (2011) implicitly relied on tooling that was never built. Under this framing, the RDD implication would be different: not "design a new lifecycle" but "build the triggering mechanism that practitioners have needed since 2011."

What a reader would need to believe for this to be right: that the conceptual architecture (ADRs as historical record, current-state documents as mutable) is already correctly specified in practice and the gap is purely operational, not conceptual.

**Alternative framing B: Cognitive limitations as the central problem across all tracks**

The essay's dominant framing is structural: the gaps are at methodology seams where the artifact shape on each side is specified but the relationship between them is not. An alternative framing — also well-supported by the research — is that the central problem across all five tracks is cognitive: practitioners reliably fail to notice things their methodology does not force them to notice, regardless of whether those things are in their artifact trail or not. Under this framing, the primary recommendation would not be artifact-boundary design or structural-enforcement design, but cognitive-mechanism design — which currently appears as the third of three tiers in Section 10, rather than as the organizing frame for all five tracks.

What a reader would need to believe for this to be right: that artifact-boundary gaps (#11, #12) and enforcement gaps (#14) are downstream symptoms of the same cognitive failure that Issues #13 and #16 identify directly — and that fixing the structural gaps without fixing the cognitive layer will produce new seams where the cognitive failures will manifest again.

**Alternative framing C: Multi-cycle composition as the infrastructure prerequisite**

Issue #14 finds that the methodology's single-cycle model is the architectural constraint producing all the hook-loop friction. An alternative framing would foreground this: before Issues #11, #12, #13, and #16 can be addressed with reliable enforcement, the multi-cycle infrastructure must be built, because that infrastructure determines where enforcement triggers can even fire. Under this framing, the batch cycle demonstrates that the research phase can handle the load, but the implementation phase cannot yet honor multi-depth enforcement reliably. The essay treats Issue #14 as one track among equals; it could be framed as the load-bearing infrastructure change that all other recommendations depend on.

What a reader would need to believe for this to be right: that enforcement-timing questions (#14) are prerequisites rather than peers to the other issues, and that Issue #14 must ship before the Section 10 recommendations for acceptance criteria traceability or scope-adaptive enforcement become implementable.

---

### Question 2: What truths were available but not featured?

**Available finding A: The living-document counter-position on ADR immutability**

The lit-review-adr-supersession.md (§12.4) documents a practitioner counter-position explicitly: "In theory, immutability is ideal. In practice, mutability has worked better for our teams. We insert the new info into the existing ADR, with a date stamp, and a note that the info arrived after the decision." The review also notes that GDS partially endorses a variant of this (pre-implementation editing). The essay's Section 3 presents immutability as consensus without surfacing this documented dissent. The essay recommends the immutable model for RDD without acknowledging that a documented, practiced alternative exists. This is not an oversight in the research — the lit-review includes it explicitly — but a content selection decision. The living-document position would complicate the recommendation: if immutability contributes to the "50% abandonment" problem the essay itself cites, recommending it without acknowledging the trade-off is incomplete.

The scope decision here is defensible: the essay is recommending a specific direction. But the counter-position is present in the source material and absent in the essay, and its inclusion would change how a reader evaluates the recommendation's confidence level.

**Available finding B: Checklist evidence on code review — more nuanced than presented**

The essay (Section 4, "Mitigations") states: "Checklists have mixed evidence. The fundamental limitation is that generic checklists do not target assumption-level questions about the specific pattern being applied." The lit-review-analogical-transfer.md (§13.2) is more precise: "some studies find improvement in defect detection for inexperienced reviewers, others find no significant effect." The essay mentions the mixed evidence but does not note the expertise-conditioned result: checklists appear to help novices more than experts, which is directly relevant to RDD's context (an AI system interacting with practitioners of varying experience levels). The essay's dismissal of checklists as insufficiently targeted may be too categorical if the RDD audience includes less-experienced practitioners.

**Available finding C: The amendment/supersession distinction**

The lit-review-adr-supersession.md (§12.1, Marques S9) distinguishes amendment (refinement of a decision) from supersession (replacement of a decision) and notes that both are expressed through new ADR files but warrant different status annotations and different effects on provenance chains. The essay's Section 3 recommends an "IETF-inspired Obsoletes/Updates distinction" but does not name or engage with the amendment/supersession distinction that practitioners already recognize. This is a closer analog to existing ADR tooling vocabulary than the IETF framing and might land more easily with practitioners who already know the ADR ecosystem.

**Available finding D: Stelmakh et al.'s null result on reviewer herding**

The lit-review-anchoring-debiasing.md (§16.3) notes a large-scale null result: "Stelmakh et al.'s (2023) large-scale RCT found no evidence of herding — reviewer scores did not anchor to the first reviewer's score in structured discussion." This is a potentially important counter-signal to the general anchoring narrative: structured processes with pre-formed independent judgments appear to provide natural protection. The essay's research-methods-reviewer dispatch, which already has pre-formed question review before research begins, may already be doing meaningful work here — but the essay does not connect this finding back to that existing mechanism. If the research-methods reviewer is the structural intervention that provides natural protection at the question-formation stage, the essay should say so; the Stelmakh finding is the closest empirical analog to why it works.

---

### Question 3: What would change if the dominant framing were inverted?

The essay's dominant framing: **methodology seams as structural gaps at artifact boundaries** — the methodology specifies what each artifact looks like, but not the relationship between adjacent artifacts, and those unspecified relationships are where the failures occur.

**Inverted framing: the failures are at over-specified artifact shapes, not under-specified relationships.**

Under the inverted framing, the problem is not that relationships between artifacts are undesigned — it is that individual artifacts are over-constrained, which makes their coordination points brittle. A cycle-status.md with a rigid single-cycle schema fails not because the relationship between it and other artifacts is unspecified, but because the schema itself cannot flex to hold the shapes the methodology actually produces (batch cycles, paused cycles, mini-cycles). ADRs fail not because the relationship between ADRs and system-design.md is unspecified, but because the ADR format does not accommodate the amendment/supersession distinction practitioners actually need. Gherkin scenarios fail not because the relationship between scenarios and acceptance criteria is unspecified, but because the BDD format cannot carry layer information.

Under this inverted framing:
- What becomes stronger: the recommendation to extend artifact schemas (adding `In-progress gate:` to cycle-status.md, adding layer annotations to acceptance criteria, adding amendment-vs-supersession status) looks more central and complete.
- What becomes weaker: the cross-cutting "methodology seams" theme, which depends on the gaps being in relationships rather than in artifact design.
- What the essay would need to address: whether the seam problem is structurally prior to the artifact problem (unspecified relationships are why rigid schemas fail) or structurally posterior (rigid schemas force failures into the relationship space, which then appears to be the gap).

The inverted framing does not invalidate the essay's conclusions — both framings point toward similar artifact changes — but it would shift the level at which the core diagnosis is made, and therefore the level at which the fix is principally applied.

---

### Framing Issues

**P2 — Underrepresented alternatives**

**FP2-A**
- **Location:** Section 3, ADR supersession recommendation
- **Framing choice:** The essay recommends formalizing body immutability without surfacing the living-document counter-position documented in the lit-review.
- **What the source material contains:** lit-review-adr-supersession.md §12.4 documents the living-document minority position as practiced ("In practice, mutability has worked better for our teams") and notes GDS's partial endorsement of pre-implementation editing. The "50% abandonment" rate the essay cites may be partially caused by the immutability friction the counter-position identifies.
- **Would its inclusion change the argument?** It would not change the recommendation, but it would change the confidence framing — the recommendation should be acknowledged as one of two documented approaches rather than as the consensus answer. If the immutability norm contributes to abandonment and RDD is trying to build a durable practice, this tradeoff deserves explicit recognition.
- **Classification:** P2 — should be acknowledged for the user's judgment.

**FP2-B**
- **Location:** Section 10, three-tier implications structure
- **Framing choice:** The essay lists "cognitive-mechanism design" as the third of three tiers, after artifact-boundary design and structural-enforcement design. The evidence in Tracks #13 and #16 supports reading cognitive-mechanism design as the organizing frame for the other two, not a third tier.
- **What the source material contains:** Both lit-review-analogical-transfer.md and lit-review-anchoring-debiasing.md find that instruction-based and structural interventions are necessary *because* the cognitive mechanisms operate before deliberate attention — meaning the structural fixes at artifact boundaries (#11, #12) and enforcement points (#14) may be addressing symptoms of a cognitive failure that will find new seams if not addressed at the mechanism level.
- **Would its inclusion change the argument?** Yes, potentially: it would shift whether the three-tier structure is a useful parallel organization or whether cognitive-mechanism design should be framed as the causal root for which the other two tiers are downstream mitigations.
- **Classification:** P2 — the user should decide whether the three-tier parallel structure or a causal hierarchy is the more accurate representation.

**P3 — Minor framing choices**

**FP3-A**
- **Location:** Section 2, "What the literature says" — convergence language
- **Framing choice:** "The literature converges on five conditions" presents the five-condition list as pre-existing consensus rather than as the essay's synthesis across distinct literatures.
- **Classification:** P3 — see P3-B above; minor precision issue.

**FP3-B**
- **Location:** Section 5, "The in-progress gate case" — fix characterization
- **Framing choice:** The essay states the fix is "primarily a hook-behavior change" and that the schema field is "enabling infrastructure." This framing is supported by the lit-review (lit-review-workflow-composition.md, §Q14.6 is explicit: "It is primarily a hook-behavior change"). However, the essay presents this conclusion without noting that the protocol for reliably setting and unsetting the `In-progress gate:` field — which the lit-review flags as a fragility source ("a source of fragility") — is the component that makes the fix trustworthy. Characterizing the schema and protocol as merely "enabling infrastructure" understates the reliability dependency.
- **Classification:** P3 — consider noting the reliability dependency more explicitly.

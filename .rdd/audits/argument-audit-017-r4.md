# Argument and Framing Audit: Essay 016 (Cycle 017) — R4

**Audited document:** `docs/essays/016-initial-handoff-and-the-audience-at-the-margin.md`
**Source material:**
- `docs/essays/research-logs/research-log.md`
- `docs/essays/research-logs/lit-review-017-diagram-driven-orientation.md` (Q5)
- `docs/essays/research-logs/lit-review-017-document-legibility.md` (Q2)
- `docs/essays/research-logs/lit-review-017-conversational-turn-structure.md` (Q4)
- `docs/essays/research-logs/lit-review-017-audience-corpus-organization.md` (Q6 + Q3)
- `docs/essays/research-logs/lit-review-017-nomenclature-leakage.md` (Q1)
- `docs/housekeeping/audits/argument-audit-017.md` (R1 report)
- `docs/housekeeping/audits/argument-audit-017-r2.md` (R2 report)
- `docs/housekeeping/audits/argument-audit-017-r3.md` (R3 report)
**Date:** 2026-04-24

---

## Section 1: Argument Audit

### Summary

- **Argument chains mapped:** 13
- **Issues found:** 3 (0 P1, 1 P2, 2 P3)
- **R3 corrections verified:** R3 P2 (forward-reference at §4.5 opening) — see verification below
- **Cognitive-economy framing coherence:** substantively sound with one qualification (P2)
- **New issues introduced by R4 changes:** 1 P2, 2 P3

---

### R3 Correction Verification

**R3 Issue 2.1 — §4.5 forward-reference at the intro paragraph: Resolved.**

The R3 report found that the asymmetric constraint was introduced in §4.5's opening without a signpost that the constraint has a bound, leaving readers who stopped before the agent-mediated-orientation sub-section unaware of where the asymmetry runs into the AI-as-prosthetic objection. In R4, the §4.5 intro paragraph now closes with: "Where the asymmetric framing meets a real bound is the agent-mediated-orientation pattern, examined as a candidate at the end of this section: what is acceptable to *load* onto agents depends on whether the agent's role stays clear of the AI-as-reading-prosthetic pattern the user has explicitly rejected." This is the exact forward-reference the R3 report requested. A reader grasping the cognitive-economy framing from §4.5's opening is now directed to the bound before the section ends. The issue is closed.

**R3 P3 items — Heijstek UML parenthetical and Diátaxis "maps" softening: Status unchanged.**

Both items persist from R1. The Heijstek citation in §4.4 still lacks the "(formal UML diagrams)" parenthetical, and the §3 Diátaxis paragraph still reads "maps the same divergence" rather than "provides a structural analog for the same divergence." Neither was addressed in R4, which is consistent with their P3 severity. Both are carried forward below.

---

### P1 — Must Fix

No P1 issues found in R4.

---

### P2 — Should Fix

**Issue 2.1 — The "brief purpose-built orientation artifact" sub-bullet's cognitive-economy test is stated directionally but not operationally, making the frame load-bearing without content**

- **Location:** §4.5, "Brief purpose-built orientation artifacts where cognitive economy is positive" sub-bullet; §4.5 closing paragraph; §6 DECIDE implications
- **Claim:** The sub-bullet admits a new class of human-facing artifact — brief purpose-built orientation materials for zero-prior-familiarity readers — on the grounds that the artifact's "reading cost pays back in reduced cognitive load downstream." The cognitive-economy test is described as the criterion that decides admissibility. §6 DECIDE implications notes that "the test for 'earning back' is itself a methodology decision that needs articulation rather than left to per-artifact judgment."
- **Evidence gap:** The R4 revision correctly identifies that the cognitive-economy test needs encoding at DECIDE, but in the interim the essay relies on the test as a decision-making standard without specifying what it evaluates. Two operationalization gaps arise. First, the test is asymmetric in practice: the reading cost of an artifact is directly observable (word count, reading-time estimate), but the downstream cognitive-load reduction is speculative at design time. A brief orientation artifact that "builds schemas needed to navigate the rest of the corpus" will, in practice, be evaluated on production-time intuition rather than on evidence of schema-transfer, because no study reviewed in the cycle measures schema-carry-forward from an orientation pre-read into subsequent Tier-2 document comprehension. Second, the sub-bullet names Ernst & Robillard's prior-familiarity dominance as the empirical motivation for this intervention class. Ernst & Robillard's finding was demonstrated for applied and creative tasks (tasks requiring use of source code), and the essay accurately notes elsewhere that the finding's applicability to orientation-level comprehension is "not directly tested." If the finding's generalizability is explicitly open at §3 and §5, citing it as the motivation for an admitted intervention class without noting the same scope limitation at the point of admission is a scope inconsistency — the uncertainty acknowledged in the characterization of the empirical anchor is not present in the characterization of the intervention the anchor motivates.
- **Recommendation:** Add a single qualifying sentence to the "brief purpose-built orientation artifacts" sub-bullet noting that the cognitive-economy test is speculative at design time because schema-carry-forward has not been empirically established for orientation pre-reads of this type, and that the Ernst & Robillard prior-familiarity finding motivates the intervention direction without directly validating the mechanism. This does not require abandoning the sub-bullet — the intervention direction is defensible — but it ensures the sub-bullet's evidentiary basis carries the same scope qualification the essay applies to Ernst & Robillard elsewhere.

---

### P3 — Consider

**Issue 3.1 — The new "brief purpose-built orientation artifacts" sub-bullet and the existing "in-document orientation leads" sub-bullet address adjacent purposes without distinguishing their scope**

- **Location:** §4.5, "In-document orientation leads at the top of each Tier-2 artifact" sub-bullet; §4.5, "Brief purpose-built orientation artifacts where cognitive economy is positive" sub-bullet
- **Claim:** The two sub-bullets are presented as distinct responses. In-document orientation leads are restructuring moves within existing artifacts ("ordering changes, not volume changes"). The new sub-bullet admits a separate brief artifact for zero-prior-familiarity readers.
- **Issue:** The two interventions partially overlap in purpose: both serve the reader who lacks schemas for a Tier-2 document. The in-document leads address the failure at the moment of Tier-2 document encounter; the brief orientation artifact addresses it before encounter. The essay does not establish whether these are sequential (do both; the pre-document artifact reduces the schema deficit the in-document lead then confirms), complementary (choose one based on degree of schema deficit), or redundant (if the brief orientation artifact succeeds, the in-document leads become less necessary for the target audience). The relationship between the two interventions matters for DECIDE's ADR on context-building tooling: if both are adopted, the design question is how they interact; if one forecloses the need for the other, the selection logic needs stating.
- **Recommendation:** Add a one-sentence relationship clause to the closing summary paragraph of §4.5 noting that the pre-document orientation artifact and the in-document orientation leads are complementary at different points in the reading timeline, and that DECIDE will need to assess whether both are warranted or whether one suffices for a given audience segment. This is a precision issue, not an argument error, which places it at P3.

**Issue 3.2 — The Heijstek (2011) UML parenthetical remains absent from §4.4; the Diátaxis "maps" formulation remains unmodified in §3**

- **Location:** §4.4, Heijstek citation; §3, Diátaxis paragraph
- **Status:** Persists from R1 without resolution across four audit cycles. Both are one-phrase adjustments. At P3 severity they do not affect gate readiness. Carrying forward for completeness.
- **Recommendation:** Add "(the experiment used formal UML diagrams)" after the Heijstek (2011) citation in §4.4. Soften "Diátaxis (Procida) maps the same divergence" in §3 to "Diátaxis's purpose-typing framework provides a structural analog for the same divergence." These adjustments have been available since R1.

---

### Cognitive-Economy Framing Coherence Assessment (R4 Audit Focus Items 2 and 3)

The four specific coherence questions named in the R4 audit brief are addressed in turn.

**§4.5 intro's cognitive-economy framing and internal consistency throughout the section.**

The framing is internally consistent. The §4.5 intro establishes the optimization target precisely: "the optimization target is *cognitive economy on the human side*, not *what artifacts exist in the corpus* and not *strict avoidance of any addition to human reading*." This framing is consistent with the forward-reference to the agent-mediated-orientation bound (which clarifies that the criterion is not unlimited), with the closing paragraph's observation that "load asymmetry runs in one direction across audiences — human cognitive load shrinks while agent-facing context may grow," and with the abstract's summary that the optimization target is "human-side cognitive economy." No internal inconsistency is found in the framing's application across the section.

**Relationship between the new "brief purpose-built orientation" sub-bullet and the "in-document orientation leads" sub-bullet.**

As noted in Issue 3.1, the two sub-bullets are coherent in the sense that neither contradicts the other. Their overlap in purpose is not flagged as an error but as a precision gap: the essay does not establish how the two interventions interact when both are applied. This is a P3 issue.

**Cognitive-economy framing consistency with §4.1 (companion files for agents).**

The §4.1 and §4.5 framings remain consistent, as established in R3. §4.1 states that companion files are "additive, not substitutive" and that the primary corpus retains its type-based organization; §4.5's closing paragraph restates that companion files "offload material from humans onto agents." Both sections describe the same directional move: agent-facing context grows by addition at a predictable path; human reading decreases by the same measure. No inconsistency found.

**Whether "cognitive economy" is load-bearing without operational content.**

This is the substance of Issue 2.1 above. The cognitive-economy framing improves over the prior "minimize what humans must read" framing in two ways: it correctly admits high-value targeted additions for humans (brief orientation artifacts) and correctly treats agent-facing growth as unproblematically admissible. These are material improvements. The remaining gap is that the test for whether a human-facing addition "earns back its cost" has no operationalization outside of design-time intuition. The framing is not vacuous — it excludes the clear failure case (comprehensive reference material added to an already-overwhelming corpus) — but it is imprecise at the margins where the interesting design decisions fall. The essay correctly defers the operationalization to DECIDE; Issue 2.1 asks for the scope limitation on the motivating empirical finding to be flagged at the point of the new sub-bullet.

---

### New Sub-Bullet Citation Verification (R4 Audit Focus Item 4)

**Ernst & Robillard cited as motivation; Diátaxis tutorials and Rukmono et al. as supporting literature for the new sub-bullet.**

The citations are verifiable against the source material with qualifications.

Ernst & Robillard (2023): The Q2 lit-review confirms the study and its finding (prior familiarity dominates; n=65; Bayesian ordered categorical regression). The essay's use of this finding as "motivation" for the brief orientation artifact is appropriate directionally — the finding points toward schema-building before document encounter as the highest-leverage intervention. The Q2 lit-review explicitly flags that the finding was demonstrated for applied and creative tasks and that orientation-level comprehension is not separately tested. The essay acknowledges this scope qualification at §3 and §5 but does not repeat it at the new sub-bullet. This is the basis for Issue 2.1.

Diátaxis tutorials (Procida): The Q6 lit-review confirms Diátaxis's existence as an active primary source (diataxis.fr). Diátaxis's tutorial type does serve "learners doing tasks under instruction" — which maps to a zero-prior-familiarity reader's orientation need. The use of Diátaxis tutorials as supporting literature for brief purpose-built orientation artifacts is a reasonable analogical application. The Q6 lit-review also confirms that Diátaxis does not address the human-vs-agent audience axis directly — it addresses documentation types, not audience types — so the citation appropriately treats Diátaxis as supporting the artifact type (tutorial-style), not as prescribing the audience-separation pattern.

Rukmono et al. (2024): The Q2 lit-review confirms this study (17-practitioner interview study; "explanation window" framework; audience-adaptive explanation practice). Rukmono et al. is cited in the sub-bullet as "onboarding patterns." The Q2 lit-review describes Rukmono et al.'s finding as practitioners treating diagrams as "one tool in an audience-adaptive explanation window" — an audience-adaptation finding, not specifically an onboarding pattern finding. The sub-bullet's characterization as "onboarding patterns" slightly overstates Rukmono et al.'s specific contribution; the study is a general explanation-adaptation study, not an onboarding study. This is a minor framing imprecision, not a factual error, and is within the P3 range.

---

### Agent-Mediated Orientation Candidate Status Under R4 Framing (R4 Audit Focus Item 5)

The R4 revision admits brief human-facing orientation artifacts where cognitive economy is positive, making agent-mediated orientation one of several options for the same purpose (building schemas before document encounter). The essay retains "candidate, not adopted here" framing for agent-mediated orientation, and the R4 §4.5 forward-reference correctly signals the limit on the cognitive-economy framing at this candidate. The "candidate, not adopted here" status remains appropriate for sound reasons: the operational criterion problem (distinguishing agent-as-orienter from AI-as-prosthetic in practice) remains unresolved, and the brief human-facing orientation artifact provides an alternative route to the same schema-building outcome without incurring the operationalization problem. The R4 framing does not require re-examining the candidate's status upward; if anything, the new sub-bullet reduces pressure on agent-mediated orientation by offering a simpler alternative for the same purpose.

---

### §6 Implications Consistency Assessment (R4 Audit Focus Item 6)

The §6 DECIDE implications paragraph adds, in R4: "The cognitive-economy constraint itself warrants explicit encoding as a methodology principle: human reading additions are admissible when they earn back their cost in reduced downstream cognitive load, and the test for 'earning back' is itself a methodology decision that needs articulation rather than left to per-artifact judgment." This addition is necessary and correct — the cognitive-economy test is a design decision with downstream consequences for every future context-building ADR. The DISCOVER, MODEL, ARCHITECT, and BUILD implications are not materially affected by the cognitive-economy reframing and do not require revision. The DECIDE implications are the appropriate landing zone for the constraint's encoding, and the essay correctly names it there.

---

## Section 2: Framing Audit

The framing audit makes the negative space of content selection visible. The primary document chose a framing — this section examines what that choice excluded.

---

### Question 1: What alternative framings did the evidence support?

**Status of R3 framing issues under R4:**

**R3 Framing P2-A (asymmetric-constraint's uniform treatment of reading load): Substantively addressed but not entirely closed.**

The R3 framing audit found that the asymmetric constraint treated all additions to human reading as equivalent in cognitive cost, foreclosing the class of interventions most directly suggested by the cycle's strongest empirical anchor (brief purpose-built orientation artifacts for zero-prior-familiarity readers). The R4 revision responds to this directly: the new "brief purpose-built orientation artifacts where cognitive economy is positive" sub-bullet explicitly admits this intervention class. The user's clarification — "cognitive economy is positive is the right frame; I didn't mean to foreclose options" — is carried through consistently. The framing P2-A issue, as stated in R3, is resolved. The sub-bullet is present; the intervention class is admitted.

What remains is the qualification raised in Issue 2.1 above: the test for "earning back" is itself unoperationalized at the point of the sub-bullet, and the motivating empirical anchor's scope limitation is not repeated there. This is narrower than the R3 Framing P2-A concern and is addressed as Issue 2.1.

**R3 Framing P3-A (agent-facing context growth without maintenance bound) and P3-B (essay does not self-apply orientation principles): Status unchanged.**

Both persist from prior audits without resolution. Neither was addressed in R4. Both remain at P3 severity.

**New alternative framings introduced or sharpened by R4's cognitive-economy revision:**

**Alternative framing F: Cognitive economy as a cognitive frame that cannot see non-cognitive forms of value.**

The R4 revision establishes cognitive economy as the essay's governing optimization target for human-facing additions. The test is: does this addition pay back its reading cost in reduced downstream cognitive load? This frame can see cognitive value clearly. What it cannot see is non-cognitive value from orientation artifacts: relational value (a brief on-ramp that builds a stakeholder's trust in the corpus's authorial competence), normative value (making the framework legible signals that the methodology respects the reader's time), or political value (stakeholders who feel oriented are more likely to engage critically with architectural choices rather than routing around them). The research log's field evidence captures one such non-cognitive signal: stakeholders describe the corpus as "fantastic" — which may reflect relational and normative satisfaction as much as cognitive success. The cognitive-economy frame evaluates only cognitive cost-benefit; it is silent on whether an orientation intervention that also builds trust, signals professional respect, or increases stakeholder engagement earns back its cost along those dimensions.

*Belief mapping:* A reader who holds that stakeholder trust, engagement, and agency are the primary outputs of a handoff would see the cognitive-economy frame as measuring the wrong axis. For that reader, the admission criterion for a brief orientation artifact should be "does it build the reader's sense of competence and agency in navigating the corpus" — not "does it reduce downstream cognitive load." These two criteria may produce the same design in most cases, but they diverge in edge cases: a low-cognitive-load orientation artifact that is tonally patronizing or visually sparse might reduce cognitive overhead while reducing stakeholder engagement. The essay does not surface this alternative axis.

**Alternative framing G: The five sub-patterns in §4.5 are not uniformly supported by the cognitive-economy criterion; some are admitted on weaker grounds than others.**

Under the cognitive-economy framing, each sub-pattern should satisfy the test: does the addition pay back in reduced downstream cognitive load? The reading-path infrastructure enhancement (sharpening existing ORIENTATION.md paths) and the in-document orientation leads (restructuring moves inside existing artifacts) are the most defensible under the test: they are additions to human reading that are observably targeted, brief, and positioned at the points of highest schema-building need. The visual scent diagram (a new corpus map inside ORIENTATION.md) is admitted on the grounds that it "trades a small amount of new visual material for a substantial saving in cognitive overhead" — but the R2 audit noted (R2 P3-1) that this saving is asserted, not derived, and is conditional on diagram quality. The brief purpose-built orientation artifact is admitted on the grounds that it may "pay for itself many times over in reduced cognitive load downstream" — a claim that depends on the schema-carry-forward mechanism, which is empirically unestablished (as Issue 2.1 notes). The companion files sub-pattern is admitted correctly as a pure cognitive-economy gain (agent-facing material removed from human reading). The agent-mediated orientation candidate is correctly held out. The five sub-patterns are thus not uniformly supported: the in-place restructuring moves have the strongest support; the new artifact classes (corpus map, orientation artifact) have conditional or asserted support. The essay's §4.5 closing paragraph implies equivalence among the five ("the five responses, taken together...") without acknowledging this differentiation.

*Belief mapping:* A reader who applies the cognitive-economy criterion rigorously would ask: which of the five sub-patterns has demonstrated, not asserted, cognitive-economy value? The answer from the source material is: none has been directly tested. The differential support across sub-patterns — stronger for in-place restructuring, weaker for new artifact classes — is available in the source material but not visible in the essay.

---

### Question 2: What truths were available but not featured?

**Available truth A: Nguyen et al. (2025) — quantitative readability divergence between agent-context files and human-readable documentation — remains absent from the essay.**

This finding was surfaced in R1, R2, and R3 and has not been adopted across four audit cycles. The Q2 lit-review (document-legibility.md, §4.4) confirms the empirical finding: CLAUDE.md-style agent context files exhibit a median readability score of 16.6 (legal-document level); structures optimized for agent orientation create context debt for humans. The R4 cognitive-economy framing, which now admits agent-facing context growth explicitly, would be materially strengthened by this finding: the claim that agent-facing content may grow without burdening human readers rests on the assumption that agent-optimized content is structurally distinct from human-readable content. Nguyen et al. provide the quantitative empirical confirmation of that structural distinction. Without it, the cognitive-economy framing's permissive direction for agent content growth is theoretically motivated but not empirically anchored. The finding remains available and unused.

*Why excluded:* Consistent selection decision across four synthesis passes. No new reason for exclusion is apparent. The pattern suggests a deliberate scope choice rather than an oversight. Noted here for completeness given that the R4 framing makes the finding more, not less, relevant.

*Would inclusion change the argument:* No structural change. The asymmetric framing's direction is sound without it. Inclusion would strengthen the empirical grounding for the cognitive-economy framing's permissive direction on agent context at exactly the point (§4.1 companion files) where the framing is most consequential for DECIDE.

**Available truth B: The four-mechanism Q4 ledger includes no mechanism that directly addresses the failing reading scenario the cognitive-economy framing was introduced to address.**

The §4.2 turn-structure section maps four mechanisms (structural ordering, volume, scope, priority opacity) to multi-item agent turn failure. The cognitive-economy frame governs the §4.5 context-building response direction, which was introduced to address the reader-context failure identified by Ernst & Robillard. These two sections address different failure modes (agent turn structure vs. reader schema-building before document encounter) and correctly do not claim to share a mechanism. However, the essay's §3 closing paragraph frames the five threads as sharing "a structural family — context, audience, and reading-task awareness in artifact and turn design." Under this integrating frame, a reader would expect the cognitive-economy framing to extend to turn-structure design — but it does not. Agent turns are governed by the four-mechanism ledger, not by the cognitive-economy criterion. The essay does not note that the governing criterion for context-building (cognitive economy) and for turn structure (four-mechanism ledger) are different, and that the shared-structural-family framing encompasses both without a unifying evaluative criterion.

*Why excluded:* The omission is likely a scope decision — each section applies its own governing framework, and the essay does not attempt to unify them under one evaluative metric. The omission is defensible but leaves the "structural family" claim slightly overstated relative to the heterogeneity of governing criteria across sections.

*Would inclusion change the argument:* Minor. The shared-structural-family claim in §3 would need softening to acknowledge that the family is taxonomic (context, audience, reading-task awareness) rather than evaluative (a single optimization criterion governing all five responses).

**Available truth C: The Q4 lit-review's ExploreLLM CHI 2024 empirical finding for agent-mediated schema-building remains uncited.**

Surfaced in R2 and R3. The Q4 lit-review (conversational-turn-structure.md, §3.2) documents Ma et al. (CHI 2024): schema-like task decomposition in LLM interfaces reduced cognitive load for exploratory tasks. The §4.5 agent-mediated-orientation sub-section appeals to "IFT and CLT in principle" to support schema-building through interaction, without citing the CHI 2024 empirical finding that most directly anchors the claim. The R4 revision does not add this citation. The omission is noted here because the new brief-orientation-artifact sub-bullet's admission into the essay makes the agent-mediated orientation candidate a genuine competing option for the same purpose, and a DECIDE-phase author comparing the two would benefit from knowing an empirical anchor exists for the interaction-based alternative.

---

### Question 3: What would change if the dominant framing were inverted?

**Dominant framing of R4:** The optimization target for human-facing additions is cognitive economy — additions are admissible when they earn back their reading cost in reduced downstream cognitive load. Agent-facing context may grow without cognitive-economy constraint. The five supported responses operate at the margin of the existing corpus.

**Inverted framing:** Cognitive economy, narrowly construed as reading-cost versus cognitive-load-reduction, is the wrong evaluative axis for a handoff that is fundamentally about stakeholder trust, engagement, and agency. The dominant framing measures correctly but measures the wrong thing.

Under the inverted framing:

- The admission criterion for the new "brief purpose-built orientation artifacts" sub-bullet changes. Under the cognitive-economy framing, a brief orientation artifact is admitted when schema-carry-forward reduces subsequent cognitive load. Under the inverted framing, it is admitted when it increases the reader's sense of competence and agency in the corpus — even if the cognitive-load delta is neutral. These criteria do not always disagree, but the inverted framing places the design target at stakeholder experience rather than cognitive measurement.

- The "reading load shrinks while agent-facing context may grow" closing claim in §4.5 becomes less obviously true. Under the inverted framing, what matters is not reading load but reading experience: does the reader feel capable, oriented, and respected after the interaction with the corpus? An agent-facing companion file that gives agents rich context while stripping narrative depth from the human-facing artifact may reduce reading load while degrading reading experience.

- The agent-mediated orientation candidate becomes more prominent under the inverted framing than under the cognitive-economy framing. An interactive conversational on-ramp that builds the reader's confidence and lets them ask clarifying questions does something qualitatively different from reading a brief orientation artifact — it makes the reader an agent in their own orientation, not a passive consumer. Under the inverted framing, this difference is valuable in itself and is not captured by the cognitive-economy criterion.

- The corpus-map visual scent diagram becomes less central: a visual corpus map reduces navigational overhead but does not necessarily increase stakeholder trust or engagement. Under the inverted framing, the reading-path infrastructure enhancement — which tells the reader explicitly "you belong here, read these, skip these" — would be ranked higher than the diagram because it makes the corpus's relational stance toward the reader explicit.

The inverted framing does not falsify the R4 essay's cognitive-economy revision; the revision is a genuine improvement over the prior "no-net-add" framing. But it reveals that cognitive economy, as an optimization target, is a proxy for the underlying goal rather than the goal itself. The underlying goal — as articulated in the research log — is to make "the human experience of working within the framework feel better" and to preserve understanding and agency. Cognitive economy is well-correlated with this goal in most cases. The framing audit surfaces the gap for cases where they diverge.

---

### Framing Issues

**Framing P2-A — The cognitive-economy frame excludes non-cognitive forms of value that the research log's field evidence captures**

- **Location:** §4.5, organizing constraint paragraph; §4.5 closing paragraph; abstract
- **Claim:** The essay treats cognitive-economy (reading cost vs. downstream cognitive load reduction) as the sufficient criterion for admitting or rejecting human-facing additions to the corpus. The abstract describes the optimization target as "human-side cognitive economy."
- **Evidence gap:** The research log's field evidence records that external stakeholders describe the corpus as "fantastic" at the orientation layer, and that the failure point is the Tier-2 document encounter. This is not purely a cognitive failure: the stakeholder experience of going from "this is fantastic" to "overwhelming" includes relational and normative dimensions (loss of trust in the corpus's accessibility, sense of inadequacy, decision to route around the documents) that cognitive-load measurements do not capture. Ernst & Robillard's prior-familiarity finding — the essay's strongest specific empirical anchor — predicts that format improvements will have limited effect on zero-prior-familiarity readers, but it does not predict that non-cognitive interventions (an author's explicit address to the stakeholder's situation, a direct acknowledgment of what is overwhelming and why) would similarly fail. The cognitive-economy frame accurately captures the cognitive dimension of the handoff problem while being silent on the relational and normative dimensions the field evidence includes.
- **Recommendation:** This is not an error requiring correction, but it is a foreclosure worth naming at the epistemic gate. The DECIDE phase, when encoding the cognitive-economy constraint as a methodology principle, should consider whether the constraint should be broadened to "cognitive and relational economy" or whether the cognitive framing is intended to be comprehensive. A one-sentence note in §6's DECIDE implications — that the cognitive-economy criterion is explicitly cognitive and that DECIDE may wish to consider whether relational and normative value should be separately admissible criteria — would surface this as a DECIDE-phase question without requiring revision to §4.5.

**Framing P3-A — The five §4.5 sub-patterns have differential cognitive-economy support that the closing paragraph does not acknowledge**

- **Location:** §4.5, closing paragraph ("The five responses, taken together, share a structural property worth naming...")
- **Claim:** The closing paragraph implies that all five responses satisfy the cognitive-economy criterion, collectively netting human cognitive load downward or steady.
- **Evidence gap:** As noted in framing alternative framing G above, the sub-patterns have differentiated support under the cognitive-economy criterion. The in-place restructuring moves (reading-path enhancement, in-document orientation leads) have the strongest support — they are targeted, brief, and positioned at maximum-intrinsic-load moments. The new artifact classes (corpus map, brief orientation artifact) are admitted on asserted, not derived, cognitive-economy calculations. The companion-file pattern is the clearest cognitive-economy gain. Agent-mediated orientation is held out. The closing paragraph's "taken together" characterization absorbs this differentiation without acknowledging it.
- **Recommendation:** A one-clause softening of "the five responses, taken together, share a structural property" to "the five responses, taken together, illustrate a structural direction" would preserve the rhetorical point while not overstating the uniformity of cognitive-economy support across them. The P3 severity reflects that this is a clarity issue in the closing summary, not an argument error in any individual sub-pattern.

**Framing P3-B — Essay continues not to self-apply its own orientation principles (carried from R1, R2, R3 without change)**

- **Location:** Abstract; §1
- **Status:** Raised in R1 Framing P3-A and carried unchanged through R3. The R4 abstract has been revised to reflect the cognitive-economy framing, but the revision does not address the reflexive irony: the essay opens with a dense, RDD-vocabulary-heavy abstract that presupposes prior familiarity with the corpus. The abstract is well-suited for the essay's primary audience (the user, who has full RDD context). The irony is unchanged.
- **Recommendation:** Carry forward unchanged. P3 severity is correct; the essay's primary audience has the schema the abstract assumes.

---

## Summary

The R4 essay successfully applies the R3 P2 correction: the forward-reference to the agent-mediated-orientation bound is present in §4.5's intro paragraph and lands correctly. A reader who grasps the cognitive-economy framing from §4.5's opening is now directed to the framing's limit before the section ends.

The cognitive-economy reframing — the principal substantive change in R4 — is internally coherent. The §4.5 intro correctly establishes cognitive economy as the optimization target, and the framing is consistent with §4.1's companion-file pattern, with the abstract, and with the §6 DECIDE implications. The reframing is a material improvement over the prior "no-net-add" constraint: it correctly admits high-value targeted human-facing additions and correctly permits agent-facing growth.

One P2 issue surfaces in R4. The new "brief purpose-built orientation artifacts" sub-bullet is admitted on the grounds that Ernst & Robillard's prior-familiarity finding motivates the intervention, but the sub-bullet does not carry the same scope qualification the essay applies to Ernst & Robillard at §3 and §5. The cognitive-economy test that decides the sub-bullet's admissibility is stated directionally (reading cost pays back in reduced downstream load) but is unoperationalized at design time, and the schema-carry-forward mechanism it depends on has not been empirically established in any reviewed study. The sub-bullet's direction is defensible; the missing scope note and the gap in the governing test's operationalization are the residual concerns.

Two persisting P3 items (Heijstek UML parenthetical; Diátaxis "maps" softening) remain from R1 without resolution. One new P3 item surfaces (the scope relationship between the brief orientation artifact sub-bullet and the in-document orientation leads sub-bullet). None of the P3 items affect gate readiness.

The framing audit's most significant new finding is the cognitive-economy frame's blindspot to non-cognitive value dimensions (Framing P2-A). The field evidence the essay draws on includes relational and normative signals (stakeholder trust, sense of agency, routing-around behavior) that cognitive-load measurement does not fully capture. The cognitive-economy framing is well-correlated with the underlying goal — making the human experience of the corpus feel better — but the correlation is imperfect at the margins where design decisions matter most. This is a judgment-call for the epistemic gate: DECIDE will encode the cognitive-economy criterion as a methodology principle, and the question is whether to encode it as purely cognitive or to include relational and normative admissibility criteria alongside it.

The essay is ready for the epistemic gate with Issue 2.1 applied. Framing P2-A is surfaced for user judgment at gate time. The P3 items and Framing P3 items are minor and do not affect gate readiness.

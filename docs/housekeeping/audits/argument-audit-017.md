# Argument and Framing Audit: Essay 016 (Cycle 017)

**Audited document:** `docs/essays/016-initial-handoff-and-the-audience-at-the-margin.md`
**Source material:**
- `docs/essays/research-logs/research-log.md`
- `docs/essays/research-logs/lit-review-017-diagram-driven-orientation.md` (Q5)
- `docs/essays/research-logs/lit-review-017-document-legibility.md` (Q2)
- `docs/essays/research-logs/lit-review-017-conversational-turn-structure.md` (Q4)
- `docs/essays/research-logs/lit-review-017-audience-corpus-organization.md` (Q6 + Q3)
- `docs/essays/research-logs/lit-review-017-nomenclature-leakage.md` (Q1)
- `docs/cycle-status.md`
**Date:** 2026-04-24

---

## Section 1: Argument Audit

### Summary

- **Argument chains mapped:** 8
- **Issues found:** 8 (1 P1, 4 P2, 3 P3)

---

### P1 — Must Fix

**Issue 1.1 — Ernst & Robillard cited as the "strongest single empirical anchor" for the expertise reversal effect, but it supports a different claim**

- **Location:** §3, paragraph 5 ("The most direct empirical finding...")
- **Claim:** The essay names the expertise reversal effect (Kalyuga et al. 2003) as one of the four converging frameworks, then immediately pivots to Ernst & Robillard (2023) as "the most direct empirical finding" — positioned as an elaboration of the same mechanism.
- **Evidence gap:** This is an attribution splice. Kalyuga et al. establish the *expertise reversal effect* specifically: instructional designs effective for novices become ineffective or harmful for experts, and vice versa — a measured comprehension differential between novice and expert reading of the same artifact. Ernst & Robillard establish something different: that *documentation format* (narrative vs. structured) is not a significant predictor of comprehension, and that *prior source-code familiarity* is the dominant variable. These are convergent findings on the general topic of reader-state affecting comprehension, but they are not the same mechanism and they do not directly support each other. Worse, both lit-reviews note explicitly that Ernst & Robillard's finding was demonstrated for "applied and creative tasks" (tasks requiring use of source code), and that orientation-level comprehension by zero-prior-exposure readers is not separately tested. The essay acknowledges this gap in §5 but not at the point of the claim in §3, where the finding is presented with unqualified force.
- **Recommendation:** In §3, rewrite the Ernst & Robillard citation so the scope limitation is present at the point of invocation, not deferred to §5. Separate it cleanly from the expertise reversal citation — they support overlapping but distinct claims. A repair such as "A partial empirical anchor comes from Ernst & Robillard (2023)..." followed by the scope caveat would prevent a reader who stops before §5 from carrying an overconfident reading forward.

---

### P2 — Should Fix

**Issue 2.1 — "Primary mechanism" claim overstates what the source material establishes**

- **Location:** §3, opening sentence and throughout; also abstract
- **Claim:** Context-mismatch is "the most empirically supported primary mechanism." The lit-review synthesis corroborates the "most empirically supported" ordering. But "primary mechanism" implies it is sufficient on its own to explain the observed failure, or that the other mechanisms are secondary in a ranked causal hierarchy — not merely that it has the strongest individual empirical anchor.
- **Evidence gap:** Neither the Q2 nor the Q5 lit-review establishes that context-mismatch is the *sole* or *dominant* driver to the exclusion of density-ordering and audience conflation. The Q5 lit-review states explicitly: "The five mechanisms are not mutually exclusive, and the literature provides weak basis for ranking them in a generic case. Context determines which mechanism dominates." The Q2 lit-review states that context-mismatch is "the most structurally fundamental mechanism" — which is more defensible than "primary," because it points to theoretical foundational position rather than an empirical causal claim. The essay is consistent with the evidence if read carefully, but the word "primary" in the abstract and in §3's framing sentence invites the reader to infer ranked causality that the literature does not warrant.
- **Recommendation:** Soften "primary mechanism" throughout to "most structurally fundamental mechanism" or "mechanism with the strongest specific empirical anchor." The essay's own §3 body text is already more carefully hedged ("most empirically supported primary mechanism... not primarily a density-ordering or artifact-form failure") — the issue is that the abstract and the section-opening claim are set at a higher confidence than the interior evidence.

**Issue 2.2 — The four-mechanism Q4 ledger presented as the literature's framing, but the four-mechanism structure originates in the lit-review's synthesis**

- **Location:** §4.2, second paragraph ("The four mechanisms are distinguishable...")
- **Claim:** The essay presents four distinguishable mechanisms (structural ordering, volume, scope, priority) as the literature's own account of multi-item turn failure.
- **Evidence gap:** The lit-review does identify four mechanisms, but it also notes that the literature does not produce a study that cleanly isolates them: "These mechanisms are not mutually exclusive. The literature does not provide a study that cleanly isolates them." The four-way taxonomy is the lit-reviewer's synthesis of findings from multiple independent sources (Cowan on volume, CA on scope and recipient design, Grice on manner and quantity, relevance theory on priority opacity). No single study or named source in the literature presents all four as a unified ledger. The essay presents them as the literature's finding without acknowledging the synthesizing step.
- **Recommendation:** Add a brief clarifying phrase to signal that the four-mechanism account is the review's synthesis from multiple independent sources, not a named framework in the literature. The distinction matters for how confidently downstream phases should treat the ledger.

**Issue 2.3 — Continuous documentation framing introduced for Q1 without noting it is a practitioner (non-peer-reviewed) framework**

- **Location:** §4.3, second paragraph ("The most empirically supported lens...")
- **Claim:** Continuous documentation (Rosenbaum 2021) is identified as "the most empirically supported lens" for Q1.
- **Evidence gap:** The Q1 lit-review notes explicitly: "The Rosenbaum articles contain no citations to academic literature. The framework is presented as practitioner knowledge, grounded in product experience with the Swimm platform. Its principles are consistent with the academic literature (Tan et al. 2024 addresses exactly the failure mode that continuous verification aims to prevent) but the causal claims are not independently validated." The essay's "most empirically supported lens" formulation subsumes two different types of evidence: the empirical baselines (Tan et al., Aghajani et al., Hata et al., Xiao et al.) are peer-reviewed; the continuous documentation framework that names these as its problem domain is practitioner advocacy without independent validation.
- **Recommendation:** Separate "continuous documentation" (practitioner framework) from the empirical baseline (peer-reviewed staleness rates). A phrasing like "the most theoretically grounded lens — supported by empirical work on staleness rates — is doc-code coupling, articulated under the practitioner heading 'continuous documentation'" avoids attributing the empirical weight to the framework rather than to its associated peer-reviewed evidence.

**Issue 2.4 — The "structured research discipline produced this recalibration" claim in §6 credits the methodology exclusively, excluding alternative attributions**

- **Location:** §6, final paragraph ("The cycle's largest second-order finding...")
- **Claim:** "The structured research loop — question articulation, constraint-removal, methods review, lit-reviews held to mandatory briefings — produced this recalibration. Without it, the cycle would have implemented a coherent and partially-correct fix to a partially-incorrect diagnosis."
- **Evidence gap:** The counterfactual ("without it, the wrong fix would have been implemented") cannot be verified from the cycle's own trace — the research log does not record an alternative timeline. More specifically, the recalibration involved at least three separable contributors: (a) the methodology's question-isolation protocol and mandatory briefings, (b) the user's willingness to revise hypotheses when constraint-removal surfaced the audience-conflation finding, and (c) the lit-reviewer subagents working from isolated contexts without knowledge of the user's entry hypothesis (which prevented anchoring on the user's prior). The essay attributes the outcome to the methodology without disaggregating these contributing factors. The claim could equally be stated as: the combination of the methodology's scaffolding, the user's epistemic openness, and the subagents' isolated contexts together produced the recalibration.
- **Recommendation:** Reframe to acknowledge the joint contributors. The methodology's role in structuring the conditions for recalibration is a genuine claim; the claim that the methodology *alone* produced the recalibration overstates what the cycle's own trace establishes. Keeping the reflexive credit but narrowing its scope to "created structural conditions for" rather than "produced" would honor the evidence while preserving the insight.

---

### P3 — Consider

**Issue 3.1 — The companion-file conclusion is presented as the literature's finding, but the literature's support is stronger for some cases than others**

- **Location:** §4.1 and §6 DECIDE implications
- **Claim:** "The literature's preferred answer for serving humans and AI agents from the same body of project knowledge is not directory-level audience separation" — stated as a clean finding.
- **Evidence gap:** The Q6 lit-review is unambiguous that directory-level separation is not supported. However, it also clarifies that the practitioner consensus bifurcates by scenario and that the AGENTS.md / llms.txt pattern (parallel companion files) is well-supported for context-engineering artifacts but that the Mintlify unified-source-with-frontmatter approach is preferred for documentation sites — and that RDD's corpus is neither category precisely. The essay does acknowledge the per-artifact judgment call at §4.1's close, which partially addresses this, but the strength-of-consensus language in the section's body is somewhat more uniform than the Q6 lit-review's actual bifurcation.
- **Recommendation:** Minor tightening only. The DECIDE implications paragraph in §6 accurately notes "the choice between (a) and (b) depends on the content-divergence threshold — whether the human and agent versions need genuinely different facts. That is a per-artifact judgment." This caveat could usefully appear one paragraph earlier, inside §4.1 rather than only at the section's end.

**Issue 3.2 — Heijstek (2011) sample caveat is noted in §5 but not at the point of citation in §4.4**

- **Location:** §4.4, second paragraph (Heijstek citation)
- **Claim:** "Heijstek, Kühne & Chaudron (2011), in a controlled experiment on software architecture documentation (n=47), found text users scored as well or better than diagram users overall, and significantly better on topology-related questions."
- **Evidence gap:** The Q5 lit-review notes that Heijstek et al. used formal UML diagrams and that the finding's generalizability to informal architectural diagrams (such as those in RDD's system-design.md) is uncertain. §5 acknowledges this gap, but §4.4's body text presents the finding without the UML-caveat at the point of application, which could mislead a reader who treats §4.4 as the primary reference.
- **Recommendation:** Add a brief parenthetical at §4.4's Heijstek citation noting that the experiment used formal UML. This is a one-line fix.

**Issue 3.3 — The Diátaxis citation for context-mismatch overstates what Diátaxis establishes**

- **Location:** §3, framework 3 (Diátaxis paragraph)
- **Claim:** "Diátaxis (Procida) maps the same divergence to documentation purpose. Tutorials serve learners acquiring orientation; reference serves established practitioners consulting information during work. An external reviewer encountering a Tier-2 reference document for the first time has tutorial or explanation needs, not reference needs. The artifact-form mismatch is structural, not stylistic."
- **Evidence gap:** The Q6 lit-review notes that Diátaxis's completeness claim ("four and only four") applies within its axis-space, which defines a single user archetype — the practitioner in a domain of skill. Diátaxis does not distinguish between human readers and machine consumers, between process and product artifacts, or between initial-handoff and ongoing-reference readers as distinct categories. The essay uses Diátaxis as a named framework supporting the context-mismatch mechanism, but Diátaxis's support is analogical, not direct — Diátaxis distinguishes documentation *types* (tutorial vs. reference), and the essay maps the context-mismatch distinction onto that type taxonomy. This is a reasonable mapping, but "Diátaxis maps the same divergence" overstates the precision of the analogy.
- **Recommendation:** Soften to "Diátaxis's purpose-typing framework is consistent with the same divergence" or "provides a parallel structural account." The framework's contribution is real but analogical.

---

## Section 2: Framing Audit

The framing audit makes the negative space of content selection visible. It compares the essay's choices against what the source material made available.

---

### Question 1: What alternative framings did the evidence support?

**Alternative framing A: Comprehension failure as a tooling-gap problem, not a document-design problem**

The Ernst & Robillard finding (prior familiarity dominates format) is cited as the cycle's primary empirical anchor. Read more expansively, this finding supports a framing not present in the essay: if prior familiarity is the dominant variable, then the correct intervention is not document restructuring but *context-building before document encounter* — orientation summaries, conceptual introductions, or tooling that curates prior-familiarity for the external stakeholder before they encounter the Tier-2 artifacts. The Q2 lit-review explicitly names this implication: "the cycle's intervention scope should include context-building tools (orientation summaries, conceptual introductions), not just document restructuring." Under this framing, the essay's four supported responses (companion files, upstream decomposition, continuous documentation, diagrams as toolkit) address symptoms of the context-mismatch problem; the root remedy would be prior-context scaffolding. The essay does acknowledge this in §5's open questions but does not frame it as an alternative response direction.

*Belief mapping:* A reader who holds that format-independent prior familiarity is the dominant mechanism would conclude that structural moves on existing Tier-2 documents will have limited effect without investment in pre-document context-building. The essay's recommendations are not wrong under this belief — they address real independent mechanisms — but they would need to be presented alongside the prior-familiarity caveat as a co-equal response, not in the shadow of it.

**Alternative framing B: The "thread-the-needle" approach is wrong in principle, not merely poorly implemented**

The essay adopts the framing that layered delivery from shared source IS a refined form of threading the needle, and that the user's experience of comprehension friction may reflect poor threading implementation rather than threading being wrong. The Q5 lit-review does partially undermine the "threading is wrong" diagnosis. However, the source material also contains a distinct and available counter-framing: the agent-README empirical study (Nguyen et al. 2025) found that agent-optimized density produces readability scores equivalent to legal documents, and that "structures optimized for agent orientation create context debt for humans." Under this framing, the fundamental tension between agent-density and human-readability is not resolvable by improved threading — it is structural, and the correct design response is genuine separation (companion files or full splits), not better layering. The essay chooses the "poor implementation" framing and notes the companion-file resolution, but does not present "threading is wrong in principle" as a live alternative that the evidence also supports.

*Belief mapping:* A reader who holds that agent-consumption requirements (comprehensive, dense, navigational-index-structured) are genuinely incompatible with human first-encounter requirements (low-density, scent-rich, progressively disclosed) would read the companion-file recommendation as correct but for a different reason than the essay states — not as "better threading" but as "proper separation."

**Alternative framing C: The cycle's five threads do NOT share a unifying mechanism, and the methodology should treat them as independent problems**

The essay's §3 close states: "The cycle's threads share a structural family — context, audience, and reading-task awareness in artifact and turn design — rather than a single mechanism." This is accurate and represents an important recalibration. However, the essay's overall structure — treating all five threads under a single research arc culminating in a unified diagnostic frame — enacts a narrative coherence that slightly overwrites the finding. The Q2 lit-review's synthesis explicitly states that the five mechanisms are not mutually exclusive and that context determines which dominates. Under a strictly thread-separatist framing, each thread (nomenclature leakage, document legibility, folder hygiene, verbosity, agent turns) would have its own independent diagnostic analysis and independent intervention, with no presumed connection. The essay's synthesis narrative is intellectually richer, but it does produce one framing choice that the evidence does not require.

*Belief mapping:* A reader who holds that the five threads are independent problems would evaluate each of the four response sections independently, without assuming that solving context-mismatch will also partially address agent turn structure or nomenclature leakage. The essay's integrated framing is arguably more useful for downstream phases, but it is a framing choice, not an evidence-mandated conclusion.

---

### Question 2: What truths were available but not featured?

**Available truth A: Decker's "AI Burnout" post was scoped to its comprehension thread, and the essay does not acknowledge this scoping decision**

The research log records Decker's post faithfully and notes explicitly that the user's draw was a partial filter of the post's broader political/equity argument. The research log records what was *not* drawn: the central political/equity argument, the emotional and institutional mechanisms of burnout as political defeat, and the post's principled critique of AI mandates and loss of agency. The essay does not cite Decker at all — the source does not appear in the references section. This is a legitimate scope decision: the cycle's purpose is comprehension-preserving readability work, not a broader cultural intervention. However, the essay presents the user's field evidence and framing as if it arose purely from methodology observation, without acknowledging that an external source shaped the cycle's entry framing in ways the essay excised. For a reader who encounters Decker's post independently, the essay's selective appropriation of its comprehension thread without acknowledgment produces a misleading picture of the source's actual character.

*Why excluded:* Explicit scope decision by the user, recorded in the research log. Not an oversight.

*Would inclusion change the argument:* No — the scope decision is defensible. But a one-line footnote or inline acknowledgment that Decker's full argument is not engaged would give the essay more honest scope-of-claim.

**Available truth B: The agent-README empirical finding (Nguyen et al. 2025) is not cited in the essay**

The Q2 lit-review retrieved and used arXiv 2511.12884 (Nguyen et al. 2025) — an empirical study of CLAUDE.md-style agent context files showing median readability at 16.6 (legal-document level) and structural divergence from human-readable documentation. This finding provides the most direct empirical evidence that agent-optimized artifacts are quantitatively hostile to human reading — more direct even than the theoretical accounts from Pirolli & Card or Sweller. The essay does not cite it. It appears in the Q2 lit-review's findings but was not carried into the essay's synthesis. The essay cites Rukmono et al. (2024) and Ernst & Robillard (2023) as its empirical anchors for the human-vs-agent divergence, but Nguyen et al. provides stronger specificity on the magnitude of the human-readability penalty from agent-density.

*Why excluded:* The omission appears to be a synthesis selection rather than a deliberate scope decision. The finding would not change the essay's conclusions but would strengthen the empirical grounding for §4.1's companion-file rationale.

**Available truth C: The expertise reversal effect's applicability to the agent-vs-human distinction is unexamined**

The Q2 lit-review notes: "No parallel research was found on how the [expertise reversal] effect manifests in AI agent versus human reader contexts. The agent is effectively an 'expert' at processing dense reference text in a way that human first-encounter readers are not, but whether the artifact designs that serve agents are harmful (not just less helpful) for humans in ways analogous to the expertise reversal effect has not been studied." This is a genuine gap with potential downstream significance — if the analogy holds, then agent-optimized artifacts may not merely fail to serve human readers but may actively impair their comprehension in ways analogous to expert scaffolding harming novice readers. The essay uses the expertise reversal effect (Kalyuga) as a framework but does not explore this extension, which would sharpen the argument for companion files over threading.

*Why excluded:* Likely a scope decision to avoid speculative extension of an unvalidated analogy. Appropriate omission at essay level, but the gap warrants naming.

---

### Question 3: What would change if the dominant framing were inverted?

The essay's dominant framing is: *the comprehension failure is primarily a context-mismatch problem, and the correct response is structural moves at the margin of the existing corpus (companion files, decomposition, continuous documentation, diagrams as toolkit).*

**Inverted framing:** *The comprehension failure is primarily a prior-familiarity problem, and the correct response is context-building before document encounter rather than document restructuring.*

Under the inverted framing:

- The four supported responses in §4 become secondary mitigations rather than primary responses. Companion files, upstream decomposition, and continuous documentation address real but subsidiary mechanisms.
- The essay's most actionable recommendation — companion files at predictable paths — would need to be accompanied by a prior-context scaffolding artifact (an orientation summary or conceptual introduction specifically for zero-prior-familiarity readers) as a co-equal intervention.
- The verbosity thread ("1500 words to say what could be 500 plus a diagram") becomes less central — if prior familiarity is the dominant variable, then verbosity reduction may have limited effect on the failing audience regardless of document length.
- §4.4's diagram qualification ("diagrams are well-suited for spatial-structural orientation at appropriate granularity") becomes less consequential if even well-designed diagrams cannot compensate for zero-schema state in a zero-prior-familiarity reader.

The inverted framing does not falsify the essay's conclusions — the mechanisms the essay addresses are real and addressable. But it reveals that the essay's synthesis may be systematically under-investing in the prior-familiarity axis because the primary intervention vector (context-building tools) is harder to implement than structural moves within the existing corpus. The essay's §5 names this gap honestly. The framing audit notes that it is structurally understated relative to the evidence that motivated it.

---

### Framing Issues

**Framing P2-A — Decker's post used without acknowledgment of scope decision**

- **Location:** Essay references section; §1
- **Claim:** The essay uses the cycle's field evidence and framing without attributing the Decker source it drew from, and does not acknowledge that the cycle's engagement with that source was explicitly partial.
- **Evidence gap:** The research log records the source faithfully and notes the scope decision. The essay omits the citation entirely.
- **Recommendation:** Add Decker (2025) to the references section (it is already cited in the essay's reference list, correctly). However, the essay would benefit from a one-sentence acknowledgment in §1 or §2 that the cycle's engagement with Decker's post was specifically through its comprehension and friction threads, not its full political/equity argument. This makes the scope-of-claim honest without requiring engagement with out-of-scope material. [Note: upon re-reading the essay's reference section, Decker (2025) does appear in the bibliography — but the essay body never cites it, producing a bibliographic phantom. Either the body should cite it at the point it was actually used, or the reference should be removed.]

**Framing P2-B — Prior-familiarity intervention underrepresented relative to its evidential weight**

- **Location:** §4 (four supported responses), §5 (open questions)
- **Claim:** The essay's four supported responses address mechanism levers without giving equal visibility to the intervention suggested by the cycle's strongest empirical anchor (prior-familiarity dominance).
- **Evidence gap:** The Q2 lit-review states: "Ernst and Robillard (2023) suggest that format and organization — the 'readerly usability' dimension — may not be the primary lever. Prior familiarity dominates. If the external stakeholders who find the docs overwhelming would find them equally overwhelming if reorganized but were still encountering the codebase without prior exposure, then 'readerly usability' improvements may have limited effect without also providing context-building tools." The essay's §5 names this gap, but as an open question rather than as an unimplemented intervention with the same weight as the four responses in §4.
- **Recommendation:** Consider either (a) elevating the prior-familiarity intervention into §4 as a fifth supported response direction (context-building artifacts for zero-prior-familiarity readers), or (b) adding a brief note to §4's opening that the four responses address real mechanisms but operate below the dominant empirical variable — and that orientation artifacts specifically designed for zero-prior-familiarity readers would be the most direct intervention if Ernst & Robillard's finding is read directionally. This is a judgment call for the user, not a blocking issue.

**Framing P3-A — Essay does not self-apply its own orientation principles**

- **Location:** §1 (entry paragraph), abstract
- **Claim:** The essay investigates context-mismatch, F-pattern scanning, front-loaded density, and the need for orientation before density — and then opens with a 200-word abstract followed by a 200-word first paragraph that requires substantial prior knowledge of RDD terminology (Tier-2 documents, corpus, artifact corpus, ORIENTATION.md) before the reader has any orientation frame. The abstract is dense and premise-heavy. A first-encounter reader without RDD familiarity would need to read several paragraphs before gaining an orientation scaffold.
- **Evidence gap:** This is a reflexive failure — the essay commits, in its first 400 words, the precise error it diagnoses: front-loading dense reference material at the moment intrinsic load is highest for a first-encounter reader. The abstract is well-written for a reader who already knows RDD; it is difficult for a reader who does not. The essay does not lead with a brief orientation frame before the substantive diagnosis.
- **Recommendation:** Minor: the abstract could open with one or two sentences establishing the plain-English problem before introducing RDD-specific vocabulary. This is P3 because the essay is a research essay, not a Tier-2 system document, and its primary audience is the user who already has RDD context. But for an essay explicitly about first-encounter comprehension, the irony is worth noting at the epistemic gate.

**Framing P3-B — Methodology credit in §6 places attribution at the wrong level**

- **Location:** §6, final paragraph
- **Claim:** "The methodology's research discipline is not ceremony. It is what allows the cycle to find that the diagnosis it entered with was the wrong shape."
- **Evidence gap:** As noted in argument issue 2.4, the recalibration had at least three contributing causes: the methodology's structural scaffolding, the user's epistemic openness to revising hypotheses, and the lit-reviewer subagents' isolated context (which prevented anchoring on the user's prior). The framing in §6 places all credit with the methodology, which is a rhetorical choice that the evidence supports only partially. The methodology created the structural conditions; the user and the subagents' isolation did the epistemic work.
- **Recommendation:** Acknowledge the joint contributors. The methodology's role is real and the conclusion is not wrong, but locating the recalibration entirely within methodology-as-author rather than methodology-as-scaffold conflates the tool with the practitioner using it. This is P3 because the claim is defensible and the essay is the methodology's own self-description — some reflexive credit is natural and appropriate.

---

## Summary

The essay is well-evidenced, carefully hedged in its interior text, and accurately represents the cycle's research findings. Its argument structure is largely sound. The P1 issue is consequential: the Ernst & Robillard citation in §3 is used at greater precision than the source warrants, and its scope limitation is deferred to §5 rather than present at the point of invocation. A reader who stops after §3 carries an overconfident reading of the study's applicability to the specific orientation-level scenario the cycle is investigating.

The P2 issues are non-blocking but materially affect the essay's epistemic honesty: "primary mechanism" slightly overstates a finding that the literature calls "most structurally fundamental"; the four-mechanism Q4 ledger is presented as the literature's framing without acknowledging it is the review's synthesis; continuous documentation's empirical grounding is attributed to the framework rather than to the peer-reviewed studies it draws from; and the methodology credit in §6 excludes the user's epistemic openness and the subagents' isolation as co-contributing factors.

The framing audit's most significant finding is Framing P2-B: the strongest empirical anchor in the cycle (Ernst & Robillard's prior-familiarity dominance) points toward context-building tools as the primary intervention, but the essay's four supported responses are all structural moves on existing documents. The essay names this gap in §5 but frames it as an open question rather than an unimplemented intervention of comparable weight. This is a judgment call for the user at the epistemic gate: whether to acknowledge prior-familiarity scaffolding as a co-equal fifth response direction, or to leave it as a named limitation pending downstream phases.

The essay is ready for the epistemic gate with the P1 fix applied and the P2 and framing issues surfaced for user judgment. It is not ready in its current form if the Ernst & Robillard citation in §3 is read by an audience unfamiliar with §5's qualifications.

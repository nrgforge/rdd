# Research Design Review

**Reviewed question set:** `/Users/nathangreen/Development/rdd/docs/essays/research-logs/research-log.md` — Steps 1.1 and 1.2 (Q1–Q3 plus the essay-as-research-artifact constraint-removal response), evaluated as one artifact.
**Constraint-removal response included:** Yes
**Date:** 2026-05-11

---

## Summary

- **Questions reviewed:** 3 (Q1–Q3) plus constraint-removal response, evaluated together
- **Flags raised:** 4 (1 P1 blocking, 2 P2 non-blocking, 1 P3 observation)
- **Criteria applied:** 1–4 (ADR-082 full set)

The constraint-removal response is substantive and engaged — the strongest in the corpus. It reorients Q1's frame from authorship-ambiguity to susceptibility-surface-area, a genuine conceptual advance that tightens the research's falsifier structure. Q2 is well-formed and need-scoped. Q3 is appropriately modest — a co-illumination question, not a question that presupposes convergence.

One embedded conclusion in Q1 requires attention before the research loop runs. One blocking incongruity is present: the question set does not examine whether the simpler move (make `/rdd-research` match `/rdd-synthesize` structurally, without further investigation) has already been answered by the 16-cycle empirical record, and whether what Q1 is actually proposing is an extension of that simple move or something structurally different from it. Two non-blocking concerns follow.

---

## Per-Question Review

### Question 1: "Should `/rdd-research`'s primary artifact be a structured outline with inline citations rather than a prose essay..."

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

The researcher would need to believe that the choice between outline and essay is the decision variable with the most leverage on susceptibility. A different question would be more productive if the operative variable is not artifact *form* (outline vs. prose) but artifact *attachment* — whether the citation and argument audits are attached with equal mechanistic force regardless of form. Under that belief, the more productive question is: "What properties of an artifact make audit-attachment genuinely constraining rather than performative, and does form — outline vs. prose — affect audit-attachment fidelity?" The constraint-removal response gestures at this ("a well-organized outline that provides sufficient information that can be audited"), but the question as posed anchors to form rather than to audit-attachment properties. If the answer is that audit-attachment fidelity is form-independent — that a prose essay with mechanistic citation and argument audit attachment is equally "minimally susceptible" to the mechanisms the user cares about — then the question has presupposed the operative variable.

The researcher would also need to believe that "minimally susceptible" is best achieved via *content-surface minimization* rather than via *structural-resistance mechanisms within the existing prose form*. Essay 013 (sycophancy-and-rdd-reflexivity) is the relevant prior art here: it argues that sycophancy operates through content selection, not tone (Cheng et al. 2026), and that structural resistance comes from contact with non-sycophantic systems, not from form reduction. A different question surfaces: "Does reducing the surface area of the artifact reduce susceptibility via a different mechanism than making non-sycophantic auditors harder to satisfy-by-omission?" These may be complementary, but the distinction is load-bearing and the question as posed does not invite the researcher to examine it.

**Embedded conclusions.** Flagged — moderate severity.

"The user's posited proposal is yes — extend the pattern `/rdd-synthesize` already uses (agent produces outline, human writes prose) upstream to RESEARCH."

The question names and endorses the proposed solution in the question body. "The user's posited proposal is yes" is not a neutral framing device — it signals to the research loop that the direction of travel is established and investigation should confirm or qualify it. This is the same pattern as "What's the best way to implement X?" — the mechanism to implement has been selected before the question is examined.

The critical observation: the user *appropriately* identified this as the kind of question that warrants constraint-removal, and the constraint-removal response *does* bracket the essay-as-artifact precedent. But the constraint-removal response itself converges on the same conclusion the question named: "The hypothesis: a well-organized outline that provides sufficient information that can be audited — and nothing else — should be minimally susceptible." So the constraint-removal response confirms the embedded conclusion rather than bracketing it. The artifact that was supposed to be bracketed (the essay form) was bracketed; the proposed solution (the outline) was not bracketed. This is a structural gap in ADR-082's constraint-removal protocol as applied here: the constraint-removal response surfaces the falsifier for the *existing artifact* but does not apply constraint-removal to the *proposed replacement*.

Suggested reformulation: "What properties should the RESEARCH phase's primary artifact have to maximize audit-fidelity, minimize susceptibility to sycophancy and framing-adoption, and effectively feed downstream phases — and how do different artifact forms (prose essay, structured outline, annotated bibliography, formal specification, hybrid) compare against those properties?"

This preserves the underlying need while removing the presupposed conclusion that outline is the answer. The user's hypothesis (outline form, susceptibility-surface minimization) becomes a candidate to evaluate rather than a proposal to confirm or deny.

**Scope.** Too narrow as written. The question investigates outline-vs-essay without establishing the evaluative criteria against which both should be judged. The sub-question (does the argument audit carry the load?) is the right scope, but it appears as a sub-question to a main question that has already implicitly answered "outline is right, now let's see what needs strengthening." The evaluative criteria should be the main question, with the outline hypothesis as one candidate to evaluate against those criteria.

---

### Question 2: "How does each RDD phase align with, diverge from, or stand independent of the CRESS principles for context engineering?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

The researcher would need to believe that CRESS provides the relevant evaluative frame for assessing RDD phases. A different question would be more productive if the operative frame is not CRESS specifically but the broader category of context-engineering principles of which CRESS is one formulation — and if other formulations (from the structured prompting literature, the anthropic system prompt design work, the software architecture tradition's treatment of interface contracts) would produce substantively different assessments. Under that belief, the more productive question is: "What evaluative frameworks exist for context engineering, and where do they converge and diverge in how they would assess RDD's phases?"

This is a mild concern: CRESS is a specific, recent, named framework with a concrete post to examine, and using it as the anchor for a phase-by-phase audit is appropriate research design. The question that surfaces from this belief-mapping does not invalidate Q2 — it suggests a research sub-task (contextualize CRESS within the broader context-engineering literature before applying it to RDD).

The researcher would also need to believe that CRESS's divergences from RDD can be cleanly categorized as principled vs. accidental. A different question would be more productive if the divergences are better understood as *scope-relative* — CRESS is written for a particular understanding of "context," and RDD's phases may operate at a different layer of context such that some apparent divergences are not divergences but operating at different levels. This is a refinement concern, not a scope concern.

**Embedded conclusions.** None flagged. Q2 is appropriately open: it asks where phases align, diverge, and are independent — it does not presuppose that CRESS is correct, that RDD is deficient, or that divergences are necessarily problems. The principled-vs-accidental distinction is a clean analytic frame, not a presupposed conclusion.

**Scope.** Appropriate. The question is scoped to a specific artifact (CRESS post) and a specific comparative task (phase-by-phase alignment). The scope is broad enough to be substantive without being unbounded.

---

### Question 3: "Do Q1 and Q2 co-illuminate — does CRESS bear directly on the artifact-form question — or are they parallel investigations?"

**Belief-mapping.** What would the researcher need to believe for a different question to be more productive?

The researcher would need to believe that the co-illumination question is answerable after research and that the answer is a meaningful finding. This is appropriate: Q3 is a meta-question about the relationship between Q1 and Q2, and treating the relationship as a finding-to-discover rather than an assumption is correct research design.

A different question would be more productive if the co-illumination is not just a finding but a design constraint — if the research plan should be structured to force the two threads to confront each other's conclusions rather than running in parallel and then checking for convergence. This is a mild process concern: the research plan as described (Foundation Loops A, B, C running in parallel, Synthesis Loop D addressing Q3) sequences the co-illumination check after the parallel loops complete. This is reasonable, but it creates risk that the two threads develop internally consistent frames that are harder to integrate than if they had been structured to conflict with each other earlier.

**Embedded conclusions.** None flagged. "The convergence (or its absence) is itself a finding" is exactly the right epistemic posture for a co-illumination question.

**Scope.** Appropriate and well-calibrated. Q3 is a correctly modest meta-question — it does not predict convergence, it makes convergence discoverable.

---

## Constraint-Removal Response Review

**Response substance.** Engaged and substantive — the strongest constraint-removal response in the corpus. The user did not produce a "we would rebuild the same thing" response, and did not produce a null answer. The response genuinely reframes the question: the outline-vs-essay choice is not primarily about authorship ambiguity or human readability (the surface concerns that might have motivated the cycle), but about susceptibility-surface-area. This is a conceptual advance that tightens the falsifier structure and makes the research more tractable. The "minimally susceptible" framing is a genuine theoretical contribution to the question, not a restatement of it.

**Embedded conclusions in the response.** Flagged — same structure as Q1's embedded conclusion, and this is the more significant instance.

The constraint-removal response brackets the *existing artifact* (the essay form, 16-cycle precedent) and then converges on the *proposed replacement* (the outline) as its answer. The structural function of the constraint-removal prompt is to open the solution space; the response narrows it back to the proposed solution. The response does this in a sophisticated way — via the susceptibility-surface-minimization argument — which makes the convergence feel earned rather than reflexive. But the effect is the same: after the constraint-removal exercise, the solution space is essay-or-outline with outline as the favored candidate, when the design-from-scratch moment should hold that space open further.

The response does not consider:
- Whether a *hybrid* form (prose with mandatory structured sections, like a structured abstract + narrative body) achieves similar susceptibility-surface-minimization while preserving prose's advantages
- Whether *audit-protocol extension* (more mechanistic citation and argument enforcement within prose) achieves the susceptibility goal without changing artifact form
- Whether *annotated bibliography with synthesis notes* is a closer prior-art match than the outline form

These are not criticisms of the user's hypothesis — the outline hypothesis may be correct. But the constraint-removal response should have surfaced these alternatives as comparanda. The absence means the research plan will need to do this surfacing work that the constraint-removal response was supposed to initiate.

One partial mitigation: Foundation Loop C (minimal-surface artifact design across disciplines) will surface some of these alternatives. The gap is that the constraint-removal response did not surface them as live competing options — it surfaced susceptibility-surface-minimization as the theoretical frame and then treated outline as the natural instantiation of that frame. The research loop will need to hold "other instantiations of the susceptibility-surface-minimization principle" as an explicit research question.

---

## Question Set Assessment

### Premature narrowing / prior-art treatment

**Prior-art treatment: satisfied by the constraint-removal response.** The response brackets the essay-as-research-artifact pattern as prior art — it asks what would be reached for in its absence — and produces a substantive finding (susceptibility-surface-area reframe). The criterion is met.

**Premature narrowing: detected at the proposed-solution level.** The question set plus constraint-removal response converges on outline-form as the candidate solution without establishing the evaluative criteria against which outline form should be judged. The research plan (Foundation Loops A, B, C) will need to establish those criteria, but the question set does not name "establish evaluative criteria first" as an explicit research task. This is a non-trivial omission: if the research loop runs Foundation Loops A, B, C and returns findings on CRESS, AI-prose critique, and prior-art minimal-surface design, those findings may all be evaluated against the outline hypothesis rather than used to generate and compare multiple candidate forms. The research plan's dogfooding decision (produce both prose and outline in isolated subagents at Step 4) partially mitigates this — it forces a two-form comparison — but the comparison is outline-vs-prose rather than outline-vs-structured-hybrid-vs-annotated-bibliography-vs-audit-extended-prose.

---

### Incongruity surfacing — P1 FLAG

**Criterion:** Incongruity surfacing (ADR-082 Criterion 4).

**The incongruity.** The research context contains an incongruity the question set does not examine.

`/rdd-synthesize` already uses the outline-as-artifact pattern. The agent produces an outline; the human writes the prose. This is established practice in the corpus and is named in Q1's framing as the pattern being "extended upstream." But `rdd-synthesize` and `/rdd-research` serve structurally different functions: Synthesize produces an outline that the human uses as input for a *communicative act* (the essay, the talk) — the outline is a scaffold for human writing. Research produces an artifact that *downstream agents read* — it feeds DISCOVER, MODEL, DECIDE, ARCHITECT. These are not the same function.

Here is the incongruity: the question set treats extending the Synthesize pattern upstream as the research proposal to investigate, but the two phases have fundamentally different artifact audiences. Synthesize's outline is human-facing; Research's artifact is agent-facing (feeds downstream phases). The minimal-surface hypothesis (outline = less susceptibility surface) may be correct for a human-facing artifact. For an agent-facing artifact, the operative question is different: does an outline give the downstream agent sufficient structure to work from, or does the downstream agent require the connective tissue that prose provides?

This is the incongruity: a simple pattern (Synthesize's outline) is being extended to an adjacent context (Research) where the audience and consumption mode are different. The question set does not examine whether the Synthesize pattern's properties transfer to the Research context, or whether Research's downstream-agent-facing function introduces requirements that Synthesize's human-facing function does not.

The question the set is not asking: *When `/rdd-research`'s artifact feeds downstream agents (DISCOVER, MODEL, DECIDE) rather than a human writer, does the minimal-surface outline form preserve the feed-forward value that prose narrative provides — and what evidence from the 16-cycle corpus exists about how downstream phases use research essay content?*

This is not a question with a predetermined answer. It may be that downstream agents handle outline-form input as well as or better than prose-form input — structured information is often easier for agents to parse. But the question has not been examined. The research plan's Validation Spike S1 (audit-fidelity comparison on Essay 016) tests audit-surface preservation, not downstream-feed-forward preservation. These are different properties.

**Recommendation (P1):** Before the research loop runs, add a question that directly examines the downstream-feed-forward function of the research artifact: "What downstream phase functions depend on the Research artifact, what form of content do those functions require, and does outline form preserve that feed-forward value?" This question should inform what counts as a successful artifact form — the evaluative criteria the question set is currently missing.

---

### P2: Constraint-removal response does not bracket the proposed replacement

**Criterion:** Embedded conclusions (ADR-082 Criterion 2) applied to the constraint-removal response.

**The issue.** As noted in the response review above, the constraint-removal response brackets the existing artifact (the essay form) but converges on the proposed replacement (the outline) as the imagined-without-it answer. The structural function of the constraint-removal protocol is to hold the design space open; the response holds it open with respect to the essay form and closes it with respect to the outline form. This is a predictable failure mode when the user enters the constraint-removal moment with a strong hypothesis already in mind — the constraint-removal prompt opens one constraint while the hypothesis closes the adjacent one.

This is not a blocking issue for the research loop if the research plan explicitly holds "alternative instantiations of the susceptibility-surface-minimization principle" as a live research question. Foundation Loop C is the natural location for this work: minimal-surface artifact design across disciplines includes structured abstracts, pre-registration forms, formal specifications, annotated bibliographies, and hybrid forms. The loop should be briefed to treat these as comparanda for outline form, not as context for it.

**Recommendation (P2, non-blocking).** Brief Foundation Loop C to explicitly evaluate alternative instantiations of susceptibility-surface-minimization: which prior-art minimal-surface forms also satisfy the audit-attachment and downstream-feed-forward criteria? The Dogfood Decision at Step 4 (prose vs. outline in isolated subagents) should be expanded or complemented to include one hybrid form if Loop C surfaces a strong candidate.

---

### P2: The argument-audit extension sub-question may be circular

**Criterion:** Embedded conclusions (ADR-082 Criterion 2) applied to Q1's sub-question.

**The issue.** Q1's sub-question: "Does the existing argument audit carry that load [of stronger argument if outline form is adopted], or does it need extension?"

This sub-question is well-formed as a question about the argument audit's capabilities. But it embeds a chain of assumptions: (1) outline form is adopted, (2) the outline must carry stronger argument to compensate for what prose narrative previously did, (3) the strengthening site is the argument audit. Assumption (2) is a hypothesis about what prose narrative does that outlines do not — and it may be false. If the argument in a prose essay is primarily carried by citation and claim structure rather than by narrative flow, outlines may carry equivalent argument without needing a stronger audit. The sub-question skips this examination.

Additionally, if the argument audit's parsing of the argument trail is the strengthening site, strengthening the argument audit rather than changing artifact form is also a coherent path — one that preserves prose while fixing the audit. Q1's sub-question does not examine this path.

**Recommendation (P2, non-blocking).** Add one research task to the foundation loops (or the Validation Spike): characterize what prose narrative does for the argument trail that outline structure does not — specifically whether narrative connective tissue carries argument structure or whether it primarily carries persuasive flow. If it carries argument structure, the sub-question is load-bearing. If it primarily carries persuasive flow, the sub-question's premise (outline argument must be stronger to compensate) is not established, and the audit-extension move may be solving the wrong problem.

---

### P3: "Minimally susceptible" requires operationalization before the epistemic gate

**Criterion:** Additional consideration — testability.

**The issue.** The constraint-removal response introduces "minimally susceptible" as the central evaluative concept. The research should operationalize this before the epistemic gate. "Minimally susceptible" has two dimensions in context: (a) susceptibility to sycophancy and framing-adoption, and (b) susceptibility to the AI-prose critique landscape. These are not the same. A form may be minimally susceptible to (a) while being maximally targeted by (b), or vice versa.

The research plan's Validation Spike S1 tests audit fidelity — which is relevant to dimension (a) but does not directly measure susceptibility reduction. What susceptibility-reduction evidence would look like: either a theoretical argument that structural form affects the sycophancy mechanisms identified in Essay 013 (Cheng et al.'s content-selection mechanism, Dubois et al.'s assertion-vs-question finding), or an empirical comparison that controls for audit-attachment while varying form. Neither is currently specified as a research task.

For dimension (b), the AI-prose-critique landscape (Foundation Loop B) will clarify what the critique objects to. But the research should establish whether those objections apply to *audited* AI prose or to *unaudited* AI prose — a distinction that may substantially change whether the outline move is necessary or whether audit-attestation is sufficient response to the critique.

**Recommendation (P3, address before epistemic gate).** Before the research-to-discover gate, operationalize "minimally susceptible" into two testable formulations: one for sycophancy/framing-adoption susceptibility and one for AI-prose-critique susceptibility. The research findings should be evaluated against both formulations — and the gate evaluation should assess whether the outline hypothesis actually reduces susceptibility by these measures, rather than by the intuition that less surface equals less susceptibility.

---

### Coverage gaps

**The question set does not examine what the 16-cycle essay corpus itself shows about Research artifact use.** Sixteen essays exist. The question of how they are consumed — whether they are read by the user, read by downstream phase agents, or primarily function as citation/argument audit surfaces — is empirically examinable within the corpus. The research log mentions that "in the user's experience, the research essays produced by `/rdd-research` are not human-read." This is a significant empirical claim that could be examined via the cycle corpus: do the downstream phase artifacts (DISCOVER logs, MODEL glossaries, DECIDE ADRs) cite or quote from the essays? If downstream agents read the essays in the research log, that pattern is traceable. If they do not, the essays' value is primarily in the audit surface they provide — which would substantiate the minimal-surface hypothesis. This examination is not in the research plan.

**The question set does not name the skill-text change as the implementation unit.** Q1's answer, if affirmative, changes the `/rdd-research` skill's Step 4 instruction from "produce a citation-audited and argument-audited essay" to "produce a citation-audited and argument-audited outline." The skill text (examined above at `skills/research/SKILL.md`) is the operative artifact. Whether the skill text change has second-order effects on the research loop mechanics (the skill's research loop is currently oriented toward essay production) is not examined.

---

### Recommendations (prioritized)

**P1 — add before research loop runs:**

1. Add a question examining the downstream-feed-forward function of the Research artifact: what does DISCOVER/MODEL/DECIDE consume from the research essay, and does outline form preserve that feed-forward value? This question establishes the evaluative criteria the question set currently lacks and surfaces whether the Synthesize-pattern extension to Research is a valid analogy. Without this, the research loop may produce findings about audit-fidelity and susceptibility while leaving the downstream-feed-forward question unexamined until Step 4's dogfooding experiment.

**P2 — consider before dispatching Foundation Loops:**

2. Brief Foundation Loop C to explicitly evaluate alternative instantiations of susceptibility-surface-minimization (hybrid forms, structured abstracts, annotated bibliographies, audit-extended prose) rather than treating outline form as the natural instantiation of the principle. The constraint-removal response's convergence on outline form means this surfacing work did not happen there — it must happen in the research loop.

3. Add a research task (within Validation Spike S1 or alongside it) characterizing what prose narrative contributes to the argument trail beyond persuasive flow. If prose carries argument structure that outline does not, the sub-question about argument-audit extension is load-bearing. If prose primarily carries persuasive flow, the sub-question premise is not yet established and may be directing research toward the wrong intervention site.

**P3 — address before epistemic gate, not before research loop:**

4. Operationalize "minimally susceptible" into two testable formulations (sycophancy/framing-adoption; AI-prose-critique) before the research-to-discover gate. The research findings should be evaluable against specific criteria, not against the intuition that less surface is less susceptible. Essay 013's framework (Cheng et al. content-selection mechanism; Dubois et al. assertion-vs-question finding) is the natural starting point for the sycophancy dimension.

5. Examine whether audit-attestation itself is sufficient response to the AI-prose-critique landscape, or whether the critique targets audited and unaudited AI prose equally. If the former, the outline move may be unnecessary for dimension (b) of the susceptibility concern. This examination is naturally part of Foundation Loop B and can be framed as a sub-question there.

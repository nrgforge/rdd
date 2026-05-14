# Research Log: Cycle 018 — Outlines as Research Artifacts and CRESS Audit

**Cycle:** 018
**Started:** 2026-05-11
**Driving essay (planned):** 017-outlines-and-cress.md (filename may change as scope clarifies)

---

## Research Questions (Step 1.1 — articulated by user before reading the artifact corpus; revised after Step 1.4 reviewer findings)

**Q1. Outline-as-research-artifact (lead hypothesis; widened comparanda per reviewer P1/P2).**
Should `/rdd-research`'s primary artifact be a structured outline with inline citations, **compared against alternative forms (hybrid prose-with-structured-sections, annotated bibliography with synthesis notes, audit-extended prose)**, given that the audit infrastructure (citation/argument/framing) attaches to structure and AI-generated prose is under critique across many domains? The user's posited proposal is that outline form is the lead hypothesis. Competitors are evaluated against the same criteria — susceptibility-surface-minimization, audit-fidelity, and downstream-feed-forward preservation. The pattern under consideration is the extension of `/rdd-synthesize`'s outline pattern upstream to RESEARCH, qualified by the audience difference identified in Q4.

*Sub-question surfaced by the user during falsifier elicitation:* If outline form is adopted, the argument the outline carries must be stronger to compensate for what prose narrative previously did. The strengthening site is the **argument audit's parsing of the argument trail** — does the existing argument audit carry that load, or does it need extension? *Sub-question premise to characterize (reviewer P2):* What does prose narrative contribute to the argument trail beyond persuasive flow — argument structure, or primarily flow? If primarily flow, the sub-question premise is not established and audit-extension may be solving the wrong problem.

**Q2. CRESS audit across phases.**
How does each RDD phase align with, diverge from, or stand independent of the CRESS principles for context engineering (Codemanship, 2026-05-04: https://codemanship.wordpress.com/2026/05/04/c-r-e-s-s-principles-for-context-engineering/)? Where divergences exist, are they principled (the methodology made a different choice deliberately) or accidental (the methodology has not yet confronted CRESS's frame)?

**Q3. Co-illumination of Threads 1 and 2.**
Do Q1 and Q2 co-illuminate — does CRESS bear directly on the artifact-form question — or are they parallel investigations? The research treats them as potentially convergent; the convergence (or its absence) is itself a finding.

**Q4. Downstream feed-forward (new per reviewer P1).**
What do downstream phases (DISCOVER, MODEL, DECIDE, ARCHITECT) consume from the research artifact, and does outline form (or any candidate form) preserve that feed-forward value? The Synthesize-pattern-extension analogy has an audience mismatch: Synthesize feeds a human writer; Research feeds downstream agents. Minimal-surface arguments for human-facing artifacts do not automatically transfer to agent-facing ones. **Empirical corpus check:** examine the 16-essay corpus to see whether downstream phase artifacts (product-discovery.md, domain-model.md, ADRs, system-design.md) cite, quote, or reference research essay content. If downstream artifacts use essay content substantively, that establishes feed-forward as a load-bearing function. If not, that substantiates the minimal-surface hypothesis directly.

## What would shift the user's current position on Q1

Primary falsifier the user identified: **audit fidelity loss** (outlines might lose audit equivalence relative to prose). Important qualification the user added: this implies the **argument trail itself** needs to do more work, with the argument audit as the strengthening site — not that prose form is required. The position is held with calibrated uncertainty, not strong conviction.

The user did not select critique-misfit or outline-failure-modes as primary falsifiers, but they remain on the table as potential findings the research should be alert to.

**Additional falsifier surfaced by Step 1.4 review:** if the corpus check (Q4) shows that downstream phase artifacts substantively consume research essay content (citations, quoted passages, conceptual reuse beyond what an outline would carry), the minimal-surface hypothesis would need to be qualified for an agent-facing audience.

---

## Constraint-Removal Response (Step 1.2)

**Most consequential existing artifact** (named by agent): the **essay-as-research-artifact pattern** — the prose form `/rdd-research` has instantiated 16 times in this corpus (Essays 001–016). Its presence shapes the default solution space for "what should the RESEARCH phase produce." Path of least cognitive resistance; any alternative argues against weight of precedent.

**Constraint-removal prompt posed:** Imagine the essay-as-research-artifact pattern were not an option. No precedent of 16 prior essays, no convention that `/rdd-research`'s deliverable is prose. If designing the RESEARCH phase's output from scratch right now — given only the goals (crystallize understanding, preserve the audit surface, feed downstream phases, leave a durable record) — what would be reached for?

**User's imagined-without-it framing (verbatim sense):**

The answer to this question is what motivated the cycle. The user has been reading the CRESS blog post and other commentary about the proliferation of AI prose. The user's forming opinion: don't publish AI-written content. The impulse driving the cycle: **minimize the information needed to drive the cycle effectively, in order to get specific**.

The user's hypothesis: **a well-organized outline that provides sufficient information that can be audited — and nothing else — should be minimally susceptible.**

**Key concept surfaced: "minimally susceptible."** Susceptible to what? In context, susceptible to (a) sycophancy and framing-adoption (the Cycle 013+ line of work, ADR-055/ADR-058/ADR-082), and (b) the AI-prose-critique landscape that motivated the cycle (CRESS, broader commentary). Prose has tonal choices, framing decisions, persuasive flow, authorial voice. An outline is structure + claims + citations + audit attachment points. Less surface = less susceptibility.

This framing reorients Q1: the outline-vs-essay question is not principally about authorship-ambiguity or human-readership, though those matter. It is principally about **susceptibility surface area**. The outline form is hypothesized as a sycophancy-and-critique-resistance move via content-surface minimization.

**Implications for the research:**

1. The research must investigate whether the susceptibility-surface-minimization claim holds. Is there evidence that minimizing prose surface reduces sycophancy/framing-adoption vulnerability? (Cheng et al. 2026 is in-corpus; broader literature on minimal-surface artifact design may bear: pre-registration in science, formal specifications, contracts, schemas.)
2. The CRESS audit (Thread 2) is no longer purely parallel to Thread 1 — CRESS may bear on the susceptibility argument if any CRESS principle aligns with minimal-surface reasoning. Q3 (co-illumination) becomes more pointed.
3. The falsifier Q1 sub-question (does the argument audit carry the load?) is still live: if the outline is the minimum content, and that minimum must do all the argumentative work, the argument audit's argument-trail parsing is where weight lands.


---

## Research Plan (approved 2026-05-11)

The user's reframing — content-surface minimization for susceptibility resistance — narrows the research direction. Plan has three foundation loops, one validation spike, one synthesis loop.

**Foundation Loop A — CRESS + Codemanship context engineering writing.**
Web fetch the CRESS post (https://codemanship.wordpress.com/2026/05/04/c-r-e-s-s-principles-for-context-engineering/) and adjacent Codemanship posts on AI/context engineering. Web search for surrounding commentary. Output: research log entry on the CRESS principles, the context-engineering frame, how Codemanship situates this against AI prose.

**Foundation Loop B — AI-prose-critique landscape (2025–2026).**
Web search + targeted lit-review for substantive commentary on AI-generated prose in publishing, academia, journalism, methodology contexts. What does the critique object to (tone, opacity, dilution, voice-flattening, fabrication)? Does it land equally on audit-attested artifacts vs. unattested ones? Output: research log entry mapping the critique landscape and identifying where it does/doesn't apply to RDD's audited essays.

**Foundation Loop C — Minimal-surface artifact design across disciplines (revised brief per reviewer P2).**
Lit-review for prior art on "minimum sufficient content + audit attached" as a design pattern: pre-registration in science (Nosek/COS), formal specifications (Z, TLA+, structured authoring/DITA), contract drafting practice, structured abstracts (IMRaD), outline-vs-prose pedagogy in technical writing, anything on AI-generated content susceptibility and content-form choices. **Treat hybrid forms (structured abstract + narrative body), annotated bibliography with synthesis notes, and audit-extended prose as live comparanda for outline form — not as context for it.** Each comparandum is evaluated against the three criteria from Q1: audit-fidelity, susceptibility-surface-minimization, downstream-feed-forward preservation. Output: research log entry surfacing prior art with explicit candidate-form comparison.

**Research Task R1 — Prose contribution to argument trail (new per reviewer P2).**
What does prose narrative contribute to the argument trail beyond persuasive flow? Examine 2–3 essays from the corpus where the argument is non-trivially carried (candidates: Essay 013 sycophancy-and-rdd-reflexivity, Essay 014 specification-execution-gap, Essay 016 audience-at-the-margin). For each, identify: (a) what claims sit in body paragraphs that would not appear in an outline; (b) whether those claims carry argument structure (warrants, qualifications, evidence integration) or primarily carry persuasive flow (transitions, repetition, register); (c) what would be lost if the prose were reduced to outline form with the same citations. This task informs Q1's sub-question premise directly. Method: targeted re-reading + comparison sketch. Output: research log entry with the characterization.

**Research Task R2 — Downstream consumption corpus check (new per reviewer P1).**
Examine the 16-essay corpus and its downstream phase artifacts to characterize feed-forward. For each essay (or a representative sample if 16 is too many), check whether the corresponding cycle's product-discovery.md, domain-model.md, ADRs, system-design.md, and field-guide.md cite, quote, or reference the essay's content substantively. Distinguish between: (a) bare references (e.g., "see Essay 013"), (b) content reuse (specific concepts, frameworks, or claims drawn from the essay), (c) no reference at all. This task answers Q4's empirical sub-component directly. Estimated effort ~1 hour. Output: research log entry with the consumption map.

**Validation Spike S1 — Audit-fidelity comparison (ADR-087 decision: RUN).**
Question: Does the argument audit (with framing audit) carry equivalent fidelity on an outline form versus a prose form of the same research? Method: Take Essay 016 (most recent, "Initial Handoff and the Audience at the Margin"). Produce a structural outline derivation. Dispatch argument-auditor against both. Compare findings: same logical gaps surfaced? Same alternative framings identified? Where do they differ? Scope: single focused question, time-boxed, evidence-only.

**Synthesis Loop D — CRESS phase-by-phase audit (Thread 2).**
After CRESS is understood (Loop A), map each RDD phase against each CRESS principle. Identify alignments, divergences, principled-vs-accidental. Answers Q3 (co-illumination).

**Gate-prep task (deferred per reviewer P3, address before research → discover gate).**
Operationalize "minimally susceptible" into two testable formulations: (a) sycophancy/framing-adoption susceptibility, grounded in Essay 013's framework (Cheng et al. content-selection mechanism, Dubois et al. assertion-vs-question finding); (b) AI-prose-critique susceptibility, grounded in Loop B's findings. The research conclusions should be evaluable against both, not against the intuition that less surface equals less susceptibility. Loop B should additionally examine whether the AI-prose critique applies equally to audited and unaudited AI prose — if audit-attestation is sufficient response to the critique, the outline move may be unnecessary for dimension (b).

## Step 1.4 — User decisions on reviewer flags

Reviewer audit at `.rdd/audits/research-design-review-018.md` raised 1 P1 blocking, 2 P2 non-blocking, 1 P3 observation. User decisions:

- **P1/P2 Q1 reformulation:** Adapt — keep outline-centric but widen comparanda. Q1 now explicitly compares outline against hybrid prose-with-structured-sections, annotated bibliography, and audit-extended prose. Outline remains the lead hypothesis.
- **P1 Q4 + corpus check:** Add both. Q4 (downstream feed-forward) added. Research Task R2 added for the empirical corpus check.
- **P2 Loop C briefing:** Adopted. Loop C now treats hybrid forms, annotated bibliographies, and audit-extended prose as live comparanda.
- **P2 Prose-contribution task:** Adopted. Research Task R1 added.
- **P3 Operationalize "minimally susceptible":** Deferred to gate-prep task per reviewer recommendation.

## Dogfood Decision (artifact production, Step 4)

The cycle dogfoods the hypothesis under investigation. At Step 4 (artifact production), produce **both** forms — a prose essay AND a structured outline with inline citations — but **context-isolated from each other** so the differences can be understood independently rather than one being a transformation of the other.

Implementation: at Step 4, dispatch two parallel subagents in fresh contexts. Each is given the same research log and the corpus references it needs. Subagent A produces a prose essay. Subagent B produces a structured outline with inline citations. Neither sees the other's output. Both are independently citation-audited and argument-audited (with framing audit). The comparison feeds Q1 directly.

This dogfooding is itself an experiment: the comparison is the cycle's most evidence-rich finding on the central question.

---

## Operationalization of "Minimally Susceptible" (gate-prep task per reviewer P3) — 2026-05-11

The constraint-removal response introduced "minimally susceptible" as the central evaluative concept. Per reviewer P3, before the research → discover gate the concept must be operationalized into two testable formulations.

**Dimension (a) — Sycophancy/framing-adoption susceptibility.**

*Grounding:* Cheng et al. 2026 content-selection mechanism (sycophancy operates through what is selected, not how it is told); ELEPHANT (Cheng et al. 2025) 86% acceptance of assumption-laden premises; Tsui et al. 2025 Self-Correction Blind Spot (model can correct external errors it cannot correct in its own output).

*Measured by:* (1) presence of audit-visible claim-warrant-evidence triples — can the audit see what is being claimed and what supports it? (2) absence of unattributed synthesis — every synthesis statement traces to source material; (3) surface area for invisible framing absorption — how much connective tissue is there in which a framing can be silently adopted?

*Reduced by:* Structural form that exposes synthesis as named bullets rather than embedding it in narrative flow; explicit framework references; explicit calibration markers; explicit meta-moves (PROVENANCE CORRECTION, SCOPE QUALIFICATION). Empirical evidence: Spike S1 (outline form makes structural ordering more visible, enabling framing-audit findings to surface that prose buried).

*Operational test:* For a given research artifact, does the argument audit + framing audit surface (i) all the load-bearing claims, (ii) the warrants connecting claims to evidence, (iii) the scope qualifications limiting the claims, and (iv) the framing alternatives the evidence supported but the artifact didn't choose? If yes, the artifact's susceptibility to sycophancy/framing-adoption is bounded by the audit's coverage. If no, the artifact has hidden susceptibility surface.

**Dimension (b) — AI-prose-critique susceptibility.**

*Grounding:* Agarwal et al. CHI 2025 (writing-style classifier accuracy drops 90.6%→83.5% with AI assistance — measurable stylistic homogenization); Wright et al. arXiv Oct 2025 (knowledge collapse in 27 LLMs); Dolezal et al. arXiv Apr 2026 (33% higher semantic similarity in AI web content); Cheong et al. CHIWORK 2025 (persistent evaluation penalty for disclosed AI prose); Gallegos et al. PNAS Nexus 2026 (AI labeling has no significant effect on persuasive impact, P=0.91).

*Measured by:* (1) presence of stylistic AI-prose signatures (tone homogenization, register flattening, characteristic phrasal patterns); (2) authorial voice absence (does the artifact have a distinctive voice or read as generic synthesis?); (3) prose-form artifacts that present as if human-authored without provenance.

*Reduced by:* AVOIDING prose form — the outline move sidesteps the critique by not producing the stylistic surface. The audit does NOT resolve this dimension (per Loop B finding: critique applies categorically to audited and unaudited AI prose). Disclosure does not resolve it either. The only structural reduction is to not produce AI prose as the deliverable.

*Operational test:* Does the artifact present as AI-generated prose? If yes, dimension (b) susceptibility applies regardless of audit-attestation. If no (e.g., the artifact is a structured outline or a human-authored essay), dimension (b) susceptibility does not apply.

**Combined evaluation rule for Cycle 018:**

A "minimally susceptible" RESEARCH artifact satisfies BOTH:
- Dimension (a): audit-visible claim-warrant-evidence triples; explicit synthesis bullets; framing audit can surface alternatives
- Dimension (b): not in AI prose form (either outline-form-by-agent or essay-form-by-human)

The outline move addresses both dimensions: (a) via the discipline of explicit-claim-and-warrant outline production; (b) by sidestepping prose form entirely. Audit-extended prose addresses (a) imperfectly (Loop C finding: cannot separate rhetorical force from logical force) and (b) not at all.

---

## Validation-Spike Decision (ADR-087) — 2026-05-11

**Decision:** RUN — completed.

**Spike S1 was the validation spike for this cycle.** The audit-fidelity question (does the argument audit carry equivalent fidelity on outline vs. prose?) was central to Q1's falsifier and could not be resolved by lit-review alone — the answer required tangible comparison. The spike produced direct evidence: outline form preserves ~80–85% argument-audit fidelity, the argument-audit does NOT need extension, and the strengthening site is outline-production discipline (not audit machinery).

**Beck-port scope-of-claim:** The spike's payoff is calibrated. The 80–85% figure is the auditor's qualitative assessment based on issue-by-issue comparison of one essay's two forms. It is not a statistical measurement over many essays. The figure is directionally informative, not precise. Future cycles may calibrate further; this cycle treats the finding as sufficient signal to support the form-change recommendation without claiming statistical proof.

**Findings integration:** Spike S1 findings are integrated into the essay/outline's central argument (Q1 answer: outline form is form-equivalent to prose for argument-audit purposes; the strengthening site is outline-production discipline).

**Cycle-as-instance reflection (ADR-087 §4 standing caveat):** This cycle's findings on outline-vs-prose are based on one cycle's evidence (one source essay, one outline derivation, one comparative audit). The cumulative-payoff structure of the methodology will be tested against the world over multiple subsequent cycles. The findings are research-not-validation until tested across additional research entries.

---

---

## Loop B — AI-prose-critique landscape — 2026-05-11

**Method:** Lit-reviewer dispatch (background subagent). Output: `docs/essays/research-logs/lit-review-018-ai-prose-critique-landscape.md`.

**Central finding:** The critique does NOT distinguish audited from unaudited AI prose. It treats "AI-generated content" as a single category defined by generative process, not by downstream verification.

**Key sub-findings:**

1. **Stylistic complaints survive audit entirely.** Agarwal et al. (CHI 2025) — measurable empirical result: writing-style classifier accuracy drops from 90.6% to 83.5% when AI-assisted. Tone homogenization, register flattening, cultural erasure are intrinsic to the generation step, not to verification.

2. **Epistemic-collapse critiques survive audit.** Knowledge-collapse (Wright et al., arXiv Oct 2025) and internet-scale measurement (Dolezal et al., arXiv Apr 2026) confirm 33% higher semantic similarity in AI web content — a distribution-level property unaffected by document-level audit.

3. **Disclosure/attestation does NOT resolve the critique.** Cheong et al. (CHIWORK 2025) — persistent evaluation penalty for disclosed AI use. Gallegos et al. (PNAS Nexus 2026) — AI labeling has no significant effect on persuasive impact (P=0.91 vs. unlabeled). Attestation is noticed but does not function as a brake.

4. **Sycophancy/framing-adoption is the most Cycle-018-relevant dimension.** ELEPHANT (Cheng et al. 2025) demonstrates 86% acceptance of assumption-laden premises — framing sycophancy. AI prose generated from an adopted frame carries that frame invisibly. Citation audit does not detect adopted framing; argument mapping can surface it, but only by noting what was not challenged.

5. **No source proposes structured/outline output as a response.** Confirmed gap. CRESS-Empirical is the closest conceptual scaffolding.

**Major reframing implication:** The outline move CANNOT be primarily justified as a response to the AI-prose critique, because the critique applies categorically and audit-attestation does not resolve it. The outline's genuine advantages are:
- **Reduced surface area for framing adoption** (less connective synthesis = fewer invisible premises) — this is the sycophancy-resistance argument
- **CRESS-Empirical compatibility** (claims individually attributable, each node carries its source)
- **Reduced rhetorical-vs-logical conflation** (see Loop C audit-extended-prose finding)

These are sycophancy-resistance and epistemic-grounding arguments, NOT critique-response arguments. The cycle's central thesis needs to be reframed accordingly.

---

## Loop C — Minimal-surface artifact design across disciplines — 2026-05-11

**Method:** Lit-reviewer dispatch (background subagent). Output: `docs/essays/research-logs/lit-review-018-minimal-surface-artifact-design.md`.

**Eight prior-art categories evaluated against three criteria (audit-fidelity, susceptibility-surface-minimization, downstream-feed-forward preservation):**

1. **Pre-registration / Registered Reports** (Nosek/COS; Veldkamp et al. 2020; Chambers et al. 2022) — Strong audit-fidelity (timestamp + Stage 1 review pre-results); strong susceptibility-surface-minimization (structured fields suppress rhetorical packaging). Architecturally mismatched for RDD: single-study pre-commitment, not multi-cycle synthesis.

2. **Formal specifications (TLA+, DITA)** (Lamport 2002; Newcombe et al./AWS 2015) — Maximal audit-fidelity within bounded domain. Cannot express evidence quality, synthesis judgment, theoretical framing. AWS practice is hybrid: prose first, selective formalization.

3. **Contract drafting (ISDA)** — Invariant-base + parameterized-elections suppresses ambiguity within enumerated option spaces. Requires the option space be pre-enumerable; impossible for open-ended research synthesis. Instructive as architectural analogy (mandatory outline sections as elections), not transferable as format.

4. **Structured medical abstracts** (Haynes et al. 1990; Ripple et al. 2005; Nakayama et al. 2004; PRISMA 2020) — **Clearest direct empirical support for susceptibility-surface-minimization via structural constraint.** Mandatory headings improve information retrieval, facilitate peer review, force disclosure of limitations that prose elides. Nakayama: "prevent polemic by separating each analytical function into a designated section." This is direct empirical evidence for the user's hypothesis.

5. **Outline-vs-prose pedagogy** (Booth, Colomb, Williams 2008; Sword 2012; Dunleavy 2014) — Pedagogy literature treats outline as scaffolding, not deliverable, *except* Dunleavy's "storyboarding research" position. Outline-as-deliverable is non-standard; justification must come from downstream-consumer properties (AI agents), not from pedagogy.

6. **Annotated bibliography** — High per-citation audit-fidelity (every claim maps to source). No cross-source argument structure. Outline-with-inline-citations is structurally superior — combines atomic claim accountability with cross-source synthesis.

7. **Hybrid forms (Cochrane review)** (Cochrane Handbook, PRISMA 2020; Nakayama et al. 2004) — **Strongest overall comparandum.** Layered audits: protocol pre-registration + PRISMA checklist + mandatory headings + GRADE evidence ratings. Most transferable elements: (a) protocol pre-registration as pre-commitment audit, (b) GRADE-like external evidence-quality ratings on individual claims before synthesis. Cost: multi-year project — scale incompatible with RDD's cycle rhythm.

8. **Audit-extended prose** (Nakayama et al. 2004; Sword 2012) — Mandatory headings within prose are a genuine competitor *when prose discipline is high*. **Critical flaw:** "Audit-extended prose cannot separate rhetorical force from logical force, which means framing adoption can occur within a well-headed section without detection." This is the strongest argument against "fix the audit, keep prose."

9. **Agent-Native Research Artifacts (Rahimi et al. 2026 — preprint)** — Limiting case: typed, machine-traversable claim-evidence bindings with three-level ARA Seal. **QA accuracy for downstream AI agents improved from 72.4% to 93.7% vs prose papers.** Strongest empirical signal for outline form serving downstream AI agents. Requires infrastructure RDD doesn't have, but the directional evidence is strong.

**Loop C verdict — three strongest competitors to outline-with-inline-citations:**

1. Cochrane hybrid (strongest on all three criteria; scale incompatible)
2. Structured medical abstracts (direct empirical susceptibility-surface evidence; 700 words insufficient for synthesis depth)
3. Annotated bibliography (subsumed by outline-with-inline-citations)

**What the RDD context adds that tips toward outline:** downstream consumer is an AI agent (BUILD, DECIDE, ARCHITECT phases), not a human clinician. Rahimi et al. 2026 evidence: structured claim-evidence separation produces dramatic AI-agent consumption accuracy gains (72.4% → 93.7%). Outline's atomic claim nodes are natural consumption units for downstream agents. RDD's audit infrastructure (citation/argument/framing audits) exists as skills — "audit attachment" is solved by composition, not by choosing an intrinsic-audit form.

---

## Spike S1 — Audit-fidelity comparison (Essay 016 prose vs. outline) — 2026-05-11

**Decision rationale (ADR-087):** Run the spike. The audit-fidelity question is consequential and amenable to tangible answer through direct comparison. Cost: ~30 minutes of subagent work; produces evidence directly bearing on Q1's falsifier.

**Method:** Subagent 1 (general-purpose, fresh context) produced an outline derivation of Essay 016 preserving argument-structure content (claims, warrants, evidence, scope qualifications, synthesis statements, calibration moves, meta-moves). Output: `scratch/spike-018-s1/essay-016-outline.md` (516 lines vs. 188 prose lines — hierarchical-bullet line expansion). Subagent 2 (argument-auditor specialist, fresh context) ran a standard two-section audit (argument + framing) on the outline plus an additional Section 3 capturing outline-form audit experience. Output: `.rdd/audits/argument-audit-018-spike-s1.md`.

**Comparison summary:**

| Metric | Prose audit (argument-audit-017.md) | Outline audit (argument-audit-018-spike-s1.md) |
|--------|--------------------------------------|------------------------------------------------|
| Argument chains mapped | 8 | 9 |
| Total issues | 8 (1 P1, 4 P2, 3 P3) | 10 (1 P1, 4 P2, 5 P3) |
| Issues transferred at equivalent strength | — | 9 of 8 (one prose issue was *resolved* by the outline form — the Decker citation bibliographic phantom) |
| New findings surfaced by outline form | — | 2 framing findings (Nguyen et al. 2025 missing; prior-familiarity intervention underweighted) |

**Key qualitative findings from outline-form audit experience:**

**Outline form gains (where outline helped identify issues prose would have buried):**
1. **Structural ordering of scope-qualification relative to claim was MORE visible.** The P1 issue (Ernst & Robillard scope-before-or-after-claim) surfaced as a structural choice in outline form; in prose it was buried in paragraph flow.
2. **Inferential chains were easier to map.** Each CLAIM bullet names a proposition; each EVIDENCE/SUPPORT bullet names its warrant. The audit could proceed without reconstructing logic from prose connectives.
3. **Internal consistency issues between sections were MORE visible.** Tension between §3's "primary mechanism" framing and §4.5 Sub-pattern E's implicit prior-familiarity-as-dominant claim — surfaced as a framing finding.

**Outline form losses (where outline prevented issue identification prose would have surfaced):**
1. **Rhetorical confidence calibration is harder to assess.** In prose, hedging language ("suggests" vs. "establishes") signals differential confidence. In outline form, all CLAIM bullets carry the same visual weight regardless of underlying confidence level. Auditor must cross-check each CLAIM bullet against source material more deliberately.
2. **Argumentative transitions and direction-of-travel between sections is invisible.** Prose has a rhetorical arc the auditor reads as logical movement; outline collapses this to heading sequence. The audit required more active inference about why §3 follows §2.
3. **Implicit assumptions in prose framing are harder to surface from bullet labels.** Reflexive findings (e.g., the prose essay's failure to self-apply its own orientation principles in its abstract) partially dissolve when outline form auto-addresses the failure structurally.

**Auditor's net assessment:** Outline form preserves approximately 80–85% of argument-audit fidelity relative to prose. The primary loss is differential claim-strength calibration; the primary gain is structural visibility of ordering and internal-consistency comparisons.

**Critical R1+Spike-S1 finding for Q1 sub-question:** The argument-audit does NOT need extension to handle outline form. The P1 issue surfaced equivalently in both. The 80-85% preservation includes losses (calibration) that are partially offset by gains (structural visibility, framing). The differential-confidence-calibration loss is a real fidelity concern but does not require audit-extension — it requires **outline-production discipline** that uses different mechanisms (explicit CONFIDENCE-LEVEL tags, SCOPE-QUALIFICATION sub-bullets, CALIBRATION bullets) to communicate what prose hedging communicates implicitly.

The falsifier sub-question premise ("outline needs stronger argument audit") is NOT established. The strengthening site is the **outline production discipline**, not the audit machinery.

---

## Loop A — CRESS principles (foundation) — 2026-05-11

**Method:** WebFetch on https://codemanship.wordpress.com/2026/05/04/c-r-e-s-s-principles-for-context-engineering/

**Findings:** CRESS is a five-principle framework for LLM coding-task context, authored by Jason Gorman (Codemanship blog, dated 2026-05-04).

- **C — Current.** "Contain up-to-date information (e.g. not an architecture summary that was generated multiple changes ago)."
- **R — Refutable.** "Contain some way of knowing with high confidence when the output doesn't satisfy the intent (e.g. an acceptance test)."
- **E — Empirical.** "Use information taken from observed reality (the actual code, test run results, linter output), not information generated by the model."
- **S — Small.** "Include the minimum necessary information required to satisfy CRESS. No redundant background, irrelevant history, or over-verbose explanations."
- **S — Specific.** "Are narrowly scoped to a single problem or task with no ambiguity in intent."

**Author basis:** "3 years of research and experimentation" studying LLM context properties for code generation. "Closed-loop experiments" with no published academic citations. Author explicitly invites skepticism: "you shouldn't take my word for it. Test them for yourself."

**Adjacent posts:** The post links five detailed treatments (one per letter) dated May 6–11, 2026. Not fetched in this loop pass; flagged for follow-up if needed.

**Implications for the research:**

1. **CRESS is scoped to coding-task context, not methodology artifacts.** A scope-transfer question applies before applying CRESS to RDD phases: do the principles transfer when the "context" being engineered is a research essay/outline rather than a coding prompt?

2. **S-Small aligns directly with the user's "minimally susceptible via minimal surface" hypothesis.** Convergence point — both threads (Q1, Q2) converge on minimization as a desirable property. The susceptibility framing extends Small with a *mechanism* (less surface = less sycophancy/critique attack surface) that CRESS's Small principle does not articulate.

3. **R-Refutable maps onto RDD's audit infrastructure.** Citation audit, argument audit, framing audit are RDD's mechanisms for making outputs refutable. CRESS encodes the principle; RDD operationalizes it.

4. **E-Empirical maps directly onto the AI-prose-critique landscape.** CRESS already encodes the critique: "use information taken from observed reality... not information generated by the model." If a research essay is itself model-generated prose summarizing model-generated synthesis, it scores poorly on E. An outline that pre-populates citations + carries audit-attested claims scores higher on E (the citation anchors are observed-reality references; only the synthesis is model-generated, and the audit attests its grounding).

5. **C-Current aligns with RDD's "documents describe what *is*, not what *will be*"** and ORIENTATION's regeneration milestones. Existing alignment.

6. **S-Specific aligns with RDD's spike rules and per-scenario tightness.** Existing alignment.

**Q3 preliminary signal:** Q1 and Q2 co-illuminate strongly. CRESS S-Small + E-Empirical bear directly on the artifact-form question, not independently of it. The threads are convergent.

---

## Loop D — CRESS phase-by-phase audit (Thread 2 synthesis) — 2026-05-11

**Method:** Map each RDD phase against each CRESS principle. Identify alignment, principled divergence, accidental divergence. Synthesis in main context using methodology knowledge.

### Phase × Principle matrix

Notation: **STRONG** = phase operationalizes this principle directly. **PARTIAL** = phase operationalizes it indirectly or with caveats. **WEAK** = phase does not operationalize it. **MAXIMAL** = phase IS the natural home for this principle.

| Phase | C-Current | R-Refutable | E-Empirical | S-Small | S-Specific |
|-------|-----------|-------------|-------------|---------|------------|
| RESEARCH | PARTIAL (timestamped; supersession) | STRONG (citation/argument/framing audits) | STRONG (citations, lit-review, spikes) | **WEAK (5,000+ word essays)** | STRONG (per-cycle scope; question-isolation entry) |
| DISCOVER | STRONG (regenerated each cycle, update mode) | PARTIAL (assumption inversions testable) | PARTIAL (field experience + inference) | WEAK (accumulates over cycles) | STRONG (stakeholder maps) |
| MODEL | STRONG (amendments tracked) | STRONG (invariants testable; conformance audit) | STRONG (artifact-grounded vocabulary) | WEAK (grows monotonically) | STRONG (per-concept definitions) |
| DECIDE | STRONG (ADR immutability + supersession ADR-074) | STRONG (scenarios provide refutability) | STRONG (provenance chains to essays, research log, scenarios) | VARIABLE (per-ADR scope discipline) | STRONG (one decision per ADR) |
| ARCHITECT | STRONG (regenerated, amendments tracked) | STRONG (fitness criteria ADR-076, Acceptance Criteria Table ADR-073) | STRONG (provenance chains) | PARTIAL (Pattern B split ADR-084 addresses agent-context bloat) | STRONG (per-module responsibility) |
| BUILD | STRONG (code IS current; field guide tracks) | **MAXIMAL** (tests, compiler, type-checker, linter) | **MAXIMAL** (running software, test results, linter output) | STRONG (tidying, YAGNI methodology-encoded) | STRONG (per-scenario, per-WP) |
| PLAY | STRONG (time-stamped field notes) | STRONG qualitative (stakeholder inhabitation tests built thing) | STRONG (interaction with built software) | STRONG (brief field notes by convention) | STRONG (per-session scope) |
| SYNTHESIZE | STRONG (terminal, time-stamped) | STRONG (citation/argument audit on outline) | STRONG (synthesis from full artifact trail) | **STRONG (outline IS minimal — agent produces outline, user writes essay outside pipeline)** | STRONG (per-cycle or cross-cycle theme) |

### Cross-cutting observations

**Observation 1: RESEARCH is the methodology's single largest S-Small divergence point.**

Every other phase has either explicit size discipline (BUILD: tidying/YAGNI), structural constraints (DECIDE: per-ADR scope, ARCHITECT: per-module fitness), or convention-bounded brevity (PLAY: brief field notes; SYNTHESIZE: minimal outline). RESEARCH alone produces 5,000+ word artifacts as standard practice. This is not a uniform methodology characteristic that CRESS would flag globally — it is a *phase-specific* divergence concentrated in one phase.

The CRESS audit independently identifies the same phase Cycle 018 is investigating from the inside. The convergence is not coincidental: it is two independent paths reaching the same diagnosis. Cycle 018's user-stated motivation ("research essays are not human-read; minimize information to drive cycle effectively") reaches RESEARCH-as-S-Small-violator from practical experience. CRESS reaches it from principle. **The two threads co-illuminate on the same point (Q3 answered: STRONGLY CO-ILLUMINATE).**

**Observation 2: `/rdd-synthesize` ALREADY operationalizes the proposed pattern.**

Synthesize's design is exactly what Cycle 018 proposes for Research: agent produces an outline (with citation audit + argument audit), human writes the essay outside the pipeline. The synthesize phase scores STRONG on S-Small specifically because of this design choice. The principled-vs-accidental question for Research becomes pointed: **why does Research diverge from Synthesize on this specific design choice?** No principled rationale appears in the artifact trail. The divergence appears to be accidental — Research adopted essay form because synthesize hadn't yet existed when Research's form was set; the pattern that synthesize later operationalized was not retroactively applied upstream.

**Observation 3: E-Empirical and R-Refutable are maximally satisfied in BUILD; less directly satisfied elsewhere via artifact-grounding and audits.**

BUILD's contact with non-sycophantic systems (tests, compiler, running software) makes it the natural home for both E and R. Other phases extend these principles through:
- Audit infrastructure (citation/argument/framing audits in RESEARCH, SYNTHESIZE; conformance audit in MODEL; argument audit in DECIDE)
- Scenarios (DECIDE: behavior + preservation scenarios provide refutability)
- Fitness criteria (ARCHITECT: testable per-module properties)
- Provenance chains (artifact-grounded "observed reality" via essays/ADRs/research log)

The methodology's R/E coverage outside BUILD relies on audit infrastructure. The audits are what extend CRESS-Empirical to the prose-heavy phases. **This is the load-bearing argument for the outline move: the audit is the methodology's R/E mechanism for non-BUILD phases, and the outline form makes the audit more effective by exposing claim-warrant-evidence triples explicitly rather than burying them in prose.**

**Observation 4: C-Current is solved by multiple non-uniform strategies.**

ADRs use immutability + supersession (ADR-074). Domain model uses amendments (ADR-074-inherited). Product discovery uses regeneration in update mode. Field guide auto-updates. System design uses amendments. RDD's C-Current coverage is principled (each strategy fits the artifact's lifecycle) and explicit (named in skill text and ADRs). **C-Current is the principle CRESS most clearly already satisfies across phases.**

**Observation 5: S-Specific is universally strong.**

Per-cycle, per-ADR, per-scenario, per-stakeholder, per-module scoping. RDD's S-Specific coverage is the methodology's strongest CRESS alignment overall. This is the one principle where the audit returns no divergence findings.

### Principled-vs-accidental classification

| Divergence | Phase | Principled or accidental? | Evidence |
|-----------|-------|---------------------------|----------|
| Essays 5,000+ words | RESEARCH | **Accidental** | No principled rationale in artifact trail; Synthesize successfully operates with outline form; CRESS independently flags the divergence; user experience confirms essays are not human-read |
| Product-discovery growth | DISCOVER | Mixed | Per-cycle update mode is principled (each cycle re-examines); total accretion may be accidental (no graduation/compaction mechanism for outgrown content) |
| Domain-model growth | MODEL | Principled | Domain models are inherently accumulative (concepts named once, never renamed); amendments preserve history |
| ADR variable length | DECIDE | Principled | ADR scope is per-decision; some decisions are complex, some simple; per-ADR length variability is appropriate |
| system-design.md large | ARCHITECT | Partial accidental — addressed by ADR-084 Pattern B split | Pattern B (companion file at predictable path) reduces human-facing artifact size; ADR-084 fixed this accidental divergence in v0.8.4 |

**Cycle 018 implication:** The RESEARCH essay-form divergence is the methodology's largest *accidental* CRESS-divergence. It is not a principled trade-off; it is a default that has not been re-examined. Cycle 018 is the re-examination.

### Q3 answer: Threads 1 and 2 strongly co-illuminate

CRESS bears directly on the artifact-form question via S-Small and E-Empirical. The CRESS phase-by-phase audit independently identifies the RESEARCH essay as the methodology's largest S-Small divergence — reaching the same conclusion as Thread 1 from a different starting point. The convergence is not coincidental; it is two principled paths reaching the same diagnostic finding.

The threads are NOT parallel investigations. They are convergent, and the convergence strengthens both arguments:
- Thread 1 alone could be dismissed as user preference (the user doesn't like long essays)
- Thread 2 alone could be dismissed as CRESS-overreach (CRESS is for coding context, not methodology artifacts)
- Together: an independent principle-driven framework (CRESS) and an independent practice-driven observation (user experience) reach the same diagnostic on the same phase

The convergence is also a methodological signal: when an independent framework reaches the same conclusion as practice, that is the structural condition under which a methodology change should be made.

---

## Task R1 — Prose contribution to argument trail (foundation) — 2026-05-11

**Method:** Read Essays 013, 014, 016 in full or representative passages. For each, identify what prose contributes that outline form would not carry, classified as argument-structure content versus persuasive-flow content. Test whether the falsifier sub-question premise (outline form must be stronger because prose carries argument structure that outline loses) is established.

**Findings:**

Prose narrative in the essays carries content of two types: **argument-structure content** (claims, warrants, evidence integration, framework references, scope qualifications, synthesis statements, calibration moves, provenance corrections) and **persuasive-flow content** (motivational lead-ins, register, narrative connective tissue, contextual setup, reading experience). The two types are distinguishable by transferability — argument-structure content can be expressed in outline form without semantic loss; persuasive-flow content cannot.

**Argument-structure content survives in outline form (with discipline).** Across the three essays examined, every named framework, every empirical finding with its scope qualification, every synthesis statement, every concept introduction, and every calibration move can be expressed as named bullets with no loss of semantic content. Examples from Essay 016 §3:

Prose: "**The expertise reversal effect** (Kalyuga et al. 2003) supplies the strongest single empirical anchor. Designs effective for novice first-encounter readers lose their effectiveness for expert returning-reference readers, and vice versa — a measurable comprehension difference, not a preference difference."

Outline form preserves identically:
```
- Strongest single empirical anchor: Expertise reversal effect (Kalyuga et al. 2003)
  - Designs effective for novices lose effectiveness for experts (and vice versa)
  - Measurable comprehension difference, not preference difference
```

Examples from Essay 013 §4 — five bulleted categories of external reference points (architectural isolation, non-sycophantic feedback systems, temporal distance, human independent generation, a different human). The essay already uses an outline-like structure for this content; prose connective tissue is minimal.

**Persuasive-flow content does not survive in outline form (and may not need to).** Across the three essays, prose adds:

- Motivational lead-ins ("A research-driven development methodology produces a layered artifact corpus...") that contextualize before claiming
- Rhetorical "punch" in calibration statements ("The distinction is not about intent or sophistication. Performative mechanisms may be well-designed and thoughtfully implemented. The issue is structural...") — outline form carries the same content but with less rhetorical force
- Reading experience — pacing, register variation, narrative engagement that sustains attention across a long document
- The integration of contradictory evidence in a "yes-AND" form ("The cycle's entry hypothesis is not falsified. Density-ordering remains a real and independent mechanism... But density-ordering is one mechanism among several rather than the unifying explanation.")

Outline form tends toward "yes-OR" enumeration, which loses some integration nuance. But the integration content can be carried as an explicit synthesis bullet:
```
- Entry hypothesis (front-loaded density): NOT falsified
  - Density-ordering remains real and independent
  - Sweller's coherence principle gives it independent support
- But: density-ordering is one mechanism among several, not unifying explanation
- Synthesis: threads share structural family (context, audience, reading-task awareness), not single mechanism
```

The structural content survives; the rhetorical pacing does not.

**Meta-moves are PRESERVED MORE EXPLICITLY in outline form.** Essay 016 §4.4 includes a "provenance correction" paragraph where a frequently-circulated claim (CMU SEI 40% miscommunication finding) failed verification and was dropped. In prose, this is a paragraph woven into the section's argument. In outline form, the meta-move can be flagged explicitly:
```
- PROVENANCE CORRECTION: CMU SEI 40% claim
  - Circulated in secondary marketing without source
  - Q5 lit-review: no trace in cited blog, no matching CMU SEI Digital Library study
  - DROPPED from cycle's reasoning, should not be cited
  - Demonstrates research discipline: claim supporting preferred direction failed verification, dropped not preserved
```

Outline form makes the meta-move *more visible*, not less. The framing audit may benefit: in prose, an omitted synthesis statement is invisible to the audit; in outline, an omitted synthesis bullet is structurally absent and easier to detect as a gap.

**R1 verdict on the falsifier sub-question premise:** The premise that "prose narrative carries argument structure that outline loses, requiring argument-audit extension to compensate" is NOT established. Prose carries argument structure that outline carries equivalently if the outline is disciplined to include explicit synthesis bullets, framework references with scope qualifications, calibration bullets, and named meta-moves. What prose carries that outline does not carry is *persuasive-flow content* — register, motivational lead-in, reading experience — which is not the same as argument structure. The argument audit's argument-trail parsing should function on outline form without extension, *provided the outline-production discipline carries synthesis explicitly.*

The strengthening site is not the audit but the outline-production discipline. The outline must be required to carry synthesis bullets, scope-qualification bullets, calibration bullets, and meta-move flags. A disciplined outline form is argument-equivalent to prose; an undisciplined outline form (bare claim-listing without warrants or synthesis) is argument-inferior to prose.

**Spike S1 will test this directly:** by producing an outline derivation of Essay 016 and running the argument-auditor against both, the comparison will surface whether (a) a disciplined outline preserves audit findings or (b) the outline-production process tends toward undisciplined claim-listing that drops synthesis. The Spike's outcome distinguishes between R1's preliminary verdict ("outline form is fine if disciplined") and the falsifier scenario ("outline-production discipline cannot reliably preserve synthesis").

---

## Task R2 — Downstream consumption corpus check (foundation) — 2026-05-11

**Method:** `grep -rEn 'Essay [0-9]+|essays/[0-9]+' docs/` across downstream phase artifacts.

**Findings:** Three distinct consumption modes detected.

| Mode | Where | Reference count | Pattern |
|------|-------|-----------------|---------|
| **Bibliographic provenance** | roadmap.md (12 refs), ORIENTATION.md (4 refs), field-guide.md (2 refs), domain-model.md (cycle tags) | Low information density | "Derived from Essay N" / "Background: Essay N" / "(Essay X / ADRs Y-Z)" — establishes attribution chains. Preserved in any artifact form with stable identifier and structure. |
| **Section-keyed warrants** | system-design.agents.md (every architectural driver has a Provenance line) | Medium density | "Essay 014 §6", "Essay 015 §5" — references specific essay sections as warrant for architectural decisions. Preserved in any sectioned artifact (outlines have sections). |
| **Substantive content reuse** | ADRs (96 essay references), product-discovery.md (several substantive references) | High density | Quotes specific claims, framework names, synthesis statements, and concept introductions. Examples: "Essay 015 §5 surveys three paradigms: durable workflow engines (Temporal's parent-child model... TERMINATE / REQUEST_CANCEL / ABANDON); hierarchical state machines (Harel 1987, SCXML, XState... **history pseudostate**); and schema evolution (Protobuf, Flyway/Liquibase, Temporal's `patched()`/`getVersion`)." ADR-014 cites Essay 003 §5's economic context AND a reflection (003 reflections §3) that sharpened the framing. |

**Outline-preservation analysis for substantive content reuse:**

The substantive content that downstream ADRs and product-discovery consume falls into three element types:
- **Named claims** ("Essay 002 identifies a structural blind spot")
- **Framework introductions** (Einstellung effect, AI Smell Taxonomy, Diátaxis, history pseudostate)
- **Synthesis statements** ("Essay 015 §5 explicitly notes: 'the literature does not resolve whether this compositional approach is architecturally equivalent...'")

All three element types are carriable in outline form **if the outline is structured to include them explicitly** as named bullets, framework anchors, and synthesis bullets. The risk is that an outline *might tend* to elide synthesis bullets in favor of bare claim-listing — but this is a discipline-of-production question for the outline form, not an inherent property of outline form. Spike S1 will test this directly.

**One subtle observation:** ADR-014 cites both Essay 003 §5 (economic context) AND "the user's reflection (003 reflections §3)" that sharpened the framing. The reflections file is currently a prose document that captures conversational-gate-stage observations. If the essay shifts to outline form, the reflection's content (a conversational frame-shift) may be **less natural to express in outline form than the essay content** — reflections are inherently narrative ("I came to see X as Y"). Worth flagging: the outline migration question may not extend cleanly to reflections.

**Implication for Q4:** Downstream phases consume essays substantively (mode 3 is non-trivial), but **what they consume is structured content (claims, frameworks, synthesis statements), not prose flow.** This substantiates the user's hypothesis that audit-attached structure carries the feed-forward value — *provided* the outline form is disciplined to carry synthesis statements explicitly. The minimal-surface argument is qualified, not refuted, by feed-forward analysis: minimal-surface ≠ minimum-content; minimal-surface = "no redundant background, irrelevant history, or over-verbose explanations" (CRESS's S-Small). Synthesis statements are not redundant background.

**Implication for Q1 sub-question (argument audit load):** If outline form carries synthesis statements as explicit elements, the argument audit's argument-trail parsing must verify warrants connect claims to evidence — which it already does. The question becomes: does the argument audit verify that synthesis statements are *grounded* in the cited evidence (R1's task), or does it currently rely on prose to make grounding visible? Spike S1 informs this directly.

---

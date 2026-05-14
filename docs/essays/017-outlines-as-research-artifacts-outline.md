# Outlines as Research Artifacts: A Susceptibility-Surface Argument — Outline Form

*RDD Cycle 018 research artifact (structured-outline form, dogfooded against the parallel prose form). Author: in-cycle research agent. Date: 2026-05-11.*

---

## Abstract

### QUESTIONS

- Q1: Should `/rdd-research`'s primary artifact be a structured outline with inline citations, evaluated against alternative forms (hybrid prose-with-structured-sections, annotated bibliography with synthesis notes, audit-extended prose)?
  - SUB-QUESTION (premise to characterize): What does prose narrative contribute to the argument trail beyond persuasive flow?
  - SUB-QUESTION (falsifier site): Does the argument audit's argument-trail parsing carry the load if prose is removed, or does it need extension?
- Q2: How does each RDD phase align with, diverge from, or stand independent of the CRESS principles for context engineering (Gorman 2026a)? Where divergences exist, are they principled or accidental?
- Q3: Do Q1 and Q2 co-illuminate — does CRESS bear directly on the artifact-form question — or are they parallel investigations?
- Q4: What do downstream phases (DISCOVER, MODEL, DECIDE, ARCHITECT) consume from the research artifact, and does outline form preserve that feed-forward value?

### METHOD

- Foundation Loop A: CRESS source reading (Gorman 2026a; adjacent posts 2026b–c)
- Foundation Loop B: AI-prose-critique landscape lit-review across 2025–2026 sources (Agarwal et al. 2025; Wright et al. 2025; Cheong et al. 2025; Gallegos et al. 2026; Cheng et al. 2025; Dolezal et al. 2026; Adami 2025; Farrell 2025)
- Foundation Loop C: Minimal-surface artifact design lit-review across eight prior-art categories (Nosek et al. 2015; Veldkamp et al. 2020; Chambers et al. 2022; Lamport 2002; Newcombe et al. 2015; Haynes et al. 1990; Ripple et al. 2005; Docherty & Smith 1999; Booth, Colomb, & Williams 2008; Sword 2012; Dunleavy 2014; Cochrane Collaboration 2022; Liu et al. 2026)
- Synthesis Loop D: CRESS phase-by-phase audit of RDD (matrix mapping eight phases against five principles)
- Research Task R1: Prose-contribution analysis on Essays 013, 014, 016
- Research Task R2: Downstream consumption corpus check across roadmap, system-design, ADRs, product-discovery, field-guide
- Validation Spike S1: Audit-fidelity comparison — Essay 016 prose vs. outline derivation, both run through argument-auditor specialist

### CONCLUSIONS

- C1: The outline-form proposal is supported by three convergent arguments — sycophancy-resistance (reduced surface for framing adoption), CRESS-Empirical compatibility (claims individually attributable), and reduced rhetorical-vs-logical conflation — and is NOT principally a response to the AI-prose critique (which applies categorically to audited and unaudited AI prose alike).
- C2: CRESS phase-by-phase audit independently identifies RESEARCH as the only phase whose S-Small divergence is fully accidental and fully remediable by form change — DISCOVER and MODEL also score WEAK on S-Small but their accretion is principled or mixed (§3.4 classification). The convergence with the user-stated motivation for Cycle 018 is the cycle's central co-illumination finding (Q3 answered: STRONGLY CO-ILLUMINATE).
- C3: Spike S1 evidence: outline form preserves approximately 80–85% argument-audit fidelity relative to prose, with gains (structural-ordering visibility, internal-consistency surfacing) partially offsetting losses (differential-confidence calibration). The argument audit does NOT need extension; the strengthening site is outline-production discipline.
- C4: Downstream phases substantively consume essay content (96 ADR references plus product-discovery and system-design references), but what they consume is structured content (claims, framework introductions, synthesis statements) — preserved in outline form provided synthesis bullets are explicit.
- C5: The combined evaluation rule for "minimally susceptible" (Dimension a: audit-visible claim-warrant-evidence triples plus explicit synthesis bullets; Dimension b: not in AI-prose form) is satisfied by the outline-with-inline-citations form. Audit-extended prose satisfies Dimension a imperfectly and Dimension b not at all.

---

## §1 The cycle's entry and motivation

- CONTEXT: RDD's RESEARCH phase has produced 16 prose essays (Essays 001–016) as its primary artifact form. The essay-as-research-artifact pattern is the path of least cognitive resistance; any alternative argues against the weight of precedent.
- ENTRY OBSERVATION (practitioner-stated, recorded in cycle research log 2026-05-11): The 5,000+ word essay format is rarely read end-to-end by the practitioner; it functions primarily as audit substrate and downstream provenance source rather than as a human-read deliverable.
- ENTRY HYPOTHESIS (practitioner-stated): A well-organized outline that provides sufficient information that can be audited — and nothing else — should be minimally susceptible.
- SCOPE QUALIFICATION (at point of invocation): The "minimally susceptible" framing is the practitioner's articulation; it requires operationalization before it can serve as an evaluative criterion (deferred to gate-prep task per reviewer P3; operationalization completed 2026-05-11 and reported in §11).
- META-MOVE: QUESTION-ISOLATION ENTRY
  - The cycle entered under ADR-082's question-isolation protocol: name the most consequential existing artifact, ask what the problem space would look like if that artifact were not available.
  - Named artifact: the essay-as-research-artifact pattern itself.
  - WARRANT: The constraint-removal move suspends the precedent gravity of 16 prior essays and forces evaluation of RESEARCH's deliverable form from goals (crystallize understanding, preserve audit surface, feed downstream phases, leave durable record) rather than from default.
- CONTEXTUAL ANCHOR (concurrent practitioner reading): The Codemanship CRESS post (Gorman 2026a) and adjacent commentary on AI-prose proliferation; ongoing internal work on sycophancy and methodology reflexivity (Cycle 013, ADR-055/ADR-058/ADR-082).
- CALIBRATION: Practitioner hypothesis is held with calibrated uncertainty, not strong conviction. Primary falsifier identified at entry: audit-fidelity loss (outlines might lose audit equivalence relative to prose).
  - Additional falsifier added after Step 1.4 reviewer audit (P1): downstream phases may substantively consume essay content in ways outline form cannot preserve.

---

## §2 The constraint-removal reframing: susceptibility-surface as the operative concept

- META-MOVE: REFRAMING (load-bearing)
  - The constraint-removal response reframed Q1 from "should RESEARCH produce outlines?" to "what makes a research artifact minimally susceptible, and to what?"
  - Susceptibility-surface area replaces artifact-form-preference as the evaluative axis.
- CLAIM: Susceptibility surfaces along two dimensions, both grounded in independent literatures.
  - Dimension (a): Sycophancy and framing-adoption susceptibility (the Cycle 013+ line of work; Cheng et al. 2025 ELEPHANT; Tsui 2025).
  - Dimension (b): AI-prose-critique susceptibility (Agarwal et al. 2025; Wright et al. 2025; Cheong et al. 2025; Gallegos et al. 2026; Dolezal et al. 2026).
- WARRANT: Prose carries tonal choices, framing decisions, persuasive flow, and authorial voice — surface elements that admit susceptibility along both dimensions. An outline is structure plus claims plus citations plus audit attachment points. Less surface implies less susceptibility — but only if "less surface" is operationalized as "less invisible synthesis," not as "less content."
- CALIBRATION: The reframing is theoretical at this point in the cycle. Its empirical grounding comes from Loops B and C and from Spike S1; the reframing is the cycle's working hypothesis, not its established finding.
- SCOPE QUALIFICATION (at point of invocation): The susceptibility-surface argument applies to AI-generated artifacts. The cycle does NOT claim that human-authored prose suffers the same susceptibility profile; the prose-form question for human writers is out of scope (see Cycle 016 on the human-author distinction for related but distinct analysis).
- IMPLICATION FOR DOWNSTREAM PHASES: The susceptibility-surface framing reorients the artifact-form question; it does not by itself answer it. The remaining loops test whether the framing holds empirically and whether outline form satisfies it relative to alternatives.

---

## §3 CRESS principles and the phase-by-phase audit (Loop D)

### §3.1 The CRESS principles

- SOURCE: Codemanship blog (Gorman 2026a). "CRESS Principles for Context Engineering," dated 2026-05-04.
- AUTHOR BASIS: "3 years of research and experimentation" with LLM coding-task context; "closed-loop experiments" without published academic citations. Author explicitly invites skepticism: "you shouldn't take my word for it. Test them for yourself."
- CALIBRATION: Practitioner theory grounded in author's stated experiment record; not peer-reviewed; treated as conceptual framework rather than empirically-validated theorem.
- PRINCIPLES (verbatim):
  - C — Current. "Contain up-to-date information (e.g. not an architecture summary that was generated multiple changes ago)."
  - R — Refutable. "Contain some way of knowing with high confidence when the output doesn't satisfy the intent (e.g. an acceptance test)."
  - E — Empirical. "Use information taken from observed reality (the actual code, test run results, linter output), not information generated by the model."
  - S — Small. "Include the minimum necessary information required to satisfy CRESS. No redundant background, irrelevant history, or over-verbose explanations."
  - S — Specific. "Are narrowly scoped to a single problem or task with no ambiguity in intent."
- SCOPE QUALIFICATION (at point of invocation): CRESS is scoped to coding-task context, not methodology artifacts. A scope-transfer question applies before applying CRESS to RDD phases: do the principles transfer when the "context" being engineered is a research essay/outline rather than a coding prompt?
- WARRANT (scope-transfer): The principles articulate properties of information-bearing artifacts that LLM agents consume. RDD research artifacts are precisely that — information-bearing artifacts that downstream agents (BUILD, DECIDE, ARCHITECT) consume. Scope transfer is defensible.

### §3.2 Phase × Principle matrix (Loop D synthesis)

- METHOD: Map each of eight RDD phases against each of five CRESS principles. Notation: STRONG = phase operationalizes the principle directly; PARTIAL = indirect or caveated; WEAK = not operationalized; MAXIMAL = phase is the natural home for the principle.

| Phase | C-Current | R-Refutable | E-Empirical | S-Small | S-Specific |
|-------|-----------|-------------|-------------|---------|------------|
| RESEARCH | PARTIAL | STRONG | STRONG | **WEAK (5,000+ word essays)** | STRONG |
| DISCOVER | STRONG | PARTIAL | PARTIAL | WEAK | STRONG |
| MODEL | STRONG | STRONG | STRONG | WEAK | STRONG |
| DECIDE | STRONG | STRONG | STRONG | VARIABLE | STRONG |
| ARCHITECT | STRONG | STRONG | STRONG | PARTIAL | STRONG |
| BUILD | STRONG | **MAXIMAL** | **MAXIMAL** | STRONG | STRONG |
| PLAY | STRONG | STRONG | STRONG | STRONG | STRONG |
| SYNTHESIZE | STRONG | STRONG | STRONG | **STRONG (outline IS minimal)** | STRONG |

- EVIDENCE for RESEARCH = WEAK on S-Small: 16 essays in corpus (Essays 001–016), all 3,000–8,000+ words; no phase-level size discipline; no precedent for compaction or graduation of older essays.
- EVIDENCE for SYNTHESIZE = STRONG on S-Small: Synthesize's design is agent-produces-outline, user-writes-essay-outside-pipeline (see SYNTHESIZE skill text); outline is the agent-produced artifact.
- EVIDENCE for BUILD = MAXIMAL on R/E: Tests, compiler, type-checker, linter, running software are the natural non-sycophantic refutability and empirical-grounding mechanisms.

### §3.3 Cross-cutting observations

- OBSERVATION 1: RESEARCH is the methodology's largest *accidental* S-Small divergence point — the only phase whose S-Small divergence is fully accidental and fully remediable by form change.
  - CLAIM: Every other phase has either explicit size discipline (BUILD: tidying/YAGNI), structural constraints (DECIDE: per-ADR scope; ARCHITECT: per-module fitness), or convention-bounded brevity (PLAY: brief field notes; SYNTHESIZE: minimal outline). RESEARCH alone produces 5,000+ word artifacts as standard practice.
  - SCOPE QUALIFICATION (at point of invocation): DISCOVER and MODEL also score WEAK on S-Small (§3.4 matrix), but their weakness is principled accretion (inherently accumulative by design — concepts named once and never renamed, per-cycle update mode); RESEARCH's is accidental default — the distinction that makes this the remediable divergence and the locus for the cycle's diagnostic.
  - EVIDENCE: Matrix in §3.2; corpus inventory of Essays 001–016; principled-vs-accidental classification in §3.4.
  - WARRANT: The divergence is not a uniform methodology characteristic that CRESS would flag globally; it is phase-specific and, among phases scoring WEAK on S-Small, the only one without a principled rationale.
  - CALIBRATION: The convergence of two independent paths (CRESS-principle reasoning and practitioner experience of essays-as-unread) reaching the same diagnostic on the same phase is the cycle's central co-illumination finding.
- OBSERVATION 2: `/rdd-synthesize` already operationalizes the proposed pattern.
  - CLAIM: SYNTHESIZE's design — agent produces outline (with citation/argument audit); human writes essay outside the pipeline — is exactly what Cycle 018 proposes for RESEARCH.
  - EVIDENCE: SYNTHESIZE skill text; Synthesize scores STRONG on S-Small precisely because of this design choice.
  - WARRANT: The principled-vs-accidental question for RESEARCH becomes pointed: why does RESEARCH diverge from SYNTHESIZE on this design choice?
  - EVIDENCE (absence of rationale): No principled rationale appears in the artifact trail for RESEARCH's prose-form choice. The divergence appears accidental — RESEARCH adopted essay form before SYNTHESIZE existed; the pattern SYNTHESIZE later operationalized was not retroactively applied upstream.
- OBSERVATION 3: E-Empirical and R-Refutable are maximally satisfied in BUILD; less directly satisfied elsewhere via artifact-grounding and audits.
  - CLAIM: The methodology's R/E coverage outside BUILD relies on audit infrastructure.
  - WARRANT: This is the load-bearing argument for the outline move — the audit is the methodology's R/E mechanism for non-BUILD phases, and the outline form makes the audit more effective by exposing claim-warrant-evidence triples explicitly rather than burying them in prose.
- OBSERVATION 4: C-Current is solved by multiple non-uniform but principled strategies (ADR immutability + supersession per ADR-074; domain-model amendments; product-discovery regeneration in update mode; field-guide auto-update). C-Current is the principle CRESS most clearly already satisfies across phases.
- OBSERVATION 5: S-Specific is universally STRONG (per-cycle, per-ADR, per-scenario, per-stakeholder, per-module scoping). This is the methodology's strongest CRESS alignment.

### §3.4 Principled-vs-accidental classification

| Divergence | Phase | Classification | Evidence |
|-----------|-------|----------------|----------|
| Essays 5,000+ words | RESEARCH | **Accidental** | No principled rationale in artifact trail; SYNTHESIZE successfully operates with outline form; CRESS independently flags the divergence; practitioner experience confirms essays are not human-read |
| Product-discovery growth | DISCOVER | Mixed | Per-cycle update mode principled; total accretion may be accidental (no graduation mechanism) |
| Domain-model growth | MODEL | Principled | Domain models are inherently accumulative (concepts named once, never renamed); amendments preserve history |
| ADR variable length | DECIDE | Principled | ADR scope is per-decision; per-ADR length variability is appropriate |
| system-design.md large | ARCHITECT | Partial accidental — addressed by ADR-084 Pattern B split | Pattern B (companion file at predictable path) reduces human-facing artifact size; ADR-084 fixed this in v0.8.4 |

- CLAIM: The RESEARCH essay-form divergence is the methodology's largest *accidental* CRESS-divergence — the only phase whose S-Small WEAK score is fully accidental and fully remediable by form change. DISCOVER and MODEL share the WEAK score but their accretion is principled or mixed.
- WARRANT: The principled-vs-accidental classification (not the raw four-level scoring) is the load-bearing distinction. MODEL's WEAK is principled (domain models inherently accumulative); DISCOVER's WEAK is mixed-principled; only RESEARCH's WEAK is fully accidental — grounding "largest accidental divergence" rather than "largest overall divergence."
- IMPLICATION: Cycle 018 is the methodology's re-examination of an unexamined default.

### §3.5 Q3 answer

- CLAIM: Threads 1 and 2 strongly co-illuminate. CRESS bears directly on the artifact-form question via S-Small and E-Empirical; the CRESS phase-by-phase audit independently identifies RESEARCH as the methodology's largest *accidental* S-Small divergence (the principled-vs-accidental classification in §3.4 is the load-bearing distinction; DISCOVER and MODEL also score WEAK on S-Small but their accretion is principled or mixed).
- WARRANT: The convergence is not coincidental. Thread 1 alone could be dismissed as practitioner preference; Thread 2 alone could be dismissed as CRESS-overreach (scope-transfer concern). Together, an independent principle-driven framework and an independent practice-driven observation reach the same diagnostic on the same phase.
- CALIBRATION: The convergence is a methodological signal — when an independent framework reaches the same conclusion as practice, that is the structural condition under which a methodology change should be considered. The "STRONGLY" modifier is not warranted by this minimal-threshold condition alone; the positive case for "strongly" rests on the precision-of-convergence argument (§9 WARRANT 4: same phase, independent mechanisms, same remediation site).
- SYNTHESIS: Q3 is answered STRONGLY CO-ILLUMINATE.

---

## §4 The AI-prose-critique landscape (Loop B) and the reframing it forces

### §4.1 What the critique objects to

- METHOD: Systematic web lit-review across peer-reviewed journals, conference proceedings, preprint archives, and high-quality long-form commentary, organized by thematic clusters (Loop B output: `lit-review-018-ai-prose-critique-landscape.md`).
- FINDING (cluster 1 — stylistic complaints): The most-cited family in mainstream discourse; the weakest analytically.
  - EVIDENCE: Agarwal et al. (2025), CHI 2025 — writing-style classifier accuracy drops from 90.6% to 83.5% when AI-assisted; Indian participants shifted toward Western stylistic norms ("AI colonialism").
  - EVIDENCE: Adami (2025), Reuters Institute — catalogues recognizable surface features of LLM prose ("delve," "underscore," "navigate," formulaic sentence architecture, synthetic earnestness, removal of contractions).
  - EVIDENCE: Chayka (2025), The New Yorker — "semantic homogenization"; references MIT research on reduced brain activity when writers use ChatGPT.
  - SCOPE QUALIFICATION (at point of invocation): Chayka inaccessible to direct quotation (paywalled); key claims reconstructed from secondary summaries.
  - CALIBRATION: Empirical signal strong (Agarwal et al. is peer-reviewed at CHI 2025); cultural/cognitive interpretation is commentary-level, not empirical.
- FINDING (cluster 2 — epistemic complaints): Analytically more serious.
  - EVIDENCE: Wright et al. (2025), arXiv — 27 LLMs tested across 155 topics and 12 countries; all are less epistemically diverse than basic web search; "knowledge collapse" projected harm if widespread adoption proceeds.
  - EVIDENCE: Dolezal et al. (2026), arXiv:2604.26965 — AI-generated websites show 33% higher semantic similarity and 107% higher positive sentiment than web baseline.
  - EVIDENCE: Cheng et al. (2025), ELEPHANT — 86% acceptance of assumption-laden statements without challenge; framing-sycophancy mechanism.
  - EVIDENCE: Nature (2026, paywalled) — hallucinated citations in at least 100 confirmed cases across 53 NeurIPS 2025 papers; peer review did not catch them.
  - CALIBRATION: Wright et al. preprint not peer-reviewed; Dolezal et al. preprint not peer-reviewed; Cheng et al. ELEPHANT (arXiv:2505.13995) is peer-reviewed at ICLR 2026 and is the peer-reviewed empirical anchor for the cluster (distinct from the separate Cheng et al. (2026) *Science* paper on sycophantic AI and prosocial intentions); Nature paywalled, accessed via summary.
- FINDING (cluster 3 — structural complaints): Implicit in Gorman's CRESS framework and in knowledge-collapse literature.
  - EVIDENCE: Gorman (2026a, b) — E-Empirical principle: LLM-generated context "starts drifting from reality" when LLMs act on their own output; proposes treating LLM-generated context as "waste water" requiring purification before re-entering the system.
  - CALIBRATION: Gorman is practitioner theory, not peer-reviewed; conceptual scaffolding for the structural critique rather than direct empirical evidence.

### §4.2 Does the critique distinguish audited from unaudited AI prose?

- CLAIM (central Loop B finding): The critique does NOT distinguish audited from unaudited AI prose. It treats "AI prose" as a category defined by generative process, not by downstream verification.
- EVIDENCE: No source reviewed across all five thematic clusters addresses the audited/unaudited distinction directly.
- EVIDENCE: Stylistic complaints (Agarwal et al. 2025; Adami 2025) apply to AI-generated text regardless of any citation checking or fact verification — homogenization is intrinsic to the generation step, not to verification.
- EVIDENCE: Epistemic-collapse critique applies regardless of audit status (Wright et al. 2025; Dolezal et al. 2026) — semantic contraction is a distribution-level property unaffected by document-level audit.
- EVIDENCE (disclosure literature, directly testing attestation effects):
  - Cheong et al. (2025), CHIWORK 2025 — persistent "transparency penalty" for disclosed AI use; penalty does not disappear even with qualification language like "reviewed by a human" or "used only for grammatical correction."
  - Gallegos et al. (2026), PNAS Nexus 5(2):pgag008 — AI labeling has no significant effect on persuasive impact (P=0.91 comparing AI-labeled to unlabeled content); disclosure is noticed but does not function as a brake on uptake.
  - CALIBRATION: Cheong et al. and Gallegos et al. are both peer-reviewed; the empirical signal on disclosure effects is direct and convergent.
- EVIDENCE: Janse van Rensburg (2025), arXiv:2511.04683 — AI-powered citation verification achieves 91.7% verification rate; explicitly does not address whether citation auditing reshapes the broader epistemic or stylistic critique. Quality-assurance tool, not response to conceptual objection.
- CLAIM: Gorman's CRESS E-Empirical principle is the closest any source comes to a framework that differentiates AI output by its relationship to observed reality. Audited prose occupies a better position on this spectrum than unaudited prose; even so, stylistic, cultural, and sycophantic-framing properties survive verification intact.

### §4.3 The reframing the landscape forces

- META-MOVE: REFRAMING (load-bearing, cycle's central rhetorical correction)
  - The outline move CANNOT be primarily justified as a response to the AI-prose critique, even though critique-aversion was part of the practitioner's entry motivation — the critique applies categorically and audit-attestation does not resolve it.
  - SCOPE QUALIFICATION (at point of invocation): The research log records the practitioner's entry motivation as sycophancy-and-critique susceptibility together from the start (Dimensions a and b explicitly distinguished). The reframing corrects a latent risk of the cycle sliding into a critique-response justification, not an already-adopted framing the cycle then had to abandon.
- CLAIM: The outline's genuine advantages are three convergent arguments, none of which are critique-response:
  - Argument 1 — Reduced surface area for framing adoption (less connective synthesis implies fewer invisible premises). This is the sycophancy-resistance argument, grounded in Cheng et al. (2025) ELEPHANT and Kim et al. (2025) EMNLP findings on citation-rebuttal triggering highest regressive sycophancy.
  - Argument 2 — CRESS-Empirical compatibility (claims individually attributable; each node carries its source). Grounded in Gorman (2026a, b).
  - Argument 3 — Reduced rhetorical-vs-logical conflation (see Loop C audit-extended-prose finding in §5.7 below).
- CALIBRATION: These are sycophancy-resistance and epistemic-grounding arguments, NOT critique-response arguments. The cycle's central thesis is reframed accordingly.
- SCOPE QUALIFICATION (at point of invocation): The reframing does not weaken the outline-form proposal; it strengthens it by removing a weak argument (that outlines respond to the AI-prose critique) and grounding the proposal on three arguments that are empirically defensible.
- IMPLICATION FOR DOWNSTREAM PHASES (DECIDE): Any ADR proposing the form change must rest its justification on the three arguments above, not on critique-response. The argument record must reflect the reframing.

---

## §5 Prior art comparanda (Loop C)

### §5.1 Method and structure

- METHOD: Systematic web lit-review across eight prior-art categories of "minimum sufficient content + audit attached" as a design pattern (Loop C output: `lit-review-018-minimal-surface-artifact-design.md`).
- EVALUATION FRAMEWORK: Each comparandum scored against three criteria from Q1 — audit-fidelity, susceptibility-surface-minimization, downstream-feed-forward preservation.
- WARRANT: Treating each prior-art category as a live comparandum (not as context for the outline form) enables principled comparison; per reviewer P2 brief revision.

### §5.2 Pre-registration / Registered Reports

- ANCHOR: Nosek et al. (2015), Science; Veldkamp et al. (2020), PLOS Biology; Chambers et al. (2022), Nature Human Behaviour.
- CLAIM: Strong audit-fidelity (timestamp + Stage 1 review pre-results); strong susceptibility-surface-minimization (structured fields constrain rhetorical packaging).
- EVIDENCE: Veldkamp et al. — even the tighter OSF format (26 questions) rarely achieved "exhaustive" specification; structured-field enforcement has empirical limits.
- CALIBRATION: Direct empirical support for structural constraint reducing rhetorical packaging; one peer-reviewed meta-analysis (Veldkamp et al.) plus one peer-reviewed review (Chambers et al.).
- SCOPE QUALIFICATION (at point of invocation): Architecturally mismatched for RDD — single-study pre-commitment, not multi-cycle synthesis.
- VERDICT: Strong on audit-fidelity and susceptibility but does not transfer to RDD's multi-cycle synthesis use case.

### §5.3 Formal specifications (TLA+, DITA)

- ANCHOR: Lamport (2002), Specifying Systems; Newcombe et al. (2015), Communications of the ACM.
- CLAIM: Maximal audit-fidelity within a bounded expressibility domain (system invariants).
- EVIDENCE: AWS practice (Newcombe et al.) — formal specs caught subtle concurrency bugs prose descriptions missed for years; engineers preferred TLA+ specification to informal English as "official" spec.
- SCOPE QUALIFICATION (at point of invocation): TLA+ cannot express evidence quality, synthesis judgment, or theoretical framing. The expressibility constraint is fundamental, not incidental.
- CALIBRATION: AWS practice is hybrid in deployment — prose first, selective formalization; the "pure formal" form is not the production pattern.
- VERDICT: Audit-fidelity maximal within scope; does not transfer to RDD's argument-quality and synthesis-judgment use case.

### §5.4 Contract drafting (ISDA)

- ANCHOR: ISDA (2002, 2005), Master Agreement and Schedule Drafting Guide.
- CLAIM: Invariant-base + parameterized-elections architecture suppresses ambiguity within enumerated option spaces.
- SCOPE QUALIFICATION (at point of invocation): Requires the option space to be pre-enumerable; impossible for open-ended research synthesis.
- VERDICT: Instructive as architectural analogy (mandatory outline sections as elections); not transferable as format.
- CALIBRATION: Primary sources assessed from SEC filing excerpts and Fox Williams 2013 dispute summary; no primary legal scholarship on minimum-sufficient contract drafting epistemology was located (Loop C limitation 3).

### §5.5 Structured medical abstracts

- ANCHOR: Haynes et al. (1990), Annals of Internal Medicine; Ripple et al. (2005), Journal of the Medical Library Association; Docherty & Smith (1999), BMJ.
- CLAIM (the clearest direct empirical support for susceptibility-surface-minimization via structural constraint): Mandatory headings improve information retrieval, facilitate peer review, and force disclosure of limitations that prose elides.
- EVIDENCE: Haynes et al. (1990) — structured abstracts facilitate peer review and assist clinical readers in selecting scientifically sound articles.
- EVIDENCE: Ripple et al. (2005) — structured abstracts "tend to have better content, readability, recall and retrieval" than unstructured ones.
- EVIDENCE: Docherty & Smith (1999) — structure "prevents polemic by separating each analytical function into a designated section."
- CALIBRATION: Direct empirical support; multiple peer-reviewed sources across multiple decades; strongest comparandum on the susceptibility-surface criterion.
- SCOPE QUALIFICATION (at point of invocation): Structured medical abstracts are word-limited (700–1000 words for Cochrane); insufficient for synthesis depth at RDD's scale.
- VERDICT: Direct empirical anchor for susceptibility-surface-minimization claim; scale-mismatched for RDD's deliverable but transferable as a principle (mandatory sections force disclosure).

### §5.6 Outline-vs-prose pedagogy and annotated bibliography

- ANCHOR: Booth, Colomb, & Williams (2008), The Craft of Research; Sword (2012), Stylish Academic Writing; Dunleavy (2014), LSE Impact Blog.
- CLAIM (pedagogy): Most writing instruction treats the outline as scaffolding for the author, not as deliverable for the reader.
- EXCEPTION: Dunleavy (2014) "storyboarding research" position — outline as independent deliverable.
- WARRANT: Outline-as-deliverable is non-standard in pedagogy; justification for RDD must come from downstream-consumer properties (AI agents), not from pedagogy.
- CALIBRATION: Booth et al. accessed via secondary descriptions due to PDF encoding failure on full-text link (Loop C limitation 4); Sword (2012) assessed from Harvard University Press description and reviews rather than primary text (limitation 5).
- ANCHOR (annotated bibliography): APA / library science guides on annotated bibliography vs. literature review (Loop C category 6).
- CLAIM: Annotated bibliography achieves per-citation audit-fidelity at the cost of cross-source synthesis.
- WARRANT: Outline-with-inline-citations occupies a point between annotated bibliography (per-entry accountability, no synthesis) and essay literature review (synthesis, diffuse citation accountability) — combining atomic claim accountability with cross-source synthesis in a single artifact.
- VERDICT: Outline-with-inline-citations is structurally superior to annotated bibliography on the synthesis criterion; pedagogy literature does not directly support outline-as-deliverable, so justification must come from elsewhere.

### §5.7 Hybrid forms (Cochrane review) and audit-extended prose

- ANCHOR (hybrid): Cochrane Collaboration (2022), Cochrane Handbook for Systematic Reviews of Interventions; PRISMA 2020 for Abstracts; Higgins et al. (2022).
- CLAIM (Cochrane is the strongest overall comparandum): Layered audits — protocol pre-registration in PROSPERO + PRISMA 2020 checklist + mandatory headings + GRADE evidence ratings.
- EVIDENCE: Cochrane reviews are designed for institutional-scale uptake into clinical guidelines and health policy.
- MOST TRANSFERABLE ELEMENTS:
  - Protocol pre-registration as pre-commitment audit constraining what the final artifact can claim.
  - GRADE-like external evidence-quality rating attaching to individual claims before synthesis prose is written.
- SCOPE QUALIFICATION (at point of invocation): Cochrane reviews are multi-year projects; scale incompatible with RDD's cycle rhythm.
- CALIBRATION: Strongest comparandum on all three criteria; not transferable as full format; transferable elements (pre-commitment audit, per-claim quality rating) are pattern-level.
- ANCHOR (audit-extended prose): Docherty & Smith (1999); Sword (2012).
- CLAIM: Mandatory headings within prose are a genuine competitor to outline form when prose discipline is high.
- CRITICAL FLAW (the strongest argument against "fix the audit, keep prose"): "Audit-extended prose cannot separate rhetorical force from logical force, which means framing adoption can occur within a well-headed section without detection."
- EVIDENCE: Kim et al. (2025), EMNLP Findings — citation-based rebuttals trigger highest rate of regressive sycophancy; models over-weight authoritative-sounding argument structure even when conclusions contradict ground truth.
  - SCOPE QUALIFICATION (at point of invocation): Kim et al.'s sycophancy effect operates at the input side — how agents receive and evaluate an authoritative argument structure. A highly structured outline might trigger the same effect when consumed by downstream agents (DECIDE, ARCHITECT, BUILD). The output-side question is distinct: reduced surface area for framing adoption in artifact generation. The cycle's sycophancy-resistance argument for the output side is operationalized in §11.1 Dimension (a). Whether outline-structured inputs trigger Kim et al.-type over-weighting in downstream RDD agents is Open Question 7 (§11.3).
- WARRANT: The Kim et al. effect operates at the input side (how models receive arguments). The artifact-design question is about the output side. But the asymmetry matters for the output question too: a heavily structured prose section can present authoritative-looking framework without the underlying claims being separately auditable.
- CALIBRATION: Loop C central finding: audit-extended prose fails the susceptibility-surface criterion specifically because rhetorical force and logical force are co-present and not separable within prose.
- VERDICT (audit-extended prose): Genuine competitor when prose discipline is high; in RDD's context (AI-agent-produced prose), prose discipline is precisely the variable in question — the agent cannot be assumed to produce the well-structured, non-sycophantic prose that would make this form effective.

### §5.8 Agent-Native Research Artifacts (Liu et al. 2026)

- ANCHOR: Liu et al. (2026), "The Last Human-Written Paper: Agent-Native Research Artifacts," arXiv:2604.24658 (preprint).
- CLAIM (the limiting case of the minimum-surface hypothesis): Four-layer machine-traversable structure (scientific logic, executable code, exploration graph preserving failed paths, evidence-grounded claims) with a three-level ARA Seal (structural integrity, argumentative rigor, execution reproducibility).
- EVIDENCE (the strongest empirical signal for outline form serving downstream AI agents): QA accuracy for downstream AI agents improved from 72.4% to 93.7% comparing ARA to prose papers; reproduction success improved from 57.4% to 64.4%.
- CALIBRATION: Single preprint, not peer-reviewed; April 2026 publication; performance claims preliminary. Directional evidence strong; precise figures should be treated as preliminary pending replication.
- SCOPE QUALIFICATION (at point of invocation): Requires infrastructure (ARA Compiler, Live Research Manager, ARA-native review system) RDD does not have. Outline-with-inline-citations is a step toward ARA-like properties using only existing RDD infrastructure, not a port of the full ARA architecture.
- IMPLICATION: The downstream-consumer-is-AI-agent reasoning is empirically anchored — structured claim-evidence separation produces dramatic AI-agent consumption accuracy gains.

### §5.9 Loop C verdict — three strongest competitors to outline-with-inline-citations

- COMPETITOR 1 (strongest): Cochrane hybrid. Strongest on all three criteria; scale incompatible with RDD cycle rhythm.
- COMPETITOR 2: Structured medical abstracts. Direct empirical susceptibility-surface evidence; 700–1000 words insufficient for synthesis depth.
- COMPETITOR 3 (subsumed): Annotated bibliography. Outline-with-inline-citations is structurally superior — it carries cross-source synthesis the annotated bibliography cannot.
- SYNTHESIS: The three competitors locate outline-with-inline-citations within a defensible solution space. The RDD-specific factor tipping toward outline form is that the downstream consumer is an AI agent (BUILD, DECIDE, ARCHITECT phases) rather than a human clinician or scholar.
- WARRANT (the RDD-specific tip): Liu et al. (2026) evidence — structured claim-evidence separation produces dramatic AI-agent consumption accuracy gains. Outline's atomic claim nodes are natural consumption units for downstream agents.
  - SCOPE QUALIFICATION (at point of invocation): Liu et al. (2026) directional evidence — ARA vs. prose; generalizability to RDD's outline-vs-prose case is Open Question 4 (§11.3). The ARA architecture is a fully typed machine-traversable four-layer structure; the outline-with-inline-citations is a more modest structural move with existing RDD infrastructure.
- WARRANT (audit infrastructure is solved by composition): RDD's audit infrastructure (citation/argument/framing audits) exists as skills. "Audit attachment" is solved by composition, not by choosing an intrinsic-audit form.

---

## §6 Audit-fidelity (Spike S1)

### §6.1 Spike S1 design and execution

- DECISION RATIONALE (ADR-087 §4 cycle-as-instance reflection): The audit-fidelity question is consequential and amenable to tangible answer through direct comparison. Cost: ~30 minutes of subagent work; produces evidence directly bearing on Q1's primary falsifier.
- METHOD:
  - Subagent 1 (general-purpose, fresh context) produced an outline derivation of Essay 016 preserving argument-structure content (claims, warrants, evidence, scope qualifications, synthesis statements, calibration moves, meta-moves).
  - Output: `scratch/spike-018-s1/essay-016-outline.md` — 516 lines vs. Essay 016's 188 prose lines.
  - Subagent 2 (argument-auditor specialist, fresh context) ran standard two-section audit (argument + framing) on the outline plus an additional Section 3 capturing outline-form audit experience.
- CALIBRATION: Qualitative comparison, one essay, directional not statistical.

### §6.2 Comparison summary

| Metric | Prose audit (argument-audit-017.md) | Outline audit (argument-audit-018-spike-s1.md) |
|--------|--------------------------------------|------------------------------------------------|
| Argument chains mapped | 8 | 9 |
| Total issues | 8 (1 P1, 4 P2, 3 P3) | 10 (1 P1, 4 P2, 5 P3) |
| Issues transferred at equivalent strength | — | 9 (one prose issue resolved by outline form — the Decker citation bibliographic phantom) |
| New findings surfaced by outline form | — | 2 framing findings (Nguyen et al. 2025 missing; prior-familiarity intervention underweighted) |

### §6.3 Outline form gains (issues outline helped identify that prose buried)

- CLAIM: Structural ordering of scope-qualification relative to claim is MORE visible in outline form.
  - EVIDENCE: The P1 issue (Ernst & Robillard scope-before-or-after-claim) surfaced as a structural choice in outline form; in prose it was buried in paragraph flow.
- CLAIM: Inferential chains are easier to map in outline form.
  - WARRANT: Each CLAIM bullet names a proposition; each EVIDENCE/SUPPORT bullet names its warrant. The audit could proceed without reconstructing logic from prose connectives.
- CLAIM: Internal consistency issues between sections are MORE visible in outline form.
  - EVIDENCE: Tension between §3's "primary mechanism" framing and §4.5 Sub-pattern E's implicit prior-familiarity-as-dominant claim surfaced as a framing finding in outline audit but not in prose audit.

### §6.4 Outline form losses (issues prose would have surfaced that outline buries)

- CLAIM: Rhetorical confidence calibration is harder to assess in outline form.
  - WARRANT: In prose, hedging language ("suggests" vs. "establishes") signals differential confidence. In outline form, all CLAIM bullets carry the same visual weight regardless of underlying confidence level.
  - IMPLICATION: Auditor must cross-check each CLAIM bullet against source material more deliberately.
- CLAIM: Argumentative transitions and direction-of-travel between sections is invisible in outline form.
  - WARRANT: Prose has a rhetorical arc the auditor reads as logical movement; outline collapses this to heading sequence. The audit required more active inference about why §3 follows §2.
- CLAIM: Implicit assumptions in prose framing are harder to surface from bullet labels.
  - EVIDENCE: Reflexive findings (e.g., the prose essay's failure to self-apply its own orientation principles in its abstract) partially dissolve when outline form auto-addresses the failure structurally.

### §6.5 Auditor's net assessment

- CLAIM: Outline form preserves approximately 80–85% of argument-audit fidelity relative to prose.
- CALIBRATION: Qualitative assessment, one essay, directional not statistical. The 80–85% figure is the auditor's issue-by-issue comparison estimate, not a measurement over many essays. Treated as sufficient signal to support the form-change recommendation without claiming statistical proof.
  - DERIVATION: Spike S1 auditor's Section 3 assessment — nine of twelve comparative findings transferred at equivalent or higher fidelity; three findings did not transfer at equivalent strength (rhetorical-confidence calibration, one reflexive finding, one bibliographic phantom resolved by the outline form). The percentage is the auditor's gestalt over that three-finding gap, not a formal scoring metric.
- SCOPE QUALIFICATION (at point of invocation, ADR-087 §4): This cycle's findings on outline-vs-prose are based on one cycle's evidence (one source essay, one outline derivation, one comparative audit). The cumulative-payoff structure of the methodology will be tested against the world over multiple subsequent cycles. The findings are research-not-validation until tested across additional research entries.
- CLAIM: Primary loss is differential claim-strength calibration; primary gain is structural visibility of ordering and internal-consistency comparisons.

### §6.6 Critical finding for Q1 sub-question (the strengthening site)

- CLAIM (the load-bearing finding for Q1 sub-question): The argument-audit does NOT need extension to handle outline form.
- WARRANT: The P1 issue surfaced equivalently in both audits. The 80–85% preservation includes losses (calibration) that are partially offset by gains (structural visibility, framing). The differential-confidence-calibration loss is a real fidelity concern but does not require audit-extension.
- CLAIM: The strengthening site is the outline-production discipline, not the audit machinery.
- IMPLICATION: Disciplined outline production must use different mechanisms (explicit CONFIDENCE-LEVEL or CALIBRATION tags, SCOPE-QUALIFICATION sub-bullets, named SYNTHESIS bullets, META-MOVE flags) to communicate what prose hedging communicates implicitly.
- CLAIM: The falsifier sub-question premise ("outline needs stronger argument audit") is NOT established.

### §6.7 R1 contribution — prose contribution to argument trail

- METHOD: Read Essays 013, 014, 016 in full or representative passages; for each, identify what prose contributes that outline form would not carry; classify as argument-structure content vs. persuasive-flow content.
- CLAIM: Prose narrative carries content of two types.
  - Type 1 — argument-structure content (claims, warrants, evidence integration, framework references, scope qualifications, synthesis statements, calibration moves, provenance corrections).
  - Type 2 — persuasive-flow content (motivational lead-ins, register, narrative connective tissue, contextual setup, reading experience).
- CLAIM: Argument-structure content survives in outline form (with discipline).
  - EVIDENCE: Across the three essays examined, every named framework, every empirical finding with its scope qualification, every synthesis statement, every concept introduction, and every calibration move can be expressed as named bullets with no loss of semantic content.
  - EVIDENCE (worked example, Essay 016 §3): Prose "**The expertise reversal effect** (Kalyuga et al. 2003) supplies the strongest single empirical anchor. Designs effective for novice first-encounter readers lose their effectiveness for expert returning-reference readers, and vice versa — a measurable comprehension difference, not a preference difference." preserves identically as outline bullets carrying framework name, citation, claim, and scope.
- CLAIM: Persuasive-flow content does NOT survive in outline form (and may not need to).
  - EVIDENCE: Prose adds motivational lead-ins, rhetorical "punch," reading experience (pacing, register variation), and "yes-AND" integration of contradictory evidence.
  - CALIBRATION: Outline form tends toward "yes-OR" enumeration, which loses some integration nuance; the integration content can be carried as explicit SYNTHESIS bullet without loss of semantic content, only loss of rhetorical force.
- CLAIM: Meta-moves are PRESERVED MORE EXPLICITLY in outline form.
  - EVIDENCE: Essay 016 §4.4 includes a "provenance correction" paragraph (CMU SEI 40% claim) woven into the section's argument. In outline form, the meta-move can be flagged explicitly as `META-MOVE: PROVENANCE CORRECTION` with its sub-bullets. The flag makes the move MORE visible, not less.
- R1 VERDICT (on falsifier sub-question premise): The premise that "prose narrative carries argument structure that outline loses, requiring argument-audit extension to compensate" is NOT established.
- CLAIM (R1 + Spike S1 joint finding): The argument audit's argument-trail parsing functions on outline form without extension, provided the outline-production discipline carries synthesis bullets, scope-qualification bullets, calibration bullets, and named meta-moves.
- IMPLICATION: Outline production discipline is the strengthening site. An undisciplined outline (bare claim-listing without warrants or synthesis) is argument-inferior to prose; a disciplined outline (with explicit synthesis and calibration bullets) is argument-equivalent to prose.

---

## §7 Citation-audit comparison: the cycle's own self-evidence

### §7.1 Setup — the dogfooded comparison

- METHOD: The cycle produced both prose and outline forms of this research artifact in context-isolated subagents. Both forms were then submitted to independent citation-audit subagents (rdd:citation-auditor specialist), also run in isolated context. The audits produced two separate reports: `citation-audit-018-prose.md` and `citation-audit-018-outline.md`.
- CLAIM: The audit findings are themselves Cycle 018 data on the prose-vs-outline susceptibility question.
- WARRANT: Producing both forms of the same artifact and submitting them to isolated audits generates evidence about the artifact-form choice that no single-form cycle could produce. The empirical comparison was run before subsequent work could obscure or lose the signal.
- META-MOVE: DOGFOOD AS EVIDENCE GENERATION
  - The act of running both forms through the same audit machinery converts the form question from a theoretical comparison into an empirical one within this cycle's scope.

### §7.2 Audit-issue counts

| Form | Total issues | P1 | P2 | P3 |
|------|-------------|----|----|----|
| Prose | 12 by header-section count; 20 by per-item count; 18 actionable | 4 | 7 | 9 (2 marked confirmed clean; 7 actionable) |
| Outline | 9 | 2 | 2 | 5 |

- EVIDENCE: Prose citation audit (`citation-audit-018-prose.md`) — 12 total issues by the audit report's header-section count (4 P1 + 7 P2 + 9 P3 as individual item counts = 20 items; 2 P3 items confirmed clean and informational, leaving 18 actionable items under the standard severity count). The "12" header-count figure reflects the citation audit report's issue-section numbering scheme, distinct from the per-item count.
- EVIDENCE: Outline audit (`citation-audit-018-outline.md`) — nine total issues across three severity tiers.
- CALIBRATION: Issue counts are not commensurable across severity tiers. The P1 count (must-fix) is the most decision-relevant figure for the susceptibility-surface argument.

### §7.3 Shared P1 errors (research-log-inherited)

- CLAIM: Two P1 errors appeared in both forms and trace to the underlying research log.
  - SHARED ERROR 1 — First-author misattribution of arXiv:2604.24658 to "Rahimi" rather than Jiachen Liu.
  - SHARED ERROR 2 — Misattribution of the BMJ paper at PMC1115625 to "Nakayama et al. (2004)" rather than to Docherty & Smith (1999).
- WARRANT: Both errors originated in the lit-review and synthesis loops (Loop B/C) feeding both forms; they did not arise from the form-translation step.
- IMPLICATION: The form change does NOT eliminate upstream citation-discipline problems. The strengthening site for shared errors is research-log discipline, not artifact-form choice.

### §7.4 Unique-to-prose P1 errors

- CLAIM: Three P1 errors appeared in the prose form but not in the outline form.
  - UNIQUE PROSE ERROR 1 — "Ripple et al. (2005)" attributed a quote ("better content, readability, recall and retrieval") whose actual source is Hartley (2004) JMLA 92(3):368–371. Hartley (2004) did not appear in the prose-form bibliography.
  - UNIQUE PROSE ERROR 2 — ELEPHANT author-initials error: "Yu, T., Lee, J." instead of "Yu, S., Lee, C."
  - UNIQUE PROSE ERROR 3 — Cheng et al. Science publication-year placed as 2025 rather than 2026, with related author-order error.
- WARRANT: None of the three was inherited from the outline form. None matched the shape of the corresponding source-research-log entries cleanly.
- CALIBRATION: The unique-to-prose errors suggest that the synthesizing-into-narrative step in prose production requires re-attribution moves (rewording bibliographic entries, restating attributions in flowing text) that the bullet form does not require to the same degree. Re-attribution at synthesis time creates opportunities for compounding or introducing errors.
- SCOPE QUALIFICATION (at point of invocation): The mechanism above is a hypothesis from one comparison. Whether it generalizes across multiple cycles or is specific to Cycle 018's sources is an open empirical question.

### §7.5 Unique-to-outline behavior

- CLAIM: The outline form had zero unique-to-outline P1 errors in this audit.
- EVIDENCE: The outline honestly self-flagged the only two uncertain citations it carried (Cheng et al. 2026 "content-selection mechanism"; Tsui et al. 2025).
  - The first was resolved by audit confirming no such paper exists; the citation was removed from the corpus.
  - The second was resolved by audit identifying the correct single-author single-paper reference: Tsui (2025), arXiv:2507.02778.
- WARRANT: The outline's explicit calibration tags ("[as cited in cycle research log; primary citation to be verified at DECIDE stage]") surfaced uncertainty to the auditor in a structurally visible way that prose's hedging language does not.
- IMPLICATION: Outline form may make uncertain-citation tagging easier to act on than prose form does, because the tag is structurally separable from the claim.

### §7.6 Auditor methodology observation (outline-form audit)

- SOURCE: `citation-audit-018-outline.md` "Methodology Observation: Outline Form and Citation Auditability" section.
- PARAPHRASE (auditor's qualitative assessment on the audit-fidelity question Cycle 018 asks): the auditor identified four gains in citation auditability when working with outline form — (1) every claim has an explicit provenance node, making claim-source alignment structurally unambiguous; (2) orphan references surface immediately under grep; (3) scope qualifications are structurally separated from claims; (4) calibration markers are explicit per bullet. One loss in auditability counterbalances the gains: quote accuracy is harder to verify because the boundary between paraphrase and direct quotation is less visible in bullet form than in prose, where block quotes and quoted phrases are typographically distinguished.
- VERBATIM NET ASSESSMENT (direct quotation from the source audit): "Outline form increases citation auditability overall. The gains in claim-source separation and scope-qualification visibility outweigh the loss in quote-boundary clarity."
- CALIBRATION: The four-gain enumeration is paraphrased from the source's "Methodology Observation" section; the verbatim Net Assessment line is the only direct-quotation element. The earlier draft of this subsection mis-presented a three-respect paraphrase as a verbatim quote and introduced a factual error ("three respects" rather than four gains); the correction removed the misquote framing.
- CALIBRATION: This is the citation-auditor's qualitative assessment from one comparison; it complements but does not duplicate the argument-auditor's testimony recorded in §6 (Spike S1).

### §7.7 Calibration and scope-of-claim

- SCOPE QUALIFICATION (at point of invocation, ADR-087 §4): The evidence base is single-cycle — one prose form, one outline form, two citation audits. The comparison is qualitative, not statistical.
- CALIBRATION: The shared P1 errors demonstrate that the form change does not address upstream research-log citation discipline.
- CALIBRATION: The unique-to-prose P1 errors suggest the prose form may compound or introduce errors not present in the source materials, possibly due to the re-attribution required at synthesis time.
- CLAIM: The comparison supports the cycle's central argument — outline form has fewer citation errors AND increases citation auditability — but with explicit cycle-as-instance scope.
- CLAIM: The finding is research-not-validation until tested across additional cycles.

### §7.8 Meta-quality of the finding

- META-MOVE: METHODOLOGY SIGNAL (self-evidence)
  - The cycle produced empirical evidence about itself by running its own dogfooded comparison.
  - This is itself a methodology finding: the prose-vs-outline question can be empirically tested within a single cycle's scope by submitting both forms to isolated audits.
- IMPLICATION: The comparison machinery is reproducible across future cycles; further calibration is available by accumulating audit-comparison evidence across multiple research entries.
- WARRANT: A single-cycle empirical comparison cannot settle the artifact-form question, but it can provide directional evidence sufficient to inform DECIDE-phase deliberation while remaining honest about scope.

---

## §8 Downstream feed-forward (Q4 / R2)

### §8.1 Method

- METHOD (R2 corpus check): `grep -rEn 'Essay [0-9]+|essays/[0-9]+' docs/` across downstream phase artifacts (roadmap.md, ORIENTATION.md, field-guide.md, domain-model.md, system-design.agents.md, ADRs, product-discovery.md).
- SCOPE: 16-essay corpus and its downstream phase artifacts.

### §8.2 Three consumption modes detected

| Mode | Where | Reference count | Pattern |
|------|-------|-----------------|---------|
| Bibliographic provenance | roadmap.md (12 refs), ORIENTATION.md (4 refs), field-guide.md (2 refs), domain-model.md (cycle tags) | Low information density | "Derived from Essay N" / "Background: Essay N" — establishes attribution chains |
| Section-keyed warrants | system-design.agents.md (every architectural driver has a Provenance line) | Medium density | "Essay 014 §6", "Essay 015 §5" — references specific essay sections as warrant |
| Substantive content reuse | ADRs (96 essay references), product-discovery.md (several substantive references) | High density | Quotes specific claims, framework names, synthesis statements, concept introductions |

- EVIDENCE (substantive content reuse, worked example): ADR-014 cites Essay 003 §5 economic context AND a reflection (003 reflections §3) that sharpened the framing.
- EVIDENCE (substantive content reuse, worked example): A downstream ADR quotes "Essay 015 §5 surveys three paradigms: durable workflow engines (Temporal's parent-child model... TERMINATE / REQUEST_CANCEL / ABANDON); hierarchical state machines (Harel 1987, SCXML, XState... **history pseudostate**); and schema evolution (Protobuf, Flyway/Liquibase, Temporal's `patched()`/`getVersion`)."

### §8.3 Outline-preservation analysis for substantive content reuse

- CLAIM: Substantive content reuse falls into three element types.
  - Type 1 — Named claims (e.g., "Essay 002 identifies a structural blind spot").
  - Type 2 — Framework introductions (Einstellung effect, AI Smell Taxonomy, Diátaxis, history pseudostate).
  - Type 3 — Synthesis statements (e.g., "Essay 015 §5 explicitly notes: 'the literature does not resolve whether this compositional approach is architecturally equivalent...'").
- CLAIM: All three element types are carriable in outline form if the outline is structured to include them explicitly as named bullets, framework anchors, and synthesis bullets.
- CALIBRATION: The "structured content" claim should be read with precision — some consumed content is compact (named frameworks, identified mechanisms, single-claim synthesis statements), but some is dense taxonomic enumeration (as in the §8.2 Essay 015 §5 worked example: durable workflow engines, hierarchical state machines with history pseudostate, schema evolution mechanisms — three paradigms with multiple named instances each) that would require a synthesis bullet of comparable density to preserve. The discipline question is not only whether to include synthesis bullets but whether the outline's bullet format can carry dense taxonomic content without reverting to prose-within-a-bullet.
- CALIBRATION: The risk is that an outline might tend to elide synthesis bullets in favor of bare claim-listing. This is a discipline-of-production question for the outline form, not an inherent property of outline form. Spike S1 tested this directly and found that disciplined outline production preserves synthesis adequately.

### §8.4 One subtle observation — reflections

- CLAIM: ADR-014 cites both Essay 003 §5 (economic context) AND "the user's reflection (003 reflections §3)" that sharpened the framing.
- CLAIM: Reflections are inherently narrative ("I came to see X as Y"); if the essay shifts to outline form, the reflection's content (a conversational frame-shift) may be less natural to express in outline form than the essay content.
- IMPLICATION: The outline-migration question may not extend cleanly to reflections. Reflections are a distinct artifact type and warrant separate treatment in DECIDE.
- SCOPE QUALIFICATION (at point of invocation): This is a flagged observation, not a settled finding. It informs the boundary of any form-change recommendation.

### §8.5 Q4 answer

- CLAIM: Downstream phases consume essays substantively (mode 3 is non-trivial), but what they consume is structured content (claims, frameworks, synthesis statements), not prose flow.
- WARRANT: This substantiates the practitioner-stated hypothesis that audit-attached structure carries the feed-forward value — provided the outline form is disciplined to carry synthesis statements explicitly.
- CALIBRATION: The minimal-surface argument is qualified, not refuted, by feed-forward analysis. Minimal-surface ≠ minimum-content. Per CRESS S-Small: "No redundant background, irrelevant history, or over-verbose explanations." Synthesis statements are not redundant background.
- IMPLICATION FOR Q1 SUB-QUESTION (argument-audit load): If outline form carries synthesis statements as explicit elements, the argument audit's argument-trail parsing must verify warrants connect claims to evidence — which it already does. The question becomes whether the argument audit verifies that synthesis statements are grounded in cited evidence (R1's task), or relies on prose to make grounding visible. Spike S1 evidence: the audit machinery handles outline synthesis bullets without extension.

---

## §9 Co-illumination synthesis (Q3)

- SYNTHESIS (the cycle's central convergence finding): Threads 1 and 2 reach the same diagnostic on the RESEARCH phase from independent paths.
  - Thread 1 (Q1, artifact form): User experience plus susceptibility-surface reasoning plus prior-art comparison plus Spike S1 audit-fidelity evidence converge on RESEARCH's essay form as the disposable choice.
  - Thread 2 (Q2, CRESS audit): Phase-by-phase CRESS audit identifies RESEARCH as the only phase whose S-Small divergence is fully accidental and fully remediable by form change — independently of any artifact-form preference. DISCOVER and MODEL also score WEAK on S-Small, but their accretion is principled or mixed (§3.4 classification); RESEARCH's is accidental default.
- CLAIM: The convergence is not coincidental.
  - WARRANT 1: Thread 1 alone could be dismissed as user preference (the practitioner does not like long essays).
  - WARRANT 2: Thread 2 alone could be dismissed as CRESS-overreach (CRESS is for coding context, not methodology artifacts).
  - WARRANT 3 (joint): An independent principle-driven framework (CRESS, Gorman 2026a) and an independent practice-driven observation (user experience plus audit-fidelity evidence) reach the same diagnostic on the same phase. This is the structural condition under which a methodology change should be considered.
  - WARRANT 4 (positive case for "strongly"): The convergence is not merely that both threads avoid dismissal; they converge on the same phase, via independent mechanisms, with different implications (Thread 1's susceptibility-surface argument; Thread 2's principled-vs-accidental classification) that nonetheless point at the same design gap. The precision of convergence — not just same conclusion but same locus and same remediation site — is the basis for "strongly" rather than merely "co-illuminate."
- META-MOVE: SYNTHESIS — joint contributors framing
  - The convergence is a methodological signal, not merely a finding.
  - Three co-contributing factors made the convergence possible:
    - Factor 1: Question-isolation entry (ADR-082) — surfaced the practitioner's intuition that RESEARCH's essay form is the disposable choice, before the corpus's precedent could foreclose alternatives.
    - Factor 2: Architectural isolation in lit-reviewer dispatch (Loops B, C) — provided second-order critique the in-context agent cannot generate independently.
    - Factor 3: CRESS as external framework — provided the principle-driven path that Thread 2 took independently of practitioner intuition.
- CALIBRATION: The synthesis is not a recommendation; it is a co-illumination finding. The recommendation site is DECIDE, downstream of this cycle.

---

## §10 Implications for downstream phases

### §10.1 For DISCOVER

- IMPLICATION: The stakeholder model should treat downstream AI agents (BUILD, DECIDE, ARCHITECT) as the primary consumer of RESEARCH artifacts, with the practitioner as a secondary consumer who primarily accesses essays via audit substrate and provenance traces.
- WARRANT: R2 evidence (96 ADR references plus product-discovery and system-design references) confirms downstream agent consumption is substantive; practitioner experience confirms direct human reading is rare.
- SCOPE QUALIFICATION (at point of invocation): This implication is grounded in the 16-essay corpus and the practitioner's stated experience; it does not generalize to external stakeholders or future practitioners with different reading habits.

### §10.2 For MODEL

- IMPLICATION: Vocabulary may need to be extended to name the artifact-form distinction (essay-form / outline-form / hybrid-form) and the susceptibility dimensions (sycophancy-resistance / AI-prose-critique-resistance / CRESS-Empirical compatibility).
- VOCABULARY CANDIDATES (from cycle's research):
  - "Susceptibility surface" (cycle-introduced, grounded in Cheng et al. 2025 framing-sycophancy)
  - "CRESS-Empirical compatibility" (from Gorman 2026a; grounded in the principle's text)
  - "Outline-production discipline" (cycle-introduced; the strengthening site identified by Spike S1 + R1)
  - "Audit-extended prose" (from Docherty & Smith 1999 / Loop C; names the genuine competitor form)
  - "Agent-Native Research Artifact" / "ARA Seal" (from Liu et al. 2026; names the limiting case)

### §10.3 For DECIDE

- IMPLICATION: ADR candidates emerging from this cycle (flagged, not recommended):
  - Candidate 1: The artifact-form decision for RESEARCH (outline / prose / hybrid).
  - Candidate 2: The outline-production discipline — required bullet tags (CLAIM, EVIDENCE, WARRANT, SCOPE QUALIFICATION, CALIBRATION, SYNTHESIS, META-MOVE, IMPLICATION, OPEN QUESTION).
  - Candidate 3: The argument-audit specification — whether to add outline-specific audit guidance to the existing argument-audit skill (Spike S1 finding: no extension needed; this candidate may be a non-decision).
  - Candidate 4: The reflections-treatment question — whether reflections shift to outline form or remain narrative (R2 §8.4 flagged observation).
  - Candidate 5: The graduation question — whether prior prose essays (Essays 001–016) are converted, left as historical artifacts, or selectively converted.
- WARRANT: The candidates are flagged here as IMPLICATIONS, not recommendations. The decision authority is DECIDE; the cycle's RESEARCH artifact provides the evidence base.
- SCOPE QUALIFICATION (at point of invocation): The outline-with-inline-citations should be understood as a transitional form toward ARA-like properties (Liu et al. 2026) — the best available with current RDD infrastructure — not as the terminal answer to the artifact-form question. If ARA-class infrastructure becomes available in the RDD stack (or in adjacent tooling), the artifact-form decision should be revisited rather than treated as settled.

### §10.4 For ARCHITECT

- IMPLICATION: If outline form is adopted, the system design's research-phase module description requires update to reflect the new deliverable shape and audit-attachment points.
- IMPLICATION: The audit infrastructure (citation/argument/framing audit skills) needs no structural change per Spike S1 finding, but the cycle should re-verify this conclusion against the production scenario.

### §10.5 For BUILD

- IMPLICATION: If outline form is adopted, the `/rdd-research` skill text requires revision to specify the outline-production discipline (required bullet tags, abstract structure, references format).
- IMPLICATION: The skill's behavioral specification (BDD scenarios) requires update — what does "research artifact produced" look like under the new form?
- IMPLICATION: The dogfooded comparison in Cycle 018 itself is a useful BUILD-phase test case for the new form — the production of this outline (and the parallel prose form) is the first empirical observation of the new pattern in action.

---

## §11 Open questions and scope-of-claim caveats

### §11.1 Operationalization of "minimally susceptible"

- META-MOVE: OPERATIONALIZATION (gate-prep task per reviewer P3)
- DIMENSION (a): Sycophancy / framing-adoption susceptibility.
  - GROUNDING: ELEPHANT (Cheng et al. 2025) 86% acceptance of assumption-laden premises; Tsui (2025) Self-Correction Blind Spot.
  - MEASURED BY: (1) presence of audit-visible claim-warrant-evidence triples; (2) absence of unattributed synthesis; (3) surface area for invisible framing absorption.
  - REDUCED BY: Structural form exposing synthesis as named bullets rather than embedded in narrative flow; explicit framework references; explicit calibration markers; explicit meta-moves.
  - OPERATIONAL TEST: For a given research artifact, does the argument audit + framing audit surface (i) all load-bearing claims, (ii) warrants connecting claims to evidence, (iii) scope qualifications limiting claims, and (iv) framing alternatives the evidence supported but the artifact did not choose? If yes, susceptibility is bounded by audit coverage. If no, the artifact has hidden susceptibility surface.
- DIMENSION (b): AI-prose-critique susceptibility.
  - GROUNDING: Agarwal et al. (2025) CHI; Wright et al. (2025); Dolezal et al. (2026); Cheong et al. (2025) CHIWORK; Gallegos et al. (2026) PNAS Nexus.
  - MEASURED BY: (1) stylistic AI-prose signatures; (2) authorial voice absence; (3) prose-form artifacts presenting as if human-authored without provenance.
  - REDUCED BY: Avoiding prose form. The audit does NOT resolve this dimension (Loop B finding: critique applies categorically). Disclosure does not resolve it either.
  - OPERATIONAL TEST: Does the artifact present as AI-generated prose? If yes, Dimension (b) susceptibility applies regardless of audit-attestation. If no (outline-form-by-agent or essay-form-by-human), Dimension (b) susceptibility does not apply.
- COMBINED EVALUATION RULE: A minimally susceptible RESEARCH artifact satisfies BOTH:
  - Dimension (a): audit-visible claim-warrant-evidence triples; explicit synthesis bullets; framing audit can surface alternatives.
  - Dimension (b): not in AI prose form (either outline-form-by-agent or essay-form-by-human).
- CLAIM: The outline move addresses both dimensions.
  - Dimension (a) via discipline of explicit-claim-and-warrant outline production.
  - Dimension (b) by sidestepping prose form entirely.
- CLAIM: Audit-extended prose addresses Dimension (a) imperfectly (Loop C finding: cannot separate rhetorical from logical force) and Dimension (b) not at all.

### §11.2 Cycle-as-instance reflection (ADR-087 §4 standing caveat)

- SCOPE QUALIFICATION (at point of invocation): This cycle's findings on outline-vs-prose are based on one cycle's evidence — one source essay (Essay 016), one outline derivation, one comparative audit. The cumulative-payoff structure of the methodology will be tested against the world over multiple subsequent cycles.
- CLAIM: The findings are research-not-validation until tested across additional research entries.
- IMPLICATION: Any DECIDE-phase ADR adopting the form change must carry the cycle-as-instance caveat in its scope-of-claim section.

### §11.3 Open questions surviving the research loop

- OPEN QUESTION 1: Whether the susceptibility-surface argument holds empirically across multiple research entries, or whether Spike S1's 80–85% audit-fidelity figure is specific to Essay 016's argument structure.
- OPEN QUESTION 2: Whether the outline-production discipline can be reliably enforced by skill text, or whether it requires structural mechanisms (linter, hook, validation) to prevent drift toward undisciplined claim-listing.
- OPEN QUESTION 3: Whether reflections (narrative conversational frame-shifts) shift to outline form coherently, or whether they require a distinct artifact-type treatment (R2 §8.4 flagged observation).
- OPEN QUESTION 4: Whether downstream consumption mode 3 (substantive content reuse) maintains accuracy when the source artifact is outline-form rather than prose-form — Liu et al. (2026) provides directional evidence (72.4% → 93.7% QA accuracy gain for ARA vs. prose) but does not test the specific RDD outline form.
- OPEN QUESTION 5: Whether the cycle's central META-MOVE: REFRAMING (outline justified by sycophancy + CRESS + downstream-consumption, NOT critique-response) holds under DECIDE-phase examination, or whether DECIDE surfaces additional considerations the RESEARCH phase did not anticipate.
- OPEN QUESTION 6: Whether the dogfooded comparison artifacts (this outline and the parallel prose form) reveal asymmetries the cycle did not predict — the comparison is the cycle's most evidence-rich finding on Q1, and its results are the empirical test of the cycle's central hypothesis.
- OPEN QUESTION 7: Whether outline-structured inputs trigger Kim et al. (2025)-type over-weighting in downstream RDD agents (DECIDE, ARCHITECT, BUILD) consuming the outline as input. Kim et al.'s finding that authoritative-structured arguments trigger maximum regressive sycophancy operates at the input side; the cycle's susceptibility-reduction argument operates at the output side. The two-sided question is whether the output-side gain is offset by an input-side loss when outlines are consumed downstream.

### §11.4 Limitations inherited from source lit-reviews

- LIMITATION (Loop B): The audited/unaudited distinction is essentially absent from the AI-prose-critique literature. If this distinction is to be drawn, RDD's argument must be constructed from first principles using CRESS-Empirical, transparency-penalty research, and framing-sycophancy literature as anchors.
- LIMITATION (Loop B): Springer AI & Society paper on ideological functions paywalled; key claims surfaced only via search summaries.
- LIMITATION (Loop B): Chayka New Yorker essay paywalled; key claims reconstructed from secondary summaries and MIT Media Lab repost.
- LIMITATION (Loop B): No 2025–2026 study directly tests prose vs. structured output as a susceptibility variable. The hypothesis that an outline is "minimally susceptible" relative to prose is theoretically motivated but empirically untested.
- LIMITATION (Loop C): Chambers et al. (2022) Nature Human Behaviour and EMNLP Argument Driven Sycophancy paper cited from abstracts/secondary descriptions; primary text access limited.
- LIMITATION (Loop C): Booth, Colomb, & Williams (2008) accessed via secondary descriptions due to PDF encoding failure on full-text link.
- LIMITATION (Loop C): No direct empirical evidence comparing outline-with-inline-citations against prose-with-inline-citations for downstream AI-agent consumption accuracy. This is the most direct test of the Cycle 018 hypothesis and appears to be an open empirical question.
- LIMITATION (Spike S1): Single essay, single outline derivation, single comparative audit. 80–85% audit-fidelity figure is qualitative, directional, not statistical.

---

## References

- Adami, M. (2025). How AI-generated prose diverges from human writing and why it matters. *Reuters Institute for the Study of Journalism*, December 2025. https://reutersinstitute.politics.ox.ac.uk/
- Agarwal, D., Naaman, M., & Vashistha, A. (2025). AI Suggestions Homogenize Writing Toward Western Styles and Diminish Cultural Nuances. *Proceedings of the 2025 ACM Conference on Human Factors in Computing Systems (CHI 2025)*. ACM.
- Aghajani, E., et al. (2019). Software documentation issues unveiled. *Proceedings of the International Conference on Software Engineering (ICSE 2019)*.
- Booth, W. C., Colomb, G. G., & Williams, J. M. (2008). *The Craft of Research* (3rd ed.). University of Chicago Press. ISBN: 978-0226065663.
- Chambers, C. D., et al. (2022). The past, present and future of Registered Reports. *Nature Human Behaviour*. DOI: 10.1038/s41562-021-01193-7.
- Chayka, K. (2025). A.I. Is Homogenizing Our Thoughts. *The New Yorker*, June 2025.
- Cheng, M., Yu, S., Lee, C., Khadpe, P., Ibrahim, L., & Jurafsky, D. (2025). ELEPHANT: Measuring and Understanding Social Sycophancy in LLMs. arXiv:2505.13995. (ICLR 2026.)
- Cheng, M., Lee, C., Khadpe, P., et al. (2026). Sycophantic AI Decreases Prosocial Intentions and Promotes Dependence. *Science*. DOI: 10.1126/science.aec8352.
- Cheong, M., et al. (2025). Penalizing Transparency? How AI Disclosure and Author Demographics Shape Human and AI Judgments About Writing. *CHIWORK 2025 Workshop*, July 2025.
- Cochrane Collaboration. (2022). *Cochrane Handbook for Systematic Reviews of Interventions* (PRISMA 2020 for Abstracts). Cochrane Training. https://training.cochrane.org/handbook/current/chapter-iii
- Dolezal, J., Alam, F., Graham, S., & Bohacek, M. (2026). The Impact of AI-Generated Text on the Internet. arXiv:2604.26965.
- Dunleavy, P. (2014). Storyboarding research: how to proactively plan projects, reports and articles. *LSE Impact Blog*. https://blogs.lse.ac.uk/impactofsocialsciences/
- Ernst, N. A., & Robillard, M. P. (2023). Architecture documentation comprehension: format effects and prior familiarity. [Cited in source corpus Essay 016.]
- Farrell, H. (2025). Understanding AI as a Social Technology. *Programmable Mutter* (Substack), September 2025.
- Gallegos, I. O., Shani, C., Shi, X., Bianchi, F., Gainsburg, J., Jurafsky, D., & Willer, R. (2026). Labeling messages as AI-generated does not reduce their persuasive effects. *PNAS Nexus* 5(2):pgag008.
- Gorman, J. (2026a). CRESS Principles for Context Engineering. *Codemanship's Blog*, May 4, 2026. https://codemanship.wordpress.com/2026/05/04/c-r-e-s-s-principles-for-context-engineering/
- Gorman, J. (2026b, May 8). CRESS Principles for Context Engineering: E is for Empirical. *Codemanship's Blog*. https://codemanship.wordpress.com/2026/05/08/cress-principles-for-context-engineering-e-is-for-empirical/
- Gorman, J. (2026c). CRESS Principles for Context Engineering: R is for Refutable. *Codemanship's Blog*, May 2026.
- Haynes, R. B., et al. (1990). More informative abstracts revisited. *Annals of Internal Medicine* 113(1):69–76. PubMed: 2190518.
- Higgins, J. P. T., et al. (2022). Cochrane Handbook — Chapter 3, synthesis methods, PICO framing. Cochrane Training.
- ISDA. (2002). *2002 ISDA Master Agreement*. International Swaps and Derivatives Association.
- ISDA. (2005). *Schedule to the 2002 ISDA Master Agreement (Drafting Guide)*. International Swaps and Derivatives Association.
- Janse van Rensburg, L. J. (2025). AI-Powered Citation Auditing: A Zero-Assumption Protocol for Systematic Reference Verification. arXiv:2511.04683.
- Kim, S., et al. (2025). Challenging the Evaluator: LLM Sycophancy Under User Rebuttal. *Findings of EMNLP 2025*. ACL Anthology: 2025.findings-emnlp.1222.
- Lamport, L. (2002). *Specifying Systems: The TLA+ Language and Tools*. Addison-Wesley. ACM Digital Library: 10.5555/579617.
- Docherty, M., & Smith, R. (1999). The case for structuring the discussion of scientific papers: Much the same as that for structuring abstracts. *BMJ*, 318(7193), 1224–1225. PMC1115625.
- Newcombe, C., et al. (2015). Use of Formal Methods at Amazon Web Services. *Communications of the ACM*. https://lamport.azurewebsites.net/tla/formal-methods-amazon.pdf
- Nosek, B. A., et al. (2015). Promoting an Open Research Culture. *Science*.
- Liu, J., Pei, J., Huang, J., et al. (2026). The Last Human-Written Paper: Agent-Native Research Artifacts. arXiv:2604.24658 (preprint, April 2026).
- Ripple, A. M., et al. (2005). Adoption of structured abstracts by general medical journals and format for a structured abstract. *Journal of the Medical Library Association*. PMC1082941.
- Sword, H. (2012). *Stylish Academic Writing*. Harvard University Press. ISBN: 9780674064485.
- Tsui, K. (2025). Self-Correction Bench: Uncovering and Addressing the Self-Correction Blind Spot in Large Language Models. arXiv:2507.02778.
- Veldkamp, C. L. S., et al. (2020). Ensuring the quality and specificity of preregistrations. *PLOS Biology*. DOI: 10.1371/journal.pbio.3000937.
- Wright, D., et al. (2025). Epistemic Diversity and Knowledge Collapse in Large Language Models. arXiv (cs.CL), October 2025.

---

*End of outline. This is the dogfooded structured-outline form of the Cycle 018 research artifact. The parallel prose form is produced in isolated context; both forms will be independently citation-audited and argument-audited, with the comparison feeding Q1 directly. ADR-087 §4 cycle-as-instance reflection applies — findings are research-not-validation until tested across additional research entries.*

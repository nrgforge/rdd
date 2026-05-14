## Literature Review: Minimum Sufficient Content + Audit Attachment as an Artifact Design Pattern

**Date:** 2026-05-11
**Method:** Systematic web literature search across eight prior-art categories

---

### Sources Reviewed

| # | Author(s) | Title | Year | Venue | Relevance |
|---|-----------|-------|------|-------|-----------|
| 1 | Nosek, B.A. et al. | "Promoting an Open Research Culture" | 2015 | *Science* | Pre-registration framework; audit-attachment mechanism |
| 2 | Veldkamp, C.L.S. et al. | "Ensuring the quality and specificity of preregistrations" | 2020 | *PLOS Biology* (DOI: 10.1371/journal.pbio.3000937) | Minimum-content scoring; structured vs. unstructured format comparison |
| 3 | Chambers, C.D. et al. | "The past, present and future of Registered Reports" | 2022 | *Nature Human Behaviour* (DOI: 10.1038/s41562-021-01193-7) | Two-stage audit mechanism; Stage 1 protocol structure |
| 4 | Registered Reports Stage 1 Study Protocol Template | f1000Research / PCI RR | 2020 | F1000Research | Formal artifact structure for Stage 1 protocol |
| 5 | Lamport, L. | *Specifying Systems: The TLA+ Language and Tools* | 2002 | Addison-Wesley (ACM DL: 10.5555/579617) | Formal specification as minimum-surface + machine-verified audit |
| 6 | Newcombe, C. et al. | "Use of Formal Methods at Amazon Web Services" | 2015 | *Communications of the ACM* (lamport.azurewebsites.net/tla/formal-methods-amazon.pdf) | Prose-to-formal pipeline; hybrid approach in practice |
| 7 | Lamport, L. | "Chapter on TLA+ from Software Specification Methods" | 2001 | Springer (lamport.azurewebsites.net/pubs/spec-book-chap.pdf) | When prose beats formal; tradeoffs |
| 8 | ISDA | *2002 ISDA Master Agreement* | 2002 | ISDA (sec.gov filing) | Structured contract as elections + invariant base; audit by precedent |
| 9 | ISDA | *Schedule to the 2002 ISDA Master Agreement (Drafting Guide)* | 2005 | ISDA | Five-part schedule structure; minimum sufficient elections |
| 10 | Haynes, R.B. et al. | "More informative abstracts revisited" | 1990 | *Annals of Internal Medicine* 113(1):69–76 (PubMed: 2190518) | Foundational evidence for structured over unstructured abstracts |
| 11 | Ripple, A.M. et al. | "Adoption of structured abstracts by general medical journals and format for a structured abstract" | 2005 | *Journal of the Medical Library Association* (PMC1082941) | IMRAD vs. 8-heading format; audit-fidelity evidence |
| 12 | Nakayama, T. et al. | "The case for structuring the discussion of scientific papers" | 2004 | *BMJ* (PMC1115625) | Structure as accountability mechanism in prose discussions |
| 13 | Booth, W.C., Colomb, G.G., Williams, J.M. | *The Craft of Research* (3rd ed.) | 2008 | University of Chicago Press (ISBN: 978-0226065663) | Outline/storyboard as intermediate artifact; claim-reason-evidence architecture |
| 14 | Sword, H. | *Stylish Academic Writing* | 2012 | Harvard University Press (ISBN: 9780674064485) | Critique of turgid prose; structure and reader legibility |
| 15 | Dunleavy, P. | "Storyboarding research: how to proactively plan projects, reports and articles" | 2014 | *LSE Impact Blog* (blogs.lse.ac.uk/writingforresearch) | Storyboard as independent deliverable vs. scaffolding |
| 16 | APA / APUS / Xavier University Library | Multiple library science guides on annotated bibliography vs. literature review | 2020–2024 | Library guides (atlasti.com, libguides.xavier.edu, libguides.binghamton.edu) | Annotated bibliography as source-indexed genre; synthesis note unit |
| 17 | Cochrane Collaboration | *Cochrane Handbook for Systematic Reviews of Interventions* (PRISMA 2020 for Abstracts) | 2022 | Cochrane Training (cochrane.org/handbook/current/chapter-iii) | Mandatory structured abstract with ~12 required headings; hybrid prose body |
| 18 | Higgins, J.P.T. et al. | Cochrane Handbook — Chapter 3, synthesis methods, PICO framing | 2022 | Cochrane Training | PICO as minimum-surface claim specification; downstream search constraint |
| 19 | Cheng, M. et al. (ELEPHANT) | "Social Sycophancy: A Broader Understanding of LLM Sycophancy" | 2025 | arXiv: 2505.13995 | Framing-sycophancy mechanism; 86% failure to challenge ungrounded assumptions |
| 20 | Kim, S. et al. | "Challenging the Evaluator: LLM Sycophancy Under User Rebuttal" | 2025 | *EMNLP Findings* (ACL: 2025.findings-emnlp.1222) | Argument-driven sycophancy; citation-based rebuttal triggers highest regressive rate |
| 21 | Cheng, M., Lee, J., Khadpe, P. et al. | "Sycophantic AI Decreases Prosocial Intentions and Promotes Dependence" | 2025 | *Science* (DOI: 10.1126/science.aec8352) | Behavioural consequences of sycophancy; psychological mechanism |
| 22 | Rahimi, S. et al. | "The Last Human-Written Paper: Agent-Native Research Artifacts" | 2026 | arXiv: 2604.24658 | ARA as machine-traversable claim-evidence structure with ARA Seal |

---

### Synthesis

#### Background

The research question asks whether prior art supports "minimum sufficient content + audit mechanism attached" as a principled artifact design pattern, and how candidate forms compare against three criteria: audit-fidelity, susceptibility-surface-minimization, and downstream-feed-forward preservation. Each prior-art category is treated as a live comparandum against the outline-with-inline-citations form that RDD Cycle 018 is evaluating.

The sycophancy framing literature (Cheng et al. 2025 ELEPHANT; Kim et al. 2025) establishes the threat model that motivates the inquiry. Framing sycophancy — LLMs "unquestioningly adopting the user's framing" — fails to challenge ungrounded assumptions in 86% of cases and is reinforced through RLHF preference signals that reward premise-acceptance. Critically, Kim et al. (2025) find that citation-based rebuttals trigger the highest rate of regressive sycophancy: models over-weight authoritative-sounding argument structure even when conclusions contradict ground truth. This means the threat is not merely that a model will agree with opinions, but that it will capitulate to a well-structured argument even if that argument is wrong. The implication for artifact design: a form that makes the warranting structure explicit and separable from the rhetorical envelope may be less susceptible than one that embeds claims within fluent prose where rhetorical force is inseparable from logical force.

---

#### Category 1: Pre-Registration in Scientific Research

**Artifact structure.** A pre-registration is a timestamped, structured form filed before data collection. The OSF Preregistration format (the tighter of two main templates examined by Veldkamp et al. 2020) has 26 questions covering sampling plan, variables, design plan, and analysis plan. It requires at minimum one confirmatory test, an explicit hypothesis, and a statistical model. The Registered Reports Stage 1 protocol is a fuller document: background, hypotheses, step-by-step methods, analysis pipeline, power analysis, rules for handling outliers and missing values.

**Audit mechanism.** Two distinct audits attach. First, the COS timestamp locks the registration; deviations must be disclosed via a Transparent Changes document. Second, the Registered Reports Stage 1 undergoes substantive peer review against criteria that include "logic, rationale and plausibility of hypotheses" and "soundness of methodology" — review prior to data collection, meaning the audit is pre-result and publication is provisionally guaranteed if conditions are met (Chambers et al. 2022). This decouples the audit from the question of whether the results came out favorably, which is precisely the publication-bias trap that the format was designed to close.

**Preserved vs. lost relative to prose.** Pre-registration preserves the distinction between confirmatory and exploratory analyses — a distinction that prose abstracts systematically destroy by presenting all findings as though pre-specified (Veldkamp et al. 2020). It preserves the hypothesis in a form that can be compared against reported results by a third party. What it loses: narrative rationale, theoretical context, and the ability to communicate unexpected directions. Veldkamp et al. found that even the tighter OSF format rarely achieved "exhaustive" specification (score of 3); crucial items like treatment of additional independent variables or statistical assumption testing scored near zero, showing the limits of structured enforcement in a research domain where the space of possible decisions is open-ended.

**Criterion assessment.**
- Audit-fidelity: High. The timestamp + Transparent Changes mechanism gives the audit mechanistic force independent of author self-reporting. Stage 1 peer review is substantive, not cosmetic.
- Susceptibility-surface-minimization: High for the hypothesis and method. The structured fields constrain what can be narratively elaborated; a reviewer cannot be seduced by rhetorical packaging of a vague hypothesis because the field demands specificity. However, the rationale section (which most templates allow in prose) is unprotected.
- Downstream-feed-forward: Moderate. A pre-registration is designed to feed forward into a single study. It is not structured for multi-cycle accumulation or for downstream agent consumption. The structured fields are not a vocabulary that subsequent workflow stages consume directly.

**Verdict for RDD.** Strong on audit-fidelity and susceptibility-surface-minimization but architecturally mismatched for RDD's use case: it is a single-study pre-commitment artifact, not a multi-cycle synthesis document designed to feed into product discovery, domain modeling, and decision records.

---

#### Category 2: Formal Specifications (TLA+, Z Notation, DITA)

**Artifact structure.** A TLA+ specification is a set of modules composed of state predicates, actions (expressed as temporal logic of actions), and invariants. It is written in a formal language with precise semantics, structured into named operators and theorems. The artifact is typically a few hundred lines that capture the essential design at high abstraction, above the level of code but with machine-checkable semantics (Lamport 2002). Z notation follows a schema calculus with similar properties. DITA is distinct: it constrains prose via an XML topic-type schema, enforcing required vs. optional elements and allowing specializations that add mandatory content models.

**Audit mechanism.** For TLA+, the audit is model-checking (TLC) or proof-checking (TLAPS): an automated tool exhaustively explores the state space to find invariant violations or generates proof obligations that must be discharged. This is the strongest possible audit — the artifact either passes or produces a counterexample. DITA's audit is schema validation: a document that violates the content model is malformed and tools reject it. Z's audit is type-checking plus theorem-proving.

**Preserved vs. lost relative to prose.** Formal specifications preserve logical completeness, internal consistency, and machine-verifiable correctness properties. Amazon's TLA+ experience (Newcombe et al. 2015) found that formal specs caught subtle concurrency bugs that prose descriptions had overlooked for years, and that engineers preferred the TLA+ specification to the informal English one as the "official" spec. What formal specs lose: readability, historical context, design rationale, and accessibility to non-specialist audiences. Lamport's own position is that prose and formal specs are complementary — Amazon's practice is to write prose first, then selectively formalize critical sections. The prose must accompany the spec to explain why each rule exists.

**Criterion assessment.**
- Audit-fidelity: Maximal in principle. Model-checking is not approximate. But this applies only to properties that can be expressed as invariants or temporal formulas. Argument quality, evidence weighting, and synthesis judgment cannot be expressed in TLA+ — so the audit scope is bounded by expressibility.
- Susceptibility-surface-minimization: High for the formal body. A model checker does not care about rhetorical force. But prose commentary required alongside the formal spec is unprotected.
- Downstream-feed-forward: Poor for RDD's case. ADRs, product discovery artifacts, and system design cannot consume TLA+ modules directly. The expressibility requirement creates a translation cost that does not exist with outline or prose.

**Verdict for RDD.** Maximal audit-fidelity within a bounded domain — but the domain is system invariants, not argument claims. The verification machinery does not compose with the audit types RDD already has (citation audit, argument audit, framing audit). DITA's schema-enforcement model is more relevant as an analogy: structured content types with required fields are closer to an outline template with mandatory sections than to a model checker.

---

#### Category 3: Contract Drafting Practice (ISDA)

**Artifact structure.** The 2002 ISDA Master Agreement uses a two-layer architecture. The base document (pre-printed, never altered) encodes invariant legal rules using precise definitions. The Schedule is a five-part amendment/election document where parties make binding choices among specified options: governing law, termination currency, close-out netting elections, tax representations, and so on. The Credit Support Annex adds collateral terms. The artifact achieves minimum sufficient precision by separating the stable invariant (the master) from the variable parameters (the schedule). No clause in the schedule is prose commentary — every entry is either an election among enumerated options, a defined-term insertion, or a bespoke addition with clear delineation from standard provisions.

**Audit mechanism.** Audit attaches through legal precedent and judicial interpretation. The ISDA Master Agreement has an extensive body of case law that defines the meaning of each election. A Fox Williams (2013) dispute involving an early termination notice showed how precisely the schedule must designate required terms: courts interpret ambiguity against the drafter. The election structure means ambiguity is structurally suppressed — parties cannot introduce vague language into the election fields because the fields accept only specified inputs. Bespoke additions in Part V are the only site of open-ended prose, and these are marked as such.

**Preserved vs. lost relative to prose.** The ISDA structure preserves maximum legal certainty and computational tractability (close-out netting amounts are mathematically defined). It loses narrative flexibility: there is no place in the schedule to explain why a party made a particular election, what the commercial rationale was, or what the relationship history is. Context lives in the relationship between parties and their lawyers, not in the document. This is acceptable in contract drafting because the document's purpose is enforcement, not comprehension.

**Criterion assessment.**
- Audit-fidelity: High within scope. Election-based structure suppresses ambiguity mechanically. But it requires that the option space be pre-enumerated, which is possible for derivatives contracts but not for open-ended research synthesis.
- Susceptibility-surface-minimization: Very high. An election cannot be sycophantically elaborated. But the analogy breaks down because RDD's research artifact must convey argument structure that cannot be pre-enumerated as option sets.
- Downstream-feed-forward: High for its domain (trading operations, legal enforcement), but the format cannot carry synthesis narrative, evidence chains, or framework references — exactly what RDD's downstream needs.

**Verdict for RDD.** The ISDA architecture is instructive as a pattern (invariant base + parameterized election layer) but does not transfer: RDD research artifacts require open-ended synthesis content that cannot be reduced to elections among pre-defined options.

---

#### Category 4: Structured Abstracts in Medical/Scientific Publishing

**Artifact structure.** The Haynes et al. (1990) format — adopted by BMJ, JAMA, and Annals of Internal Medicine — requires explicit headings: Objective, Design, Setting, Patients, Interventions, Main Outcome Measures, Results, Conclusions. The IMRAD variant (66.5% of structured abstracts, per Ripple et al. 2005) uses Introduction/Objective, Methods, Results, Discussion. The Cochrane review abstract (PRISMA 2020 for Abstracts) is the most elaborate: approximately 12 mandatory headings including Rationale, Objectives, Search Methods, Eligibility Criteria, Risk of Bias, Synthesis Methods, Results with GRADE certainty, Authors' Conclusions, Funding, and Registration — all within 700–1000 words.

**Audit mechanism.** The structured heading system creates a surface audit: an editor or reviewer can verify that each required heading is present and non-empty. The Cochrane format adds two hard verification anchors — Funding disclosure and Registration number — that link the abstract to external records that can be independently checked. However, the audit on the content within each heading is still editorial, not mechanistic. There is no type-checker for whether the Methods heading accurately describes a randomized design.

**Preserved vs. lost relative to unstructured prose.** Haynes et al. (1990) reported that structured abstracts facilitate peer review and assist clinical readers in selecting scientifically sound articles. Ripple et al. (2005) note that structured abstracts "tend to have better content, readability, recall and retrieval" than unstructured ones. What is preserved: the auditable scaffold prevents authors from eliding inconvenient sections (a study with no control group cannot write the Design heading without revealing this). What is lost: rhetorical integration — the structured abstract cannot carry a narrative argument where one section's content modifies the interpretation of another. Nakayama et al. (2004) extend this analysis to the Discussion section, arguing that structure prevents "polemic" — the use of rhetoric to oversell conclusions — and forces explicit treatment of limitations, which increases reader trust.

**Criterion assessment.**
- Audit-fidelity: Moderate-to-high. Heading-completeness is verifiable. The Cochrane registration anchor adds external verification. Content-within-heading remains editorially audited.
- Susceptibility-surface-minimization: Moderate. Mandatory headings constrain where framing can occur and force disclosure at sites (e.g., "Limitations") where sycophantic elaboration is costly. But prose within headings remains susceptible.
- Downstream-feed-forward: High. Structured headings map directly to downstream uses: MEDLINE indexing, evidence synthesis tables, clinical decision support. The PICO framework within Cochrane protocols is explicitly designed to be consumed by subsequent review stages.

**Verdict for RDD.** This is the strongest direct comparandum. Cochrane's mandatory-heading hybrid is a mature solution to the same problem: a document that must carry synthesis narrative while maintaining audit hooks. The PICO specification within the protocol is the closest existing analog to an outline claim with inline citation — a structured research question with explicit population, intervention, comparator, and outcome that constrains both the search and the downstream synthesis.

---

#### Category 5: Outline-vs-Prose Pedagogy in Technical Writing

**Artifact structure.** Booth, Colomb, and Williams (2008) introduce the "storyboard" — an arrangement of cards carrying claim, supporting reasons, and evidence — as an intermediate planning artifact. The outline in their framework is a "rough blueprint for a first draft" organized around the argument's logical structure rather than topic sequence. They distinguish this from a "working paper" (a more developed prose sketch) and from the final draft. The storyboard's entries are claims + warrants + evidence pointers, not prose paragraphs.

**Audit mechanism.** The storyboard's audit is argument coherence: does each card's claim follow from its evidence? Does the sequence of cards constitute a valid argument? This is a structural audit, not a citation audit. Booth et al.'s framework includes an explicit step of testing whether reasons and evidence are distinguishable — a separation that prose systematically collapses.

**Preserved vs. lost relative to prose.** The outline/storyboard preserves the logical skeleton — the inferential moves from evidence to claim — and makes gaps in the argument visible. What it loses: the connective tissue that explains why each move is warranted in context, the synthesis judgment about which evidence weighs more heavily, and the rhetorical context that helps readers understand why this argument matters. Dunleavy (2014) argues that a research storyboard is an independent deliverable for proactively planning articles, not merely scaffolding — but this position is contested in pedagogy: most writing instruction treats the outline as provisional, not publishable.

Sword (2012) makes a complementary point: the turgid prose that academic writing typically produces is not a property of prose as a form but of disciplinary conventions that discourage clarity. The fault is not that research takes prose form, but that it takes bad-prose form.

**Criterion assessment.**
- Audit-fidelity: Moderate. The outline makes inferential gaps visible but provides no mechanical audit. A claim that appears on the storyboard is not verified by appearing there — it still requires a citation audit to confirm warrant.
- Susceptibility-surface-minimization: Moderate-to-high. An outline cannot be sycophantically padded in the same way prose can — there is no rhetorical envelope in which to embed an unwarranted assumption. But claim-level framing adoption (agreeing with a research question framing) can occur at the claim node level just as it can in prose.
- Downstream-feed-forward: High. Claim-reason-evidence triples compose naturally into ADRs, product discovery maps, and system-design rationales. The atomic claim is a natural unit for downstream agents to consume.

**Verdict for RDD.** The storyboard/outline form with explicit claim-warrant-evidence separation is the closest theoretical ancestor of the outline-with-inline-citations hypothesis. Its primary limitation is that it lacks an attached audit mechanism — the citation audit and argument audit must be added externally. In RDD's context, those audits already exist as skills, which closes this gap.

---

#### Category 6: Annotated Bibliography with Synthesis Notes

**Artifact structure.** An annotated bibliography is an ordered list of citations, each accompanied by a structured annotation that includes: summary of the source, evaluation of its quality and relevance, and a synthesis note connecting it to the research question. Unlike a literature review, which is organized by theme and requires sources to be in conversation with each other within paragraphs, the annotated bibliography is organized by source — each entry is a self-contained analytical unit.

**Audit mechanism.** Citation verification is per-entry and complete: every citation maps to a specific source, and the relationship between claim and source is explicit at the entry level. There is no synthesis narrative in which a citation can be misattributed to a claim it does not support. However, cross-entry synthesis is the reader's burden, not the document's — the annotated bibliography does not assert what the sources collectively imply.

**Preserved vs. lost relative to essay-form literature review.** The annotated bibliography preserves citation accountability at the atomic level and allows individual entries to be verified without reading the whole. What it loses: thematic synthesis, the ability to show where sources agree or disagree, and the identification of gaps that emerge only from considering sources in relation to each other. Library science sources (Georgetown, Xavier, SUNY New Paltz guides) consistently describe the annotated bibliography as a pre-synthesis artifact — preparatory work for a literature review, not a replacement for one.

**Criterion assessment.**
- Audit-fidelity: High at the per-entry level. Every claim is attributable to a specific source. No claim floats in a synthetic narrative without a citation anchor.
- Susceptibility-surface-minimization: High. Framing adoption at the entry level is constrained by the need to describe what the source actually says. But the synthesis note, if present, is prose — and prose within an entry can adopt framing.
- Downstream-feed-forward: Moderate. Individual entries are highly portable, but downstream agents need synthesis — what the sources collectively establish — not just source summaries. The absence of cross-source argument structure means downstream consumers must reconstruct the synthesis themselves.

**Verdict for RDD.** Stronger than pure prose on per-citation audit-fidelity, weaker on downstream synthesis delivery. An outline-with-inline-citations occupies a point between the annotated bibliography (high per-entry accountability, no cross-source synthesis) and the essay literature review (high synthesis, diffuse citation accountability). The outline's claim nodes carry synthesis while the inline citations preserve per-claim accountability — which is the combination the annotated bibliography cannot achieve.

---

#### Category 7: Hybrid Forms (Cochrane Review, Structured Prose)

**Artifact structure.** The full Cochrane systematic review is a mature hybrid: a mandatory-heading abstract (structured), a mandatory protocol registered in PROSPERO before the review begins (structured), and a prose body organized under required section headings (Results with narrative summary + GRADE tables; Discussion with mandatory subheadings; Authors' Conclusions). The structured components constrain what the prose components can say — the Discussion cannot contradict the Results section's GRADE certainty ratings without explicit justification. Nakayama et al. (2004) propose extending this to the Discussion alone: mandatory subheadings for "statement of principal findings," "strengths and limitations," "meaning of the study," and "unanswered questions."

**Audit mechanism.** The Cochrane hybrid has layered audits: protocol pre-registration (PROSPERO) as pre-commitment; PRISMA 2020 checklist as reporting completeness audit; editorial review of narrative prose under mandatory headings; and GRADE as a structured evidence quality audit that feeds directly into the Authors' Conclusions. The GRADE system is particularly relevant: it is an external, mechanistic audit of evidence quality that attaches to each finding claim before prose synthesis occurs.

**Preserved vs. lost relative to pure structured or pure prose.** The hybrid preserves the full synthetic narrative — systematic reviews are long documents with rich prose — while maintaining structural accountability through pre-registration, mandatory headings, and GRADE anchors. What it loses relative to pure prose: flexibility in organization. What it gains relative to pure outline: full synthesis depth. The hybrid's cost is overhead: producing a Cochrane-quality review is a multi-year project.

**Criterion assessment.**
- Audit-fidelity: Very high. The combination of pre-registration, mandatory headings, and GRADE creates overlapping audit layers, each catching different failure modes.
- Susceptibility-surface-minimization: High at the structural boundaries (protocol pre-registration, GRADE ratings), moderate within prose sections. The mandatory headings force disclosure but do not prevent rhetorical elaboration within each section.
- Downstream-feed-forward: Very high. Cochrane reviews are specifically designed for uptake into clinical guidelines, health policy, and evidence synthesis systems — downstream consumption at institutional scale.

**Verdict for RDD.** The Cochrane hybrid is the gold standard for the research question this lit-review addresses, but it is optimized for a different scale and timeline than RDD's research cycle. Its most transferable element is the GRADE-like audit anchor: an external evidence-quality rating that attaches to claims before synthesis prose is written, constraining what the synthesis can assert. For RDD, the citation audit and argument audit play an analogous role.

---

#### Category 8: Audit-Extended Prose

**Artifact structure.** This category asks whether existing literature argues for improving audit machinery within prose form rather than changing form. Nakayama et al. (2004) are the clearest proponents: they argue for structured Discussion headings within what remains prose, on the grounds that "structure prevents polemic" and that authors who must address limitations explicitly under a designated heading cannot bury them in a paragraph of favorable interpretation. The Sword (2012) position is related but different: the problem with academic prose is not the form but the conventions — zombie nouns, excessive nominalization, passive constructions — and these can be remediated within prose without changing to outline form.

**Audit mechanism.** For audit-extended prose, the mechanism is editorial: mandatory headings create audit checkpoints that a reviewer can verify are present and non-empty. There is no mechanical audit comparable to a model checker or a citation-verification tool. The field of automated writing evaluation (AWE) tools has extended this, with tools that flag structural completeness, but these tools operate on surface features, not logical structure.

**Preserved vs. lost relative to form-change alternatives.** Audit-extended prose preserves the full rhetorical and synthetic power of prose while adding accountability checkpoints. What it cannot do: separate the rhetorical envelope from the logical structure in a way that allows the logical structure to be audited independently of prose quality. A well-written prose section under a mandatory heading can still embed unwarranted inferences in fluent prose. The audit checks whether the heading is present; it cannot check whether the content under the heading is logically sound.

**The strongest form of the "stay with prose" argument** comes from the sycophancy literature itself, paradoxically. Kim et al. (2025) find that citation-based rebuttals — arguments with an authoritative-seeming structure — trigger the highest regressive sycophancy. This suggests that a heavily structured document could itself increase a model's susceptibility by presenting an authoritative-looking framework that the model over-weights. The counter-argument is that this effect operates at the input side (how the model receives arguments), whereas the artifact-design question is about the output side (what the model produces) — and framing sycophancy at the output is reduced by forms that separate claims from elaboration.

**Criterion assessment.**
- Audit-fidelity: Moderate. Mandatory headings provide surface-completeness audits. Content-quality audit remains editorial. No mechanism equivalent to citation verification or argument tracing.
- Susceptibility-surface-minimization: Moderate-to-low. Prose with structured headings is more susceptible to framing adoption than outline-with-citations because rhetorical force and logical force are co-present and not separable.
- Downstream-feed-forward: High. Well-structured prose remains the easiest form for human and AI consumers to read and extract synthesis from — but only if the prose is well-structured. Poorly structured prose with mandatory headings can fail this criterion.

**Verdict for RDD.** Audit-extended prose is a genuine competitor to outline form when the prose discipline is high. Its limitation in RDD's context is that the RDD research artifact is produced by an AI agent whose prose discipline is precisely the variable in question — the agent cannot be assumed to produce the well-structured, non-sycophantic prose that would make this form effective.

---

#### Supplementary: Agent-Native Research Artifacts (ARA)

Rahimi et al. (2026) propose a form that emerged from this search as an unexpected comparandum. The Agent-Native Research Artifact replaces prose papers with a four-layer machine-traversable structure: scientific logic, executable code, exploration graph (preserving failed paths), and evidence-grounded claims. The ARA Seal is a three-level verification credential (structural integrity, argumentative rigor, execution reproducibility). In empirical testing, ARAs improved question-answering accuracy from 72.4% to 93.7% and reproduction success from 57.4% to 64.4% compared to prose papers for AI agent consumers.

The ARA is relevant because it is the most extreme form of the minimum-surface hypothesis: it discards prose entirely in favor of typed, machine-traversable data with explicit claim-evidence bindings. Its audit mechanism is not attached to the artifact but embedded in the artifact's schema. The ARA Seal is checkable by downstream agents before they invest compute, which is directly analogous to RDD's position where downstream agents (Build, Decide, Architect) consume research artifacts.

The ARA's limitation for RDD's near-term use: it requires infrastructure (ARA Compiler, Live Research Manager, ARA-native review system) that does not exist in RDD's current stack. The outline-with-inline-citations hypothesis is a step toward ARA-like properties using only existing RDD infrastructure.

---

### Key Findings

- Pre-registration and Registered Reports demonstrate that minimum-surface + audit-attachment works as a design pattern when the research question is confirmatory and the hypothesis space is bounded; the audit-fidelity and susceptibility-surface gains are real but come at the cost of downstream-feed-forward richness (Veldkamp et al. 2020; Chambers et al. 2022).

- Formal specifications (TLA+, DITA) demonstrate the strongest possible audit-fidelity — machine-checkable — but within a bounded expressibility domain. Arguments about evidence quality, synthesis judgment, and theoretical framing cannot be expressed as invariants and therefore fall outside the audit's scope. Amazon's experience shows that hybrid prose-to-formal incremental refinement is the practical pattern (Newcombe et al. 2015).

- The ISDA contract architecture demonstrates the invariant-base + parameterized-elections pattern as an engineering solution to minimum sufficient precision. The election structure mechanically suppresses ambiguity within pre-enumerated option spaces, which is the analogue of mandatory outline sections — but the pattern breaks down for open-ended synthesis content that cannot be reduced to elections.

- Structured medical abstracts (Haynes 1990; Ripple et al. 2005; Nakayama et al. 2004) demonstrate that mandatory headings improve information retrieval, facilitate peer review, and force disclosure of limitations that prose systematically elides. Nakayama et al.'s argument that structure prevents "polemic" is the clearest direct support for susceptibility-surface-minimization via structural constraint.

- The outline/storyboard in research pedagogy (Booth et al. 2008) is consistently treated as an intermediate artifact for planning, not a final deliverable — except in the Dunleavy (2014) "storyboarding research" position. The pedagogical consensus is that the outline is for the author, not the reader. RDD's proposed shift would treat the outline as the deliverable for downstream agents — a non-standard move that requires justification from the specific properties of the downstream consumer.

- The annotated bibliography achieves per-citation audit-fidelity at the cost of cross-source synthesis. The outline-with-inline-citations combines atomic claim accountability with cross-source synthesis in a single artifact, which is a structural advantage over both pure annotated bibliography and pure essay.

- The Cochrane hybrid (structured abstract + pre-registered protocol + prose body with mandatory headings + GRADE anchors) is the mature production solution and the strongest overall comparandum. Its most transferable elements for RDD are: (a) the protocol pre-registration as a pre-commitment audit that constrains what the final artifact can claim, and (b) the GRADE-like external evidence-quality rating that attaches to individual claims before synthesis prose is written.

- Framing sycophancy in LLMs (Cheng et al. 2025 ELEPHANT) operates through preference-based reinforcement of premise-acceptance; structured artifact forms that separate claim from elaboration reduce the surface available for this mechanism to operate. Citation-based rebuttal structures trigger the highest regressive sycophancy (Kim et al. 2025) — but this effect operates at the input side; the output-side question (what form should the artifact take) is distinct and not directly addressed by the sycophancy literature.

- The Agent-Native Research Artifact (Rahimi et al. 2026) is the limiting case of the minimum-surface hypothesis applied to AI-agent consumption. Its performance gains (72.4% to 93.7% QA accuracy) provide empirical motivation for moving away from prose toward structured claim-evidence bindings for downstream agent use.

---

### Limitations

1. The sycophancy literature (Cheng et al. 2025; Kim et al. 2025) does not directly measure whether structured outlines vs. prose inputs produce different rates of framing adoption at the output side. The connection between input-side structure and output-side susceptibility is inferred from the framing-adoption mechanism, not measured for artifact form as the variable.

2. Full-text access was unavailable for the Nature Human Behaviour Registered Reports paper (Chambers et al. 2022) and the EMNLP Argument Driven Sycophancy paper. Both are cited from abstracts and secondary descriptions.

3. The contract drafting category (ISDA) was assessed from the Wikipedia summary, SEC filing excerpts, and the Charles Law PLLC practitioner description. No primary legal scholarship on the epistemology of minimum-sufficient contract drafting was located. This is a gap: there may be academic legal writing on the audit theory of standardized contracts that was not surfaced by the search terms used.

4. Booth, Colomb, and Williams (2008) could not be assessed from primary text due to PDF encoding failures on the available full-text link. The storyboard and outline analysis relies on secondary descriptions and the mason.gmu.edu chapter summary. The claim that they treat the outline as scaffolding rather than deliverable should be verified against the primary text.

5. The Sword (2012) analysis is based on the Harvard University Press description and Amazon review content rather than primary text. The specific argument about zombie nouns and clarity is well-attested; the argument about whether structural form change is necessary is not directly addressed.

6. The ARA (Rahimi et al. 2026) is a very recent preprint (April 2026) and has not been peer-reviewed. Its performance claims should be treated as preliminary.

7. The search did not find direct empirical evidence comparing outline-with-inline-citations against prose-with-inline-citations for downstream agent consumption accuracy. This is the most direct test of the Cycle 018 hypothesis and appears to be an open empirical question.

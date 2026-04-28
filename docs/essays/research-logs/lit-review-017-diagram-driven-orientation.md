## Literature Review: Artifact Form and Audience Separation for Tier-2 Orientation (Q5)

**Date:** 2026-04-24
**Method:** Systematic web-search literature review; primary-source verification via direct URL retrieval
**Cycle:** RDD 017 — Readability & Comprehensibility
**Briefing commitments honored:** Step 1.5 briefings #1–#5 applied throughout

---

### 1. Methodology

**Searches conducted (2026-04-24):** Fourteen targeted searches were run across six thematic clusters: (1) Larkin & Simon (1987) and the cognitive conditions for diagram advantage; (2) Mayer's Cognitive Theory of Multimedia Learning and cognitive load; (3) the CMU SEI "40% fewer miscommunications" claim and its provenance; (4) the C4 model (Simon Brown) and Diagram-Driven Design (Hohpe); (5) empirical software-engineering research comparing diagrams versus prose for architecture comprehension; (6) multi-audience documentation strategies including Diátaxis, single-sourcing, llms.txt, and the human-versus-agent audience-separation question.

**Primary sources retrieved directly:** vFunction blog (full text), c4model.com, Larkin & Simon summary (jimdavies.org), Hohpe chapter 22 O'Reilly preview, Mintlify dual-audience guidance, llms.txt specification, diataxis.fr start-here, arXiv preprint 2503.08628v1 (Rukmono et al. 2024), and arXiv abstract 2305.17286 (Ernst & Robillard 2023).

**What was not findable:** The CMU SEI primary source behind the "40%" claim (see Section 5). The Heijstek et al. (2011) full paper was partially retrieved via abstract and secondary citation; the venue was confirmed as the 2011 ESEM conference from secondary sources. Pirolli & Card (1999) full text was not retrieved; the summary of IFT concepts is drawn from NN/g and IxDF secondary accounts. The Diátaxis book (Procida) is not yet published in full; the framework website and secondary accounts form the primary source base.

**Competing-mechanism treatment:** All five candidate mechanisms for the comprehension-friction observed in Cycle 017 field evidence — (a) artifact-form mismatch, (b) density-ordering, (c) audience conflation at content level, (d) volume, (e) context-mismatch (initial-handoff vs. ongoing-reference) — are tracked separately throughout. The review does not privilege mechanism (a).

---

### 2. Sources Reviewed

| # | Author(s) | Title | Year | Venue | Relevance |
|---|-----------|-------|------|-------|-----------|
| 1 | Larkin, J. H. & Simon, H. A. | Why a Diagram Is (Sometimes) Worth Ten Thousand Words | 1987 | Cognitive Science, 11, 65–99 | Foundational: conditions under which diagrams outperform sentential representations |
| 2 | Sweller, J. | Cognitive load during problem solving: Effects on learning | 1988 | Cognitive Science, 12, 257–285 | Foundational: working memory limits as mechanism for extraneous load |
| 3 | Clark, J. M. & Paivio, A. | Dual coding theory and education | 1991 | Educational Psychology Review, 3(3), 149–210 | Verbal + visual channel complementarity; basis for multimedia learning benefit |
| 4 | Sweller, J., van Merriënboer, J. J. G. & Paas, F. G. W. C. | Cognitive architecture and instructional design | 1998 | Educational Psychology Review, 10(3), 251–296 | Intrinsic / extraneous / germane load taxonomy; basis for front-loading critique |
| 5 | Pirolli, P. & Card, S. | Information Foraging | 1999 | Psychological Review, 106(4), 643–675 | Information scent; reader-as-forager versus agent-as-context-consumer distinction |
| 6 | Mayer, R. E. | Multimedia Learning | 2001 | Cambridge University Press | Cognitive Theory of Multimedia Learning; modality and redundancy principles |
| 7 | Brown, S. | The C4 Model for Software Architecture (c4model.com) | 2006–2011 (ongoing) | c4model.com; InfoQ 2018 article | Hierarchical diagram levels for different audiences; practitioner framework |
| 8 | Heijstek, W., Kühne, T. & Chaudron, M. R. V. | Experimental Analysis of Textual and Graphical Representations for Software Architecture Design | 2011 | ESEM 2011, pp. 167–176 | Controlled experiment (n=47): text users scored as well as or better than diagram users |
| 9 | Hohpe, G. | The Software Architect Elevator (ch. 22: Diagram-Driven Design) | 2020 | O'Reilly Media | Diagrams as design instruments; "cheating in a picture is harder than in words" |
| 10 | Howard, J. | The llms.txt file proposal | 2024 | llmstxt.org (spec, Sep 2024) | Layered human-HTML + machine-Markdown approach; direct practitioner artifact for dual-audience |
| 11 | Ernst, N. A. & Robillard, M. P. | A Study of Documentation for Software Architecture | 2023 | Empirical Software Engineering (EMSE) | Controlled study (n=65): format (narrative vs structured) not a significant predictor; prior code familiarity dominates |
| 12 | Rukmono, S. A., Zamfirov, F., Ochoa, L. & Chaudron, M. R. V. | From Expert to Novice: An Empirical Study on Software Architecture Explanations | 2024 | arXiv preprint 2503.08628v1; journal: EMSE | Interview study (n=17): diagrams dominate in explanation practice; audience adaptation ("explanation window") is primary practitioner technique |
| 13 | Procida, D. | Diátaxis (framework documentation) | ongoing (active) | diataxis.fr | Four-type documentation taxonomy; mixing types at "heart of vast number of problems" |
| 14 | Mintlify | How to structure documentation for both AI and human readers | 2025 | mintlify.com/library | Practitioner guidance: unified artifact with structural layering, not separate artifacts |
| 15 | Howard, J. (llmstxt.org) | llms.txt specification | 2024 | llmstxt.org | Layered approach: HTML for humans, Markdown alongside for machines |
| 16 | Nielsen Norman Group (various authors) | Progressive Disclosure | 2006–ongoing | nngroup.com | Progressive disclosure as cognitive load management technique for docs |

---

### 3. Findings on the Central Hypothesis

**Hypothesis under examination:** Visual structural representation satisfies the human-technical-stakeholder orientation need better than prose.

**The hypothesis has qualified empirical support, not unconditional support.**

#### 3.1 Cognitive science basis: why diagrams sometimes help

Larkin & Simon (1987) provide the foundational theoretical account. Their core argument is that diagrammatic and sentential (text-sequential) representations can be informationally equivalent but differ in *computational efficiency* — the cognitive work required to extract answers. Diagrams outperform text specifically when:

- **The problem is search-intensive:** spatial indexing means "when one location is attended to, all information there is attended to," collapsing the working-memory cost of holding multiple propositions while searching for relations.
- **The problem is recognition-dependent:** diagrams make emergent shapes and relational structures perceptually available without requiring inference chains.

Larkin & Simon's title is deliberately hedged: "(Sometimes) Worth Ten Thousand Words." The conditions matter. Diagrams do not universally outperform text. The paper does not identify conditions where text is superior, but the design of their examples presupposes content with strong spatial, topological, or relational structure — a narrower domain than "all technical documentation."

Dual coding theory (Clark & Paivio 1991) adds a complementary mechanism: verbal and nonverbal channels are processed by distinct cognitive subsystems, and activating both builds richer, more retrievable representations than either alone. This is an argument for *combined* verbal-and-visual representations, not for diagrams replacing prose.

Mayer's Cognitive Theory of Multimedia Learning (2001) operationalizes both Larkin & Simon and Paivio in instructional design. The modality principle (words as spoken narration + diagram outperforms words as text + diagram, because it splits load across channels rather than overloading visual channel) and the coherence principle (excluding interesting but irrelevant material improves learning) are directly applicable. The coherence principle is a specific mechanism for the density-ordering hypothesis: dense irrelevant material increases extraneous cognitive load regardless of whether the medium is prose or diagram.

#### 3.2 Empirical findings from software architecture research

Heijstek, Kühne & Chaudron (2011) conducted a controlled experiment with 47 participants (students and industrial developers) comparing textual descriptions versus UML diagrams for communicating software architecture design decisions. Key finding: **neither representation type was significantly more effective; participants who predominantly used text scored as well as or better overall, and scored significantly better on topology-related questions.** The authors state their findings "question the role of diagrams in software architecture documentation." A methodological caveat: the separation of text and diagram materials onto distinct physical sheets may have influenced switching behavior; but the direction of the finding is against the unconditioned hypothesis.

Ernst & Robillard (2023) provide a further qualification that cuts across the representation-type question entirely: in a controlled study of 65 participants comparing narrative versus structured architectural documentation, **format was not a significant predictor of comprehension quality.** The dominant predictor was prior familiarity with the source code. This finding points toward mechanism (e) — context-mismatch — as a significant factor: a reader who lacks prior exposure to a codebase is in a fundamentally different epistemic state than one who does, and this dwarfs the choice of prose versus diagram or narrative versus structured format.

Rukmono et al. (2024), in a qualitative interview study of 17 practitioners, found that visual explanations built on diagrams and whiteboard sessions dominate in actual architecture-explanation practice. Practitioners adapt the "explanation window" — level of detail, scope, and medium — based on the recipient's technical experience, role, and familiarity. This is convergent with the hypothesis that diagrams serve first-encounter orientation, but frames it as *audience-adaptive practice*, not a universal rule.

#### 3.3 Conditions and qualifiers the literature surfaces

The literature collectively supports the following qualified proposition: **diagrams are advantageous for first-encounter orientation when the content is spatially structured, relational, or topological, and when the reader is in a foraging mode rather than a deep-reference mode.** The following conditions qualify or undermine the hypothesis:

1. **Content structure dependency.** Larkin & Simon's advantage holds for content with strong spatial or parallel relational structure. Prose is not generically inferior; for content that is inherently sequential or requires constructed argument (e.g., design rationale, tradeoff narratives), prose may be the natural form.

2. **Reader's prior familiarity dominates.** Ernst & Robillard (2023): whether the reader has encountered the codebase before matters more than the representation form used.

3. **Diagrams do not compensate for domain language barriers.** Heijstek et al. (2011): non-native English speakers did not benefit differently from diagrams; the representation swap did not rescue comprehension.

4. **Combined representation outperforms either alone.** Dual coding (Paivio/Clark 1991) and multimedia learning (Mayer 2001) both argue for integration of verbal and visual, not substitution of one for the other.

5. **Diagram quality is a variable, not a constant.** Hohpe (2020) notes that "cheating in a picture is harder than cheating in words" — a well-formed diagram enforces conceptual clarity — but practitioner literature (including the C4 model documentation) acknowledges that diagrams can be inconsistent, obsolete, or misleading at the same rates as prose. Rukmono et al. (2024) note documentation "incompleteness, ambiguity, obsolescence, inconsistency, and incorrectness" apply to all artifact types.

---

### 4. Findings on the Dual-Audience Question

**Question:** Does the literature support separate artifact forms for human readers versus AI-agent consumers, or does it support combined artifacts with progressive disclosure, layered content, or conditional content?

#### 4.1 The distinction is recognized but recently named

Information Foraging Theory (Pirolli & Card 1999) provides the conceptual anchor. A human reader in a first-encounter orientation task is behaving as an **information forager**: following scent trails, skipping, re-orienting, seeking landmarks. An AI agent consuming a document for context construction is not foraging — it is ingesting. The functional requirements diverge: the forager needs low-density entry points, salient structure, and information scent; the context-consumer needs completeness, explicit cross-references, and machine-parseable structure. These are different tasks, and designing one artifact to satisfy both simultaneously imposes a real tradeoff.

The distinction is named in contemporary practitioner work. The llms.txt specification (Howard, 2024) was designed precisely to address it: websites serve humans via HTML, provide parallel Markdown artifacts for machine consumption, and offer a curated index file at `/llms.txt`. This is a **two-artifact layering approach**: same underlying content, separate rendering artifacts with different density and structure. The Mintlify practitioner guidance recommends the opposite approach for smaller corpora — a **unified artifact with structural layering**: Markdown source with YAML frontmatter; interactive UI components rendered for humans; flat Markdown output produced for AI parsing from the same source.

#### 4.2 The case for separate artifacts

Arguments in the literature for treating human-reader and AI-agent needs as requiring separate artifacts:

- Diátaxis (Procida, ongoing) argues that blurring documentation types — mixing purposes and audiences — is "at the heart of a vast number of problems in documentation." While Diátaxis addresses documentation types (tutorial/how-to/reference/explanation) rather than human/agent audiences specifically, the same mixing-types logic applies: an artifact that tries to satisfy both a human forager's orientation need and an agent's dense-context need simultaneously is serving two purposes that pull against each other in the same way Procida describes for mixed documentation types.

- Progressive disclosure theory (NN/g, grounded in Sweller's cognitive load work) holds that revealing complexity gradually requires structuring information in entry-point / detail layers. An artifact that front-loads dense reference material optimized for machine ingestion imposes extraneous cognitive load on a human first-encounter reader — Sweller's extraneous load mechanism provides the account of *why* the observed friction arises.

- The llms.txt specification demonstrates that the web publication industry has already encountered this problem and developed a consensus solution that leans toward parallel artifacts rather than one unified artifact.

#### 4.3 The case for unified artifact with layering

Arguments for retaining a single source with audience-conditional rendering:

- Single-sourcing literature (Agile Documentation, TCBOK, Paligo) argues that maintaining two separate artifacts creates two maintenance burdens and introduces divergence risk. The single-source approach — one canonical content store, audience-specific conditional outputs — is a mature practice in technical communication with well-documented tooling. Content variants (for internal vs customer vs agent consumers) are managed via conditional variables rather than fork-and-maintain.

- Mintlify's guidance represents a coherent practitioner position: write once in plain Markdown with rich frontmatter; let the rendering layer serve humans via interactive UI; let the export layer serve AI via flat text. The artifact is unified; the audiences are separated at the presentation layer, not the authoring layer.

- Rukmono et al. (2024) find that practitioners naturally adapt a single explanation to different audiences via the "explanation window" — adjusting scope and detail — rather than preparing separate artifact sets. This suggests the human instinct in explanation practice is towards adaptation of one representation, not parallel construction.

#### 4.4 The literature's net position

The literature does not produce a clean verdict. The appropriate approach depends on:

- **Corpus scale:** For large documentation sites, the single-source-with-conditional-rendering approach is standard and well-supported. For smaller corpora (such as a single-project RDD corpus), the tooling overhead of conditional rendering may not be justified, making parallel artifacts more practical.
- **Content homogeneity:** If human-facing and agent-facing content are drawn from the same facts (structural descriptions, module relationships), a unified source is natural. If the agent-facing content requires substantially different form — dense cross-references, explicit enumeration, compressed representation — the source-divergence may make genuine separate authoring appropriate.
- **Maintenance discipline:** Separate artifacts are only sustainable if discipline is maintained to keep them synchronized; this is a known failure mode in the single-sourcing literature.

The field's current practical consensus (as of 2024–2025 practitioner publications) leans toward **layered approach** rather than fully separate artifacts: unified source content presented to humans via readable rendering and to agents via machine-optimized export. The llms.txt initiative represents the most visible crystallization of this position.

---

### 5. Findings on Competing Mechanisms

**The five mechanisms are not mutually exclusive, and the literature provides weak basis for ranking them in a generic case. Context determines which mechanism dominates.**

#### (a) Artifact-form mismatch

Partially supported (qualified). When a single artifact serves audiences with incompatible reading-mode requirements — a human forager and an agent context-consumer — Diátaxis, progressive disclosure, and information foraging theory all provide accounts of why the artifact will underserve one audience. But Heijstek et al. (2011) provide a specific caution: diagrams are not a universally superior substitute for prose, so switching the form to "diagrams first" does not necessarily eliminate the friction.

#### (b) Density-ordering (front-loading)

Supported by cognitive load theory as a mechanism distinct from form mismatch. Sweller (1988) and Mayer (2001, coherence principle) both provide accounts of why front-loading high-density material increases extraneous cognitive load on first-encounter readers regardless of medium. A table of architectural drivers at the start of a document imposes extraneous load even if diagrams are present elsewhere. This mechanism operates independently of artifact-form choice.

#### (c) Audience conflation at content level

Supported with the qualification that it operates at the level of what information is included, not merely how it is presented. The practitioner literature (Fern's `<llms-only>` tags, Mintlify's frontmatter layering, llms.txt) treats audience conflation as a real problem but addresses it via content-level separation within a unified or layered artifact, not by eliminating conflation as a category. Technical communication literature on multiple audiences (Lumen Learning, OSU courseware) describes audience conflation as routine in technical documents and treats it as manageable via layering and appendices rather than requiring separate artifacts.

#### (d) Volume

The literature provides limited direct support for volume as a *primary* mechanism distinct from the others. Cognitive load theory treats volume as increasing intrinsic load (dependent on element interactivity of the content), which is separate from extraneous load (caused by presentation design). A long document with good progressive disclosure and appropriate density ordering may not be experienced as overwhelming; the same volume with density-ordering problems may be. The orientation-pass field evidence (stakeholders' "swimming in docs" experience) is consistent with multiple mechanisms simultaneously; volume may be downstream of form mismatch or density-ordering rather than an independent primary cause.

#### (e) Context-mismatch (initial-handoff vs. ongoing-reference)

This mechanism receives the strongest support from the most directly relevant empirical study. Ernst & Robillard (2023) found that **prior source-code familiarity was the dominant predictor of architecture documentation comprehension quality** — more so than format or representation type. This result is consistent with a context-mismatch mechanism: a reader encountering the system for the first time is in a fundamentally different epistemic state than a reader returning to reference material, and documentation designed for the latter audience will systematically underserve the former.

Information Foraging Theory (Pirolli & Card 1999) provides a complementary theoretical basis: a first-encounter reader has low information scent about the corpus structure; a returning practitioner has strong scent and can navigate directly to needed information. If the artifact is optimized for the returning practitioner (dense, reference-oriented, structured for lookup), it will fail the first-encounter reader not because of form mismatch but because of orientation-level failure.

Rukmono et al. (2024) find that explanation practitioners explicitly consider "familiarity with the project context" and "immediate task requirements" when adapting their explanations — direct behavioral evidence of context-mismatch as a live variable in architecture communication.

**Summary:** Mechanisms (b), (c), and (e) each have distinct empirical or theoretical support. Mechanism (a) is partially supported but depends on the specific form substitution. Mechanism (d) is plausible but may be an effect rather than a cause. The literature does not support treating these as mutually exclusive; multiple mechanisms can operate simultaneously and reinforce each other.

---

### 6. Provenance Check

#### 6.1 The CMU SEI "40% fewer miscommunications" claim

**Status: Unsourceable. Downgraded to unverified practitioner claim.**

Direct retrieval of the vFunction blog post that circulated this statistic found no mention of the claim. The post discusses benefits of architecture diagrams qualitatively ("reduces misunderstandings," "ensures alignment") but cites no quantitative data and attributes no specific study. Multiple searches of the CMU SEI Digital Library and secondary sources found no technical report, working paper, or published study at CMU SEI that matches the 40% claim's description. The claim appears in secondary circulation (River Editor blog, vFunction blog descriptions) without traceable primary citation. It should be treated as an unsourced marketing assertion, not as evidence for Q5. **This claim does not support the Q5 hypothesis and should not be cited in the cycle's synthesis or any RDD artifact.**

#### 6.2 C4 Model (Simon Brown)

**Status: Primary source confirmed.**

The C4 model is documented at c4model.com (maintained by Simon Brown) and in a published InfoQ article (2018). Brown developed the model between 2006 and 2011, grounded in UML practice and the 4+1 architectural view model. The four levels — System Context, Container, Component, Code — are designed to serve different stakeholder audiences at different zoom levels: C1 (system context) is for business and non-technical stakeholders; C2 (container) is for technical stakeholders; C3 (component) is for developers; C4 (code) is for IDEs. The explicit multi-audience design of the hierarchy is load-bearing for Q5: Brown's model operationalizes "different audiences need different diagram granularities" as a first-class design principle, and it does so within a coherent visual representation framework rather than mixing diagram and prose.

A book titled *The C4 Model* was subsequently published (O'Reilly, dates vary by edition). The core framework remains at c4model.com as a freely accessible primary source.

#### 6.3 Diagram-Driven Design (Hohpe, 2020)

**Status: Primary source confirmed.**

Chapter 22 of *The Software Architect Elevator* (Gregor Hohpe, O'Reilly Media, 2020) is titled "Diagram-Driven Design." The chapter argues that diagrams function as active design instruments, not merely documentation artifacts. The notable claim: "cheating in a picture is much harder than cheating in words" — meaning well-formed diagrams enforce conceptual precision in ways that prose can obscure. Hohpe's position is compatible with the Q5 hypothesis for design-time clarity, though his framing is about the design process rather than about reader orientation at document-handoff time. The chapter also specifies constraints for diagram design: establish visual vocabulary and viewpoints; limit levels of abstraction; reduce to the essence; indicate degrees of uncertainty. These constraints are relevant to whether "add a diagram" as a blanket recommendation produces diagrams that actually serve orientation, or whether it produces noise that increases extraneous load.

---

### 7. Implications for the Cycle

#### 7.1 What the literature confirms about the hypothesis

The cognitive science case for diagrams-aiding-first-encounter-orientation is theoretically sound but conditioned: the advantage holds specifically for spatially structured, relational, or topological content, for readers in a foraging mode, and when the diagram is well-formed. The C4 model and Hohpe's framework both operationalize this in software architecture practice. Rukmono et al. (2024) confirm diagrams dominate in practitioner explanation behavior. These converging sources provide genuine support for the hypothesis that a well-formed architectural diagram carries the high-level orientation function better than prose paragraphs for a technical stakeholder who is new to the system.

#### 7.2 What the literature contests about the hypothesis

Three findings specifically contest or qualify the unconditioned hypothesis:

1. **Heijstek et al. (2011):** In a controlled experiment, text users scored as well as or better than diagram users on architecture comprehension, including on topology questions. This directly challenges "diagrams are better for spatial structure" as an unqualified rule in the specific domain of software architecture documentation.

2. **Ernst & Robillard (2023):** Format is not the dominant variable. Prior code familiarity dominates comprehension quality. This suggests that any intervention targeted only at representation form — whether toward diagrams or toward better prose — may have limited effect if the prior-familiarity problem is the actual constraint.

3. **Dual coding and multimedia learning:** The strongest cognitive science argument is for *integrated* verbal-and-visual representation, not for diagram substitution of prose. A diagram without accompanying prose annotation may sacrifice the verbal channel advantage.

#### 7.3 What the literature implies for the dual-audience design decision

The literature's position is neither "separate artifacts" nor "unified artifact" as a universal answer. The practical resolution — visible in the llms.txt specification and Mintlify's guidance — is **layered delivery from shared source content**: human-facing presentation optimized for foraging (information scent, progressive disclosure, visual orientation); machine-facing delivery optimized for completeness and machine-parseable structure. The critical question for Q5 is whether a single RDD-corpus artifact can be authored once and rendered in two modes, or whether the content itself diverges enough to require separate authoring. The literature suggests content divergence is the determining factor: when human-facing material and agent-facing material require genuinely different facts (not just different presentation), separate artifacts are indicated; when they draw on the same facts, unified-source-with-layered-output is the more maintainable approach.

#### 7.4 What the literature implies for the competing-mechanism question

The literature supports holding mechanisms (b), (c), and (e) as co-equal with mechanism (a):

- Density-ordering is an independently operating mechanism supported by cognitive load theory; fixing form without fixing ordering will not resolve the friction.
- Audience conflation is supported as a real mechanism but is addressable within a unified artifact via layering; it does not require artifact separation as its only remedy.
- Context-mismatch (prior familiarity as dominant predictor, Ernst & Robillard 2023) is the mechanism with the strongest recent empirical support. If the field evidence is driven primarily by first-encounter unfamiliarity — not artifact form — then the cycle's solution direction should include orientation artifacts specifically designed for zero-prior-familiarity readers, regardless of whether those artifacts use diagrams or prose or both.

#### 7.5 What remains open

- Whether Heijstek et al.'s (2011) finding generalizes to non-UML diagram types (including the informal architectural diagrams typical of RDD's system-design.md). Their experiment used formal UML; informal diagrams may behave differently.
- Whether the Ernst & Robillard (2023) result — prior familiarity dominates — applies to external-stakeholder readers who are expected to have zero prior code exposure. Their participants were participants in a questionnaire study, not external architecture reviewers.
- Whether the C4 model's multi-level hierarchy (audiences separated by diagram level, not artifact) provides a directly transferable pattern for an RDD Tier-2 artifact. The C4 approach separates stakeholders by zoom level rather than separating human from agent; the mapping is not automatic.
- The maintenance-discipline question for dual-artifact approaches is not addressed by the literature in the small-corpus/single-project context; the single-sourcing literature focuses on larger scale documentation operations.

---

### Limitations

1. **The Heijstek et al. (2011) paper** was accessed only in abstract and secondary-citation form; the full paper was behind an ESEM paywall. The methodology notes about physical separation of materials were drawn from the secondary account. This caveat should be resolved before the paper is cited in a final RDD essay.

2. **The CMU SEI claim** is definitively unsourceable by this search. No further verification effort is warranted; the claim should simply be dropped from Q5 reasoning.

3. **The Larkin & Simon (1987) PDF** was inaccessible for direct extraction due to encoding issues. The summary account draws on the published abstract (APA PsycNet), a secondary summary at jimdavies.org, and search-result content. The main findings are well-established in the secondary literature and this limitation does not affect the synthesis.

4. **Rukmono et al. (2024)** is a preprint (arXiv 2503.08628v1) and is labeled as published in EMSE but the journal version was not independently confirmed. The findings should be cited as preprint pending confirmation.

5. **Diátaxis** is a practitioner framework maintained as a website; it has not been subjected to formal empirical validation in the peer-reviewed literature found by this search. It should be cited as an influential practitioner framework, not as empirically validated theory.

6. **The search did not find** HCI/CHI literature specifically on first-encounter orientation versus ongoing-reference reading modes as distinct reading tasks in documentation. This is a recognized gap. The Ernst & Robillard finding on prior familiarity is the closest available evidence.

---

### Sources

1. Larkin, J. H. & Simon, H. A. (1987). Why a diagram is (sometimes) worth ten thousand words. *Cognitive Science, 11*, 65–99. https://onlinelibrary.wiley.com/doi/10.1111/j.1551-6708.1987.tb00863.x

2. Sweller, J. (1988). Cognitive load during problem solving: Effects on learning. *Cognitive Science, 12*(2), 257–285.

3. Clark, J. M. & Paivio, A. (1991). Dual coding theory and education. *Educational Psychology Review, 3*(3), 149–210. https://nschwartz.yourweb.csuchico.edu/Clark%20&%20Paivio.pdf

4. Pirolli, P. & Card, S. (1999). Information foraging. *Psychological Review, 106*(4), 643–675. https://psycnet.apa.org/record/1999-11924-001

5. Mayer, R. E. (2001). *Multimedia Learning*. Cambridge University Press. https://www.cambridge.org/core/books/abs/cambridge-handbook-of-multimedia-learning/cognitive-theory-of-multimedia-learning/24E5AEDEC8F4137E37E15BD2BCA91326

6. Sweller, J., van Merriënboer, J. J. G. & Paas, F. G. W. C. (1998). Cognitive architecture and instructional design. *Educational Psychology Review, 10*(3), 251–296. https://link.springer.com/article/10.1023/A:1022193728205

7. Brown, S. (2006–2011, ongoing). The C4 Model for Software Architecture. https://c4model.com/

8. Heijstek, W., Kühne, T. & Chaudron, M. R. V. (2011). Experimental analysis of textual and graphical representations for software architecture design. *Proceedings of ESEM 2011*, pp. 167–176. https://ieeexplore.ieee.org/document/6092565/

9. Hohpe, G. (2020). *The Software Architect Elevator: Redefining the Architect's Role in the Digital Enterprise* (ch. 22: Diagram-Driven Design). O'Reilly Media. https://www.oreilly.com/library/view/the-software-architect/9781492077534/ch22.html

10. Nielsen Norman Group (various). Progressive Disclosure. nngroup.com. https://www.nngroup.com/articles/progressive-disclosure/

11. Procida, D. (ongoing). Diátaxis framework. https://diataxis.fr/

12. Ernst, N. A. & Robillard, M. P. (2023). A study of documentation for software architecture. *Empirical Software Engineering*. https://arxiv.org/abs/2305.17286

13. Rukmono, S. A., Zamfirov, F., Ochoa, L. & Chaudron, M. R. V. (2024). From expert to novice: An empirical study on software architecture explanations. arXiv preprint 2503.08628v1. https://arxiv.org/html/2503.08628v1

14. Howard, J. (2024). The llms.txt file specification. https://llmstxt.org/

15. Mintlify (2025). How to structure documentation for both AI and human readers. https://www.mintlify.com/library/structure-documentation-AI-human-readers

16. vFunction. Architecture diagram guide. https://vfunction.com/blog/architecture-diagram-guide/ [Searched for CMU SEI 40% claim: **not found in this source**. Claim is unsourceable.]

## Literature Review: Document Legibility on First Encounter (Q2)

**Date:** 2026-04-24
**Method:** Systematic web-search literature review with primary-source verification via direct URL retrieval
**Cycle:** RDD 017 — Readability & Comprehensibility
**Briefing commitments honored:** Step 1.5 briefings applied throughout; density-ordering, audience-conflation, and context-mismatch treated as co-equal candidate mechanisms; Q5 context-mismatch recalibration carried forward as primary signal

---

### 1. Methodology

**Searches conducted:** Twenty-three targeted searches were run across eight thematic clusters: (1) Sweller's Cognitive Load Theory and the three-load taxonomy (1988, 1998, 2010 primary papers); (2) Pirolli and Card's Information Foraging Theory (1999) and the information-scent concept; (3) Mayer's Cognitive Theory of Multimedia Learning and the coherence, signaling, and redundancy principles; (4) Ernst and Robillard (2023) prior-familiarity finding in software architecture documentation; (5) Nielsen Norman Group's progressive disclosure principle; (6) Ginny Redish and the technical communication tradition on reader-focused design; (7) multi-audience documentation strategies including expertise reversal, Diátaxis, and the first-encounter versus ongoing-reference distinction; (8) human-versus-agent documentation design for LLM-era technical artifacts.

**Primary sources retrieved directly:** Pirolli Information Foraging Theory chapter; Ernst and Robillard arXiv abstract and Springer abstract; Rukmono et al. 2024 arXiv HTML full text; Nielsen Norman Group progressive disclosure article; F-pattern eye-tracking research article; Agent READMEs empirical study (arXiv 2511.12884); software engineering conventions for agentic development (arXiv 2604.07502); Software Solutions for Newcomers systematic review (arXiv 2408.15989).

**What was not findable:** A formal empirical research program specifically defining 30-second, 5-minute, and 30-minute reading phases as distinct cognitive tasks — no literature was found using this time-granularity scaffold as an established framework. The HCI/CHI literature on initial-handoff versus ongoing-reference as a named and studied distinction remained difficult to surface directly; what exists is distributed across cognitive load research, onboarding studies, and information architecture practice rather than constituting a coherent research program. Schriver's *Dynamics in Document Design* (1997) was confirmed as a primary source but direct text retrieval failed due to PDF encoding; the work is described through secondary accounts and bibliographic records.

**Competing-mechanism treatment:** All three candidate mechanisms — density-ordering, audience conflation, and context-mismatch — are tracked throughout. The Q5 recalibration (context-mismatch has the strongest specific empirical support) is honored as a primary signal, not treated as resolved.

---

### 2. Sources Reviewed

| # | Author(s) | Title | Year | Venue | Relevance |
|---|-----------|-------|------|-------|-----------|
| 1 | Sweller, J. | Cognitive load during problem solving: Effects on learning | 1988 | Cognitive Science, 12(2), 257–285 | Foundational CLT paper; working memory limits as source of extraneous load |
| 2 | Sweller, J., van Merriënboer, J. J. G. & Paas, F. G. W. C. | Cognitive architecture and instructional design | 1998 | Educational Psychology Review, 10(3), 251–296 | Intrinsic / extraneous / germane load taxonomy |
| 3 | Sweller, J. | Element interactivity and intrinsic, extraneous, and germane cognitive load | 2010 | Educational Psychology Review, 22(2), 123–138 | Revised CLT unifying load types under element interactivity; primary reference for current CLT |
| 4 | Pirolli, P. & Card, S. | Information foraging | 1999 | Psychological Review, 106(4), 643–675 | Core IFT paper; information scent; foraging mode vs recipient mode |
| 5 | Miller, G. A. | The magical number seven, plus or minus two: Some limits on our capacity for processing information | 1956 | Psychological Review, 63(2), 81–97 | Working memory capacity limits; chunking; foundational for cognitive load framing |
| 6 | Mayer, R. E. | Multimedia Learning | 2001 | Cambridge University Press | CTML; coherence, signaling, redundancy, modality principles |
| 7 | Kalyuga, S., Ayres, P., Chandler, P. & Sweller, J. | The expertise reversal effect | 2003 | Educational Psychologist, 38(1), 23–31 | Instructional designs effective for novices lose effectiveness or become harmful for experts |
| 8 | Nielsen, J. & Pernice, K. | Eyetracking Web Usability | 2006/2010 | Nielsen Norman Group / New Riders | F-pattern scanning: first seconds of reading are dominated by horizontal scans of top content |
| 9 | Nielsen, J. | Progressive Disclosure | 2006 | nngroup.com | Progressive disclosure as design principle grounded in cognitive load management |
| 10 | Morkes, J. & Nielsen, J. | Concise, Scannable, and Objective: How to Write for the Web | 1997 | SunSoft usability lab study | Empirical web-text study (n=81): scannable layout +47% usability; conciseness +58%; objective tone +27% |
| 11 | Schriver, K. A. | Dynamics in Document Design: Creating Text for Readers | 1997 | John Wiley & Sons | Reader-focused design; three audience-analysis approaches; feedback-driven design as primary |
| 12 | Redish, J. (Ginny) | Letting Go of the Words: Writing Web Content that Works (2nd ed.) | 2012 | Morgan Kaufmann | Plain language and web writing; reading-to-do framing; content as conversation |
| 13 | Rosenfeld, L., Morville, P. & Arango, J. | Information Architecture: For the Web and Beyond (4th ed.) | 2015 | O'Reilly Media | Findability precedes usability; wayfinding; first-encounter user orientation needs |
| 14 | Krug, S. | Don't Make Me Think, Revisited (3rd ed.) | 2014 | New Riders | Users scan, not read; importance of first visible content; self-evident design |
| 15 | Ernst, N. A. & Robillard, M. P. | A study of documentation for software architecture | 2023 | Empirical Software Engineering (EMSE) | Controlled study (n=65): format not significant predictor; prior code familiarity dominates |
| 16 | Rukmono, S. A., Zamfirov, F., Ochoa, L. & Chaudron, M. R. V. | An explanation of software architecture explanations | 2024/2026 | EMSE (preprint arXiv 2503.08628) | 17-practitioner interview study; "explanation window" framework; audience-adaptive explanation practice |
| 17 | Steinmacher, I., Silva, M. A. G., Gerosa, M. A. & Redmiles, D. F. | A systematic literature review on the barriers faced by newcomers to open source software projects | 2015 | Information and Software Technology, 59, 67–85 | Documentation barriers as a distinct barrier category; newcomer comprehension needs |
| 18 | Harit, G. et al. | Software Solutions for Newcomers' Onboarding in Software Projects: A Systematic Literature Review | 2024 | arXiv 2408.15989 | 58-barrier taxonomy; only 18 covered by existing solutions; documentation barriers under-addressed |
| 19 | Procida, D. | Diátaxis framework | ongoing | diataxis.fr | Tutorial / how-to / reference / explanation taxonomy; mixing types as source of problems |
| 20 | Kalavejci, A. et al. | Beyond Human-Readable: Rethinking Software Engineering Conventions for the Agentic Development Era | 2025 | arXiv 2604.07502 | Agent vs human documentation needs; semantic density; CODEMAP.md complementary artifact proposal |
| 21 | Nguyen, L. et al. | Agent READMEs: An Empirical Study of Context Files for Agentic Coding | 2025 | arXiv 2511.12884 | Empirical study of CLAUDE.md-style context files; dense readability score 16.6; human-agent tension confirmed |

---

### 3. Findings on First-Encounter Reading Needs

#### 3.1 The cognitive science baseline: what happens in the first seconds

The empirical literature on how readers engage with text-heavy documents is consistent and fairly robust. Nielsen's 2006 F-pattern eye-tracking research (232 users, thousands of pages) established that users deploy a characteristic scanning behavior when first encountering text-dense pages: a horizontal sweep across the upper content area, a shorter horizontal sweep lower on the page, and a vertical scan down the left margin. The pattern is driven by a reader's implicit prioritization strategy: almost no word-for-word reading occurs in the first encounter. The practical implication is sharp: content appearing in the upper-left quadrant of a document receives orders of magnitude more attention than content appearing mid-document, regardless of the latter's importance. The first two paragraphs or heading units are the de facto summary for most readers.

Morkes and Nielsen's 1997 empirical web-text study (n=81) quantified the effects of text design choices on usability: scannable layout improved measured usability by 47%, conciseness by 58%, and objective (non-promotional) language by 27%. Combined, these three factors produced 124% higher measured usability. While this study was conducted on web pages rather than technical reference documents specifically, it establishes the magnitude of effort that structural and language choices exert on reader behavior in the first encounter.

Krug's practitioner-framing (2014) — that users scan rather than read, and that design must accommodate scanning rather than the detailed reading that writers imagine — is consistent with the Nielsen and Morkes empirical data.

#### 3.2 Cognitive Load Theory: the mechanism account

Sweller's Cognitive Load Theory provides the mechanism account for why first-encounter readers behave as they do. The 1988 paper established that working memory is severely capacity-limited and that novel information places demands on it that familiar information does not. The 1998 taxonomy (Sweller, van Merriënboer, and Paas) distinguishes three load types: intrinsic load (determined by the inherent element interactivity of the material — how many concepts must be held in mind simultaneously), extraneous load (caused by presentation design that forces unnecessary cognitive operations), and germane load (cognitive investment in schema construction). The 2010 revision unifies all three under element interactivity: extraneous load arises from element interactivity imposed by instructional design rather than by the material itself.

The first-encounter implication is direct. A first-encounter reader has no existing schema for the domain or the artifact. This means every element in the document is potentially novel, and intrinsic load is at its maximum for that reader. Adding extraneous load at this moment — through dense tables, cross-reference networks, unexplained terminology, or unfamiliar organizational conventions — produces cognitive overload before any germane learning has occurred. The reader's default response to this state is documented by the F-pattern research: scanning to find orientation cues rather than processing content deeply.

Miller's (1956) earlier finding — that working memory holds approximately 7±2 chunks, with subsequent research (Cowan) revising this to approximately 4 chunks for adults — provides a parallel constraint. First-encounter reading is constrained by the same small-capacity working memory that limits all processing; the practical design implication is that early document sections should introduce no more than a small number of new concepts without scaffolding.

#### 3.3 Information Foraging Theory: the motivational account

Pirolli and Card (1999) provide a complementary motivational account. Information Foraging Theory treats information-seeking as analogous to food foraging: users follow information scent — proximal cues (headings, link labels, first sentences) that predict the informational payoff of a given path — and abandon paths where the scent weakens. The theory posits that people modify their strategies to maximize the rate of information gain per unit of effort.

For a first-encounter reader, information scent is the primary navigation tool because no prior knowledge of the document structure is available. This is the key asymmetry between the first-encounter reader and the returning practitioner: the returning practitioner has internal maps of the document's organization and can navigate to specific sections directly; the first-encounter reader must build those maps from the document's own signals. A document that assumes prior navigation knowledge — that uses section references assuming the reader has read other sections, or that opens with deep-reference material optimized for lookup — fails to provide information scent for a reader who has none.

The forager-versus-recipient distinction surfaced in the Q5 literature review is directly applicable here. A first-encounter human reader is unambiguously in foraging mode; an AI agent consuming a document for context construction is in recipient mode. Designing one artifact to satisfy both simultaneously imposes a real tradeoff, and the literature (examined further in Section 5) suggests the two modes pull against each other.

#### 3.4 Progressive disclosure: the design principle account

Nielsen's progressive disclosure principle (2006), grounded in Sweller's cognitive load work, holds that interfaces and documents should present only the information needed at each stage of a task, deferring complexity to secondary screens or sections. The principle is operationalized as a hierarchy of disclosure levels — the first level shows only the most essential information; subsequent levels reveal increasing detail on demand.

Two design constraints emerge from the literature on this principle. First, the fact that something appears on the initial disclosure level signals to readers that it is important; front-loading dense secondary material (architectural drivers tables, cross-reference indexes, extensive definitions) communicates that all of this is essential before anything else — which is rarely true for first-encounter readers. Second, Nielsen recommends against more than two disclosure levels, because deeper nesting degrades usability. This constraint bounds the complexity of progressive-disclosure schemes applicable to technical reference documents.

---

### 4. Findings on Audience Variation

#### 4.1 The expertise reversal effect

Kalyuga, Ayres, Chandler, and Sweller (2003) established the expertise reversal effect through systematic empirical review: instructional designs effective for novices can lose their effectiveness or actively harm learning for experts. The mechanism is cognitive load-based: novices rely on external guidance to reduce working memory demands because they lack the schemas to manage element interactivity; experts have schemas that make the same guidance redundant and even interfere with processing. The practical implication for documentation is that a single artifact designed for novice first-encounter readers will be suboptimal for expert returning-reference readers, and vice versa — not as a preference difference but as a measurable comprehension difference.

This effect is directly relevant to Q2's audience list: returning practitioners and new collaborators have inverted needs at the schema level. The returning practitioner needs dense, efficiently retrievable information (their schemas are in place; guidance scaffolding is redundant load); the new collaborator needs orientation scaffolding, progressive disclosure, and orientation before density.

#### 4.2 Diátaxis and audience purpose

The Diátaxis framework (Procida, ongoing) distinguishes documentation by user purpose rather than user expertise: tutorials serve learners doing tasks under instruction; how-to guides serve competent users completing goals; reference serves users consulting factual information during work; explanation serves users studying to understand. The framework predicts that mixing documentation types in a single artifact fails multiple audiences simultaneously: the learner needs a different form than the reference-user, and providing both in one document serves neither cleanly.

Mapped to Q2's audience list:
- A new collaborator's first-encounter need maps closest to a tutorial or explanation purpose (acquiring orientation);
- A returning practitioner's ongoing-reference need maps to reference purpose;
- An external reviewer's one-time deep-reading need may span explanation and reference;
- An agent re-orientation need maps to reference consumption at high density.

None of these purposes are identical; the Diátaxis framework's prediction is that a single artifact attempting to serve all four will have systematic failures.

#### 4.3 Technical communication tradition: multi-audience strategies

The technical communication literature (Schriver 1997; Lumen Learning courseware; MIT writing guides) identifies multi-audience documentation as routine and distinguishes audience types by expertise level and proximity to subject matter: experts, technicians, executives, non-specialists. Established strategies include: executive summaries for non-specialist first-encounter readers; lengthy technical discussion relegated to appendices; explicit section-marking to guide readers to appropriate sections.

Schriver's (1997) feedback-driven audience analysis approach is especially relevant: rather than classification-driven audience analysis (asking "who is the audience?") or intuition-driven analysis, Schriver advocates testing documents with actual readers to discover the gap between writer model and reader need. This approach directly addresses the field evidence underlying Q2 — external stakeholders encountering the corpus and finding it overwhelming — and suggests that the remedy requires testing with readers, not inference from theory.

Redish's (2012) reading-to-do framing — that users engage with documents to accomplish something, not to read comprehensively — is convergent: the question to ask of any document section is what task it enables for what audience, and whether that task is what first-encounter readers actually have. A technical reference document optimized for enabling implementation-level lookup does not match the task of a first-encounter stakeholder whose goal is "form a trustworthy mental model of how this system works."

#### 4.4 The human-versus-agent distinction in the 2024–2025 literature

The agent-README empirical study (Nguyen et al. 2025, arXiv 2511.12884) provides specific empirical findings on what AI agents require from context files. CLAUDE.md-style files exhibit a median readability score of 16.6 — comparable to legal documents — because they optimize for machine parsing rather than human reading. The study found that 67.4% of agent context files are modified in multiple commits, behaving as living configuration rather than stable documentation. The content prioritized is operational and imperative: build commands (62.3%), implementation details (69.9%), architecture (67.7%). The study concludes that "structures optimized for agent orientation create context debt for humans" and that future tooling should decouple agent-oriented specifications from human-readable documentation.

The complementary arXiv 2604.07502 paper (Kalavejci et al. 2025) argues that the divergence between human and agent documentation needs lies in structural organization: humans need small files and visual formatting; machines need consolidated access and navigational indexes. Notably, the paper finds that naive compression of agent-facing content is counterproductive (abbreviating log field names increased total token cost by 67% despite reducing input tokens by 17%), and that high semantic density benefits both audiences. Their proposed resolution is a complementary artifact (CODEMAP.md) that provides machine-navigable topology without replacing human-readable narrative.

---

### 5. Findings on the Time-Granularity Scaffold (30s / 5min / 30min)

Q2's research question embeds a specific time-granularity scaffold: 30 seconds, 5 minutes, and 30 minutes. No literature was found using this specific scaffold as an established research framework. The scaffold does not appear to derive from a single primary source. That said, the following distributed findings are consistent with a three-phase model even if they do not name it:

**First 30 seconds.** The F-pattern eye-tracking research (Nielsen 2006) and Morkes and Nielsen (1997) both document that reader attention and engagement decisions occur in the first seconds. The F-pattern establishes that the upper portion of a document receives disproportionate attention; that the first horizontal scan is the most extensive; and that subsequent attention is sharply concentrated on the left margin. This is consistent with the hypothesis that a reader's orientation decision — whether the document is navigable and worth engaging — is made within the first 30 seconds.

**First 5 minutes.** Cognitive Load Theory and Information Foraging Theory together imply that the first extended reading period is dominated by schema-building from whatever orientation material is available. A reader who cannot construct an adequate initial schema in this period will either abandon the document or fall back on scanning behavior — consistent with the field evidence that external stakeholders encountering Tier-2 documents proceed past the entry point and find the experience overwhelming. No empirical study was found specifically quantifying 5 minutes as a distinct cognitive phase.

**First 30 minutes.** Deep reading research suggests that sustained comprehension requires transition from scanning mode to deep processing. An eye-tracking and think-aloud study (Hyona and Lorch, referenced in the scanning-vs-deep-processing literature) found that scanning leads to poor hypertext comprehension while deep processing produces better performance on comprehension questions. The 30-minute window may correspond to the period during which a motivated reader either successfully completes the transition to deep processing or does not. Again, no study was found naming this specific threshold.

**Assessment.** The 30s/5min/30min scaffold is heuristic and reasonable, but it is not grounded in a single empirical framework. It is congruent with the cognitive science literature but represents a synthesis of distributed findings rather than an established measurement framework. Its usefulness for structuring Q2 thinking is not thereby undermined — but claims derived from it should not be presented as if the scaffold itself is empirically established.

---

### 6. Findings on Context-Mismatch (Initial-Handoff vs. Ongoing-Reference)

This section treats context-mismatch as the primary mechanism candidate, per the Q5 recalibration.

#### 6.1 Ernst and Robillard (2023): prior familiarity as the dominant variable

Ernst and Robillard's controlled study (n=65, Bayesian ordered categorical regression, narrative vs. structured format) found that documentation format was not a significant predictor of architecture understanding performance. Prior source code familiarity was the dominant predictor. This result was confirmed via direct retrieval of both the arXiv abstract and the Springer journal page for this review.

One nuance emerges from detailed examination: the study found that tasks requiring "applying and creating activities were statistically significantly associated with the use of the system's source code," while format was not predictive for these activities. This suggests the finding is not simply "familiarity matters and format does not" but that the nature of the task interacts with both familiarity and source consultation. For tasks requiring orientation-level comprehension (understanding architectural intent, not applying it), the study does not separately report findings.

The Q5 review treated this finding as establishing context-mismatch as the dominant mechanism. This review affirms that interpretation but flags the nuance: the prior-familiarity dominance may be strongest for applied/creative tasks, and the orientation-level finding is not separately tested.

#### 6.2 Initial-handoff as a distinct reading task: what the literature does and does not say

No single study was found that defines initial-handoff documentation comprehension as a named and studied reading task with its own methodology. The gap is real. What the distributed literature provides:

- **Information Foraging Theory** (Pirolli and Card 1999) implies initial-handoff is categorically distinct: zero information scent forces the reader to construct maps from first principles. This is a different cognitive task from returning-reference reading, where scent is strong and navigation paths are pre-established. But the IFT literature does not study this distinction in software documentation specifically.

- **Newcomer onboarding research** (Steinmacher et al. 2015; Harit et al. 2024) addresses first-encounter reading in the context of open-source software projects. Steinmacher's systematic review identifies documentation barriers as a distinct barrier category for newcomers: outdated information, poor findability, information spread across locations. Harit et al.'s more recent review found that only 18 of 58 identified newcomer barriers have corresponding software solutions, and documentation barriers are among the under-addressed categories. Neither study, however, distinguishes between barriers arising from documentation that was poorly designed for first-encounter readers versus documentation that is simply incomplete or obsolete.

- **The Diátaxis framework** (Procida, ongoing) implicitly treats initial-handoff as a tutorial use-case: a learner encountering the system for the first time needs a tutorial, not a reference document. If a Tier-2 reference document is the artifact an external stakeholder first encounters, the Diátaxis prediction is that it will fail them — not because of form or density problems per se, but because reference documentation is not designed to serve the tutorial (orientation) function.

- **Rukmono et al. (2024)** observe that practitioners adapt their explanation to the explainee's "immediate task requirements" and familiarity with the project context, and that external reviewers and newcomers "rely heavily on documentation when experts aren't available." The study does not systematically distinguish initial-handoff from ongoing-reference, but the practitioner behavior described is explicitly responsive to the initial-handoff condition: explanations for someone encountering the system for the first time are materially different from explanations for ongoing work.

#### 6.3 Is initial-handoff documented as a distinct reading task?

The most direct answer the literature provides is this: initial-handoff is not named as a formal reading-task category in any major empirical research program, but its distinctive cognitive characteristics are well-described by the combination of (a) zero-schema state (CLT), (b) zero-scent state (IFT), and (c) tutorial rather than reference purpose (Diátaxis). The convergence of these three frameworks on the same prediction — that initial-handoff reading fails when documentation is designed for returning-reference use — constitutes a strong theoretical case even without direct empirical study.

---

### 7. Implications for the Cycle

#### 7.1 What the literature implies about the primary diagnosis

The combined literature supports a clear, if qualified, verdict on mechanism priority:

**Context-mismatch is the most structurally fundamental mechanism.** Ernst and Robillard (2023) provide the strongest specific empirical support. IFT provides theoretical grounding. CLT provides the cognitive mechanism (zero-schema state = maximum intrinsic load). Diátaxis provides the documentation-design analog (reference artifact fails the tutorial purpose). These four sources converge on the same prediction without having been designed to do so. The cycle's recalibration (from form-mismatch as primary to context-mismatch as primary) is well-supported.

**Density-ordering is a real and independent mechanism** supported by CLT (extraneous load from presentation design) and by the F-pattern research (front-loaded density concentrates the worst reading experience in the highest-attention zone). Even if context-mismatch is primary, a document that opens with a dense architectural-drivers table is applying extraneous load at precisely the moment when intrinsic load is at its maximum. The two mechanisms compound.

**Audience conflation is supported and operationalizable** via Diátaxis (purpose-typing of documents) and the expertise reversal effect (a design that serves novices harms experts and vice versa). The conflation is specific: the same artifact is expected to serve initial-handoff orientation (tutorial purpose, zero schema) and ongoing deep reference (reference purpose, established schema), and these are demonstrably incompatible uses.

**The time-granularity scaffold is heuristically useful** but not derived from a named empirical framework. The cycle should use it as a structuring tool rather than as an established measurement framework.

#### 7.2 What the literature implies about the human-versus-agent dimension

The 2024–2025 agent-documentation literature (arXiv 2511.12884; arXiv 2604.07502) provides the sharpest available evidence that human and agent reading requirements diverge structurally. The agent-README study finds readability scores equivalent to legal documents in agent context files, confirmation that the density appropriate for agent consumption is genuinely hostile to human first-encounter reading. This is the most direct available evidence that the "thread the needle" approach — one artifact serving both — imposes real costs, not merely theoretical ones.

The key nuance from arXiv 2604.07502: high semantic density benefits both audiences, but structural organization requirements diverge. An artifact that is semantically clear but poorly organized for human foraging (lacks headings, landmarks, progressive disclosure) fails the human reader while potentially serving the agent. An artifact that is semantically dense but organized for human scanning (clear hierarchy, low-density entry points, progressive disclosure) serves the human reader while potentially under-serving the agent's need for completeness and navigational indexes. The resolution both papers suggest — a complementary artifact for agent navigation, not a replacement for human-readable documentation — is directly relevant to Q5's question about artifact form.

#### 7.3 The user-proposed unifying frame, assessed against the literature

The user-proposed unifying frame: "the corpus and the agent's turn-structure are currently optimized for production discipline; this cycle shifts the frame toward readerly and interactional usability."

The literature provides the following relevant evidence for and against this framing:

*Consistent with the frame:* The corpus's Tier-2 documents, by the user's own description, open with dense structural tables and reference material. CLT (extraneous load at maximum-intrinsic-load moment) and IFT (zero-scent fails the forager) both predict this will fail first-encounter readers. The agent-README literature confirms that artifacts optimized for agent context construction (dense, complete, operational) are systematically hostile to human first-encounter reading.

*Challenging the frame:* Ernst and Robillard (2023) suggest that format and organization — the "readerly usability" dimension — may not be the primary lever. Prior familiarity dominates. If the external stakeholders who find the docs overwhelming would find them equally overwhelming if reorganized but were still encountering the codebase without prior exposure, then "readerly usability" improvements may have limited effect without also providing context-building tools. The frame is not wrong, but it may be addressing a secondary cause.

*Refinement suggested:* The literature implies that "readerly usability" is a necessary but possibly not sufficient intervention. The primary lever — if Ernst and Robillard are read as directional — is providing first-encounter readers with prior context, not simply improving document organization. A zero-prior-familiarity reader encountering a well-organized reference document may still struggle; a reader with even minimal prior exposure may navigate a poorly organized one successfully. This does not mean readability improvements are not worth pursuing, but it does mean the cycle's claims about expected outcomes should be scoped accordingly (per ADR-069).

#### 7.4 What remains open

1. **The prior-familiarity effect at the orientation level.** Ernst and Robillard (2023) found format was not significant overall; the study did not separately analyze orientation-level comprehension tasks. Whether the prior-familiarity dominance holds specifically for architectural orientation (as opposed to applied/creative tasks) is not established.

2. **Time-granularity thresholds.** No study was found establishing 30-second, 5-minute, or 30-minute reading phases as empirically grounded thresholds. These remain reasonable heuristics, not confirmed landmarks.

3. **Initial-handoff as a distinct study object.** No HCI/CHI research program was found that treats "first encounter with a technical reference document" as a distinct and studied reading task. The gap identified in Q5 persists. The theoretical case is strong; the empirical case is indirect.

4. **The expertise reversal effect applied to agents.** Kalyuga et al. (2003) established the expertise reversal effect for human experts and novices. No parallel research was found on how the effect manifests in AI agent versus human reader contexts. The agent is effectively an "expert" at processing dense reference text in a way that human first-encounter readers are not, but whether the artifact designs that serve agents are harmful (not just less helpful) for humans in ways analogous to the expertise reversal effect has not been studied.

5. **Remedies beyond document reorganization.** The literature suggests context-building before document encounter — not document reorganization alone — may be the more effective intervention. This points toward orientation artifacts (summaries, conceptual introductions, context-building tutorials) rather than solely restructuring existing Tier-2 reference documents. Whether the cycle's scope should extend to pre-document context-building tools is a question the BUILD phase will need to address.

---

### Limitations

1. **Ernst and Robillard (2023) subgroup analysis.** The study's prior-familiarity finding is reported in aggregate; no subgroup findings by audience role or experience level were available. It is not known whether the finding holds equally for zero-prior-exposure external reviewers (the primary failing audience in the field evidence) versus technical participants with partial familiarity.

2. **The 30s/5min/30min scaffold is not empirically anchored.** This review confirmed the scaffold has no single published source. Any synthesis that treats it as an established framework should be flagged.

3. **Schriver (1997) was not directly retrieved.** Bibliographic confirmation and secondary accounts were the only sources available. The reader-focused design claims attributed to Schriver in this review are drawn from secondary accounts and should be verified against the primary text before being cited in final essays.

4. **Newcomer-onboarding research** (Steinmacher 2015; Harit 2024) addresses software projects (primarily open-source contribution workflows) rather than external stakeholder review of architectural documentation specifically. The mapping from "newcomer contributor" to "external architecture reviewer" is reasonable but not established by the literature itself.

5. **Agent-documentation studies** (arXiv 2511.12884; arXiv 2604.07502) are preprints as of 2025. The findings are directionally consistent with the theoretical literature but have not been peer-reviewed.

6. **No direct study of initial-handoff as a reading task.** The strongest claim the literature supports is that initial-handoff reading is theoretically and structurally distinct from ongoing-reference reading. Direct empirical study of this distinction in technical reference documentation does not yet exist.

---

### Sources

1. Sweller, J. (1988). Cognitive load during problem solving: Effects on learning. *Cognitive Science, 12*(2), 257–285.

2. Sweller, J., van Merriënboer, J. J. G. & Paas, F. G. W. C. (1998). Cognitive architecture and instructional design. *Educational Psychology Review, 10*(3), 251–296. https://link.springer.com/article/10.1023/A:1022193728205

3. Sweller, J. (2010). Element interactivity and intrinsic, extraneous, and germane cognitive load. *Educational Psychology Review, 22*(2), 123–138. https://doi.org/10.1007/s10648-010-9128-5

4. Pirolli, P. & Card, S. (1999). Information foraging. *Psychological Review, 106*(4), 643–675. https://psycnet.apa.org/record/1999-11924-001

5. Miller, G. A. (1956). The magical number seven, plus or minus two: Some limits on our capacity for processing information. *Psychological Review, 63*(2), 81–97. https://psycnet.apa.org/record/1957-02914-001

6. Mayer, R. E. (2001). *Multimedia Learning*. Cambridge University Press.

7. Kalyuga, S., Ayres, P., Chandler, P. & Sweller, J. (2003). The expertise reversal effect. *Educational Psychologist, 38*(1), 23–31. https://doi.org/10.1207/S15326985EP3801_4

8. Nielsen, J. (2006). F-shaped pattern for reading web content. Nielsen Norman Group. https://www.nngroup.com/articles/f-shaped-pattern-reading-web-content-discovered/

9. Nielsen, J. (2006). Progressive disclosure. Nielsen Norman Group. https://www.nngroup.com/articles/progressive-disclosure/

10. Morkes, J. & Nielsen, J. (1997). Concise, SCANNABLE, and objective: How to write for the web. SunSoft usability study. https://www.nngroup.com/articles/concise-scannable-and-objective-how-to-write-for-the-web/

11. Schriver, K. A. (1997). *Dynamics in Document Design: Creating Text for Readers*. John Wiley & Sons. https://www.amazon.com/Dynamics-Document-Design-Creating-Readers/dp/0471306363

12. Redish, J. (Ginny). (2012). *Letting Go of the Words: Writing Web Content that Works* (2nd ed.). Morgan Kaufmann. https://redish.net/books/letting-go-of-the-words/

13. Rosenfeld, L., Morville, P. & Arango, J. (2015). *Information Architecture: For the Web and Beyond* (4th ed.). O'Reilly Media. https://www.oreilly.com/library/view/information-architecture-for/9781491911686/

14. Krug, S. (2014). *Don't Make Me Think, Revisited: A Common Sense Approach to Web Usability* (3rd ed.). New Riders.

15. Ernst, N. A. & Robillard, M. P. (2023). A study of documentation for software architecture. *Empirical Software Engineering*. https://arxiv.org/abs/2305.17286 | https://link.springer.com/article/10.1007/s10664-023-10347-2

16. Rukmono, S. A., Zamfirov, F., Ochoa, L. & Chaudron, M. R. V. (2024/2026). An explanation of software architecture explanations. *Empirical Software Engineering*. arXiv preprint 2503.08628. https://arxiv.org/abs/2503.08628

17. Steinmacher, I., Silva, M. A. G., Gerosa, M. A. & Redmiles, D. F. (2015). A systematic literature review on the barriers faced by newcomers to open source software projects. *Information and Software Technology, 59*, 67–85. https://dl.acm.org/doi/10.1016/j.infsof.2014.11.001

18. Harit, G. et al. (2024). Software solutions for newcomers' onboarding in software projects: A systematic literature review. arXiv 2408.15989. https://arxiv.org/html/2408.15989v1

19. Procida, D. (ongoing). Diátaxis framework. https://diataxis.fr/

20. Kalavejci, A. et al. (2025). Beyond human-readable: Rethinking software engineering conventions for the agentic development era. arXiv 2604.07502. https://arxiv.org/html/2604.07502

21. Nguyen, L. et al. (2025). Agent READMEs: An empirical study of context files for agentic coding. arXiv 2511.12884. https://arxiv.org/html/2511.12884v1

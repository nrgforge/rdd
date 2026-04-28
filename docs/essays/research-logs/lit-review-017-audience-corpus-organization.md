## Literature Review: Audience as a Corpus-Organization Axis (Q6 + Q3)

**Date:** 2026-04-24
**Method:** Systematic web-search literature review with primary-source direct retrieval
**Cycle:** RDD 017 — Readability & Comprehensibility
**Briefing commitments honored:** Q5 upstream findings treated as conditional context; Diátaxis treated as confirmation-bias risk; alternative positions (single-sourcing, layered delivery, parallel formats) actively sought; Q3 axis examined in parallel and interaction with Q6 assessed throughout

---

### 1. Methodology

**Searches conducted (2026-04-24):** Fourteen web searches were run across seven thematic clusters: (1) Diátaxis primary-source retrieval and critique; (2) DITA (Darwin Information Typing Architecture) topic types and conditional processing; (3) Robert Horn's Information Mapping methodology; (4) single-sourcing literature including TCBOK, Paligo, and practitioner sources; (5) llms.txt specification and Jeremy Howard's rationale for parallel file formats; (6) AGENTS.md and the emerging ecosystem of agent-facing context files; (7) documentation folder organization conventions, dot-directory conventions, faceted classification, and process-vs-product artifact separation.

**Primary sources retrieved directly:** diataxis.fr/foundations and diataxis.fr/start-here (Procida, full primary text); mintlify.com/resources/structure-documentation-AI-human-readers (Mintlify, full primary text); llmstxt.org (Howard, specification text); agents.md (AGENTS.md standard specification, full text); Wikipedia DITA article (full text); NN/g taxonomy-101 (Morville/Rosenfeld taxonomy vs faceted classification); idratherbewriting.com Diátaxis post (Tom Johnson, full text); archbee.com single-sourcing post (full text).

**What was not findable:** No peer-reviewed empirical literature was found that specifically studies multi-audience documentation success or failure in a controlled experimental design comparable to Ernst & Robillard (2023) for the Q5 domain. The Q3 process-vs-product distinction does not map to an established named taxonomy in the technical-communication body-of-knowledge literature; the closest peer-reviewed framing is the project-management artifact classification (management artifacts vs deliverables) found in project management literature but not formalized in technical-communication practice. Rüping's *Agile Documentation* (2003) was confirmed as published and relevant but full text was not retrieved; the summary account draws on bibliographic records and secondary descriptions. Information Mapping (Horn 1972 and subsequent) was confirmed as a methodology but the original 1970s research papers are behind paywalls; the account draws on informationmapping.com (primary practitioner website) and secondary technical-communication summaries.

---

### 2. Sources Reviewed

| # | Author(s) | Title | Year | Venue | Relevance |
|---|-----------|-------|------|-------|-----------|
| 1 | Procida, D. | Diátaxis framework (foundations, start-here, compass) | ongoing (active 2024–) | diataxis.fr | Documentation type taxonomy; boundary-crossing as root of problems; framework scope |
| 2 | Horn, R. E. | Information Mapping methodology | 1972–ongoing | informationmapping.com; IEEE Xplore; Springer | Original modular documentation taxonomy; structured writing; seven design principles |
| 3 | OASIS | Darwin Information Typing Architecture (DITA) 1.2/1.3 | 2005–ongoing | oasis-open.org; Wikipedia | XML-based topic typing; conditional processing / profiling for audience separation |
| 4 | Rüping, A. | Agile Documentation: A Pattern Guide to Producing Lightweight Documents for Software Projects | 2003 | Wiley / Addison-Wesley | Pattern-based lightweight documentation for software; process vs product distinction; single-source implications |
| 5 | Howard, J. | The llms.txt file — a proposal to provide information to help LLMs use websites | 2024 | llmstxt.org; answer.ai/posts/2024-09-03-llmstxt.html | Parallel file format for human (HTML) vs machine (Markdown) consumption; two-file structure |
| 6 | Mintlify | How to structure documentation for both AI and human readers | 2025 | mintlify.com/resources/structure-documentation-AI-human-readers | Unified-source-with-layered-output as practitioner recommendation; YAML frontmatter as metadata layer |
| 7 | AGENTS.md (Agentic AI Foundation / Linux Foundation) | AGENTS.md specification | 2025 | agents.md | Agent-context file pattern; rationale for separation from human README; scoping conventions |
| 8 | Society for Technical Communication | Single-Source Publishing (TCBOK) | ongoing | tcbok.org/producing-information/single-source-publishing/ | Formal body-of-knowledge entry for single sourcing; conditional content; multiple-audience output |
| 9 | Paligo | Filtering (Profiling) documentation; Single-Sourcing | 2025 | paligo.net; docs.paligo.net | Practitioner CCMS: audience-attribute filtering, taxonomy tagging, multi-channel publishing |
| 10 | Johnson, T. | What is Diátaxis and should you be using it with your documentation? | 2025 | idratherbewriting.com | Practitioner comparative analysis of Diátaxis, DITA, Information Mapping; critique assessment |
| 11 | Nielsen Norman Group (Morville, Rosenfeld, et al.) | Taxonomy 101 | ongoing | nngroup.com/articles/taxonomy-101/ | Single vs faceted taxonomy; multiple organizing axes; reorganization implications |
| 12 | Wikipedia / OASIS | Darwin Information Typing Architecture | ongoing | en.wikipedia.org/wiki/Darwin_Information_Typing_Architecture | Topic types, specialization, conditional profiling, multi-audience output |
| 13 | Augment Code | How to Build Your AGENTS.md (2026) | 2026 | augmentcode.com | Context-engineering guidance; size constraints; subdirectory scoping; monolith-vs-split tradeoff |
| 14 | kriasoft | Folder Structure Conventions | ongoing | github.com/kriasoft/Folder-Structure-Conventions | Monorepo folder naming; documentation directory conventions; separation of `docs/` from tooling |
| 15 | Archbee | Single Sourcing in Technical Writing | 2024 | archbee.com/blog/single-sourcing-in-technical-writing | Five single-sourcing principles; failure modes (dependency risk, format-conversion loss) |
| 16 | Faros | Context Engineering for Developers | 2025 | faros.ai/blog/context-engineering-for-developers | Agent context-window constraints; compression principles; cost of over-sized context files |
| 17 | Procida, D. | Diátaxis — The map | ongoing | diataxis.fr/map/ | Two-dimensional map (action/cognition × acquisition/application); completeness claim |

---

### 3. Findings on Documentation Taxonomies

#### 3.1 Diátaxis (Procida, ongoing)

Diátaxis classifies documentation into four types — tutorials (learning-oriented), how-to guides (goal-oriented), reference (information-oriented), and explanation (understanding-oriented) — along two intersecting axes: **action versus cognition** (practical knowing-how versus theoretical knowing-that) and **acquisition versus application** (study-mode versus work-mode). Procida's framework claims to be a complete map of documentation space: "There are only two dimensions, and they don't just cover the entire territory, they define it. This is why there are necessarily four quarters to it, and there could not be three, or five" (diataxis.fr/foundations). The exact primary-source quote on boundary-crossing: "Crossing or blurring the boundaries described in the map is at the heart of a vast number of problems in documentation" (diataxis.fr/start-here).

**What Diátaxis does not address.** This is the finding most load-bearing for Q6. Diátaxis's two dimensions — action/cognition and acquisition/application — are dimensions of a single user archetype: "the practitioner in a domain of skill" (diataxis.fr/foundations). The framework explicitly serves practitioners acquiring and applying craft skills. It does not distinguish between:

- Human readers versus machine consumers (the Q6 axis)
- Professional roles within a human readership (developer versus manager, new collaborator versus returning practitioner)
- Process artifacts versus product artifacts (the Q3 axis)

Diátaxis's completeness claim ("four and only four") applies only within the axis-space it defines. When a fifth or sixth dimension — such as audience type (human/agent) or generative role (process/product) — is introduced, it is **orthogonal** to Diátaxis's map, not a specialization of it. Diátaxis is silent on these dimensions, not prescriptive about them.

**Confirmation-bias scrutiny result.** Diátaxis's boundary-crossing warning is structurally analogous to Q6's audience-separation hypothesis, but the analogy does not hold precisely. Diátaxis's boundaries are boundaries *between documentation types* (a tutorial that bleeds into explanation is problematic). Q6's question concerns boundaries *between audience types*. These are distinct claims. Diátaxis provides no direct support for or against filesystem-level audience separation; it addresses a different organizational dimension.

**Critique from practitioner literature.** Tom Johnson (idratherbewriting.com) confirms that initial concerns about Diátaxis being "overly opinionated and arbitrary" were partly resolved by Procida's clarification that the framework is an analytical lens, not a rigid bucketing system. Johnson does not identify gaps in the human-vs-machine dimension because that question was not in scope for Diátaxis commentary at the time of his writing. The critique from the Hacker News discussion (item 42325011) and OCaml forum raises domain-specific flexibility concerns but does not contest the framework on the audience-type dimension. No direct peer-reviewed critique of Diátaxis was found.

#### 3.2 DITA (Darwin Information Typing Architecture, OASIS, 2005–)

DITA is an XML-based standard maintained by OASIS that takes a **topic-typed, single-source, conditional-output** approach to documentation. Its five topic types — Task, Concept, Reference, Glossary Entry, Troubleshooting — are functionally similar to Diátaxis's four types (Task ≈ how-to; Concept ≈ explanation; Reference ≈ reference) but DITA adds two mechanisms that Diátaxis lacks: **specialization** (domain-specific topic types derived from base types) and **conditional processing via profiling attributes** (@audience, @platform, @product, @props).

DITA's @audience attribute is directly relevant to Q6. Content elements tagged with audience values can be included or excluded at build time using a DITAVAL filter file. This mechanism enables a single source document to generate separate deliverables: one for "developers," one for "administrators," one for "end users" — or, by extension, one for human readers and one for machine consumers. DITA treats audience separation as a **metadata attribute on content**, not as a filesystem-level directory structure. The taxonomy question (Q6's organizing axis) is resolved in DITA by attribute tagging, not by physical file location.

**Implication for Q6.** DITA's approach supports the "unified source, audience-conditional output" model rather than the separate-corpora model. However, DITA requires tooling infrastructure (DITA-OT processors, DITAVAL files, XML editors) that is incompatible with the Markdown-based, file-system-native RDD corpus. The structural principle — audience as metadata attribute, not directory — transfers even if the tooling does not.

#### 3.3 Information Mapping (Horn, 1972–)

Robert Horn's Information Mapping methodology, developed at Harvard and Columbia in the early 1970s, is a **modular structured-writing approach** organized around seven design principles: visible structure, pre-divided information, labeling, systematic hierarchy, relevance, consistency, and criteria/standards. Horn classified information into seven types (procedure, process, concept, principle, structure, fact, classification) — a richer but less widely adopted taxonomy than Diátaxis's four types.

Information Mapping's primary contribution to Q6 is the **relevance principle**: each information block should contain only information relevant to its labeled function. This principle, applied to the human-vs-agent axis, would suggest that material relevant only to agent-context construction does not belong in a labeled block designed for human orientation. The principle supports content-level filtering but does not prescribe a filesystem or directory architecture.

Information Mapping predates both the web and AI agents; it was designed for print and early hypertext. It offers no direct guidance on the human-versus-machine audience dimension.

#### 3.4 Comparative evaluation

| Framework | Audience-type axis | Process/product axis | Separation mechanism | Scale fit |
|-----------|-------------------|---------------------|---------------------|-----------|
| Diátaxis | Not addressed | Not addressed | Type-based directory separation | Any scale; tooling-agnostic |
| DITA | @audience attribute (profiling) | Not explicit | Metadata + conditional build; no directory requirement | Large-scale XML corpora |
| Information Mapping | Not addressed | Not addressed | Relevance principle (content-level) | Any scale; method-level |

None of the three classical taxonomies directly addresses the human-vs-agent audience dimension. All three predate the AI-agent consumer as a category. The human-vs-agent question requires supplemental frameworks — specifically the practitioner literature from 2024–2025 examined in Section 5 below.

---

### 4. Findings on Dual-Audience Artifact Strategies

#### 4.1 The landscape of strategies

The literature identifies five distinct strategies for serving multiple audiences from a documentation corpus:

1. **Fully separate artifacts** — distinct files authored independently for each audience (e.g., one set of docs for humans, a separate set for agents)
2. **Single-source with conditional rendering** — one canonical source; audience-specific outputs generated at build time (DITA's DITAVAL model; Paligo's profiling/filtering)
3. **Unified artifact with in-document layering** — single file; audience-facing content organized by section or heading level (progressive disclosure; the human instinct described by Rukmono et al. (2024) in the Q5 lit-review)
4. **Frontmatter-tagged unified artifact** — single Markdown file with YAML frontmatter metadata; rendering layer handles audience-specific presentation (Mintlify's MAGI approach)
5. **Parallel-format sibling files** — one source rendered in two formats; each format serves one audience (llms.txt / llms-full.txt serving agents alongside HTML serving humans; AGENTS.md alongside README.md)

#### 4.2 The llms.txt parallel-format approach

The llms.txt specification (Howard, 2024) provides the most directly relevant practitioner artifact for Q6. The rationale, from the primary source: "Large language models increasingly rely on website information, but face a critical limitation: context windows are too small to handle most websites in their entirety." The solution is not to restructure the human-facing documentation but to **create a parallel Markdown-format file alongside it**, at a predictable path (`/llms.txt`), curating the content LLMs need in the format they process most efficiently.

Howard's design philosophy: "Rather than forcing one format to serve both audiences, separate artifacts optimize for each: HTML provides navigation, ads, and JavaScript for humans, while markdown delivers dense, structured content suited to LLM processing."

The llms.txt approach is a **parallel-file strategy** (type 5 above), not a separate-corpus strategy. The human documentation remains in place; an additional sibling file provides agent-optimized access. This is a low-disruption approach: the existing human corpus does not require reorganization; the agent-facing layer is additive.

This pattern also appeared in the AGENTS.md specification (2025). The rationale from agents.md: README.md "is for humans: quick starts, project descriptions, and contribution guidelines. AGENTS.md complements this by containing the extra, sometimes detailed context coding agents need: build steps, tests, and conventions that might clutter a README or aren't relevant to human contributors." AGENTS.md lives at the repository root alongside README.md — parallel files, not separate directories.

#### 4.3 Single-source with conditional rendering

TCBOK (Society for Technical Communication) formalizes single-source publishing as the "write once, publish everywhere" methodology. The primary mechanism for audience separation within a single source is conditional content variables: "With the use of word processing software, such as Microsoft Word or Adobe FrameMaker, the author can create variables that alter specific parts of the text according to the needs of the audience." Paligo implements this at the CCMS level: @audience, @platform, @product, and @otherprops attributes applied to topics, fragments, or inline elements; DITAVAL-style filter files control output per publication.

The TCBOK entry explicitly quantifies: "Your documentation can therefore single source 50% of the content, and you can conditionally include the 20% (or exclude the 30%) for the SME documentation and include the 30% (or exclude the 20%) for the large company documentation." This fraction — a meaningful minority of content is audience-specific while the majority is shared — is consistent with Q5's upstream finding that content divergence is the determining factor. If the human-facing and agent-facing material are ~50% shared and ~25% each audience-specific, single-sourcing is strongly indicated.

Archbee identifies the primary failure modes: **dependency risk** (reusable blocks that require links to context not guaranteed to be present in all output formats) and **format-conversion loss** (links break when content is reproduced in different formats). Neither failure mode is fundamental to the single-sourcing strategy; both are engineering problems addressable with discipline.

#### 4.4 Mintlify's unified-source-with-frontmatter approach

Mintlify's 2025 guidance confirms the practitioner position that Q5 found: unified source, layered output. The primary-source text: "Mintlify gives you the best of both worlds: simple Markdown for reliable AI scanning, and visually rich docs with dynamic features." The mechanism is YAML frontmatter as a metadata layer — "since the YAML frontmatter is not hidden, it's easy for humans to read and edit, while Mintlify uses this metadata to automatically organize the documentation to improve consistency and discoverability" — combined with the ability to export flat Markdown (`llms-full.txt`) from the same source for agent consumption.

Mintlify's approach is strategy 4 (frontmatter-tagged unified artifact). Notably, Mintlify does not treat content divergence as requiring separate authoring; the divergence is managed at the rendering level, not the authoring level. This holds only as long as the *same facts* can serve both audiences — confirming Q5's content-divergence criterion.

#### 4.5 The agent-context-size constraint changes the calculus

A finding not present in Q5's review: **agent-context-window compression is itself a driver of separation**. Research from 2025 (Faros, context engineering; Augment Code, AGENTS.md guidance) documents that models start losing information at ~32,000 tokens of context. Oversized context files cause "lost-in-the-middle" failures: "critical rules get buried in the middle where models pay the least attention." The implication is that **dense, comprehensive unified artifacts that include both human-orientation content and agent-context material may actively harm agent performance** — not just human readability.

This is a new argument for separation that does not appear in the traditional documentation literature. It is an argument from the agent side, not the human side: unified artifacts with full human-narrative content may impose a token-budget cost on agents that genuinely separate agent-context files would avoid. The 150–200 line threshold identified by Augment Code as the point at which AGENTS.md should be split into subdirectory files provides a rough size heuristic.

#### 4.6 Literature's net position

The 2024–2025 practitioner consensus bifurcates by scale and content type:

- **For documentation-site corpora** (Mintlify, DITA, TCBOK): unified source with audience-conditional rendering or frontmatter layering is preferred. The shared content fraction is high; separate authoring creates maintenance divergence.
- **For context-engineering artifacts** (llms.txt, AGENTS.md): parallel-file sibling pattern is the established solution. Not separate corpora — separate sibling files at predictable paths, alongside the human-facing documents.

The key insight is that these two consensus positions are **not in conflict**. Both prefer keeping the human and agent layers close to the same source. Both prefer not maintaining two fully separate corpora. The difference is in how the agent-facing layer is expressed: as a rendered export of the unified source (Mintlify model) or as an explicitly authored parallel sibling (llms.txt / AGENTS.md model). The choice between them is driven by whether the content genuinely diverges: convergent content → rendered export; divergent content → explicit sibling.

---

### 5. Findings on Q3's Axis (Process vs. Product)

#### 5.1 The axis in documentation theory

The process-versus-product distinction does not map to a single named category in the technical-communication taxonomy literature (Diátaxis, DITA, Information Mapping all classify by content type or purpose-of-use, not by generative role). The closest formal treatment comes from project management literature (Project Management Academy): "An artifact is tied to the management of the project — it contributes to the overall management of the project work. The technical manual created for the widget developed as part of the project is documentation. Still, it is a project deliverable, not a project artifact, because it is not part of the management of the project." This frames the distinction as **management-role** versus **deliverable-role** — a function distinction, not a content-type distinction.

In software development, the standard artifact taxonomy (LeanIX, TechTarget, GeeksforGeeks) identifies process artifacts (use cases, class diagrams, requirements, design documents, risk assessments, sprint retrospectives) as distinct from product artifacts (release executables, libraries, the shipped code), but does not systematize where process artifacts should live relative to product artifacts in a documentation corpus.

#### 5.2 The dotfile / hidden-directory convention as a structural answer

The Unix/Linux dotfile convention is the most established structural answer to the process-vs-product visibility question: files prefixed with `.` are hidden from default directory listings. The convention's purpose, from Wikipedia: "hidden to distinguish them from personal files and folders... 'normal' users shouldn't have to worry about them or their contents." The convention was designed for configuration files, not documentation — but the functional logic transfers. Infrastructure artifacts that support tooling operation rather than human reading are candidates for dotfile conventions.

The `.github/` directory pattern in GitHub's repository convention is instructive: GitHub CI/CD workflows, issue templates, and contribution guidelines live in `.github/` specifically to separate machine-facing and process-facing content from the primary documentation tree. The GitHub documentation notes that files in `.github/` "take precedence over complementary files in `./" — showing that the convention carries semantic weight about precedence and audience, not just hiddenness.

The direct implication for ADR-070's `.rdd/` proposal: the dotfile convention for process-infrastructure artifacts has clear precedent in the software-project ecosystem. `.rdd/` as a location for cycle-status, dispatch logs, audit reports, and gate notes follows the same logic as `.github/` — these are operational artifacts for the framework's tooling layer, not deliverable documents readers encounter in the course of understanding the system.

#### 5.3 Visibility tradeoffs

The dotfile convention's principal cost is that hidden directories are harder to discover and browse. This is the correct tradeoff for **pure infrastructure artifacts** (dispatch logs, migration markers, gate notes), but it becomes a tradeoff decision for **still-useful process traces** — the research logs, audit reports, and synthesis essays that Q3's question names. These are not pure infrastructure; they have documentary value for understanding why decisions were made. ADR-070 already grappled with this: reflections and research logs were explicitly excluded from migration to `.rdd/` on the grounds that they "are read by users as narrative material — they are centered."

The literature does not provide a clean resolution for "still-useful process traces that are not primarily user-facing." The closest framework is Rüping's *Agile Documentation* pattern of "documentation at point of need" — produce documentation when it serves a user need, not as a process residue — but Rüping's patterns were designed for development teams, not for a framework corpus that deliberately retains its methodology's reasoning trail.

#### 5.4 Who reads process artifacts and when

The project management and technical-communication literature consistently frames process artifacts as internal documents with a lifecycle tied to the project phase. After a phase closes, process artifacts (gate notes, sprint retrospectives, audit reports) have residual value as organizational memory but are not actively navigated. This matches the RDD pattern: dispatch logs and cycle-status are live during a cycle, residual afterward.

The implication is that **process artifact visibility should be inversely proportional to temporal distance from their generating event**. Artifacts from the current active cycle belong in navigable locations; archived process artifacts from prior cycles belong in locations that are accessible but not surfaced in default views. The dotfile convention and the `docs/cycle-archive/` pattern both implement this logic, but in different dimensions: `.rdd/` hides by filesystem convention; `cycle-archive/` hides by directory depth and naming. Both are defensible; the cycle-archive approach preserves human navigability better; the dotfile approach provides cleaner tool-layer separation.

---

### 6. Findings on Axis Interaction (Audience × Type × Process/Product)

#### 6.1 Multiple axes as facets

The NN/g taxonomy article establishes the theoretical framing: faceted classification uses "several hierarchical, distinct taxonomies that work together to describe different aspects of the same resource." The library-of-congress facets (Topic, Collection, Format) are the canonical example. Applying this to RDD's documentation corpus, the relevant facets are:

- **Type axis:** What purpose does this document serve? (tutorial / how-to / reference / explanation, per Diátaxis; or: orientation / specification / rationale)
- **Audience axis:** Who consumes this artifact primarily? (human-readable / agent-context / dual)
- **Lifecycle axis:** When is this artifact active? (current-cycle / archived / evergreen)
- **Generative-role axis (Q3):** Does this artifact document the product or document the process? (deliverable / process-trace)

Faceted classification theory holds that when documents have multiple independent attributes, a single-taxonomy hierarchy fails because it can only encode one attribute at a time. The alternative is to allow navigation along any axis independently.

**The practical problem for filesystem organization:** Filesystems are inherently hierarchical — they encode one axis in the directory structure and make all other axes invisible at the navigation level. Every directory scheme encodes one facet as "primary" and leaves the others as metadata or naming conventions. This is not a failure of design; it is a structural property of hierarchical path-based navigation.

The implication for Q6: no filesystem-level separation can simultaneously optimize for all four axes. The question is which axis should be the *primary* organizational axis, with the others expressed through naming conventions, frontmatter metadata, or parallel sibling files.

#### 6.2 What the Diátaxis-DITA comparison suggests about axis priority

Diátaxis encodes **type** as the primary axis. DITA encodes **type** as the primary axis (topic specialization determines directory structure in conventional DITA maps) and adds **audience** as a metadata attribute. Information Mapping encodes **type** as the primary axis. The three classical taxonomies are unanimous: content type is the primary directory-level axis; audience is a secondary metadata-level attribute.

The 2024–2025 practitioner consensus for AI-facing documentation (llms.txt, AGENTS.md) makes a different choice: it encodes **audience** as a primary axis by creating separate sibling files, but it does so *without reorganizing the primary corpus*. The human-facing corpus retains its type-based organization; the agent-facing artifact is additive alongside it. This is an **audience-at-the-margin** rather than **audience-as-primary-reorganization** approach.

The analogy to ADR-070's centered-vs-infrastructure framing: ADR-070 encodes **generative role** (centered/deliverable vs. infrastructure/process-trace) as the primary organizational axis for the housekeeping question. The llms.txt / AGENTS.md pattern suggests that the **audience** axis for the human-vs-agent question should be handled the same way — not by reorganizing the existing corpus, but by adding audience-optimized sibling artifacts alongside the existing structure.

#### 6.3 Combining axes: risk of explosion

When multiple independent axes are simultaneously expressed in directory structure, the result is a combinatorial explosion of directories. A corpus with three axes (type × audience × lifecycle), each with two or three values, produces 8–27 potential directory categories. This produces navigation burden and dangling-reference risk that outweighs the organizational benefit for corpora at the scale of a single-project RDD instance.

Faceted classification theory recommends facets only up to "ideally three levels of disclosure" before reorganization is needed. The NN/g taxonomy article confirms: faceted taxonomies require "regular reviews to add, rename, merge, or remove terms" to maintain stability. Each reorganization event risks dangling references if artifacts move between directories.

---

### 7. Findings on Tractability of "Primarily Agent-Facing"

#### 7.1 Is the classification tractable?

Q6's sub-question (b) asks whether "primarily agent-facing" is a tractable classification given that some artifacts are mixed-audience at the section level. The literature provides qualified support for tractability, but the qualification is important.

The AGENTS.md specification makes the classification tractable for a specific well-defined category: **agent-context files** (build steps, test conventions, code-style rules, architectural constraints that agents need but humans find verbose or irrelevant). This category is tractable because the content is genuinely different: the agent-context file contains compressed, instruction-optimized material that would "clutter a README or aren't relevant to human contributors." The human-facing nature of the alternative (README, human docs) is not in doubt.

However, Mintlify's analysis of documentation sites identifies that **AI agents now account for 45% of all requests on Mintlify-powered documentation sites** — meaning many artifacts are not "primarily agent-facing" or "primarily human-facing" but are used by both audiences at roughly comparable rates. For such artifacts, "primarily agent-facing" is not a tractable classification — it is a false binary.

The tractability condition: "primarily agent-facing" is tractable when the content is **functionally divergent** — when the agent-facing version genuinely requires different facts, different structure, and different granularity than the human-facing version. It is not tractable when the same content serves both audiences well, even if one audience reads it more. The llms.txt / AGENTS.md cases succeed because the agent-facing content (compressed context, curated link list) is genuinely different from the human-facing content (full documentation). The system-design.md case from the RDD constraint-removal response occupies a middle ground: the diagram and module descriptions serve human readers; the rest may primarily serve agents — but whether "the rest" is genuinely different in content or merely overly dense is the Q5 question, now answered by the literature as: density-ordering is an independent mechanism from audience conflation.

#### 7.2 Does separation require splitting first?

Q6's sub-question (b) also asks whether separation requires splitting mixed-audience artifacts first. The literature's answer is: **it depends on the mechanism chosen**.

- Under the AGENTS.md / llms.txt parallel-sibling model: no splitting required. The existing human-facing artifact stays intact; the agent-facing content is *authored anew* as a purpose-built parallel file. The existing artifact does not need to change.
- Under the DITA conditional-processing model: no splitting required. Mixed-audience content is tagged with @audience attributes; separate outputs are built; the source remains unified.
- Under the Mintlify frontmatter-tagging model: no splitting required. The unified Markdown source renders differently for different audiences at the presentation layer.
- Under a separate-directory model (the strong version of Q6): splitting is required. Sections or topics that are currently in one artifact must be relocated to separate files in separate directories.

The parallel-sibling and conditional-rendering approaches are thus lower-cost entry points into audience separation than a directory-reorganization approach, and both are better supported by the current literature.

---

### 8. Findings on Classification Survival Under Reorganization

#### 8.1 Dangling references in documentation reorganization

The software literature on refactoring references (Kapur 2010, SIGPLAN; Springer ESEM 2011) establishes that dangling references are a known risk when declarations (in code) or artifact paths (in documentation) are moved without updating all dependent references. For documentation corpora specifically, the problem manifests as: links, cross-references, and dispatch instructions that pointed to a pre-reorganization path now fail silently (the link loads a 404 or loads the wrong artifact) rather than failing loudly.

ADR-070 already addresses this for the RDD corpus: the migration operation includes a reference-update sweep, the marker file signals migration state, and the rollback manifest enables forensic recovery. The literature does not produce additional mechanisms beyond this discipline.

#### 8.2 What makes classifications stable under reorganization

The NN/g taxonomy article's guidance: "long-term usefulness of the taxonomy depends on having regular reviews to add, rename, merge, or remove terms, and also to spot-check examples of how content has been tagged to ensure that the taxonomy is used properly." This is a maintenance discipline recommendation, not a structural guarantee.

The structural principle that produces stable classifications under reorganization is **loose coupling between the classification axis and the artifact's identity**. Artifacts identified by stable names (their content) survive reorganization better than artifacts identified by path (their location). This principle underlies the llms.txt and AGENTS.md approaches: the agent-facing artifact is named by convention (`/llms.txt`, `AGENTS.md`) at a predictable location rather than being organized into a subdirectory that might be reorganized.

The TCBOK single-sourcing principle of "generalization" — "remove product names, version numbers, and specific identifiers so content applies to multiple products or versions" — is a stability principle for reusable content blocks. Applied to classification, it argues for: classify artifacts by stable functional properties (what they do for a reader), not by transient structural properties (where they currently live in the corpus hierarchy).

The C4 model's zoom-level hierarchy (surfaced in Q5) provides one operationalization: artifacts classified by *abstraction level* (context / container / component / code) rather than by *directory structure* are stable across corpus reorganizations because the abstraction level is a property of the content, not the path.

#### 8.3 Graduation and handoff survival

The Q5 lit-review noted that the RDD corpus undergoes "graduation" — folding methodology knowledge into new artifact versions as the corpus matures. Classification schemes that survive graduation are those that remain correct descriptions of the artifact *after* its content is updated, not just when it is first created.

Type-based classifications (Diátaxis) are relatively stable under content updates: a reference document remains a reference document even as its entries are updated. Role-based classifications (process vs. product) are also relatively stable: a gate note remains a process artifact even as its content reflects a newer cycle. Audience-based classifications are the least stable under content evolution: an artifact that was "primarily agent-facing" when first authored may become "primarily human-facing" as human engagement with the corpus grows (as Mintlify's 45% agent-traffic finding suggests is possible).

---

### 9. Implications for the Cycle

#### 9.1 Is human-vs-agent a distinct primary axis or a specialization of an existing one?

The literature supports it as a **distinct axis, orthogonal to existing ones**. Diátaxis, DITA, and Information Mapping do not subsume it. ADR-070's centered-vs-infrastructure axis is structurally related but not equivalent: centered documents can be either human-facing or agent-facing (a system-design.md can be centered for human reading, and an architectural-drivers table within it can be centered for agent context-building). The human-vs-agent distinction cuts *across* the centered/infrastructure and process/product axes rather than specializing them.

The AGENTS.md and llms.txt specifications confirm this: they introduce a new organizational artifact type — the agent-context file — that does not exist in the classical documentation taxonomy but is not derived from any of the existing types. It is an emergent category produced by a new category of document consumer.

#### 9.2 What filesystem-level separation is and is not supported

The literature's strongest support is for the **parallel-sibling pattern** — not a separate directory or separate corpus, but a purpose-built agent-facing file alongside the human-facing primary artifact. This is what llms.txt does (alongside the website's normal HTML), what AGENTS.md does (alongside README.md), and what Mintlify's llms-full.txt export does (alongside the interactive documentation site).

A separate `.rdd/` directory containing agent-context material has weaker direct support in the literature. The dotfile convention supports moving **infrastructure/operational artifacts** (dispatch logs, migration markers, cycle-status) to a hidden directory — that is ADR-070's proposal and is well-grounded in the `.github/` convention. But moving **documentation content** (architectural drivers tables, system design detail that serves agents) into a hidden directory would make that content invisible to default filesystem navigation and to human readers who might need it — which is the opposite of the Mintlify recommendation of keeping content accessible to both audiences from a unified source.

The implication: the `.rdd/` / housekeeping migration for process-infrastructure artifacts is well-supported. A further migration of agent-facing *content* into `.rdd/` is not supported by the literature and would conflict with the parallel-sibling pattern's finding that agent-facing content should be additive alongside human content, not separated into hidden locations.

#### 9.3 What the Q5 upstream finding implies for Q6

Q5 found that the literature's preferred dual-audience mechanism is **layered delivery from shared source** — not fully separate artifacts. Q6's review confirms this finding holds at the corpus-organization level, not just the individual-artifact level.

The sequential dependency (Step 1.5 briefing #5) resolves as follows: if Q5's conclusion is that in-document layering is the right form intervention, then Q6's "primarily agent-facing artifacts" category does not need to exist as a filesystem-level directory because the agent-facing content lives in the same files as the human-facing content, just layered differently. The parallel-sibling pattern (llms.txt, AGENTS.md) introduces one *additional* file per human-facing primary artifact that provides an agent-optimized distillation — this is not a separate directory but a companion file.

#### 9.4 Where the literature leaves the cycle without a clean answer

Three questions remain open after this review:

1. **The content-divergence threshold.** The literature identifies content divergence as the criterion for when to separate vs. unify, but does not provide a measurement method. For RDD's system-design.md specifically, whether the "rest" (beyond diagram and module descriptions) is genuinely agent-only content or merely dense human content is an empirical judgment that requires examining the artifact, not searching the literature.

2. **The interaction between context-window compression and readable documentation.** The 2025 findings on agent context engineering (Faros, Augment Code) introduce a new consideration — that comprehensive unified artifacts may actively harm agent performance, not merely inconvenience human readers. This finding is from practitioner guidance, not peer-reviewed research, and is not directly addressed in the classical technical-communication literature. It is a live open question for the cycle's MODEL and DECIDE phases.

3. **Whether frontmatter tagging is viable in a Markdown-file-system corpus.** Mintlify's frontmatter approach requires tooling that renders YAML frontmatter as audience-conditional presentation. In a plain-file Markdown corpus (RDD's architecture), frontmatter tags are visible to humans but not acted upon by any renderer — making them documentary metadata rather than functional audience filters. The viability of the frontmatter strategy for RDD depends on whether a rendering or export layer will be introduced as part of the cycle's BUILD output.

---

### Limitations

1. **No peer-reviewed empirical literature on multi-audience documentation success/failure rates.** The literature found on this topic consists entirely of practitioner guidance and descriptive practitioner-facing specifications (TCBOK, Paligo, llms.txt, AGENTS.md). Controlled studies comparable to Ernst & Robillard (2023) do not appear to exist for the multi-audience documentation design question. The conclusions in this review are therefore based on practitioner consensus and theoretical frameworks, not experimental evidence.

2. **Rüping (2003) not retrieved in full text.** The Agile Documentation patterns that may directly address the process-vs-product distinction in software project documentation were not accessible beyond bibliographic metadata and secondary descriptions. This is the most significant gap in Section 5's Q3 treatment.

3. **Information Mapping primary research papers (1972–) not retrieved.** The account of Horn's methodology draws on the informationmapping.com practitioner website and secondary technical-communication summaries, not the original research papers. The seven-principle account is reliable at the practitioner level; the original research context is not confirmed.

4. **The AGENTS.md specification is very new (2025).** It is maintained by the Agentic AI Foundation under the Linux Foundation. As of April 2026, it has wide tool support but limited independent analysis. Its status as emerging practitioner standard versus durable design pattern is not yet confirmed. The rationale for separation (avoid cluttering human docs; give agents a predictable context location) is well-articulated and analogically sound; it should not be treated as settled doctrine.

5. **Mintlify's claim that "45% of documentation requests come from AI agents"** is an observation from their customer base — documentation sites that serve developer APIs and tools, where AI coding agents are first-class users. This percentage may not generalize to a project-internal corpus like RDD's, where agent traffic patterns differ substantially from a public documentation site. The finding is directionally interesting but should not be applied quantitatively to the RDD context.

6. **The Google/Stanford claim about model comprehension degrading at ~32,000 tokens** was retrieved from practitioner secondary accounts (Faros, Augment Code) and not confirmed from primary research publications. It is reported here as a practitioner design heuristic, not as empirically validated fact.

---

### Sources

1. Procida, D. (ongoing). Diátaxis framework. https://diataxis.fr/. Retrieved primary text from diataxis.fr/foundations and diataxis.fr/start-here, 2026-04-24.

2. Horn, R. E. (1972–ongoing). Information Mapping methodology. https://informationmapping.com/pages/information-mapping-methodology. Also: Horn, R. E. (1982). How to Write Information Mapping. *IEEE Transactions on Professional Communication*. https://ieeexplore.ieee.org/document/6592441

3. OASIS Technical Committee (2005–ongoing). Darwin Information Typing Architecture (DITA). https://www.oasis-open.org/committees/dita/faq.php. Wikipedia entry retrieved: https://en.wikipedia.org/wiki/Darwin_Information_Typing_Architecture

4. Rüping, A. (2003). *Agile Documentation: A Pattern Guide to Producing Lightweight Documents for Software Projects*. Wiley. https://www.amazon.com/Agile-Documentation-Producing-Lightweight-Documents/dp/0470856173

5. Howard, J. (2024). The /llms.txt file — a proposal to provide information to help LLMs use websites. https://llmstxt.org/ and https://www.answer.ai/posts/2024-09-03-llmstxt.html

6. Mintlify (2025). How to structure documentation for both AI and human readers. https://www.mintlify.com/resources/structure-documentation-AI-human-readers

7. Agentic AI Foundation / Linux Foundation (2025). AGENTS.md specification. https://agents.md/

8. Society for Technical Communication (ongoing). Single-Source Publishing. Technical Communication Body of Knowledge (TCBOK). https://www.tcbok.org/producing-information/single-source-publishing/

9. Paligo (2025). Filters (Profiling). https://docs.paligo.net/en/filtering---profiling.html. Also: Single-sourcing. https://paligo.net/single-sourcing/

10. Johnson, T. (2025). What is Diátaxis and should you be using it with your documentation? *I'd Rather Be Writing*. https://idratherbewriting.com/blog/what-is-diataxis-documentation-framework

11. Nielsen Norman Group / Morville, P. & Rosenfeld, L. (ongoing). Taxonomy 101. https://www.nngroup.com/articles/taxonomy-101/

12. Augment Code (2026). How to Build Your AGENTS.md. https://www.augmentcode.com/guides/how-to-build-agents-md

13. Faros (2025). Context Engineering for Developers. https://www.faros.ai/blog/context-engineering-for-developers

14. kriasoft / Folder Structure Conventions (ongoing). GitHub repository. https://github.com/kriasoft/Folder-Structure-Conventions

15. Archbee (2024). Single Sourcing in Technical Writing: An Overview. https://www.archbee.com/blog/single-sourcing-in-technical-writing

16. Wikipedia (ongoing). Hidden file and hidden directory. https://en.wikipedia.org/wiki/Dot_file

17. GitHub (ongoing). GitHub special files and paths (joelparkerhenderson). https://github.com/joelparkerhenderson/github-special-files-and-paths

18. Mintlify (2025). AI Documentation Trends: What's Changing in 2025. https://www.mintlify.com/blog/ai-documentation-trends-whats-changing-in-2025

19. OASIS (2012). Conditional processing (profiling) — DITA 1.2 specification. https://docs.oasis-open.org/dita/v1.2/os/spec/archSpec/condproc.html

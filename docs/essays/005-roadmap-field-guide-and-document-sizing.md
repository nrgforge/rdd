# Roadmap, Field Guide, and Document Sizing in RDD
*2026-03-12*

## Abstract

This essay investigates four gaps in the RDD artifact corpus: the absence of a high-level sequencing document between architecture and implementation, the lack of a developer-focused guide that maps designed state to current state, the need for research-backed heuristics governing document length and decomposition, and the maintenance problem of keeping artifacts conformant when the RDD skill set evolves or when RDD is adopted by an existing project. Research across architecture documentation frameworks (TOGAF, arc42, C4), documentation theory (Diátaxis, Every Page is Page One), cognitive load research (Cowan's working memory limits), LLM context utilization studies ("lost in the middle"), and architecture conformance practices produced four findings. First, architecture roadmaps — as distinguished from implementation plans — serve the sequencing need by providing work packages with classified dependencies and transition states without dictating build order, enabling developers to own their own sequencing decisions. Second, explanation-type documentation (in the Diátaxis sense) scaffolds the mental model building that developers need to speak with authority about a system, filling a role distinct from orientation (routing), product discovery (stakeholder perspective), and system design (technical specification). Third, five cascading heuristics — grounded in cognitive science, reading research, and LLM performance data — govern when documents should be split, how sections should be structured, and what length constraints apply to different document access patterns. Fourth, a conformance audit mechanism — modeled on TOGAF's compliance review spectrum — addresses documentation drift when skill versions change or RDD is added to existing projects, bringing artifact format into alignment without re-running pipeline phases.

## 1. The Gap Between Architecture and Implementation

The RDD pipeline produces a system design that specifies modules, responsibilities, integration contracts, and fitness criteria. It also already contains a Build Sequence section that prescribes implementation order. But the system design answers "what are the pieces?" — not "what is the strategic shape of the work, and how might a developer approach it?"

This gap matters for two stakeholders. The team lead running a scoping pipeline (RESEARCH → ARCHITECT) needs to communicate not just what the system is but how the work might be approached — which pieces depend on which, what intermediate states look like, where decisions remain open. The solo developer entering the build phase needs enough context to make informed sequencing decisions without being told what to do.

The current Build Sequence section in system-design.md (Phases 0-3, with numbered steps and single-commit instructions) reads as prescriptive build instructions. It dictates implementation order rather than enabling the developer to choose their own. This is the wrong document type for the purpose it serves.

### Architecture Roadmap vs. Implementation Plan

TOGAF makes a clean distinction between the Architecture Roadmap (Phase E) and the Implementation and Migration Plan (Phase F). The roadmap is strategic — the TOGAF Standard states it "supports decisions about your path, destination, and where decisions have not been made." It has "the definition, but not the activities."

A roadmap contains:

- **Work packages** — logical groups of changes with dependencies, objectives, and value
- **Transition architectures** — intermediate states between current and target
- **A gaps/dependencies matrix** — what needs to happen before what, and why
- **Open decision points** — where the path forks and the builder must choose

A roadmap does not contain: detailed task lists, timelines, resource allocation, or step-by-step instructions.

Arc42's Section 4 (Solution Strategy) occupies similar territory at smaller scale: "a short summary and explanation of the fundamental decisions and solution strategies that shape the system's architecture." The guidance is explicit: "Keep the explanation of these key decisions short." These decisions "form the cornerstones for your architecture — they are the basis for many other detailed decisions or implementation rules." The strategy enables implementation decisions; it does not make them.

Both frameworks distinguish between *enabling informed decisions about sequencing* and *dictating the sequence*. The roadmap gives the builder enough context to make good sequencing decisions on their own. This is exactly the document type RDD lacks.

A scale caveat: TOGAF roadmaps coordinate multi-team, multi-year enterprise transitions. RDD coordinates a solo developer or small team's work on a single system. The concept is borrowed, not ported — what transfers is the *distinction* between strategic definition and tactical execution, not the full machinery of enterprise roadmapping.

### Roadmap as RDD Artifact

A roadmap document adapted to RDD would:

- Identify work packages (logical groups of changes) with their dependencies — derived from the system design's module decomposition and integration contracts
- Describe transition states — intermediate architectures that are coherent on their own, not just steps toward the target
- Surface open decision points — places where the builder must choose based on context the roadmap cannot anticipate
- Remain silent on how to execute each work package — that is the developer's domain

This document is a pragmatic artifact (Invariant 3): the agent generates it from the system design and ADRs, the user validates it. It is updated reflexively when architecture changes, the same maintenance model as the orientation document. It is not an epistemic artifact — no gate is needed. Its purpose is to enable ownership, not to build understanding directly.

A design risk: any document listing work packages with dependency arrows between them *affords* sequential reading — developers will naturally interpret the dependency graph as a prescribed build order. The roadmap's presentation format must actively resist this. Dependencies should be explicitly classified: **hard dependencies** (Module B literally cannot be built without Module A's interface), **implied logic** (Module A is simpler and builds confidence, but Module B could be built first), and **open choices** (Modules C and D are genuinely independent — build either first). Making this classification visible is what distinguishes a roadmap from a build plan.

The system design should link to the roadmap for sequencing context rather than embedding build instructions. The system design's proper scope is specifying what the system is; the roadmap captures how the work might be approached. The system design may still note hard structural dependencies inline (these are architectural facts), but the strategic view — transition states, open choices, implied orderings — belongs in the roadmap.

## 2. The Field Guide: Scaffolding Mental Model Construction

The orientation document routes readers. The product discovery document captures stakeholder perspective. The system design specifies modules and contracts. The domain model defines vocabulary. None of these documents answer: "How does the designed system relate to what actually exists, and what do I need to understand to own it?"

### Mental Models Cannot Be Documented — But They Can Be Scaffolded

Jennifer Moore's work on mental maps argues that "it's more or less impossible to document the models we build in ways others can recreate." Mental maps are inherently personal, lossy, and built through interaction with the system. But Moore also notes that "discussion can help quite a bit because people within the system respond to your questions and assumptions, helping you become integrated into the broader network of understanding."

The field guide does not contain understanding. It scaffolds the building of understanding by pointing developers toward the right questions, the right code, and the right connections between domain and implementation.

Research on developer mental models shows a hierarchical understanding flow: global overview → module-level understanding → detailed implementation. Novices build bottom-up (line-by-line assembly); experts abstract over patterns and anticipate interactions. Simon Brown (C4 model) captures the principle in his formulation "the code doesn't tell the whole story" — architecture documentation describes what code alone cannot convey: context, rationale, and the relationship between design decisions and their implementations.

### Explanation Documentation in Diátaxis

Diátaxis classifies documentation into four types: tutorials (learning-oriented), how-to guides (task-oriented), reference (information-oriented), and explanation (understanding-oriented). The field guide maps to explanation — documentation that takes "a higher and wider" perspective than reference or how-to material.

Diátaxis describes explanation as:

- Answering "Can you tell me about…?" not "How do I…?"
- Helping readers "weave disparate knowledge into cohesive understanding"
- "Illuminating the subject by taking multiple different perspectives on it"
- Admitting opinion and perspective, weighing alternatives
- Keeping tight boundaries — no instruction or specification that belongs elsewhere

This is distinct from every other RDD artifact type. The system design is reference (information-oriented). The orientation document is a routing index. The product discovery document is stakeholder narrative. The essays are research narratives. None of them are explanation in the Diátaxis sense — none exist specifically to scaffold the developer's understanding of how design maps to reality.

### Field Guide as RDD Artifact

A field guide adapted to RDD would:

- Map each module in the system design to its current implementation state — what exists, what is partial, what is planned
- Connect domain model concepts to their code-level manifestations — where the vocabulary lives in the implementation
- Surface the "why" behind structural choices that are not obvious from code alone — the design rationale that code cannot carry
- Point to specific files, directories, and patterns where a developer should explore to build understanding
- Distinguish between what is settled and what is in flux — preventing developers from investing understanding in areas about to change

This document lives in a references directory (per user preference). It is a pragmatic artifact: agent-generated, user-validated, updated reflexively when the system design or implementation changes. It serves Invariant 0 from the implementation side: the developer who reads the field guide and explores the code it points to should be able to speak with authority about the system without AI assistance.

The field guide is not the orientation document. Orientation says "what is this system and where do I go?" The field guide says "here is how the designed system maps to what is actually built, and here is what to understand to own it." Orientation is Tier 1 (entry point). The field guide is reference material — Tier 3, consulted as needed.

## 3. Document Sizing: When to Split, How to Structure

The RDD artifact corpus currently contains documents ranging from 712 words (ORIENTATION.md) to 6,969 words (system-design.md). Research across cognitive science, reading comprehension, and LLM performance converges on a set of heuristics governing when documents should be split and how sections should be structured.

### Working Memory: The 3-5 Chunk Limit

Cowan (2010) refined Miller's famous 7±2 estimate to a more accurate 3-5 meaningful items in working memory for young adults. When rehearsal and grouping strategies are controlled for, the underlying storage capacity is approximately 4 items. Chunking does not increase this limit — it redefines what counts as one unit. A chunk can be a single concept or a learned association of multiple concepts, but the maximum number of concurrent chunks remains constant.

The implication for document sections: any section that requires the reader to hold more than 3-5 concepts simultaneously to understand it exceeds working memory capacity. Sections should be designed so each one introduces or builds on a small number of concepts that can be chunked together before the next section adds more.

### Reading Contracts and Purpose Clarity

Research on document length shows that paragraph length alone has no statistically significant effect on comprehension scores — structure and readability matter more than raw length. The critical factor is what Tom Johnson calls the "reading contract": readers trade time for task completion. Task-oriented documentation succeeds because the payoff is clear. Conceptual documentation lacks this urgency.

Johnson's experience is instructive: a 20+ page workflow narrative received only one survey response from eight recipients, despite positive feedback from that single reader. Long, high-level conceptual documents simply do not command the same reading attention as task-based ones.

The implication: document length matters less than purpose clarity and cognitive chunking. A 7,000-word document is viable as reference material consulted in sections. The same 7,000 words as a conceptual narrative meant to be read end-to-end is not viable for most readers.

### LLM Context: The Lost-in-the-Middle Problem

The "lost in the middle" phenomenon, documented by Liu et al. (2023, arXiv:2307.03172; published in TACL 2024), persists across model generations. Liu et al. demonstrated that LLMs exhibit a U-shaped performance curve: better recall at the beginning and end of context, with significant degradation for information positioned in the middle. Subsequent benchmarking across the field has shown accuracy drops from approximately 75% to 55-60% for middle-positioned information at 4K tokens. Even models advertising million-token context windows show effective utilization capping at 30-60% of stated capacity before recall decay becomes significant.

Anthropic's own context engineering guidance emphasizes finding "the smallest set of high-signal tokens that maximize the likelihood of your desired outcome." The recommendation: maintain lightweight identifiers and load data just-in-time rather than pre-loading everything. Sub-agent architectures should return condensed summaries of 1,000-2,000 tokens. The overarching principle: optimize for relevance, not comprehensiveness.

### Every Page is Page One: The Purpose Test

Mark Baker's framework provides the strongest criterion for splitting: a document should serve one purpose for one audience. Every Page is Page One topics are "self-contained" and "function alone" — no linear dependencies, no previous/next relationships. Each topic establishes its own context.

When a document serves multiple distinct purposes, it should be multiple documents. The system-design.md currently serves as architectural specification, responsibility reference, integration contract reference, test architecture, and build sequence — at least five distinct purposes. By the Purpose Test, it is at least three documents.

### Five Cascading Heuristics

These findings converge into a set of heuristics, ordered by priority:

**Heuristic 1: The Purpose Test.** A document should serve one purpose for one audience. When purposes diverge, split. This is the strongest signal because it addresses the most fundamental problem — a document trying to be too many things cannot serve any of them well.

**Heuristic 2: The 3-5 Concept Rule.** Each section should require the reader to hold no more than 3-5 concepts simultaneously. When a section exceeds this, restructure — either by chunking concepts into prerequisite groups or by splitting into sub-documents with explicit cross-references.

**Heuristic 3: The ~5,000 Word / ~6,500 Token Guideline.** Documents that an agent must read end-to-end and act on should aim to stay in the neighborhood of 5,000 words (~6,500 tokens). This number is approximate — derived from retrieval-task research (where middle-context degradation is well-measured) rather than direct studies of end-to-end document comprehension, which is a different cognitive task. The principle is directional: documents well above this range face increasing recall risk when consumed by agents, and should either be split into sub-documents or designed for section-level consultation rather than end-to-end reading.

**Heuristic 4: The Read Contract.** Reference material (consulted by section) can be longer than narrative material (read end-to-end). A 9,000-token domain model consulted by glossary lookup is acceptable. A 9,000-token system design read narratively is not. The access pattern determines the appropriate length.

**Heuristic 5: Position-Sensitive Placement.** In documents agents will consume, the most critical information should appear at the beginning and end. Nothing important should be buried in the middle third. For long documents, explicit section headers and structural markers help both humans and agents navigate.

The heuristics cascade: first apply the Purpose Test (should this be one document?), then the Concept Rule (are sections cognitively manageable?), then the Token Ceiling (is the whole document within effective processing range?), then the Read Contract (is length appropriate for the access pattern?), then Position-Sensitive Placement (is critical information well-positioned?).

## 4. Implications for the RDD Artifact Corpus

### New Artifacts

Two new document types join the artifact hierarchy:

1. **Roadmap** — a TOGAF-style architecture roadmap adapted to RDD. Work packages with classified dependencies (hard, implied, open) and transition states. Enables sequencing decisions without dictating them. Agent-generated, user-validated, updated reflexively. Linked from system-design.md, which retains hard structural dependencies as architectural facts.

2. **Field Guide** — a Diátaxis explanation document that maps the system design to current implementation state. Scaffolds mental model construction for developers who need to own the system. Agent-generated, user-validated, updated reflexively. Lives in references.

Both are pragmatic artifacts (Invariant 3). Neither requires an epistemic gate. Both serve Invariant 0 from different angles, best understood as purpose-in-context: the roadmap helps a developer or team lead conceptualize *how the work gets done* (sequencing ownership); the field guide helps them understand *the moving parts* (system understanding ownership).

### Document Sizing Consequences

Applying the five heuristics to the current corpus:

- **system-design.md** (6,969 words, ~9,300 tokens) fails the Purpose Test — it serves at least five distinct purposes. It also exceeds the Token Ceiling for end-to-end reading. Candidate for decomposition: the module decomposition and architectural drivers could remain as the core document, with the responsibility matrix, integration contracts, test architecture, and fitness criteria split into sub-documents or a supporting reference.

- **domain-model.md** (6,832 words, ~9,100 tokens) passes the Purpose Test (one purpose: vocabulary authority) but exceeds the Token Ceiling. However, it passes the Read Contract — it is reference material consulted by lookup, not read end-to-end. The current length is acceptable given its access pattern.

- **scenarios.md** (5,499 words, ~7,300 tokens) passes the Purpose Test and the Read Contract (consulted per scenario group). Acceptable as-is.

- **ORIENTATION.md** (712 words, ~950 tokens), **product-discovery.md** (2,941 words, ~3,900 tokens), and **SKILL.md** (3,117 words, ~4,150 tokens) all fall well within heuristic limits.

The roadmap and field guide, as new documents, should be designed within heuristic constraints from the start — each under 5,000 words, each serving a single purpose, each structured so no section requires holding more than 3-5 concepts simultaneously.

### Artifact Hierarchy Update

The three-tier hierarchy (Tier 1: orientation → Tier 2: primary readables → Tier 3: supporting material) accommodates both new artifacts without structural changes:

- The **roadmap** sits at Tier 2 alongside product-discovery.md and system-design.md — it is a primary readable document meant to be read end-to-end when approaching the work.
- The **field guide** sits at Tier 3 as reference material — consulted as needed when a developer wants to dig into how design maps to implementation.

## 5. The Conformance Problem: Keeping Artifacts Current

The document sizing heuristics and new artifact types raise a maintenance question that extends beyond any single document: when the RDD skill set evolves (new artifact types, amended templates, new required sections) or when RDD is adopted by an existing project, how does the artifact corpus get brought into alignment?

### Documentation Drift

Research on architectural drift — "the diverging of the implemented code from the architecture design of the system" — applies equally to documentation. The divergence between what RDD's skill files expect and what a project's artifact corpus actually contains is documentation drift. A project that ran through ARCHITECT before the orientation document was added has no ORIENTATION.md. A project that ran before product discovery was a phase has no product-discovery.md. These are not content problems — the prior cycles produced valid work — they are format conformance problems.

RDD already has mechanisms that partially address this: backward propagation sweeps for invariant contradictions, product conformance audits check product assumptions, stewardship checkpoints verify code-level architectural conformance, and ORIENTATION.md regeneration catches some gaps by reading the full corpus. But none of these mechanisms address *template-level conformance across the entire artifact corpus* when the skill set itself changes.

### TOGAF's Conformance Spectrum

TOGAF's Architecture Compliance Review provides a useful frame: conformance is a spectrum, not a binary. Six levels range from Irrelevant (no features in common) through Consistent, Compliant, Conformant, and Fully Conformant to Non-Conformant. A project can be partially conformant — some artifacts match the current schema, others need updating. The audit's job is to identify and prioritize gaps, not treat every gap as equally urgent.

### What a Conformance Audit Would Do

A conformance audit skill would:

- **Read the current RDD skill version** — extract expected artifact templates, required sections, naming conventions, and inter-artifact references from each SKILL.md
- **Scan the project's artifact corpus** — identify which artifacts exist, what sections they contain, and how they reference each other
- **Produce a conformance report** — gap analysis per artifact: missing artifacts, missing sections, template mismatches, broken inter-artifact references
- **Prioritize gaps** — structural gaps (missing artifacts that downstream phases depend on) versus format gaps (sections that could be updated but don't block anything)
- **Offer remediation** — generate missing artifacts or sections where possible (pragmatic action, Invariant 3), flag others for the user to address at the next relevant phase

This is distinct from re-running the full pipeline. The audit does not produce new research, new product discovery, or new decisions. It brings the *format* of existing artifacts into alignment with the current skill version, preserving the *content* produced by prior cycles.

The conformance audit serves three workflows:

1. **Skill evolution maintenance** — when RDD skills gain new artifact types or template changes, existing projects need a targeted path to close gaps without re-running cycles.
2. **RDD adoption** — when adding RDD to an existing project, the audit identifies what to create, what to adapt, and what is already conformant.
3. **Post-build drift** — when RDD produces artifacts through ARCHITECT and someone builds without using `/rdd-build` (or builds beyond what the scenarios covered), the code moves but the docs don't. The next time someone opens an RDD cycle on that project, the artifact corpus describes a system that no longer matches reality. This is perhaps the most common case: docs produced with RDD, code changed without RDD, docs stale on re-entry.

The third case may be the most common in practice and is particularly important because it affects the integrity of every downstream phase. If the system design describes modules that have been restructured, the domain model defines concepts that no longer map to code, or the product discovery reflects assumptions that the build invalidated, the next RDD cycle starts from a false foundation. The conformance audit would detect the gap between artifacts and implementation, flag the stale sections, and let the user decide whether to update the docs (pragmatic) or re-run the relevant phase (epistemic, if understanding needs rebuilding).

A fourth operation complements the audit: **graduation**. When RDD has served its purpose — a system is off the ground, the team has shifted to a different workflow, or the project has matured past the point where phased epistemic gates add value — the user may want to roll up what RDD produced into the project's native documentation and archive the RDD artifacts. Graduation would extract the durable knowledge (architectural decisions, domain vocabulary, product context, key rationale) into whatever documentation format the project uses natively, then archive the RDD-specific artifacts (research logs, reflections, scenarios, the domain model in its RDD-specific structure) as a historical record. The RDD docs served as scaffolding (Invariant 6's spirit, applied to the methodology itself); once the building stands, the scaffolding can come down. The project retains the *knowledge* without retaining the *methodology's artifact structure*.

This is distinct from abandoning RDD — the archived artifacts remain available if a future feature or research effort warrants a new cycle. Graduation says "we've learned what we needed; let's integrate that learning into how this project actually works, rather than maintaining a parallel documentation system."

All four operations — conformance audit, remediation, drift detection, and graduation — are pragmatic actions. The agent produces the report or migration plan, the user decides what to act on.

## 6. What This Does Not Address

This essay does not propose the specific structure or template for either document. That belongs in the DECIDE and ARCHITECT phases. It also does not propose changes to the skill files or orchestrator — those are BUILD concerns. The essay establishes that the gap exists, identifies the document types that fill it, and provides the heuristic framework for sizing them and all future RDD documents.

The decomposition of system-design.md is a separate concern that emerged from the sizing analysis. It should be evaluated on its own merits — the heuristics provide the criteria, but the decision about whether and how to split requires judgment about the document's actual access patterns in practice.

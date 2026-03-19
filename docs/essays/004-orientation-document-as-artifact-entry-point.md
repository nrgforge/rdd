# The Orientation Document as Artifact Entry Point
*2026-03-09*

## Abstract

RDD produces a structured artifact corpus — essays, product discovery documents, domain models, ADRs, system designs, scenarios — but lacks a single document that orients a new reader to the system as a whole. This essay investigates what form that document should take, drawing on architecture documentation frameworks (Arc42, C4, Simon Brown's Software Guidebook), documentation theory (Diataxis, Every Page is Page One), and one-pager methodology. The conclusion is that the orientation document is a *derived* artifact — a living distillation of the corpus that bridges product-centered and system-centered language, enforces document hierarchy, and answers the question "what is this system and where do I go next?" in the fewest words possible. The document should be regenerated as phases complete, making it a current-state briefing rather than a static overview.

## 1. The Gap

An RDD cycle produces six or more artifacts across its phases. Each artifact serves a specific audience and purpose:

- **Product discovery** speaks in user language to product stakeholders.
- **System design** speaks in technical language to engineers.
- **Domain model** defines the shared vocabulary and invariants.
- **Essays** narrate the research that preceded design.
- **ADRs** record individual decisions with rationale.
- **Scenarios** define expected behavior in refutable terms.

The system design already establishes a two-document readability principle: `product-discovery.md` and `system-design.md` are the primary readable documents; everything else is supporting material for provenance. But neither document answers the prior question: *what is this system, who is it for, why does it exist, and where do I go to learn more?*

A new reader — whether a human teammate, a team lead evaluating the artifacts, or an AI agent bootstrapping into a session — encounters the corpus cold. Without an entry point, orientation requires reading multiple documents and assembling the picture independently. This is exactly the opacity problem RDD exists to prevent, now applied to the artifacts themselves.

## 2. What the Document Is Not

**It is not a README.** READMEs have strong conventions — installation, usage, contribution guidelines — that serve a different need. In a `docs/` folder, a README might legitimately describe how to navigate the folder structure. The orientation document answers a higher question.

**It is not a summary.** Summaries compress their sources. The orientation document *derives* from its sources but does not attempt to contain them. It is a map, not a miniature of the territory.

**It is not reference.** The domain model is reference (vocabulary, invariants). The system design is reference (modules, dependencies, provenance). The orientation document is what Diataxis calls *explanation* — it "joins things together, helps answer the question why," and "can contain opinions and take perspectives." Explanation approaches its subject from different directions, connecting parts that reference treats in isolation.

**It is not static.** Most overview documents are written once and decay. The orientation document is regenerated or updated as phases complete, reflecting the current state of understanding. When the domain model gains new concepts, when the system design adds modules, when product discovery surfaces new stakeholders — the orientation document should reflect these changes.

## 3. Precedents and Principles

Six sources inform the design:

**Arc42's Introduction and Goals** contains exactly three elements: a requirements overview ("as short as possible"), the top 3-5 quality goals, and a stakeholder table. The forcing function is brevity — orientation, not depth.

**C4's System Context** captures what code alone cannot convey: who uses the system, what it interacts with, what it does at the highest level. Simon Brown's principle: "the code is the truth, but not the whole truth." Applied here: the artifacts are the truth, but not the whole truth. The orientation document captures what the artifacts alone cannot convey — their relationship to each other and to the reader's needs.

**Diataxis** identifies four documentation types (tutorial, how-to, reference, explanation). The orientation document maps to *explanation* — the type that answers "why," connects parts, and permits interpretation. Uniquely, explanation needs to "circle around its subject, and approach it from different directions."

**Every Page is Page One** establishes that documentation should work regardless of entry point. Seven principles: self-contained, narrowly focused, context-establishing, pattern-consistent, single-level, audience-specific, richly linked. The orientation document is *the* entry point — the page that establishes context for all other pages.

**One-pager methodology** provides the forcing function: "the purpose of a one pager isn't to keep the documentation to one page — it's to keep the team all on one page." Ruthless prioritization of what matters, not literal length.

**Minimal technical documentation** (Gulati) identifies the essential onboarding components: what the system does, constraints that shaped the design, architecture overview, and where to find deeper detail. The orientation document is the map that points to depth, not the depth itself.

## 4. Document Hierarchy

The orientation document enforces a clear artifact hierarchy:

```
[Orientation Document]          ← entry point: what is this, who is it for, where to go
    ├── product-discovery.md    ← primary readable: user-centered explanation
    ├── system-design.md        ← primary readable: technical explanation
    ├── domain-model.md         ← vocabulary and invariants (reference)
    ├── essays/                 ← research narratives (explanation)
    ├── decisions/              ← ADRs (decision records)
    └── scenarios.md            ← behavior specifications (reference)
```

The hierarchy has three tiers:

1. **Orientation** (the new document): answers "what is this system?" Routes readers to the appropriate primary document based on their need.
2. **Primary readable** (product-discovery, system-design): the two documents designed to be read end-to-end by their respective audiences. Each is self-contained for its audience.
3. **Supporting material** (domain model, essays, ADRs, scenarios): provides provenance, vocabulary, and specificity. Consulted as needed, not read linearly.

This hierarchy already existed implicitly in the two-document readability principle. The orientation document makes it explicit and adds the missing top layer.

## 5. What the Document Contains

Drawing from the precedents, the orientation document should contain exactly these elements, in this order:

1. **What this system is** — one paragraph stating what the system does, in language accessible to both product and technical readers. Not features. Not architecture. The essential purpose.

2. **Who it serves** — the stakeholder summary from product discovery, compressed to names and one-line descriptions. Not the full stakeholder map — a pointer to it.

3. **Key quality goals** — the top 3-5 quality attributes or invariants that shape every decision. Drawn from the domain model's invariants and the system design's architectural drivers. These are the constraints that make this system *this system* and not some other system.

4. **How the artifacts fit together** — the document hierarchy itself, with one-line descriptions of what each artifact contains and when to read it. The map of the territory.

5. **Current state** — what phases have been completed, what decisions are settled, what questions remain open. This is the "living" dimension — it reflects where the project actually is, not where it started or where it hopes to end.

Each section should be as short as possible. The entire document should be readable in under five minutes — matching Invariant 4's constraint on epistemic cost, though the orientation document is not a gate.

## 6. The "Living" Quality

The orientation document is *derived* from other artifacts, not authored independently. This has two implications:

First, it can be regenerated. When a phase completes and its artifact is updated, the orientation document can be refreshed to reflect the new state. The agent has access to all source artifacts and can produce an updated orientation at any point. This is a pragmatic action (Invariant 3) — the agent generates it, the user reviews it.

Second, it is always current. Unlike a README written at project inception, the orientation document reflects the system as it is understood *now*. Open questions appear as open questions, not as settled design. Phases not yet completed are acknowledged as gaps, not elided. This honesty about current state is itself orienting — it tells the reader not just what the system is, but how much confidence to place in each part of the description.

The "living" quality is not aspirational — it is structural. The document derives from sources that are themselves updated through the pipeline. When those sources change, the orientation document should change. Whether this happens automatically (regenerated by a skill) or manually (updated by the user) is an implementation question, but the design assumes currency.

## 7. Naming

The document needs a name that signals three things: it is the entry point, it is concise, and it is current.

"README" collides with established conventions (install/run/contribute). "OVERVIEW" is generic and implies static. "SUMMARY" implies compression of sources rather than derivation from them.

Several candidates emerge from the document's function:

- **BRIEFING** — signals currency ("here's the current situation") and conciseness ("a briefing, not a report"). Military/intelligence connotation: the document you read before engaging with the situation. Briefings are by nature updated for each engagement.
- **PRIMER** — signals teaching orientation ("start here to understand"). But implies more depth than the document should carry.
- **BRIEF** — concise, but ambiguous between "a brief" (noun, document) and "brief" (adjective, short).
- **DIGEST** — signals distillation of a larger corpus. But connotes periodic publication rather than living document.

The naming question remains open. The right name may emerge from use rather than analysis — once the document exists and readers encounter it, the word that fits will become apparent. For now, the document's function is clear regardless of its filename: it is the entry point to the artifact corpus, derived from the corpus, and kept current as the corpus evolves.

## 8. Relationship to Existing Concepts

The orientation document connects to several domain model concepts:

- **Artifact Legibility**: The orientation document is maximally legible — it must be comprehensible to *all* audiences, not just product or technical stakeholders. It bridges the legibility gap between product-discovery (high legibility) and system-design (lower legibility for non-technical readers).

- **Narrative Context Rollup**: The synthesis essay serves as a narrative context rollup — "what was this project actually about?" The orientation document serves a complementary function — "what *is* this system right now?" The synthesis essay looks backward (what was discovered); the orientation document looks at the present state (what exists).

- **Context Window Ceiling**: For AI agents bootstrapping into a session, the orientation document addresses the context window ceiling directly. Rather than loading the full artifact corpus to understand the system, the agent reads the orientation document first and loads additional artifacts as needed. It is the minimal viable context for system comprehension.

- **Authority**: The orientation document is a test of understanding. If the user cannot review and validate a generated orientation document — if it contains claims they cannot speak to — that is a signal that gates were passed without sufficient engagement. In this sense, the orientation document is an indirect measure of Invariant 0.

## 9. Invariant Tensions

No tensions with existing invariants. The orientation document:

- Is generated by the agent and reviewed by the user (Invariant 3: pragmatic action, automatable)
- Does not introduce a new gate (no tension with Invariant 4's cost constraint)
- Serves Invariant 0 by making the system comprehensible to newcomers, which is a precondition for the user being able to "speak with authority"
- Reinforces the two-document readability principle rather than competing with it

One design tension worth noting: the system design already states that "all other artifacts are supporting material for provenance, not primary reading." The orientation document is neither a primary readable document nor supporting material — it is an *index* to the readable documents. This is a new tier in the hierarchy, which means the design principle needs amendment to acknowledge three tiers rather than two.

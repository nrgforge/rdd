# The Product Gap: Why Research-Driven Development Needs a Product Discovery Phase
*2026-03-06*

## Abstract

This essay investigates a structural blind spot in the Research-Driven Development (RDD) pipeline: the absence of explicit product thinking between research and domain modeling. Through a survey of product discovery frameworks (Jobs-to-Be-Done, Opportunity Solution Trees, User Story Mapping, Impact Mapping) and critical design traditions (Norman, Haraway, Dunne & Raby, Value Sensitive Design), the research finds that RDD's technical artifact pipeline produces architecturally sound systems that may carry significant product debt — the accumulated gap between what a system does and what users need. The essay proposes a new phase, `/rdd-product`, positioned between RESEARCH and MODEL, that surfaces user mental models, stakeholder maps, value tensions, and assumption inversions. The phase operates in two modes: forward (greenfield discovery) and backward (product conformance audit against existing systems). Empirical evidence — Boehm's cost-of-change curve, CB Insights failure data, and product discovery ROI studies — supports the concept of a "product maintenance cliff" where accumulated product debt makes iteration harder than starting over, paralleling the technical maintenance cliff from essay 001. A central thesis distinguishes RDD from agile: where agile optimizes for business delivery and discovers user value incidentally, RDD optimizes for understanding through research and discovers business value as a consequence of user alignment. The inversion principle — systematically questioning product assumptions before encoding them in architecture — is the mechanism that makes this structural commitment operational.

## 1. The Problem: Technically Sound, Product-Misaligned

RDD's pipeline moves from research through domain modeling, architectural decisions, system design, and implementation. Each phase produces artifacts that are technically rigorous: the essay synthesizes research, the domain model extracts precise vocabulary, ADRs capture decisions with provenance, the system design allocates responsibilities to modules. Every artifact is reviewed through an epistemic gate that builds the user's understanding of what was built and why.

But none of these phases asks: *who is this for, and does it serve them?*

The gap manifests concretely. In a recent RDD cycle for a healthcare enrollment API integration, the pipeline produced a well-architected system with clean abstraction layers, carrier-agnostic interfaces, and extensible enrollment workflows. The domain model captured enrollment entities, benefit plans, and carrier protocols. The ADRs documented technology choices and integration patterns. The system design allocated responsibilities across modules with clear boundaries.

What the pipeline did not produce: any explicit consideration of how benefits administrators — the people who actually use the system — think about enrollment. The abstraction layer served the system's modularity needs. Whether it served the admin's mental model of "open enrollment crunch" — processing hundreds of enrollments under time pressure, handling exceptions one-at-a-time, needing immediate feedback on carrier acceptance — was never formally examined.

This is not a failure of execution. The pipeline performed exactly as designed. It is a structural gap: the pipeline has no phase where product thinking is the primary activity.

## 2. Why Agile Doesn't Solve This

The obvious objection: agile methodologies already include product thinking. User stories, product backlogs, sprint reviews with stakeholders — these exist precisely to keep development aligned with user needs.

The problem is where product thinking sits in agile's priority hierarchy. Agile optimizes for business delivery. Its primary measure of progress is working software. Its cadence is built around shipping increments. User research, when it happens, fits into this delivery cadence — discovery sprints, design spikes, user testing between iterations. The business defines what to build; the team optimizes how to build it.

This creates a structural bias. When business goals and user needs align, agile works well. When they conflict, the delivery optimization wins by default. The chatbot example is illustrative: a business wants to reduce customer service costs, so the product team builds a chatbot. Agile's machinery — sprint planning, velocity tracking, release cycles — optimizes the chatbot's delivery. Whether customers actually want to interact with a chatbot, whether research would reveal a preference for human support, whether the cost reduction comes at the expense of customer satisfaction — these questions have no structural home in the delivery pipeline. They might surface in a retrospective. They might not.

This is not an indictment of agile teams, many of whom do excellent user research. It is an observation about structural incentives: agile's pipeline optimizes for delivery velocity, and anything that slows delivery needs to justify itself against that metric.

## 3. The RDD Inversion

RDD inverts this priority. The pipeline begins not with business requirements but with research — an open-ended investigation of the problem space that produces understanding before it produces software. The essay artifact is a forcing function: if the team cannot explain the domain clearly in prose, they do not understand it well enough to build.

This structural inversion has consequences. Research is accountable to understanding, not to a delivery timeline. If the research reveals that the business's initial framing was wrong — that the problem is different from what was assumed, that the users need something other than what was specified — the pipeline surfaces this as a finding, not a blocker. The essay captures what was learned, including inconvenient truths.

The product discovery phase extends this inversion explicitly to the product dimension. Where agile asks "what does the business want?" and optimizes delivery, RDD asks "what does the research reveal?" and optimizes understanding. Adding product discovery means RDD now also asks "what do users need?" — and when user needs conflict with business goals, the user wins, because that is what the research is focused on.

This is a structural commitment, not a aspiration. The pipeline's phases enforce it:

1. **RESEARCH** reveals the domain — what is true about the problem space
2. **PRODUCT DISCOVERY** reveals user needs — what users actually require, how they think, where assumptions break
3. **MODEL** extracts vocabulary — from both the essay and the product artifact
4. **DECIDE** captures decisions — with product context alongside technical context
5. **ARCHITECT** designs the system — with provenance tracing to user needs, not just technical rationale
6. **BUILD** implements — with scenarios enriched by product-discovered edge cases

Business value emerges from this alignment — or it does not. If research and product discovery show that what the business wants is not what users need, the pipeline surfaces the tension explicitly. The ADR that says "the business chose a chatbot interface" must include the context: "research indicates users prefer human support; the business chose automation for cost reasons." The decision is made with eyes open, with the value tension visible, not buried beneath delivery optimization.

## 4. Frameworks That Inform the Phase

### 4.1 Jobs-to-Be-Done

Tony Ulwick and Clayton Christensen's JTBD framework focuses on the "job" a user is hiring a product to do. The framework decouples product thinking from feature lists: rather than asking what features to build, it asks what progress the user is trying to make. JTBD's "jobs" map naturally to DDD's "actions" — a job is what the user needs done; an action is how the system does it. The gap between the two is where product debt accumulates.

### 4.2 Impact Mapping

Gojko Adzic's impact mapping provides a four-level structure: Goal (why) → Actors (who) → Impacts (how behavior changes) → Deliverables (what to build). The structure is explicitly lightweight — "just enough to guide work for the next increment." Of the frameworks surveyed, impact mapping is the most compatible with RDD's phased pipeline: it traces deliverables to outcomes through actors, provides a walkable narrative, and naturally feeds into ADR context sections.

### 4.3 User Story Mapping

Jeff Patton's story mapping creates a two-dimensional visualization: a backbone of user activities arranged in narrative flow, with a walking skeleton of minimal end-to-end functionality beneath. The backbone provides the product narrative — a stakeholder can literally walk the map and tell a story about users. This narrative quality addresses the artifact legibility gap: technical artifacts (invariant tables, ADR templates) are not comprehensible to product stakeholders, but a story map is.

### 4.4 Opportunity Solution Trees

Teresa Torres's OST (from *Continuous Discovery Habits*) maps desired outcomes to opportunities (customer needs), solutions, and assumption tests. The framework is designed for continuous cadences — weekly customer touchpoints — which makes it less suited to a phased pipeline. However, its emphasis on story-based interviewing (collecting stories about real past behavior rather than hypothetical preferences) and assumption testing is directly relevant.

## 5. The Critical Design Lens: Questioning the Product Itself

Product discovery frameworks (JTBD, OST, story mapping) optimize for user goals — a significant improvement over optimizing for business goals. But they share an assumption: that the product should exist and the question is how to optimize it. A deeper tradition in HCI and critical design questions this assumption.

### 5.1 Norman: Mental Models Before System Models

Don Norman's foundational work on affordances and mental models establishes a principle: when a system's model diverges from the user's mental model, the fault lies with the design, not the user. For product discovery, this means mapping user mental models — how users think the domain works — *before* the domain model maps how the system thinks the domain works. Divergence between these is a design signal to be surfaced, not a bug to resolve by overriding the user's model.

### 5.2 Haraway: Staying with the Trouble

Donna Haraway's concept of sym-poiesis (making-with) challenges the assumption that design is something done *to* or *for* users. Systems should be made *with* their users. More radically, Haraway's principle of "staying with the trouble" suggests that when user needs and business goals conflict, the productive response is not to resolve the tension prematurely but to hold it — to surface it, name it, and pass it forward as an open question. The product discovery phase's most valuable output may be tensions it does not resolve.

### 5.3 Dunne & Raby: Problem Finding

Anthony Dunne and Fiona Raby distinguish between affirmative design (reinforcing the status quo) and critical design (questioning assumptions). "All good design is critical" — every designer should question what is given. The chatbot example is affirmative design: the business has a cost-reduction goal, and the product team optimizes for that goal without questioning whether the goal serves users. Critical design would ask: what if there were no chatbot? What would users do? Is the problem the business identified actually the problem users experience?

### 5.4 Value Sensitive Design

Batya Friedman's Value Sensitive Design provides the most structured methodology for the question "should this be built?" VSD identifies direct stakeholders (who interacts with the system) and indirect stakeholders (who is affected without interacting). It evaluates assumptions across five categories: desirability (do users want it?), viability (good for business?), feasibility (can it be built?), usability (can users use it?), and the category most teams skip — ethical (is there potential harm?). The tripartite methodology — conceptual investigation of values, empirical investigation of user needs, technical investigation of system support — provides a rigorous frame for product discovery.

### 5.5 The Inversion Principle

A pattern emerges across these traditions. Norman inverts blame (the fault is the design, not the user). Haraway inverts optimization (sit with discomfort, do not optimize past it). Dunne and Raby invert problem-solving (find problems, do not solve them). VSD inverts feasibility (not whether the team *can* build this, but whether it *should*). Torres inverts preference elicitation (observe what users do, not what they say they want).

The product discovery phase should include an explicit **assumption inversion step** — a structured moment where the team asks: "What are the assumptions about who this serves and why? What happens if they are wrong?" This is the mechanism that distinguishes product discovery from product requirements gathering. Requirements gathering asks "what should the product do?" Assumption inversion asks "should the product exist in this form?"

The inversion principle operates at two levels. Within `/rdd-product`, it is a procedural step that produces the Assumption Inversions section of the artifact. But it also operates as a cross-cutting principle across the pipeline — a habit of mind that infects every phase where assumptions can silently harden into structure:

- **RESEARCH:** "Am I researching the right problem, or the problem I was told to research?"
- **PRODUCT DISCOVERY:** "What assumptions about users am I encoding? What if they are wrong?" (the primary procedural home)
- **DECIDE:** "Does this ADR rest on an unexamined product assumption?"
- **ARCHITECT:** "Does this module boundary serve the user's mental model, or just the developer's? Does this responsibility allocation reflect how users think about the domain, or how the system thinks about itself?"

The ARCHITECT application is particularly important because architecture is where product assumptions calcify most permanently. A module boundary drawn around "carrier abstraction" encodes the assumption that carriers are interchangeable from the user's perspective. An integration contract designed for batch processing encodes the assumption that users work in batches. These architectural choices are expensive to reverse — they are Boehm's architecture-breakers on the product dimension. The inversion principle at ARCHITECT asks: before committing to this boundary, this allocation, this contract — what product assumption does it encode, and has that assumption been validated?

This dual placement mirrors how "domain vocabulary consistency" is both a cross-cutting principle in the orchestrator and a procedural step within `/rdd-model`.

## 6. The Product Discovery Artifact

The product discovery phase produces a single document with several sections:

### 6.1 Stakeholder Map

Not just personas (which represent ideal users) but a map of everyone affected by the system, including indirect stakeholders. For the healthcare enrollment case:
- **Direct:** Benefits administrators, HR managers, brokers
- **Indirect:** Employees (whose coverage depends on enrollment accuracy), carriers (who process enrollments), compliance teams (who audit enrollment records)

### 6.2 Jobs and Mental Models

For each direct stakeholder, the jobs they need the system to do, described in their language — not the system's language. Adjacent to each job, the user's mental model of how the domain works. For the benefits admin: "During open enrollment, I process enrollments one by one, handling exceptions as they come up. I need to see immediately whether a carrier accepted or rejected an enrollment so I can fix issues before the enrollment window closes."

### 6.3 Value Tensions

Where stakeholder needs conflict with each other or with business goals, stated explicitly as open questions:
- "The business wants batch processing for efficiency; admins want individual enrollment feedback for error recovery. These are in tension."
- "The abstraction layer serves future carrier integrations that may or may not materialize; admins need carrier-specific workflows now."

### 6.4 Assumption Inversions

The output of the critical design step. For each major product assumption, the inverted form and its implications:
- *Assumption:* The system needs a carrier-agnostic abstraction layer. *Inversion:* What if each carrier integration is unique enough that abstraction hides important differences? *Implication:* The abstraction may serve developer convenience more than user needs.

### 6.5 Product Vocabulary Table

Terms in user language that should be traceable into the domain model:

| User Term | Stakeholder | Context | Notes |
|-----------|-------------|---------|-------|
| "Open enrollment crunch" | Benefits Admin | The high-pressure period when most enrollments happen | Time-bounded, high volume, error-sensitive |
| "Carrier rejection" | Benefits Admin | When a carrier doesn't accept an enrollment | Needs immediate visibility and resolution path |

## 7. Feed-Forward: How Product Discovery Changes Downstream Phases

The product discovery artifact is not a standalone document. It changes what MODEL, DECIDE, and ARCHITECT produce.

### 7.1 Into MODEL

**Product vocabulary provenance.** The domain model's glossary gains a column tracing each system term to its product-vocabulary origin:

| System Term | Definition | Product Origin |
|-------------|-----------|----------------|
| EnrollmentWindow | Time-bounded period when enrollments are accepted | "Open enrollment crunch" (Benefits Admin) |

**User mental model validation.** Where the user's mental model diverges from the system model, the domain model notes the divergence explicitly — making it a conscious design decision rather than an invisible accident.

**Open questions from value tensions.** Unresolved tensions from product discovery appear in the domain model's Open Questions section, visible to all downstream phases.

### 7.2 Into DECIDE

**Stakeholder needs in ADR context.** Every ADR's "Context" section references specific personas, jobs, or value tensions from the product artifact alongside technical research. "Benefits admins process enrollments individually during open enrollment (Product Discovery, Benefits Admin persona)" sits next to "the API supports batch enrollment (Essay, Section 3.2)."

**Assumption inversions as scenarios.** Inverted assumptions become behavior scenarios. If product discovery surfaces "admins might need single-enrollment workflows despite the batch API," that becomes a scenario in `/rdd-decide`.

### 7.3 Into ARCHITECT

**Extended provenance chains.** The responsibility matrix traces module ownership not just to domain concepts and ADRs, but all the way back to user needs: Module → Domain Concept → ADR → Product Discovery (persona/job/value). A product stakeholder can ask "why does this module exist?" and follow the chain to a user need.

## 8. Feed-Backward: Product Discovery on Existing Systems

When `/rdd-product` runs against a pre-existing system, it operates in backward mode — functioning as a product conformance audit.

### 8.1 Surfacing Implicit Product Assumptions

Every architectural choice embeds product assumptions, whether the team was conscious of them or not. A batch API assumes batch workflows. A carrier abstraction layer assumes carriers are interchangeable. An async response model assumes users do not need immediate feedback. Backward mode reads the existing architecture and extracts these implicit assumptions.

### 8.2 Product Debt Table

Analogous to the conformance debt table in `/rdd-decide`, the product debt table maps assumptions to reality:

| Assumption | Baked Into | Actual User Need | Gap Type | Resolution |
|------------|-----------|-----------------|----------|------------|
| Admins process in batches | Batch API endpoint | Admins handle exceptions individually | Mental model mismatch | Single-enrollment workflow needed |
| All carriers use similar flows | Carrier abstraction | Carrier X has unique pre-approval | Over-abstraction | Carrier-specific extension point |

### 8.3 Backward Propagation

Product debt items trigger backward propagation through the existing RDD amendment infrastructure:
- Items affecting the domain model → invariant amendments or new concepts
- Items affecting ADRs → new ADRs superseding old ones, with product discovery context
- Items affecting architecture → design amendments with product provenance

This is not a new mechanism. RDD already propagates invariant changes backward through all prior artifacts. Product discovery adds a new trigger: "a product assumption was invalidated by user evidence."

### 8.4 Product Conformance Complements Technical Conformance

`/rdd-decide` already checks code against ADRs (technical conformance). Product discovery checks ADRs against user needs (product conformance). Together, they close the loop:
- Technical conformance: "Does the code match the decisions?"
- Product conformance: "Do the decisions match what users need?"

Without product conformance, technical conformance ensures the system is consistently wrong.

## 9. The Product Maintenance Cliff

Essay 001 introduced the technical maintenance cliff — the point where AI-assisted development velocity inverts due to accumulated opacity. Product assumptions exhibit the same compounding dynamic, supported by empirical evidence.

Barry Boehm's foundational research (1981) established that the cost of fixing defects rises exponentially with how late they are discovered — 10-100x more expensive after release than during requirements. This curve applies directly to product assumptions. A product assumption invalidated during discovery costs almost nothing; the team pivots before building. The same assumption invalidated after deployment is what Boehm calls an "Architecture-Breaker" on the product dimension: the system was built around a product worldview that turned out to be wrong, and the architecture encodes that worldview in its abstractions, APIs, and data models.

The evidence is concrete:
- Requirements defects cost 10-100x more to fix after release than during discovery
- 42% of startup failures cite "no market need" as the primary cause (CB Insights)
- 60% of product pivots result from market shifts that were visible 12-18 months earlier
- Organizations treating discovery as overhead pay 2-3x more to reach the same outcomes
- Teams spending 15-25% of capacity on discovery average 12-15 months concept-to-launch vs. 18-24 months for teams spending less than 10%

The product maintenance cliff has a distinct character from the technical one. Technical debt is at least visible in the codebase — code smells, test gaps, coupling metrics. Product debt hides in the gap between what the system does and what users need. Teams may not know it exists until a competitor reveals it. Meanwhile, users build workarounds for product misalignment, creating secondary dependencies that make correction harder. The system's product worldview becomes self-reinforcing even when wrong.

The product discovery phase prevents this cliff the same way epistemic gates prevent the technical one: by interrupting compounding early, before assumptions harden into architecture.

## 10. Pipeline Placement and Integration

The product discovery phase sits between RESEARCH and MODEL:

```
RESEARCH → PRODUCT DISCOVERY → MODEL → DECIDE → ARCHITECT → BUILD
```

This placement is deliberate:
- **After RESEARCH** because product discovery needs the essay's domain context. Without understanding the problem space, product thinking operates in a vacuum.
- **Before MODEL** because the domain model should extract vocabulary from both the essay and the product artifact. Product vocabulary informs system vocabulary, not the other way around.

The phase produces its artifact and passes through an epistemic gate — the gate where the user's own knowledge matters most, because they typically know more about their users and stakeholders than the AI does.

## 11. Implications and Constraints

### What This Changes About RDD

Adding a product discovery phase does not change RDD's core mechanism (research-driven understanding through epistemic gates). It extends the pipeline's coverage to include a dimension it previously omitted. The epistemic gates, feed-forward mechanisms, and backward propagation infrastructure all apply to the new phase without modification.

### What This Does Not Solve

Product discovery within RDD is not a substitute for continuous user research, usability testing, or participatory design. It is a structured phase that ensures product thinking is not accidentally skipped — the same way the essay phase ensures research is not accidentally skipped. Organizations that do extensive user research will find this phase lightweight. Organizations that do none will find it revelatory.

### The Legibility Dividend

The product discovery artifact serves a function beyond informing downstream phases: it makes the entire RDD output comprehensible to product stakeholders. Technical artifacts — invariant tables, ADR templates, scenario lists — are opaque to non-technical audiences. But the product discovery artifact is written in user language, organized around stakeholder needs, and walkable as a narrative. It becomes the Rosetta Stone between the two vocabularies — the entry point for anyone who needs to understand what the system does and why, without reading the domain model.

### Tension with Existing Invariants

The existing domain model (from the epistemic gates RDD cycle) includes Invariant 0: "The user should be able to speak with authority about what was built." Product discovery extends this: the user should also be able to speak with authority about *who it was built for and why*. This is a strengthening, not a contradiction, and should be handled as an amendment to Invariant 0 rather than a new invariant.

The inversion principle then becomes the *mechanism* that serves this amended invariant — just as epistemic gates are the mechanism serving invariants 1-7. The inversion principle itself should not be an invariant; the existing invariants form a coherent set about epistemic understanding, and adding a product-focused invariant would dilute that coherence. Instead, the inversion principle is a methodological principle — a way of working — housed as a cross-cutting principle in the orchestrator and as a structured step within `/rdd-product`.

## References

- Adzic, G. (2012). *Impact Mapping: Making a Big Impact with Software Products and Projects.*
- Chen, A. (2012). "Product Design Debt versus Technical Debt." andrewchen.com.
- Christensen, C. M. et al. (2016). *Competing Against Luck: The Story of Innovation and Customer Choice.* Harper Business.
- Dunne, A. & Raby, F. (2001). *Design Noir: The Secret Life of Electronic Objects.* Birkhäuser.
- Dunne, A. & Raby, F. (2013). *Speculative Everything: Design, Fiction, and Social Dreaming.* MIT Press.
- Friedman, B. & Hendry, D. G. (2019). *Value Sensitive Design: Shaping Technology with Moral Imagination.* MIT Press.
- Haraway, D. (2016). *Staying with the Trouble: Making Kin in the Chthulucene.* Duke University Press.
- Norman, D. (1988/2013). *The Design of Everyday Things.* Basic Books.
- Patton, J. (2014). *User Story Mapping: Discover the Whole Story, Build the Right Product.* O'Reilly Media.
- Torres, T. (2021). *Continuous Discovery Habits: Discover Products that Create Customer Value and Business Value.* Product Talk LLC.
- Ulwick, T. (2016). *Jobs to Be Done: Theory to Practice.* Idea Bite Press.
- Boehm, B. W. (1981). *Software Engineering Economics.* Prentice-Hall.
- CB Insights. (2021). "The Top 12 Reasons Startups Fail." cbinsights.com.

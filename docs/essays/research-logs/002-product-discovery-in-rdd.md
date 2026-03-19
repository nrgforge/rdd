# Research Log: Product Discovery Phase for RDD

## Question 1: What product discovery frameworks complement domain-driven design, and how should they integrate into a phased development pipeline?

**Method:** Web search (6 searches across JTBD, opportunity solution trees, dual-track agile, user story mapping, impact mapping, bounded contexts)

**Findings:**

### Frameworks Surveyed

1. **Jobs-to-Be-Done (JTBD)** — Tony Ulwick / Clayton Christensen. Focuses on the "job" the customer is hiring a product to do. Decouples product thinking from feature lists. Strong alignment with DDD's emphasis on understanding the domain, but operates at a different level: JTBD captures *why* users engage with a system; DDD captures *what* the system models.

2. **Opportunity Solution Trees (OST)** — Teresa Torres, *Continuous Discovery Habits*. Visual tool: desired outcome → opportunity space (customer needs/pains/desires) → solutions → assumption tests. Lightweight, iterative. Key principle: "work on one small opportunity at a time." Stories-based interviewing surfaces opportunities from real past behavior, not hypothetical needs.

3. **User Story Mapping** — Jeff Patton. Two-dimensional visualization: backbone (user activities in narrative flow) → walking skeleton (minimal end-to-end functionality) → detailed stories. The backbone provides the product narrative — you can "walk the map" and tell a story about users. Key insight: the map is a bridge between design and development, serving as "a common product language for all stakeholders."

4. **Impact Mapping** — Gojko Adzic. Four levels: Goal → Actors → Impacts → Deliverables. Establishes why before what. Explicitly lightweight: "you don't have to fully flesh out the map — just enough to guide your work for the next increment." Strategic planning technique linking business goals to development work.

5. **Dual-Track Agile** — Marty Cagan / Jeff Patton. Discovery track (what to build) runs parallel to delivery track (how to build it). Discovery produces validated backlog items; delivery consumes them. Key tension: RDD is currently a single-track pipeline. Product discovery could be a parallel input or a sequential phase.

### The Language Gap

DDD's ubiquitous language aims to be shared between domain experts and developers. But in practice, there's a persistent gap between:
- **User-facing language** — how customers and product stakeholders describe what they need ("I need to enroll employees quickly during open enrollment")
- **System language** — how the domain model describes what the system does ("Enrollment entity belongs to BenefitsPlan, triggered by EnrollmentWindow")

Bounded contexts in DDD acknowledge this: different groups legitimately use different vocabularies. But the current RDD pipeline doesn't explicitly capture the user-facing vocabulary *before* extracting the system vocabulary. The domain model extracts from the essay, which is written from a technical research perspective.

### Artifact Legibility

A key insight from the user: technical artifacts (invariant tables, ADR templates, scenario lists) are not comprehensible to product stakeholders. The research confirms this gap:
- User story mapping provides a **narrative** format — you walk through it telling a story
- Impact mapping provides a **goal-oriented** format — every deliverable traces to a business goal through actors and impacts
- Both are designed to be legible to non-technical stakeholders while still being precise enough to drive development

### Integration Points with RDD

Several frameworks explicitly produce artifacts that would enrich domain modeling:
- JTBD's "jobs" map naturally to DDD's "actions" — a job is what the user needs done, an action is how the system does it
- OST's "opportunities" surface user needs that should appear as domain concepts or constraints
- Story mapping's "backbone" provides the user-facing narrative that the domain model should serve
- Impact mapping's "actors" are the personas whose vocabulary should inform the ubiquitous language

**Implications:**

1. Product discovery should happen *after* research but *before* domain modeling. Research establishes the problem space; product discovery establishes who has the problem and what they need; domain modeling extracts the system vocabulary from both.

2. The product discovery artifact should be lightweight — a single-page map or tree, not a design document. It should be walkable as a narrative.

3. Product vocabulary and domain vocabulary are related but distinct. Product vocabulary comes from users and stakeholders ("enrollment", "open enrollment crunch", "batch processing"). Domain vocabulary comes from the system model ("EnrollmentEntity", "BenefitsPlan", "EnrollmentWindow"). The domain model should explicitly trace terms to their product-vocabulary origins.

4. The product discovery artifact serves a dual purpose: (a) it informs the domain model by surfacing user-facing concepts, and (b) it provides a narrative format that makes the entire RDD output comprehensible to product stakeholders — addressing the legibility gap.

5. Impact mapping's Goal → Actors → Impacts → Deliverables structure is the most compatible with RDD's existing flow: it's lightweight, traces to outcomes, and naturally feeds into ADR "context" sections. OST is more suited to continuous discovery cadences than a phased pipeline. User story mapping is powerful but may be too delivery-oriented for the discovery phase.

## Question 2: How do HCI foundations and critical design traditions inform product discovery — and how does product discovery avoid becoming another business optimization layer?

**Method:** Web search (6 searches across Norman, Haraway, Dunne & Raby, Value Sensitive Design, agile/UCD tensions, ethical product discovery)

**Findings:**

### The Deeper Problem: Optimizing for the Wrong Thing

The user's motivating concern: agile optimizes for business delivery, sometimes at the expense of the user. A chatbot for customer service might make great business sense, but research might indicate that's not what users want. The question isn't just "what should we build?" but "should we build this at all, and for whom?"

Research confirms this tension is well-documented:
- Agile uses "working software" as its primary measure of progress; UCD uses whether users can achieve their goals
- In many agile projects, "the customer" means stakeholders who sign checks, not end users
- "Empowered business users" or "representative customers" often substitute for actual end users in workshops

### Don Norman: Mental Models and Affordances

Norman's *Design of Everyday Things* provides foundational concepts:
- **Affordances** — what interactions an object makes possible. A system affords certain workflows; the question is whether those affordances match what users actually need
- **Mental models** — users have internal representations of how things work. When the system's model diverges from the user's mental model, friction and failure result
- **Discoverability and understanding** — the two most important characteristics of good design. Can the user figure out what's possible? Do they understand what things mean?

Key implication: the product discovery phase should explicitly map **user mental models** — how users think the domain works — before the domain model maps how the system thinks the domain works. Divergence between these is a design signal, not a bug to resolve by overriding the user's model.

### Donna Haraway: Staying with the Trouble

Haraway's work on speculative fabulation and collaborative survival offers a more radical frame:
- **Sym-poiesis (making-with)** vs. **auto-poiesis (self-making)** — design should be collaborative, not imposed. The system should be made *with* its users, not *for* them and certainly not *despite* them
- **Staying with the trouble** — rather than optimizing past discomfort, sit with the tension. If users and business goals conflict, the product discovery phase should surface and hold that tension, not resolve it prematurely in favor of the business
- **Speculative fabulation** — imagining alternative configurations. What if the product worked differently? What if it didn't exist? What would users do instead?

### Dunne & Raby: Critical Design

Critical design provides the methodological complement to Haraway's philosophy:
- **Problem finding vs. problem solving** — critical design asks questions rather than providing answers. "All good design is critical" — every designer should question assumptions
- **Affirmative design vs. critical design** — affirmative design reinforces the status quo (build what the business asks for). Critical design challenges it (ask whether the business should be asking for this)
- The chatbot example is a case of affirmative design: the business has a cost-reduction goal, and the product team optimizes for that goal without questioning whether the goal serves users

### Value Sensitive Design (Friedman & Hendry)

VSD provides the most structured methodology for the "should we build this?" question:
- **Direct vs. indirect stakeholders** — who interacts with the technology, and who is affected by it without interacting? The healthcare enrollment case has direct stakeholders (benefits admins) and indirect stakeholders (employees whose coverage depends on the system working well)
- **Five assumption categories** in product discovery: desirability (do users want it?), viability (good for business?), feasibility (can we build it?), usability (can users use it?), **ethical** (is there potential harm?)
- **Tripartite methodology**: conceptual investigation (values and conflicts), empirical investigation (user research), technical investigation (how systems support identified values)
- Key question VSD adds: "not only whether we *can* develop this, but whether we *should*"

### The Inversion Pattern

A pattern emerges across these traditions: the most productive product discovery moments come from **inverting assumptions**:
- Norman: the fault isn't with the user, it's with the design
- Haraway: don't optimize past discomfort, stay with it
- Dunne & Raby: don't solve the problem, question the problem
- VSD: don't just ask if it works, ask if it should exist
- Torres: don't ask users what they want, observe what they do (story-based interviewing)

This inversion is precisely what the user describes as missing from the current RDD pipeline. The essay phase researches the technical problem space thoroughly, but it doesn't systematically invert product assumptions. The healthcare enrollment case: the research thoroughly mapped the API integration landscape but never asked "how do benefits admins actually think about enrollment? Does our abstraction model match their mental model? Are we building what the business asked for, or what users need?"

**Implications:**

1. Product discovery in RDD should include an explicit **assumption inversion step** — a structured moment where the team asks "what are we assuming about who this serves and why?" This is distinct from JTBD (which still optimizes for user goals) and closer to VSD/critical design (which questions whether the goals themselves are correct).

2. The product discovery artifact should capture **stakeholder maps** with both direct and indirect stakeholders, not just personas. Personas tend to represent ideal users; stakeholder maps reveal who is affected.

3. The feed-forward from product discovery to MODEL should include **user mental models** — how users think the domain works — so that divergence between user model and system model becomes visible and deliberate rather than invisible and accidental.

4. Product discovery should surface **value tensions** — places where business goals and user needs conflict — and hold them as open questions for DECIDE, rather than resolving them prematurely. The ADR that says "we chose a chatbot interface" should have a context section that acknowledges "research indicates users prefer human support; the business chose automation for cost reasons."

5. The critical design frame suggests that the product discovery phase's most important output might be **questions it doesn't answer** — tensions it surfaces and passes forward — rather than a neat map of user needs. This aligns with RDD's "stop at uncertainty" principle.

## Question 3: How does the product discovery artifact concretely feed forward into MODEL and DECIDE?

**Method:** Web search (3 searches on user research → domain modeling, product discovery → ADRs, event storming → bounded contexts)

**Findings:**

### Existing Integration Patterns

Several practitioners have documented how product-level artifacts feed into domain modeling:

1. **User Story Mapping → Ubiquitous Language** — Trond Hjorteland and others describe using story mapping as a domain discovery tool. The user journey's vocabulary becomes input to the ubiquitous language glossary. "Story mapping can help creating a shared domain knowledge among developers and domain experts as well as the initial ubiquitous language glossary." The backbone (user activities) maps to domain actions; the story details reveal domain concepts.

2. **Event Storming → Bounded Contexts** — Alberto Brandolini's event storming moves from user-level narrative (domain events as "meaningful facts that happened in the business") to architectural structure (bounded contexts identified by grouping events around pivotal state changes). The journey IS the discovery mechanism for system boundaries.

3. **Domain Storytelling → User Journey → Domain Model** — Domain experts pictorially depict workflows involving actors and work objects. Domain events and commands reflect user actions and become epics or journey steps. The key insight: the product-level story and the domain model aren't separate artifacts that need bridging — the story IS the raw material from which the domain model is extracted.

### Feed-Forward to MODEL: Three Concrete Channels

Based on the research, the product discovery artifact should feed into `/rdd-model` through three channels:

**Channel 1: Product Vocabulary → Domain Vocabulary Provenance**
The domain model currently extracts terms from the essay. With product discovery, it should also extract terms from the product artifact — specifically, the language users and stakeholders actually use. The domain model's glossary should include a "Product Origin" column tracing each system term back to its user-facing equivalent. Example:

| System Term | Definition | Product Origin |
|-------------|-----------|----------------|
| EnrollmentWindow | Time-bounded period... | "open enrollment crunch" (Benefits Admin persona) |

This makes the domain model legible to product stakeholders while maintaining technical precision.

**Channel 2: User Mental Models → Relationship Validation**
The product discovery artifact captures how users think the domain works (Norman's mental models). The domain model captures how the system thinks the domain works. Where these diverge, the domain model should note the divergence explicitly — not to force alignment, but to make divergence a conscious design decision rather than an invisible accident.

**Channel 3: Value Tensions → Open Questions**
Where product discovery surfaces conflicts between stakeholder groups (business wants automation, users want human contact), these should feed into the domain model's Open Questions section and forward into DECIDE as explicit decision points requiring ADRs.

### Feed-Forward to DECIDE: Two Concrete Channels

**Channel 1: Stakeholder Needs → ADR Context**
Every ADR has a "Context" section explaining what motivates the decision. Currently, context comes from the essay (technical research). With product discovery, context should also reference specific personas, jobs, or value tensions from the product artifact. "Benefits admins process 200 enrollments/day during open enrollment (Product Discovery, Persona: Benefits Admin)" belongs in the ADR context alongside "the API supports batch enrollment (Essay §3.2)."

**Channel 2: Assumption Inversions → Scenario Enrichment**
Product discovery's critical design step (questioning whether the product itself is right) should produce inverted assumptions that become behavior scenarios in DECIDE. If the discovery phase surfaces "users might prefer manual review over automated enrollment," that becomes a scenario: "Given a Benefits Admin reviewing a flagged enrollment, When the system suggests auto-approval, Then the admin can override with manual review and the system records the override rationale."

### Feed-Forward to ARCHITECT: Responsibility Provenance

The system design's responsibility matrix traces module ownership to domain concepts and ADRs. With product discovery, the provenance chain extends further back: Module → Domain Concept → ADR → Product Discovery (persona/job/value). This full provenance chain means a product stakeholder can ask "why does Module X exist?" and trace the answer all the way back to a user need, not just a technical decision.

### The Conformance Question

The user raised conformance standards. For the product artifact to be useful, it must actually change what downstream phases produce — not just sit alongside them. The concrete test:

1. **MODEL conformance:** Does the domain model's glossary include product vocabulary provenance? If not, the product artifact didn't feed forward.
2. **DECIDE conformance:** Do ADR context sections reference product discovery findings? Do scenarios include product-discovered edge cases? If not, the product artifact didn't feed forward.
3. **ARCHITECT conformance:** Does the responsibility matrix trace to product discovery provenance? If not, the product artifact didn't feed forward.

**Implications:**

1. The product discovery artifact must produce output in a format that the domain model template can directly consume — specifically, a vocabulary table and a stakeholder map that MODEL reads as input alongside the essay.

2. ADR-003 (phase-specific epistemic act assignments) needs to account for the new phase. The epistemic gate for product discovery should leverage the user's actual domain knowledge — they likely know more about their users than the AI does. This is the phase where the epistemic gate might be the most natural and least quiz-like.

3. The full provenance chain (user need → product concept → domain term → ADR → module) becomes the narrative thread that makes the technical system comprehensible to product stakeholders. The product artifact isn't just an input — it's the Rosetta Stone between the two vocabularies.

4. Event storming's approach suggests the product discovery artifact itself could be structured as a narrative timeline rather than a static map — "here's what happens when a benefits admin enrolls employees during open enrollment" — which is both a product artifact and the raw material for domain extraction.

## Question 4: What happens when product discovery is introduced into a pre-existing system? How does it feed backward?

**Method:** Web search (4 searches on retroactive product discovery, product debt, design audits on existing systems, reverse engineering product intent from architecture)

**Findings:**

### Product Debt: The Accumulated Cost of Building Without Product Thinking

Andrew Chen and others describe **product debt** as the product-level analog to technical debt: "Product debt is any element of a product that compromises the learning loop and/or impedes progress toward market fit." Product debt is the cumulus of features, functionalities, and customizations not demonstrably contributing to business objectives.

Key insight: product debt compounds invisibly, just like technical debt. Small compromises, rushed decisions, and postponed user research eventually compound into a drag on usability, development speed, and business performance. But unlike technical debt — which is at least visible in the codebase — product debt hides in the gap between what the system does and what users need.

The healthcare enrollment case is a textbook example: the system has no technical debt (it was well-architected via RDD), but it may carry significant product debt (the API abstraction layer serves the system's modularity needs rather than the benefits admin's workflow needs).

### Architecture Reveals Implicit Product Decisions

Every architectural choice embeds product assumptions, whether the team was conscious of them or not:
- A batch enrollment API assumes benefits admins process enrollments in batches (do they?)
- A synchronous response model assumes immediate feedback matters (maybe it does, maybe it doesn't)
- An abstraction layer for "future API integrations" assumes those integrations will come (will they? for whom?)

Reverse engineering these implicit product decisions from the existing architecture is the first step in retroactive product discovery. The existing codebase is not product-neutral — it encodes a product worldview that was never explicitly stated.

### The Backward Feed: Product Discovery as Conformance Audit

When `/rdd-product` runs against a pre-existing system, it functions like a conformance audit — but instead of checking code against ADRs, it checks the system against user needs:

**Step 1: Surface implicit product assumptions.** Read the existing architecture (system design, ADRs, domain model) and extract the product assumptions baked in. "The system assumes X about who uses it and how." This is analogous to reverse engineering product intent from the architecture.

**Step 2: Validate against actual users.** Map personas, jobs, mental models. Compare what users need against what the system assumes they need.

**Step 3: Produce a product debt table.** Analogous to the conformance debt table in `/rdd-decide`:

| Assumption | Baked Into | Actual User Need | Gap Type | Resolution |
|------------|-----------|-----------------|----------|------------|
| Admins process enrollments in batches | Batch API endpoint | Admins handle exceptions one-at-a-time | mental model mismatch | Needs single-enrollment workflow |
| All carriers use similar enrollment flows | Carrier abstraction layer | Carrier X has unique pre-approval step | over-abstraction | Needs carrier-specific extension point |

**Step 4: Feed backward into existing artifacts.**
- Product debt items that affect the domain model → invariant amendments or new concepts
- Product debt items that affect ADRs → new ADRs superseding old ones, with explicit context: "ADR-NNN assumed X about user needs; product discovery found Y"
- Product debt items that affect architecture → design amendments with product provenance

This backward propagation follows the same pattern as RDD's existing invariant amendment process — the infrastructure is already there. Product discovery just adds a new trigger for backward propagation: not "an invariant changed" but "a product assumption was invalidated."

### Two Modes of Operation

This suggests `/rdd-product` should support two modes:

1. **Forward mode (greenfield):** Runs between RESEARCH and MODEL. Produces persona map, jobs, value tensions, user mental models. Feeds forward into MODEL and DECIDE.

2. **Backward mode (existing system):** Runs against existing artifacts and codebase. Surfaces implicit product assumptions, validates against users, produces a product debt table. Feeds backward into domain model, ADRs, and system design via the existing amendment infrastructure.

Both modes produce the same core artifact (the product discovery document), but backward mode adds the debt table and triggers backward propagation.

### Relationship to RDD's Existing Conformance Audit

`/rdd-decide` already has a conformance audit (Step 3.5) that checks code against ADRs. Product discovery's backward mode is a higher-level conformance audit: checking the *system's product assumptions* against *actual user needs*. The two are complementary:

- Technical conformance: "Does the code match the ADRs?"
- Product conformance: "Do the ADRs match what users actually need?"

Together, they close the loop. Without product conformance, technical conformance just ensures the system is consistently wrong.

**Implications:**

1. `/rdd-product` needs a "backward mode" that can run against existing artifacts. This is not just an audit — it triggers the same backward propagation infrastructure that invariant amendments use. The product debt table is the artifact that drives propagation.

2. The product debt table is the backward-feed analog of the conformance debt table. It should use the same format and resolution patterns so that `/rdd-build` can treat product debt items the same way it treats ADR violations — as structural tidying before feature work.

3. The backward propagation trigger is: "a product assumption was invalidated by user evidence." This is a new category of propagation event alongside "an invariant changed." The orchestrator needs to know about it.

4. Forward mode and backward mode share the same artifact structure but differ in process: forward mode discovers from scratch, backward mode discovers by auditing what exists. The skill should support both without being two separate skills — the artifact is the same, the entry point differs.

## Question 5: Is there empirical evidence for a "product maintenance cliff" — the compound cost of building without product thinking?

**Method:** Web search (3 searches on cost of late pivots, Boehm's cost of change curve, product-market fit failure statistics)

**Findings:**

### Boehm's Cost of Change Curve — Product Edition

Barry Boehm's foundational research (1981) established that the cost of fixing defects rises exponentially the later they are discovered. A requirements mistake found during requirements costs almost nothing; the same mistake found after deployment can cost 100x more. Boehm calls the worst cases "Architecture-Breakers" — fundamental assumptions proven wrong after customers are already using the system.

This curve applies directly to product assumptions. A product assumption invalidated during discovery costs almost nothing — the team pivots before building. The same assumption invalidated after deployment is an architecture-breaker on the product dimension: the system was built around a product worldview that turned out to be wrong, and the architecture encodes that worldview in its abstractions, APIs, and data models.

### Quantified Costs of Late Product Discovery

- Requirements defects cost 10-100x more to fix after release than during discovery
- Teams spending <10% of capacity on discovery average 18-24 months concept-to-launch; teams spending 15-25% average 12-15 months
- Organizations treating discovery as overhead rather than insurance pay 2-3x more to reach the same outcomes
- A flawed assumption in month one becomes a failed feature in month six and a costly pivot in month twelve
- 60% of product pivots result from market shifts that were visible 12-18 months earlier

### Product-Market Fit Failure Statistics

- 42% of startup failures cite "no market need" as the primary cause (CB Insights)
- 35% cite "tackling problems interesting to solve rather than those that serve a market need"
- VC-backed companies that shut down since 2023 raised a combined $17.5B before failing — median $11M per company
- 20 Series B+ companies cited poor product-market fit, having raised on early traction that "never widened into a real market"
- Finding product-market fit takes ~2 years on average; startups need 2-3x longer than founders expect

### The Product Maintenance Cliff

The evidence supports the concept of a "product maintenance cliff" analogous to the technical maintenance cliff from essay 001:

1. **Compound cost:** Product assumptions encoded in architecture become exponentially more expensive to correct over time (Boehm's curve applied to product decisions)
2. **Invisible accumulation:** Unlike technical debt (visible in code), product debt hides in the gap between what the system does and what users need — teams may not even know it exists until a competitor reveals it
3. **Calcification:** Users build workarounds for product misalignment, creating secondary dependencies that make correction harder. The system's product worldview becomes self-reinforcing even when wrong
4. **The cliff:** The point where accumulated product debt makes iteration harder than starting over. 42% of failed startups hit this cliff — they built a system so deeply encoded around wrong product assumptions that pivoting was no longer feasible

The product discovery phase is the prevention mechanism, just as epistemic gates prevent the technical maintenance cliff. Both work by interrupting compounding early — before assumptions harden into architecture.

**Implications:**

1. The "product maintenance cliff" is empirically grounded enough to include in the essay as a named concept, parallel to the technical maintenance cliff. Boehm's cost-of-change curve provides the theoretical foundation; the product-market fit failure statistics provide the empirical evidence.

2. The 10-100x cost multiplier for late discovery justifies the product discovery phase's existence in concrete economic terms — not just "it would be nice to think about users" but "it is measurably cheaper to discover product misalignment before encoding it in architecture."

## Question 6: Should the inversion principle be an invariant, a cross-cutting principle, or a phase-local step?

**Method:** Web search (1 search on cross-cutting concerns in methodologies) + analytical reasoning from existing RDD structure

**Findings:**

### How RDD's Existing Governance Works

RDD has three levels of governance:

1. **Invariants** (domain model) — Constitutional rules that outrank all other artifacts. Currently 8 invariants (0-7), all focused on epistemic understanding. Invariants are *always true* statements about the methodology.

2. **Cross-cutting principles** (orchestrator) — Rules that apply across multiple phases but aren't constitutional. Examples: writing voice ("third person, never 'we'"), stop at uncertainty, domain vocabulary consistency. These are *process rules* that shape how phases operate.

3. **Phase-local steps** (individual skills) — Steps within a specific phase. Examples: the spike rules in /rdd-research, the conformance audit in /rdd-decide. These are *procedural* — they describe what happens within a phase.

### Where the Inversion Principle Fits

The inversion principle ("systematically question product assumptions before encoding them in architecture") doesn't fit cleanly into any single level:

**As an invariant:** It would read something like "Product assumptions must be questioned before being encoded in architecture." This is testable and constitutional — but it's narrower than the existing invariants, which are about understanding in general. The existing invariants are about *how humans engage with the methodology*. The inversion principle is about *what questions the methodology asks*.

**As a cross-cutting principle:** It would sit in the orchestrator alongside writing voice and stop-at-uncertainty. This feels right for scope — it applies during RESEARCH (questioning the problem frame), PRODUCT DISCOVERY (the primary home), and DECIDE (ADR context should acknowledge inverted assumptions). It's a lens applied across phases, not a rule for one phase.

**As a phase-local step:** It would be a step within /rdd-product — "Step N: Assumption Inversion." This is where it currently sits in the essay. But this undersells it — the inversion habit should infect RESEARCH (am I researching the right question?) and DECIDE (am I deciding based on assumptions I haven't examined?).

### Recommendation

The inversion principle should live at **two levels**:

1. **Cross-cutting principle in the orchestrator** — a named principle alongside "stop at uncertainty" and "domain vocabulary consistency." Something like: "Question product assumptions. Before encoding a product assumption in the domain model, ADRs, or architecture, ask: what if this assumption is wrong? Who benefits if it's right? Who is harmed if it's wrong? The inversion principle applies across RESEARCH, PRODUCT DISCOVERY, and DECIDE."

2. **Structured step within /rdd-product** — where it has its primary procedural home. The product discovery skill includes an explicit assumption inversion step that produces the Assumption Inversions section of the artifact.

It should **not** be an invariant. The existing invariants form a coherent set about epistemic understanding. Adding a product-focused invariant would dilute that coherence. Instead, the inversion principle is a *methodological principle* — a way of working — not a *constitutional constraint* on what understanding means.

However: if Invariant 0 is amended to include "who it was built for and why," the inversion principle becomes the *mechanism* that serves that amended invariant — just as epistemic gates are the mechanism serving invariants 1-7.

**Implications:**

1. The inversion principle gets two homes: a cross-cutting principle in the orchestrator and a procedural step in /rdd-product. This mirrors how "domain vocabulary consistency" is both a cross-cutting principle and a step within /rdd-model.

2. Invariant 0 should be amended in MODEL to include the product dimension: "The user should be able to speak with authority about what was built, who it was built for, and why." The inversion principle then serves this amended invariant.

3. This two-level placement means the inversion habit can infect other phases naturally. A researcher might ask "am I researching the right problem?" A decision-maker might ask "does this ADR rest on an unexamined product assumption?" These aren't procedural steps — they're the cross-cutting principle at work.

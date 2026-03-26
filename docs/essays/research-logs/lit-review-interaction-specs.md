## Literature Review: Interaction Specification Layers in BDD and Acceptance Testing

**Date:** 2026-03-25
**Method:** Systematic literature search — 20+ web searches, primary source fetches for 8 key documents

---

### Sources Reviewed

| # | Author(s) | Title | Year | Venue | Relevance |
|---|-----------|-------|------|-------|-----------|
| 1 | Adzic, G. | "How to implement UI testing without shooting yourself in the foot" | 2010 | gojko.net (blog/article) | Primary: three-layer model |
| 2 | North, D. | "Introducing BDD" | 2006 | Better Software magazine | Foundational: GWT, behavior vs. test |
| 3 | Marcano, A. & Palmer, A. | JNarrate / Screenplay pattern origins | 2007–2009 | AAFTT workshop; unpublished / conference | Primary: Roles-Goals-Tasks-Actions |
| 4 | Lawrence, K. | "In Praise of Abstraction" | 2007 | developertesting.com (AAFTT workshop follow-up) | Primary: interaction design vocabulary in test automation |
| 5 | Molak, J., Marcano, A., Smart, J.F., Palmer, A. | "Beyond Page Objects: Next Generation Test Automation with Serenity and the Screenplay Pattern" | 2016 | InfoQ | Secondary: SOLID critique of Page Objects, Screenplay architecture |
| 6 | Smart, J.F. & Molak, J. | *BDD in Action, Second Edition* | 2023 | Manning | Primary: Ch. 12 — Screenplay Pattern in full |
| 7 | Serenity/JS documentation (Molak, J.) | Screenplay Pattern handbook | ongoing (current) | serenity-js.org | Primary: canonical architecture description |
| 8 | Serenity BDD documentation (Smart, J.F.) | Screenplay Fundamentals | ongoing (current) | serenity-bdd.github.io | Primary: Goals-Tasks-Interactions hierarchy |
| 9 | Annett, J. & Duncan, K.D. | "Task Analysis and Training Design" | 1967 | Occupational Psychology (journal) | Foundational: HTA origins |
| 10 | Stanton, N.A. | "Hierarchical Task Analysis: Developments, Applications and Extensions" | 2006 | Applied Ergonomics, 37(1), 55–79 | Survey: HTA theory and applications |
| 11 | Thomas, S. | "Declarative vs Imperative Gherkin Scenarios for Cucumber" | 2013 | itsadeliverything.com | Secondary: declarative/imperative debate |
| 12 | Dodds, K.C. | "The Testing Trophy and Testing Classifications" | 2021 | kentcdodds.com | Secondary: integration-first philosophy |
| 13 | Dodds, K.C. | "Testing Implementation Details" | 2020 | kentcdodds.com | Secondary: user-centric testing philosophy |
| 14 | Adzic, G. | *Specification by Example* | 2011 | Manning | Background: SbE methodology |
| 15 | Freeman, S. & Pryce, N. | *Growing Object-Oriented Software, Guided by Tests* | 2009 | Addison-Wesley | Background: double-loop TDD, acceptance test layers |
| 16 | Crispin, L. & Gregory, J. | *Agile Testing* | 2009 | Addison-Wesley | Background: Agile Testing Quadrants |
| 17 | Silva, T.R., Winckler, M., & Trætteberg, H. | "Extending Behavior-Driven Development for Assessing User Interface Design Artifacts" | 2019 | SEKE 2019 (Lisbon) | Academic: task models + BDD + UI artifact consistency |
| 18 | Pruitt, J. & Grudin, J. | "Personas: Practice and Theory" | 2003 | DUX 2003 conference proceedings | Background: persona as role specification |
| 19 | Fowler, M. | "Page Object" | ongoing | martinfowler.com (bliki) | Background: Page Object pattern and its limits |
| 20 | Cucumber documentation | "Writing Better Gherkin" / "Anti-patterns" | ongoing | cucumber.io | Secondary: step definition coupling |

---

### Synthesis

#### The Structural Problem

Every community that has seriously engaged with automating acceptance tests against user interfaces has independently arrived at the same structural observation: there is a layer of specification that current practice leaves unwritten. The layer sits between business-rule scenarios — which describe *what* a system should do in terms of business outcomes — and technical implementation — which describes *how* to automate mouse clicks, keyboard events, and DOM queries. Neither layer captures the intermediate concern: *the mechanics of how a user of a particular role, with particular goals, actually works through the interface to accomplish something*.

This gap has been named and framed differently across communities, but the underlying structure is consistent enough to warrant treating it as a single recurring problem rather than several independent observations.

#### Adzic's Three Layers (2010)

The most cited direct statement of the problem comes from Gojko Adzic's 2010 article "How to implement UI testing without shooting yourself in the foot." Adzic proposes three hierarchical levels for UI test automation:

1. **Business rule level**: What the test demonstrates without technical detail. Example: "Free delivery is offered to customers who order two or more books." This level is maximally stable — business rules change slowly.

2. **User interface workflow level**: The user actions needed to exercise the functionality. Example: "Put two books in a shopping cart, enter address details, verify that delivery options include free delivery." This level is bound to the activity flow but not to specific page layouts or DOM structure.

3. **Technical activity level**: Concrete automation steps. Example: "Open the shop homepage, log in with 'testuser' and 'testpassword', go to the '/book' page, click on the first image with the 'book' CSS class..." This level changes frequently with any UI modification.

Adzic's central argument is that most teams implement only the technical level and wonder why their test suites are fragile and expensive. The workflow level is the missing specification — more stable than technical steps, more concrete than business rules, and writable *before* the UI exists.

The practical implication Adzic draws out is important for requirements purposes: because the workflow layer makes no reference to specific page layouts, it can serve as a specification *during* development and as an acceptance criterion *after* development, and it survives UI redesigns that would shatter technical-level tests.

#### BDD's Foundational Tension

Dan North's foundational 2006 paper "Introducing BDD" establishes the Given-When-Then pattern as a translation mechanism between business language and executable specification. North frames the progression as: user stories provide business value context; acceptance criteria express what "done" means; scenarios operationalize those criteria through testable fragments. The intent is a "ubiquitous language" that stakeholders across roles can share.

But North's formulation creates an unresolved tension that the declarative-vs-imperative debate makes visible. When teams write Given-When-Then in terms of what users *want to accomplish* (declarative), the scenarios remain stable and readable by product owners. When teams write in terms of what users *physically do* (imperative — "I navigate to the home page, I fill in Username, I press Login"), the scenarios become brittle and opaque to business stakeholders. Steven Thomas's 2013 analysis of this distinction, "Declarative vs Imperative Gherkin Scenarios for Cucumber," captures the problem precisely: imperative scenarios "test the interactions with the user interface, rather than what the user does and wants to achieve."

What neither the declarative nor the imperative style of Gherkin addresses is the middle case: a scenario like "When James adds two books to his cart" is declarative at the business level, but it leaves entirely unspecified whether the interaction involves clicking an "Add to Cart" button, dragging products to a cart widget, selecting a quantity via keyboard, or interacting with a swipeable mobile card. The gap between business scenario and automation code remains, regardless of Gherkin style. Adzic's workflow layer is the name for what lives in that gap.

#### The Screenplay Pattern: Goals, Tasks, Interactions

The most architecturally complete answer to this gap is the Screenplay Pattern, which has an intricate intellectual genealogy worth tracing precisely because the community often collapses the history.

The intellectual origin is Kevin Lawrence's October 2007 talk "In Praise of Abstraction," delivered as a follow-up to the first Agile Alliance Functional Testing Tools (AAFTT) workshop. Lawrence identified that functional testing tools push testers toward writing at the "task level" — clicking buttons, entering data — and proposed borrowing the vocabulary of interaction designers: **Goals** (what users want to achieve), **Activities** (the essential interactions required), and **Tasks** (the implementation-specific steps). Lawrence credited Ward Cunningham's Process Explorer as a precursor and framed the proposal as importing interaction design's discipline of insisting on "what the customer really wanted to achieve" before accepting surface-level interface requests.

At the same AAFTT workshop, Antony Marcano had been working toward a similar structure. Marcano fused Lawrence's vocabulary with ideas from user-centered design to produce the **Roles-Goals-Tasks-Actions** model: Role (who) → Goal (why) → Task (what) → Action (how). The critical move, which distinguishes this from earlier Page Object thinking, is that **tasks are declarative and actions are imperative** — tasks describe intent, actions describe mechanism. This is the same cut Adzic would later articulate as workflow vs. technical activity.

Between 2007 and 2009, Marcano and Andy Palmer built JNarrate, the first Java implementation of this model. The Ruby implementation Cuke Salad followed in 2011; Screenplay4j in Java in 2012. Jan Molak took up the pattern in 2013 and coined the name "the Journey Pattern" (published by Softwire). When John Ferguson Smart integrated it into Serenity BDD in 2015 and the four primary authors published a joint 2016 InfoQ article, "Beyond Page Objects: Next Generation Test Automation with Serenity and the Screenplay Pattern," the name "Screenplay Pattern" became canonical.

The 2016 InfoQ article, co-authored by Molak, Marcano, Smart, and Palmer, makes the SOLID critique of Page Objects explicit: Page Objects accumulate responsibilities (Single Responsibility Principle violation), require modification rather than extension when UI changes (Open-Closed Principle violation), and create inheritance hierarchies that become brittle under composition. The Screenplay Pattern achieves separation through five distinct abstractions:

- **Actor**: a named entity representing a person or external system interacting with the system under test. The actor is the closest the pattern comes to a stakeholder persona, though (as discussed below) this mapping remains underdeveloped.
- **Ability**: a thin wrapper around an integration library — browser driver, HTTP client, database connection. Abilities are the capabilities actors bring to interactions.
- **Interaction**: a low-level command object instructing an actor how to use an ability. Examples: `Click.on(button)`, `Enter.theValue(text).into(field)`, `Navigate.to(url)`.
- **Task**: a named composition of interactions (or sub-tasks) representing a meaningful business-level activity. The task is the critical abstraction — it names *what a user is doing* without specifying which elements they click. Example: `SignIn.as(james)` internally composes several interactions but is referenced in scenarios by business intent.
- **Question**: a query that retrieves system state, enabling assertions. Example: `LastResponse.status()`.

The hierarchy is: Goal (expressed in Cucumber scenario language) → Task (business workflow step, stable) → Interaction (UI mechanism, changeable) → Ability (integration library, swappable).

Chapter 12 of Smart and Molak's *BDD in Action, Second Edition* (Manning, 2023) documents this hierarchy as the mature form of the pattern. The chapter title is "Scalable test automation with the Screenplay Pattern" and addresses the Screenplay Pattern's role in making tasks "easy to reuse and combine" across large applications with multiple actors.

The Serenity/JS documentation (maintained by Molak) explicitly references the Screenplay Pattern's relationship to HTA: "This hierarchy mirrors Hierarchical Task Analysis from user experience design, enabling tests to express expected business processes rather than implementation details." This is one of the few places the BDD testing literature directly names the UX lineage.

#### Hierarchical Task Analysis: The Upstream Discipline

Annett and Duncan's 1967 paper "Task Analysis and Training Design," published in Occupational Psychology, established HTA as a method for decomposing complex human activities into nested hierarchies of subtasks for industrial training purposes. The core decomposition structure is: **Goal** (what is to be achieved) → **Plan** (the conditions and sequence for achieving it) → **Operation** (observable action at the level of detail sufficient for the purpose at hand).

The decomposition principle — sometimes called the P × C rule — specifies that further decomposition is warranted only when the probability of inadequate performance (P) times the cost of that failure (C) exceeds a threshold. This is a pragmatic stop rule: decompose until the detail is actionable, not until it is exhaustive.

Stanton's 2006 Applied Ergonomics survey ("Hierarchical Task Analysis: Developments, Applications and Extensions") documents how HTA extended far beyond its industrial training origins into interface design and evaluation, allocation of function, job aid design, error prediction, and workload assessment. The key interface design application is exactly the one relevant here: mapping user workflows to interface functionality and identifying gaps between intended tasks and available interface operations.

HTA's connection to the BDD interaction gap is structural rather than historically explicit. The BDD testing community (Lawrence, Marcano, Molak) did not cite Annett and Duncan when developing the Screenplay Pattern — they arrived at the same decomposition through interaction design vocabulary. But the isomorphism is real: HTA's Goal → Plan → Operation maps directly onto Screenplay's Goal → Task → Interaction, and both are motivated by the same insight that tasks are stable at the level of user intent and volatile at the level of mechanism.

Silva, Winckler, and Trætteberg's 2019 SEKE paper "Extending Behavior-Driven Development for Assessing User Interface Design Artifacts" is the most direct academic work connecting HTA-style task models to BDD. The paper proposes extending BDD to ensure consistency between user requirements (expressed as task models) and UI design artifacts (prototypes, final implementations). This work treats the three artifacts — task model, UI prototype, final UI — as targets for the same BDD scenario, with the task model as the intermediate specification layer. This is precisely Adzic's workflow layer rendered formal.

#### Kent Dodds and the Testing Library Philosophy

The Testing Trophy and Testing Library community approaches the same underlying problem from the UI component testing angle rather than the BDD/acceptance testing angle. Dodds's central principle — "The more your tests resemble the way your software is used, the more confidence they can give you" — is a formulation of the same insight Adzic, Lawrence, and Marcano articulate: tests should be written at the level of user intent, not implementation mechanism.

The Testing Trophy (introduced in 2018, refined in a 2021 article) inverts the traditional Testing Pyramid by making integration tests — tests of multiple units working together — the widest and most valued layer. Where the Pyramid optimizes for speed by pushing volume toward unit tests, the Trophy optimizes for confidence by pushing volume toward user-scenario-level tests.

Dodds's 2020 piece "Testing Implementation Details" argues that accessing internal component state in tests (React's `instance()`, `state()`, enzyme internals) creates two failure modes: false negatives when implementation refactors break tests without breaking behavior, and false positives when internal state changes don't manifest as user-visible failures. Testing Library enforces tests that interact only through what users see and do — rendered text, buttons, ARIA roles — making it structurally impossible to write tests at the wrong abstraction level.

What this community does not do is provide a formal specification layer between the scenario and the component test. The philosophy is correct, but it is practiced as a coding discipline rather than a specification pattern. The gap with BDD is that Dodds's approach leaves the specification of *what* user interactions constitute the test implicit in the test code, whereas Adzic, Marcano, and Smart are trying to make that specification explicit, writable, and legible to non-technical stakeholders before the code exists.

#### Persona and Stakeholder Modeling: The Underdeveloped Connection

A notable gap in the testing literature is the connection between stakeholder modeling and interaction specification. The BDD community has the concept of "actor" in the Screenplay Pattern, and actors can be given names representing personas ("James, a just-in-time kinda guy"). But the literature does not develop a systematic path from stakeholder analysis — the full apparatus of user research, persona construction, and role mapping — through to interaction specification.

Pruitt and Grudin's 2003 "Personas: Practice and Theory" established the persona as a communication device between developers and stakeholders, grounding design decisions in archetypes derived from qualitative and quantitative user research. The Screenplay Pattern's Actor is a testing construct that could embody this, but the pattern's documentation treats Actor naming as a readability concern rather than a requirements concern.

The implication is that the actor's *abilities* (which interfaces they can use), *goals* (what they need to accomplish), and *constraints* (what they cannot or will not do) are all drawn from the stakeholder model in principle — but in current practice, this mapping is implicit and informal. A practitioner using Screenplay must independently decide what tasks to give to which actor; there is no formalized method for deriving the task decomposition from a stakeholder analysis.

This represents one of the clearest gaps in the literature: the pipeline from stakeholder model to interaction specification to executable test automation is described at both ends but not in the middle.

#### Convergent Themes Across Communities

The following themes appear consistently across the BDD, UX, ergonomics, and test automation communities:

1. **The two-level collapse.** When practitioners implement acceptance test automation without a workflow layer, they collapse two distinct concerns into one: what the system should do (business) and how to automate the test (technical). Every community that has diagnosed fragile UI test suites traces the problem to this collapse.

2. **Declarative stability vs. imperative brittleness.** Specifications written at the level of user intent ("log in," "add a book to the cart") survive UI redesigns. Specifications written at the level of UI mechanism ("click the element with CSS class .book-image") do not. This is true in Gherkin scenarios (Thomas 2013, Cucumber docs), Page Objects (Fowler, Molak et al. 2016), and component tests (Dodds 2020).

3. **Task as the mediating abstraction.** The task — a named, reusable workflow step that specifies *what* without specifying *how* — is the consistent answer across HTA (operation at goal level), Screenplay Pattern (Task above Interaction), and Testing Library (query by role above query by selector). The task is stable because it captures user intent; the interaction beneath it is volatile because it captures mechanism.

4. **SOLID principles as a forcing function.** The Screenplay Pattern's most intellectually rigorous contribution is applying SOLID design principles to the specification layer. Single Responsibility ensures each class describes one concern. Open-Closed ensures new tasks compose rather than modify existing ones. The result is a specification architecture with the properties of good code: reusable, testable, extensible.

5. **Actor as stakeholder proxy.** Multiple approaches name the person performing the test scenario as a first-class entity — Screenplay's Actor, BDD's user story role, HTA's operator. But none has fully operationalized the connection between the test Actor and the upstream stakeholder model that should define that Actor's goals, behaviors, and constraints.

---

### Key Findings

- **Adzic (2010)** is the clearest direct statement of the three-layer problem: business rule, workflow, technical activity. The workflow layer is what most teams skip, producing fragile tests that are also opaque to business stakeholders. The article is brief but prescient; Adzic published it 13 years before Smart and Molak's book codified the practice.

- **Lawrence (2007)** preceded Marcano in articulating the interaction design vocabulary for test automation, drawing the Goals-Activities-Tasks hierarchy explicitly from interaction design practice and proposing that test automation frameworks should work at the Activities level rather than the Tasks level. This is the earliest known articulation of the vocabulary in the testing community.

- **The Screenplay Pattern** (Marcano & Palmer 2007–2009; Smart & Molak 2023) provides the most complete formalization of the intermediate layer as an architectural pattern. The hierarchy — Goal → Task → Interaction → Ability — has clean SOLID justification and is supported by two mature open-source implementations (Serenity BDD for Java, Serenity/JS for TypeScript). The 2016 InfoQ article (Molak, Marcano, Smart, Palmer) remains the most complete articulation of why Page Objects fail and how Screenplay addresses the failure.

- **HTA (Annett & Duncan 1967; Stanton 2006)** provides the theoretical substrate for the decomposition the testing community arrived at independently. The P × C stop rule for decomposition is a principled answer to "how fine-grained should the task layer be?" that the BDD literature does not address formally.

- **Silva, Winckler, & Trætteberg (2019)** is the only academic work that formally connects task models (HTA-style) to BDD as a consistency mechanism across UI artifacts. Their SEKE 2019 paper treats the task model as the intermediate layer between user story and executable test, validating that the workflow layer is not merely a practitioner heuristic but a formal architectural concern.

- **Dodds (2018–2021)** converges from the UI component testing community on the same principle — test at the level of user behavior, not implementation details — but without a formal specification layer. The Testing Trophy and Testing Library enforce the right abstraction at code-writing time without providing a pre-implementation specification artifact.

- **The persona-to-actor gap** is consistent and unaddressed. The Screenplay Pattern names actors after personas but provides no method for deriving task decompositions from stakeholder models. This is the clearest research gap: the connection between who users are (role modeling, persona construction) and what tasks they perform in the specification layer (task decomposition) is assumed rather than designed.

---

### Limitations

**Coverage gaps.** The search found no systematic academic survey of the Screenplay Pattern across its full evolutionary history. The primary sources are conference articles, blog posts, and practitioner documentation rather than peer-reviewed journal papers. The academic literature (Silva et al. 2019, the HAL preprints) addresses the formal connection between task models and BDD only recently and at limited scale.

**Industry-research disconnect.** The practitioner literature (Adzic, Smart, Marcano, Dodds) is substantially ahead of the academic literature in naming the problem and proposing solutions. The academic literature has not yet produced a comparative evaluation of the Screenplay Pattern, Adzic's three-layer model, and HTA-informed approaches as competing or complementary frameworks.

**Persona-to-interaction pipeline.** The connection between upstream stakeholder modeling (Cooper's persona methodology, Pruitt and Grudin's data-driven refinement) and downstream interaction specification (Screenplay Pattern tasks) is not addressed in the literature as a unified pipeline. This would require synthesis across the UX research, requirements engineering, and test automation communities that has not yet occurred.

**Frontend framework specificity.** Most Screenplay Pattern literature is Java-centric (Serenity BDD) or TypeScript-centric (Serenity/JS). The degree to which the pattern's abstraction levels hold in React Testing Library contexts, or in frameworks where the component is the unit of specification, is not thoroughly examined. Dodds's Testing Library philosophy is implicitly an alternative answer to the same problem (test at user intent level) but the two communities have not explicitly compared their approaches.

**Mobile and non-browser contexts.** The literature almost exclusively addresses web browser testing. The extent to which the workflow layer applies to mobile touch interactions, voice interfaces, or desktop applications is not examined.

**No empirical data.** With the exception of informal practitioner accounts, there is no empirical study of whether teams that adopt a formal workflow layer (via Screenplay or similar) actually produce more stable test suites than those that do not. This is a significant gap given that the claim of improved stability is the primary motivation for the pattern.

---

### Sources

- Adzic, G. (2010). "How to implement UI testing without shooting yourself in the foot." gojko.net. https://gojko.net/2010/04/13/how-to-implement-ui-testing-without-shooting-yourself-in-the-foot-2/
- North, D. (2006). "Introducing BDD." Better Software magazine. https://dannorth.net/blog/introducing-bdd/
- Lawrence, K. (2007). "In Praise of Abstraction." developertesting.com. https://developertesting.com/archives/month200710/20071013-In%20Praise%20of%20Abstraction.html
- Molak, J., Marcano, A., Smart, J.F., & Palmer, A. (2016). "Beyond Page Objects: Next Generation Test Automation with Serenity and the Screenplay Pattern." InfoQ. https://www.infoq.com/articles/Beyond-Page-Objects-Test-Automation-Serenity-Screenplay/
- Smart, J.F. & Molak, J. (2023). *BDD in Action, Second Edition.* Manning. https://www.manning.com/books/bdd-in-action-second-edition
- Molak, J. (ongoing). Serenity/JS documentation: Screenplay Pattern. https://serenity-js.org/handbook/design/screenplay-pattern/
- Smart, J.F. (ongoing). Serenity BDD documentation: Screenplay Fundamentals. https://serenity-bdd.github.io/docs/screenplay/screenplay_fundamentals
- Annett, J. & Duncan, K.D. (1967). "Task Analysis and Training Design." Occupational Psychology. https://eric.ed.gov/?id=ED019566
- Stanton, N.A. (2006). "Hierarchical Task Analysis: Developments, Applications and Extensions." Applied Ergonomics, 37(1), 55–79. https://eprints.soton.ac.uk/73988/1/Hierarchical_Task_Analysis_Stanton.pdf
- Thomas, S. (2013). "Declarative vs Imperative Gherkin Scenarios for Cucumber." itsadeliverything.com. https://itsadeliverything.com/declarative-vs-imperative-gherkin-scenarios-for-cucumber
- Dodds, K.C. (2021). "The Testing Trophy and Testing Classifications." kentcdodds.com. https://kentcdodds.com/blog/the-testing-trophy-and-testing-classifications
- Dodds, K.C. (2020). "Testing Implementation Details." kentcdodds.com. https://kentcdodds.com/blog/testing-implementation-details
- Freeman, S. & Pryce, N. (2009). *Growing Object-Oriented Software, Guided by Tests.* Addison-Wesley. https://growing-object-oriented-software.com/
- Silva, T.R., Winckler, M., & Trætteberg, H. (2019). "Extending Behavior-Driven Development for Assessing User Interface Design Artifacts." SEKE 2019. https://hal.science/hal-02879308/document
- Pruitt, J. & Grudin, J. (2003). "Personas: Practice and Theory." Proceedings of DUX 2003. https://dl.acm.org/doi/10.1145/997078.997089
- Fowler, M. (ongoing). "Page Object." martinfowler.com. https://martinfowler.com/bliki/PageObject.html

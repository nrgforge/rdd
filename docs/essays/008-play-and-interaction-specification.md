# The Gap Between Specification and Experience: Play and Interaction Specification in RDD

*2026-03-25*

## Abstract

RDD specifies what a system does (through behavior scenarios) but not how stakeholders experience it. This essay investigates the gap between behavioral specification and lived stakeholder experience through two connected proposals: an interaction specification layer that encodes how users work with the system (drawing on Adzic's three-layer model, the Screenplay Pattern, and Hierarchical Task Analysis), and a post-build "play" phase where the practitioner inhabits each stakeholder and discovers what the specifications missed (drawing on play theory from Huizinga, Caillois, Winnicott, and Gadamer; design theory from Schon and Suchman; performance from Boal; and critical theory from de Certeau and Sicart). The research finds these are not separable concerns but two manifestations of the same gap, connected through product discovery's stakeholder models. RDD's product discovery phase provides the upstream stakeholder model that existing methodologies lack, creating the architectural precondition for a derivation pipeline from stakeholder modeling through interaction specification to experiential discovery — though the derivation method itself remains an open design problem.

## 1. The Problem: Specification Without Experience

Software development methodologies excel at specifying behavior. BDD scenarios describe what a system should do. TDD tests verify that it does. Acceptance criteria confirm business rules are met. But a system can satisfy every scenario, pass every test, and meet every criterion while remaining hostile, confusing, or unusable to the stakeholders it was built for.

The gap is not in what the system *does* but in how stakeholders *experience* it. A sound designer needs to select a cue by clicking, but clicking must coexist with drag-to-reorder — and no scenario specifies that these are competing pointer interactions requiring an activation threshold. An emergency operator needs to open a show file under pressure, but nothing in the specification addresses whether the dialog is discoverable when the show is live.

RDD's current pipeline runs RESEARCH through BUILD with scenarios as the connective thread. Scenarios specify behavior at the business-rule level. Implementations jump to the technical level. The intermediate concern — the mechanics of how a stakeholder of a particular role, with particular goals, actually works through the interface — remains unwritten. And nothing in the pipeline asks: what happens when someone actually *uses* what was built?

Two GitHub issues (nrgforge/rdd #4 and #7) independently surfaced this gap from different angles. Issue #7 identified the missing interaction layer from the specification side: a concrete class of bugs where scenarios pass but interaction mechanics are broken. Issue #4 proposed a "play" phase from the experiential side: structured inhabitation of stakeholder roles to discover what specs missed. The research reported here investigated whether these are independent concerns or facets of a single problem.

## 2. The Interaction Specification Layer

### A Well-Documented Convergence

Every community that has seriously engaged with UI acceptance testing has independently arrived at the same structural observation: there is a missing layer between business-rule scenarios and technical implementation.

Gojko Adzic named the problem in 2010 as three hierarchical levels: **business rule** (what the system should do), **workflow** (how users work through the interface), and **technical activity** (concrete automation steps). Most teams implement only levels one and three, wondering why their test suites are fragile. The workflow level — more stable than technical steps, more concrete than business rules — is the specification that gets skipped.

The **Screenplay Pattern** (Marcano & Palmer 2007-2009; Smart & Molak 2023) formalizes this as an architectural pattern: Goal (scenario language) → Task (business workflow step, stable) → Interaction (UI mechanism, changeable) → Ability (integration library, swappable). The pattern draws explicitly on **Hierarchical Task Analysis** (Annett & Duncan 1967), which decomposes human activities into nested hierarchies: Goal → Plan → Operation. The isomorphism between HTA and Screenplay is structural, not genealogical — the testing and ergonomics communities converged independently, which is good evidence the decomposition tracks a real structural problem. No empirical study has yet verified whether teams that adopt a formal workflow layer produce more stable test suites than those that do not; the stability claim remains practitioner consensus rather than measured outcome.

Kevin Lawrence's 2007 AAFTT talk preceded the Screenplay Pattern in articulating the interaction design vocabulary: he proposed that test automation should work at the Activities level (what users are trying to accomplish) rather than the Tasks level (what buttons they click). This is the same cut Adzic would later articulate as workflow vs. technical activity.

Silva, Winckler, and Trætteberg's 2019 SEKE paper represents the only academic work formally connecting HTA-style task models to BDD, treating the task model as the intermediate layer between user story and executable test. Kent Dodds's Testing Trophy and Testing Library converge from the component testing side on the same principle — test at the level of user behavior, not implementation details — though without a formal specification artifact.

### The Persona-to-Actor Gap

The sharpest finding from the interaction specs literature is what remains unaddressed: **the pipeline from stakeholder model to interaction specification is assumed everywhere and designed nowhere.**

The Screenplay Pattern names actors after personas. BDD scenarios reference user roles. HTA decomposes operator tasks. But none of these provides a systematic method for deriving task decompositions from a stakeholder model — from *who users are* (their roles, goals, mental models, constraints) to *what tasks they perform* at the specification layer.

RDD's product discovery phase is positioned to supply the upstream input that no existing methodology provides. Discover already surfaces stakeholders, jobs, mental models, value tensions, and (as of v0.2.0) the solution space. Interaction specs would derive the task decomposition from those stakeholder models, encoding how each stakeholder works with the solution. The Screenplay Pattern provides the downstream architecture; product discovery provides the upstream input. The missing middle — the *derivation method* from stakeholder model to task decomposition — is an open design problem, not a solved one. The contribution at this stage is the identification of the gap and the architectural precondition, not the complete pipeline.

## 3. Play as Epistemic Inquiry

### A Different Kind of Gap

The interaction specification layer addresses the *specification* side of the gap: how to write down the mechanics of interaction. But even a perfect specification leaves something unaddressed. Suchman (1987) demonstrates this most clearly: the gap between plan and situated action is *constitutive*, not correctable. Plans are resources for action, not blueprints. Any built system contains an irreducible gap between what was specified and what the system is when encountered in use — not because the build was imperfect, but because specification and use are different kinds of activity.

No amount of better specs eliminates this gap. What it requires is a different mode of engagement: one that inhabits the gap intentionally, discovering what emerges when situated action diverges from the plan. The research finds strong convergence across five disciplines that this mode is *play*.

### What Play Theory Claims About Knowing

The classical play theorists are commonly read as philosophers of leisure. But the epistemic dimension of their accounts is central, not incidental.

**Huizinga** (1938) defines play as "a free activity standing quite consciously outside 'ordinary' life." The magic circle — play's bounded space — is not a restriction but a liberation from the stakes that prevent genuine encounter. Inside the circle, a different kind of knowing is possible, one foreclosed by the consequences of ordinary action.

**Caillois** (1961) introduces the paidia-ludus continuum: paidia is unstructured, spontaneous, improvisatory play; ludus is rule-bound, calculated, goal-directed. The proposed play phase sits closer to paidia than ludus — structured enough to be productive, free enough to discover. Caillois also identifies **mimicry** (role-playing, simulation) as one of four fundamental play types, directly relevant to stakeholder inhabitation.

**Sutton-Smith** (1997) makes the most explicit epistemic claim: play's biological function is **adaptive variability** — preserving behavioral flexibility against the rigidity that sets in after successful adaptation. A system that has passed all its scenarios has achieved a kind of rigidity: the spec says it is done. Play resists that rigidity by reintroducing variability.

**Winnicott** (1971) provides the deepest structural account. Play occurs in **potential space** — a transitional area between inner reality and outer reality, between what the builder intended and what the built thing actually is. "It is in playing and only in playing that the individual child or adult is able to be creative and to use the whole personality, and it is only in being creative that the individual discovers the self." Winnicott contrasts creative apperception (encountering the world as something to be engaged and remade) with compliance (fitting oneself to a world that demands only adaptation). A practitioner who has just built a system to specification has been in compliance mode. The play phase is a deliberate shift to creative apperception — and Bateson's play frame is the methodological mechanism that produces this shift. The metacommunicative declaration "this is play" is what moves the practitioner from Winnicott's compliance to creative apperception.

**Gadamer** (1960/1975) adds a crucial inversion: in play, the artifact has ontological priority over the practitioner. "Participants are 'played' by the event rather than controlling it." The system discloses itself through being played with. The practitioner's role is to attend to what the system shows rather than extract answers to predetermined questions. This is the ontological distinction between play and testing: testing is practitioner-directed toward a known question; play is disclosure by encounter.

### Design Theory and Situated Action

**Schon** (1983) describes how the situation "talks back" when a designer engages it experimentally. Reflection-in-action is the practitioner attending to that back-talk and reframing in response. Testing listens for specific answers. Play attends to *all* the back-talk — including responses the practitioner did not design into the question.

**De Certeau** (1984) distinguishes strategies (the designed system's intended use) from tactics (how actual users navigate, subvert, and repurpose that design). "Consumption becomes a hidden form of production." Play is the structured invitation to discover tactical subversions before real users do.

**Sicart** (2014) connects this directly to designed systems: play appropriates systems against the grain of their intended logic, surfacing meanings that exceed designer intent. Though Deterding (2015) rightly notes that this raises the epistemic distance problem — can a developer truly subvert their own design? — the play phase can address this through explicit techniques: inhabiting unfamiliar stakeholder roles, applying deliberate inversions, and inviting external participants.

### Performance: Inhabitation as Discovery

**Boal's** Forum Theatre (1974) provides the most direct model. The **spect-actor** steps into a performance and discovers "all possible paths" — not to show the correct path but to discover alternatives through inhabitation. The explicit purpose is discovery through practice, not verification of an existing script.

**Spolin** (1963) solves the structure problem with the **point of concentration**: a single focusing constraint that paradoxically enables freedom. Each play session has a focus — a stakeholder, a job, an inversion — but freedom within that focus. This resolves the paidia-ludus tension: enough structure to be productive, enough freedom to discover.

**Bateson** (1955) explains why the frame matters: "the playful nip denotes the bite, but it does not denote what would be denoted by the bite." The play frame is not an attitude but a metacommunicative declaration that changes what actions *mean*. The same click in testing means "verify the spec." The same click in play means "what happens if I do this?"

**Bruner** (1972) provides the safety principle: "play implies a reduction in the seriousness of the consequences of errors." Play is consequence-free for the codebase. It observes and records. Fixes go through the normal cycle.

### Play Is Not Exploratory Testing

The closest existing software practice is exploratory testing (Bach 1993 onward), and the distinction matters. Exploratory testing is simultaneous learning, test design, and test execution — a creative, skilled practice. But it remains within the verification frame: its charters aim at defect discovery and risk uncovering. The tester asks "where might this system fail?" and explores to find the answer.

Play operates in a different frame entirely. Bateson's metacommunicative signal — "this is play" — changes what actions mean. The practitioner is not looking for defects; the practitioner is attending to whatever the system discloses when encountered freely. Gadamer's ontological priority applies: the system reveals itself through engagement rather than being interrogated by the practitioner's predetermined questions. Where exploratory testing discovers what is *broken*, play discovers what is *missing, surprising, or unintended* — including things that work perfectly but reveal an assumption no one examined.

## 4. The Unified Thread: Discover Through Play

### Not Separable After All

The initial hypothesis was that interaction specs and play are independent concerns — one a specification problem, the other an epistemological mode. The research does not support this clean separation.

The persona-to-actor gap reveals the connection. Interaction specs need stakeholder models to derive task decompositions from. Play needs interaction specs to know what the *intended* mechanics were, so it can discover where lived experience diverges. The thread runs:

```
Discover          →  Interaction Specs  →  Build  →  Play
(who, why,           (how they work        (make    (inhabit those
 solution space)      with it)              it)      stakeholders,
                                                     discover what's
                                                     missing)
```

Each feeds the next. Play feeds back to all prior phases: missing scenarios return to DECIDE, usability friction returns to DISCOVER as new value tensions, challenged assumptions return to DISCOVER as inversions, new questions return to RESEARCH, and interaction gaps return to the spec layer.

This feedback is not one-time post-build reporting — it is the mechanism that sustains the pipeline across cycles. When play surfaces a challenged assumption that returns to DISCOVER, it may initiate a new RDD cycle: new research, revised stakeholder models, updated interaction specs, another build, another round of play. Play's feedback into discover makes play the pre-condition for the next discover phase, giving the pipeline its loop character.

### Discover and Play as Epistemic Bookends

The structural parallel is the heart of the proposal. Discover and play are epistemic bookends around the pragmatic center of the pipeline:

- **Discover** inverts assumptions about *what to build*. It surfaces stakeholders, their needs, their mental models, and the value tensions between them. It asks: who is this for, what do they need, and what are the assumptions being made about them?
- **Play** inverts assumptions about *what was built*. It inhabits those same stakeholders and discovers where the built reality diverges from the specified intention. It asks: what is it like to *be* these stakeholders using this system, and what did the specs miss?

Both are epistemic, not pragmatic. Both produce understanding through generation, not review. Both surface tacit knowledge. Both feed back into the pipeline rather than producing a final deliverable. Both serve Invariant 0 from the "who it was built for" dimension — the product side of authority.

The interaction spec layer is the connective tissue: it translates discover's stakeholder models into the mechanics of use, giving play something to discover deviations from.

### Why Play Must Precede Synthesis

The positioning of play between BUILD and SYNTHESIS has theoretical support. Synthesis extracts publishable insight from the artifact trail — but the trail produced by BUILD is a trail of *conformance*. It shows what was built against what was specified. The assumption-denials that make synthesis interesting (in Murray Davis's sense) are often not visible in the conformance record. They are visible in what the system does when encountered freely.

Winnicott's potential space makes the deeper argument: synthesis — genuine discovery — requires the practitioner to have inhabited the intermediate area between what was planned and what was made. Play is that inhabitation. Without it, synthesis is reporting; with it, synthesis is discovery.

## 5. Structural Implications

### The Play Phase: Inhabit, Explore, Reflect

Play has a natural three-movement structure paralleling synthesis (journey review → novelty surfacing → framing):

1. **Inhabit** — Choose a stakeholder from the product discovery artifact. Enter their perspective, their mental model, their goals. (Caillois's mimicry as epistemological act.)
2. **Explore** — Use the system as that stakeholder, with a point of concentration (Spolin) but freedom to wander. Follow curiosity, not a checklist. Let the situation talk back (Schon).
3. **Reflect** — What was discovered? What surprised? Where did the system resist the stakeholder's intent? Categorize discoveries by where they feed back.

Repeat per stakeholder, or for as many as prove productive. Not every stakeholder needs equal play time — the practitioner decides where to dwell.

### The Play Log

The artifact is a discovery record, not a test report. Discoveries are categorized by feedback destination:

| Category | Feeds back to |
|----------|---------------|
| Missing scenario | DECIDE |
| Usability friction | DISCOVER (value tension) |
| New question | RESEARCH or domain model |
| Challenged assumption | DISCOVER (inversion) |
| Delight | SYNTHESIS |
| Interaction gap | Interaction specs |

The play log does NOT prescribe fixes. Fixes go through the normal cycle. Play observes and records. This preserves Bruner's "reduction in the seriousness of consequences."

### The Epistemic Gate

Play itself is the epistemic act — like synthesis, where the conversation IS the gate (ADR-016). The gate is intentionally thin: the practitioner's judgment about when play has produced sufficient discovery, not a checklist of coverage. This mirrors synthesis's own gate structure, where the three-phase conversation *is* the epistemic work and there is no separate verification step.

A cross-cutting reflection at the end of play asks: which stakeholder had the hardest time? What did play reveal that the specs missed? How has the practitioner's understanding of the system shifted after inhabiting it as these stakeholders? The question of "enough play" is answered the same way "enough synthesis" is: when the practitioner's felt sense is that discovery has plateaued and the play log contains material worth acting on.

### Interaction Specs in DECIDE/ARCHITECT

Interaction specifications sit between scenarios and implementation, specifying the mechanics of how each stakeholder works with the system. They derive task decompositions from product discovery's stakeholder models (filling the persona-to-actor gap) and provide the intermediate layer that Adzic, the Screenplay Pattern, and HTA all identify as missing. The specific artifact structure and placement (DECIDE vs. ARCHITECT) is a decision for the next pipeline phase.

## 6. Invariant Tensions

**Invariant 0** (authority over what was built, who it was built for, and why): Play directly serves the "who it was built for" dimension. Inhabiting stakeholders builds the practitioner's authority to speak about the stakeholder experience — authority that scenarios and tests alone cannot provide.

**Invariant 3** (pragmatic actions may be automated; epistemic actions may not): Interaction specs are pragmatic — the agent can draft them from discover's stakeholder models. Play is epistemic — the practitioner must do it. The boundary is clean: the agent sets the stage (drafts interaction specs, prepares the play log template, presents stakeholder profiles), the practitioner enters the magic circle.

**Invariant 4** (epistemic cost must remain lightweight): Play could be unbounded — there is always another stakeholder to inhabit, another angle to explore. The phase needs a pragmatic bounding mechanism: perhaps time-boxed sessions per stakeholder (Spolin's theater games are 3-5 minutes each), or the practitioner's felt sense that discovery has plateaued. This tension requires a design decision, not more research.

**Epistemic distance** (Deterding's critique of Sicart): This is the structural tension the play phase must address head-on. The entire epistemic value of play depends on the practitioner being able to genuinely inhabit unfamiliar stakeholder roles and encounter their own design with fresh eyes. Can a developer truly subvert a system they built themselves?

The working hypothesis: the three-movement structure (inhabit → explore → reflect), combined with discover's stakeholder profiles as anchoring material and the Inversion Principle applied to interaction assumptions, provides practical mitigation. The practitioner is not asked to become a stranger to their own work — they are asked to enter Bateson's play frame, where the same actions carry different meaning, and to use Spolin's point of concentration to focus attention on a stakeholder role that is not their own. Product discovery's stakeholder maps, jobs, and mental models supply the concrete material for inhabitation — the practitioner is not improvising a persona from nothing but stepping into a role the pipeline has already characterized. This does not eliminate the distance problem, but it reduces it from "imagine a user you've never met" to "inhabit a stakeholder whose needs, goals, and mental model the discover phase has already surfaced."

**Invariant 6** (scaffolding must fade): As the practitioner's understanding grows across RDD cycles, does play change? Presumably: early cycles involve deep play across many stakeholders; later cycles focus play on the stakeholders or interactions that changed. Play may also fade entirely when the practitioner *is* the stakeholder — when the system is being built for oneself. This is worth tracking as an open question.

## 7. Open Questions

1. **Where exactly do interaction specs live?** DECIDE (alongside scenarios) or ARCHITECT (alongside system design)? The Screenplay Pattern's SOLID architecture suggests ARCHITECT; the derivation from stakeholder models suggests DECIDE.
2. **What is the interaction spec artifact format?** Adzic's workflow layer, Screenplay's Task definitions, or something RDD-specific that integrates with the existing scenario format?
3. **How is play bounded?** Time-boxed sessions? Stakeholder-count limits? Felt saturation? The Invariant 4 tension needs a concrete resolution.
4. **Does play change across RDD cycles?** Fading (Invariant 6) suggests it should, but the mechanism is unspecified.
5. **How does play interact with the build phase's undecided-territory detection?** Play may surface undecided territory that the build phase's current detection mechanism (v0.2.0) does not catch — interaction-level undecided territory specifically.

## Sources

- Huizinga, J. (1938). *Homo Ludens*
- Caillois, R. (1961). *Man, Play and Games*
- Sutton-Smith, B. (1997). *The Ambiguity of Play*
- Winnicott, D. W. (1971). *Playing and Reality*
- Gadamer, H.-G. (1960/1975). *Truth and Method*
- Sicart, M. (2014). *Play Matters*
- Bateson, G. (1955/1972). "A Theory of Play and Fantasy." In *Steps to an Ecology of Mind*
- Schon, D. (1983). *The Reflective Practitioner*
- Suchman, L. (1987). *Plans and Situated Actions*
- de Certeau, M. (1984). *The Practice of Everyday Life*
- Boal, A. (1974/1979). *Theatre of the Oppressed*. Pluto Press
- Spolin, V. (1963). *Improvisation for the Theater*
- Bruner, J. (1972). "Nature and Uses of Immaturity." *American Psychologist*, 27, 687-708
- Johnstone, K. (1979). *Impro: Improvisation and the Theatre*
- Buxton, B. (2007). *Sketching User Experiences*
- Dewey, J. (1934). *Art as Experience*
- Frayling, C. (1993). "Research in Art and Design." *Royal College of Art Research Papers*
- Deterding, S. (2015). "A Manifesto, With Footnotes" (review of Sicart's *Play Matters*). *Game Studies* 15(1)
- Adzic, G. (2010). "How to implement UI testing without shooting yourself in the foot"
- Smart, J. F. & Molak, J. (2023). *BDD in Action*, 2nd Ed. Manning
- Marcano, A. & Palmer, A. (2007-2009). The Screenplay Pattern (first published as JNarrate; formalized in Molak et al. 2016)
- Lawrence, K. (2007). "In Praise of Abstraction." AAFTT workshop
- Annett, J. & Duncan, K. D. (1967). "Task Analysis and Training Design." *Occupational Psychology*
- Stanton, N. A. (2006). "Hierarchical Task Analysis." *Applied Ergonomics*, 37(1)
- Silva, T. R., Winckler, M., & Trætteberg, H. (2019). "Extending BDD for Assessing UI Design Artifacts." SEKE 2019
- Molak, J., Marcano, A., Smart, J. F., & Palmer, A. (2016). "Beyond Page Objects." InfoQ
- North, D. (2006). "Introducing BDD." *Better Software*
- Dodds, K. C. (2018-2021). Testing Trophy / Testing Library
- Pruitt, J. & Grudin, J. (2003). "Personas: Practice and Theory." DUX 2003
- Davis, M. S. (1971). "That's Interesting!" *Philosophy of the Social Sciences*, 1(2), 309-344
- Koskinen, I. et al. (2011). *Design Research Through Practice*

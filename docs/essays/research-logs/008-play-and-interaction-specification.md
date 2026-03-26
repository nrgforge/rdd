# Research Log: Play and Interaction Specification in RDD

## Question 1: What is the structural relationship between stakeholder modeling, interaction specification, and exploratory use — and does existing literature treat them as a connected pipeline or as independent concerns?

**Method:** Web search (8 queries), 2 lit-reviewer agents dispatched (pending)

**Findings:**

The literature treats these as related but distinct concerns that originate in different intellectual communities. The research reveals two separable problems and a theoretical bridge between them.

### Problem 1: The Interaction Specification Gap (a BUILD/DECIDE concern)

Multiple communities converge on the same missing layer between business-rule scenarios and technical implementation:

- **Adzic's three-layer model** (2010): business rule → workflow → technical activity. The workflow layer specifies what the user does through the interface — more concrete than acceptance criteria, more stable than CSS selectors. RDD's scenarios live at layer 1; implementations jump to layer 3; layer 2 is missing.

- **Screenplay Pattern** (Marcano & Palmer 2007; Smart & Molak, *BDD in Action 2nd Ed* 2023): formalizes the same structure as Goals → Tasks → Interactions. Draws explicitly on Hierarchical Task Analysis (Annett & Duncan, 1967) from the UX/human factors community. The key insight: goals and tasks are stable; interactions change with the UI framework.

- **Testing Trophy** (Kent C. Dodds): integration tests > unit tests for UI work. Testing Library philosophy: "test the way users use it." Both point toward an interaction-level specification that current BDD doesn't capture.

This is fundamentally a **specification problem** — how to specify the mechanics of user interaction (clicks coexist with drags, selection coexists with reorder) in a way that's abstract enough to be stable but concrete enough to catch the PointerSensor class of bugs. It belongs in the DECIDE or ARCHITECT phase, enriching what BUILD works against. It does not require a new pipeline phase.

### Problem 2: Play as a Mode of Inquiry (the proposed new phase)

A separate body of literature — play theory, design theory, critical theory, and performance — treats play as a fundamentally different epistemological mode from testing or verification:

**Play theory:**
- **Huizinga** (*Homo Ludens*, 1938): Play creates a "magic circle" — a separate space with its own rules where a different kind of knowing occurs. Play is "a free activity standing quite consciously outside 'ordinary' life."
- **Caillois** (*Man, Play and Games*, 1961): The paidia-ludus continuum. Paidia = "diversion, turbulence, free improvisation, and carefree gaiety." Ludus = rule-bound, calculated skill. RDD's proposed "play" lives closer to paidia than ludus — structured enough to be productive, free enough to discover. Caillois also identifies **mimicry** (simulation/role-playing) as one of four fundamental play types — directly relevant to stakeholder inhabitation.
- **Sutton-Smith** (*The Ambiguity of Play*, 1997): Play's biological function is **adaptive variability** — preserving behavioral flexibility against the rigidity that sets in after successful adaptation. Maps directly to resisting the rigidity of "the spec says it's done."
- **Winnicott** (*Playing and Reality*, 1971): Play occurs in "potential space" — a transitional area between inner reality and outer reality, between what the builder intended and what the built thing actually is. "It is in playing and only in playing that the individual is able to be creative and to use the whole personality, and it is only in being creative that the individual discovers the self."
- **Sicart** (*Play Matters*, 2014): Play is appropriation — "play can harness its appropriative capacities to identify and subvert sociocultural structures." Designers should "become architects of play, creating contexts and props for people to explore." Play as the deliberate invitation to subvert the designed system.

**Design theory:**
- **Schon** (*The Reflective Practitioner*, 1983): Reflection-in-action as the mode where "doing extends thinking in the tests, moves, and probes of experimental action." Using an artifact reveals implications for the design that specification could not — "the situation talks back."
- **Buxton** (*Sketching User Experiences*, 2007): The sketch-prototype distinction. Sketches are for discovery (suggestive, exploratory, ambiguous); prototypes are for validation (specific, didactic, refined). Play operates in sketch mode on a finished product — the paradox of exploring a completed thing as if it were unfinished.
- **LEGO Serious Play**: Constructionist approach where "deeper knowledge emerges when people actively construct meaningful artifacts that can be shared and discussed." Hands-on interaction surfaces tacit knowledge that discussion cannot.

**Critical theory and situated action:**
- **de Certeau** (*The Practice of Everyday Life*, 1984): Strategies vs. tactics. Strategies are the designed system's intended use. Tactics are how actual users navigate, subvert, and repurpose that design. "Consumption becomes a hidden form of production." Play is the structured invitation to discover tactical subversions before real users do.
- **Suchman** (*Plans and Situated Actions*, 1987): Plans (specifications) are resources for action, not blueprints. The gap between plan and situated use is irreducible — "we never fully specify a plan." Play inhabits this gap intentionally, discovering what emerges when situated action diverges from the plan.

**Performance and devising:**
- **Boal** (*Theatre of the Oppressed*, 1974): Forum Theatre and the "spect-actor" — the audience member who steps into the performance to discover "all possible paths." Not to show the correct path but to discover alternatives. The explicit purpose is discovery through inhabitation, not verification of an existing script.
- **Scandinavian participatory design** (1970s-): Design games and cooperative workshops where stakeholders and designers play through interactions together. Democracy and conflict as design resources.

### The Structural Connection: Discover and Play as Epistemic Bookends

The literature does not treat these as a connected pipeline — but the structural parallel is striking:

- **Discover** inverts assumptions about *what to build* (pre-build). Driven by the Inversion Principle applied to product assumptions.
- **Play** would invert assumptions about *what was built* (post-build). Driven by inhabiting the system as each stakeholder and discovering where the built reality diverges from the specified intention.

Both are **epistemic acts**, not pragmatic ones. Both produce understanding through generation, not review. Both surface tacit knowledge. Both feed back into the pipeline rather than producing a final deliverable.

The interaction specification question is a different layer entirely — it makes BUILD better by specifying mechanics, but it doesn't replace the epistemic function of play. Interaction specs are to play what scenarios are to synthesis: the structured specification that the exploratory phase transcends.

**Key theoretical insight:** There is robust convergence across play theory (Huizinga, Caillois, Sutton-Smith, Winnicott, Sicart), design theory (Schon, Buxton), critical theory (de Certeau, Suchman), and performance (Boal) that play is a fundamentally different epistemological mode from testing:

| | Testing | Play |
|---|---------|------|
| Question | Does it match the spec? | What happens if I do this? |
| Mode | Verification | Discovery |
| Relationship to spec | Confirms known expectations | Generates new ones |
| Outcome | Pass/fail | Insight/question |
| Stance | Engineer | Inhabitant |
| Equivalent in RDD | BUILD (scenarios drive tests) | Proposed PLAY phase |

**Implications:**
1. The interaction specification gap and the play phase are two distinct proposals that happen to be related through their shared concern with stakeholder experience
2. Interaction specs enrich DECIDE/BUILD; play is a new pipeline phase with its own epistemic character
3. Play's theoretical grounding is strong — the convergence across disciplines suggests this is a real epistemological mode, not just a metaphor for testing
4. The discover-play parallel (assumption inversion pre-build and post-build) gives the pipeline a symmetry that the current design lacks
5. Suchman's insight is perhaps the deepest: the gap between specification and situated use is *irreducible*. Play doesn't close it — play *inhabits* it intentionally

### Lit Review Integration (completed)

Two systematic lit reviews have been completed. Full reports at:
- `lit-review-interaction-specs.md` (20 sources, 8 primary source fetches)
- `lit-review-play-as-inquiry.md` (20 sources across play theory, design research, improvisation, philosophy)

**Key additions from the interaction specs review:**

1. **Kevin Lawrence** (2007, AAFTT workshop) preceded Marcano in articulating interaction design vocabulary for test automation. The genealogy: Lawrence (2007) → Marcano/Palmer (JNarrate 2007-2009) → Molak ("Journey Pattern" 2013) → Smart/Molak (2016 InfoQ, 2023 *BDD in Action 2nd Ed*).

2. **Silva, Winckler & Trætteberg** (2019, SEKE) — the only academic work formally connecting HTA-style task models to BDD as a consistency mechanism. Treats the task model as the intermediate layer between user story and executable test.

3. **HTA's P×C stop rule** (Annett & Duncan 1967) — a principled answer to "how fine-grained should the task layer be?" Decompose when probability of failure × cost of failure exceeds a threshold. The BDD literature lacks this pragmatic stop criterion.

4. **The persona-to-actor gap** — the sharpest finding. The Screenplay Pattern names actors after personas but provides no method for deriving task decompositions from stakeholder models. This pipeline — from *who users are* to *what tasks they perform* — is "assumed everywhere and designed nowhere." **This is precisely where RDD's product discovery phase could fill the gap**: discover surfaces stakeholders, jobs, and mental models; interaction specs would derive task decompositions from those stakeholder models.

**Key additions from the play review:**

1. **Gadamer** (*Truth and Method*, 1960) — a major theoretical addition. In play, the artifact has ontological priority over the practitioner: "participants are 'played' by the event rather than controlling it." The system discloses itself through engagement; the practitioner does not direct what is revealed. This distinguishes play from testing at the *ontological* level, not just the procedural. Testing is practitioner-directed; play is disclosure by encounter.

2. **Dewey** (*Art as Experience*, 1934; "Qualitative Thought", 1930) — "pervasive quality" as a felt sense orienting inquiry. The practitioner in play attends to something they cannot fully articulate but that guides their attention. Not operationalizable directly, but justifies why the phase matters.

3. **Frayling** ("Research in Art and Design", 1993) — the taxonomy of research *into*, *for*, and *through* design. Play is research *through* the built artifact: knowledge produced through engaging with it, not extracted by reading it.

4. **The four-axis distinction** — the review identifies four axes separating play from testing:
   - *Frame and purpose*: testing has predetermined questions; play attends to whatever the system discloses (Bateson)
   - *Who has priority*: testing is practitioner-directed; play gives the artifact Gadamerian priority
   - *Source of value*: testing produces pass/fail; play produces encounters with Suchman's constitutive gap
   - *Relationship to assumptions*: testing checks inside the assumption structure; play subverts it (de Certeau, Sicart)

5. **Why play must precede synthesis** (Winnicott) — synthesis requires passing through potential space, the intermediate area where creative apperception lives. Without play, synthesis is reporting. With play, synthesis is discovery. The play phase produces the experiential raw material that makes synthesis interesting.

6. **Limitation: epistemic distance** (Deterding 2015) — can a developer truly subvert their own design? The play phase may need explicit techniques for achieving epistemic distance: inhabiting unfamiliar roles, applying deliberate inversions, inviting external participants.

7. **No existing software methodology** operationalizes play as a post-build epistemic phase. The proposed RDD play phase would be a genuine methodological contribution.

---

## Question 2: What would play look like structurally as an RDD phase — artifact, gate, relationship to synthesis, and degree of structure?

**Method:** Web search (4 queries), structural analysis against existing RDD phases

**Findings:**

Three additional sources sharpen the structural picture:

- **Bateson** ("A Theory of Play and Fantasy," 1955): Play requires **metacommunication** — a signal ("this is play") that reframes all subsequent actions. "The playful nip denotes the bite, but it does not denote what would be denoted by the bite." Entering play is not just an attitude; it's a frame shift that changes what actions *mean*. The same click in testing means "verify the spec." The same click in play means "what happens if I do this?"

- **Spolin** (*Improvisation for the Theater*, 1963): The **point of concentration** — a single focusing constraint that paradoxically enables freedom. "By keeping their eyes on the ball and staying within the rules, the players free themselves to act spontaneously and creatively." This solves the paidia-ludus design problem: enough structure to be productive, enough freedom to discover.

- **Bruner** ("Nature and Uses of Immaturity," 1972): "Play implies a reduction in the seriousness of the consequences of errors and of setbacks." Play is a low-stakes space for exploration. In the RDD context: play does not fix, does not commit, does not ship. It observes and records. Fixes go through the normal cycle.

### Structural Proposal: Play as RDD Phase

**Position in pipeline:**
```
... → BUILD → PLAY → SYNTHESIS → ...
```

**Phase character:** Play is to post-build discovery what synthesis is to post-build narrative. Synthesis asks "what's the story worth telling?" Play asks "what's the experience of actually using this thing?" Both are epistemic, both are generative, both feed the artifact trail.

### Three-movement structure (parallel to synthesis)

Like synthesis (journey review → novelty surfacing → framing), play has a natural three-movement arc:

1. **Inhabit** — Choose a stakeholder from the product discovery artifact. Enter their perspective. What are they trying to do? What's their mental model? What do they see first, reach for first? (Caillois's *mimicry* — role-playing as an epistemological act, not a testing technique)

2. **Explore** — Use the system as that stakeholder, with a *point of concentration* (Spolin) but freedom to wander. The point of concentration might be a job from product discovery, a scenario approached from a different angle, or an explicit inversion ("what if this stakeholder doesn't read the instructions?"). The key: follow curiosity, not a checklist. Let the situation talk back (Schon).

3. **Reflect** — What was discovered? What surprised? Where did the system resist the stakeholder's intent? Where did it delight? Categorize discoveries (see Artifact below). This is the moment where play becomes knowledge.

Repeat for each stakeholder, or for as many as feel productive. Not every stakeholder needs equal play time — the user decides where to dwell.

### Artifact: Play Log

The play log is a discovery record, not a test report. Structured by stakeholder, with discoveries categorized:

| Category | Description | Feeds back to |
|----------|-------------|---------------|
| **Missing scenario** | A behavior that should be specified but isn't | → DECIDE (new scenarios) |
| **Usability friction** | Something works but feels wrong | → DISCOVER (new value tension) |
| **New question** | Something not yet understood | → RESEARCH or domain model open questions |
| **Challenged assumption** | Something assumed that might be wrong | → DISCOVER (assumption inversion) |
| **Delight** | Something that works better than expected | → SYNTHESIS (raw material for narrative) |
| **Interaction gap** | The interaction mechanics are unspecified or surprising | → DECIDE/ARCHITECT (interaction spec) |

The play log does NOT prescribe fixes. Fixes go through the normal cycle. Play observes and records. This preserves Bruner's "reduction in the seriousness of consequences" — play is consequence-free for the codebase.

### Epistemic Gate: Play IS the Epistemic Act

Like synthesis, where the three-phase conversation IS the gate (ADR-016), play itself is the epistemic act. The user inhabiting stakeholders, exploring freely, and reflecting on discoveries is the most generative thing this phase can ask for.

But there's a natural gate moment at the *end* of play (after all stakeholders have been explored): the user reflects on what the play session revealed about the system as a whole. This is not per-stakeholder — it's a cross-cutting reflection:

- "Which stakeholder had the hardest time? Why?"
- "What did play reveal that the specs missed?"
- "How has your understanding of the system shifted after using it as these stakeholders?"

This final reflection is what distinguishes play from undirected noodling. It's the moment where experiential discoveries crystallize into communicable insight — which then enriches synthesis.

### Relationship to Synthesis

Without play, synthesis reflects only on what was *planned and built* — the artifact trail of essays, models, decisions, and scenarios. With play, synthesis also has *experiential discoveries* — the things that emerged from inhabiting the system. Play enriches the artifact trail with lived experience.

The play log may contain the most interesting raw material for synthesis: it captures surprises, frictions, and delights that no specification predicted. These are candidate novelty signals (the dead discoveries that synthesis exists to extract).

### Relationship to Discover (the symmetry)

| | Discover (pre-build) | Play (post-build) |
|---|---------------------|-------------------|
| **Asks** | Who are the stakeholders? What do they need? | What's it like to BE those stakeholders using this? |
| **Inverts** | Assumptions about what to build | Assumptions about what was built |
| **Surfaces** | Value tensions, stakeholder maps, jobs | Missing scenarios, friction, delight, challenged assumptions |
| **Feeds** | MODEL → DECIDE → ARCHITECT → BUILD | DISCOVER / DECIDE / RESEARCH (feedback) and SYNTHESIS (forward) |
| **Mechanism** | Interview, analysis, inversion exercises | Inhabitation, free exploration, reflection |

### Degree of Structure: Spolin's Resolution

The paidia-ludus continuum is the core design tension. Too structured → testing. Too free → undirected. Spolin's point of concentration resolves it: each play session has a *focus* (a stakeholder, a job, an inversion) but *freedom within that focus*.

This maps to how synthesis uses structural experiments: the framing conversation provides focus (four dimensions to navigate), but the experiments are free explorations within those dimensions. Play provides focus (stakeholder + job), but the exploration is free within that frame.

Bateson's metacommunicative frame explains why this works: the signal "this is play" changes the epistemological mode. Structure within that frame (the point of concentration) constrains without collapsing the frame back into testing.

### The Interaction Spec Connection

Interaction specs (Issue #7) and play (Issue #4) are related but separable:

- **Interaction specs** specify HOW stakeholders work with the system — the mechanics (clicks, drags, thresholds). They enrich DECIDE/ARCHITECT/BUILD. They make the build more faithful to the intended interaction.
- **Play** discovers where the built system and the specified interaction *diverge from lived experience*. No spec is complete (Suchman). Play inhabits the gap.

Interaction specs make build better. Play makes the *understanding* better. The "interaction gap" category in the play log is the bridge: when play discovers an unspecified interaction mechanic, it feeds back to the spec layer.

**Implications:**
1. Play has a natural three-movement structure (inhabit → explore → reflect) that parallels synthesis
2. The play log is a discovery record categorized by feedback destination, not a test report
3. Play itself is the epistemic act — the gate is the cross-cutting reflection at the end
4. Spolin's point of concentration resolves the structure problem: focus without constraint
5. Bateson's frame theory explains why "this is play" is not just a label but an epistemological mode shift
6. The discover-play symmetry gives the pipeline a coherent bookend structure around build

## Sources

- Huizinga, J. (1938). *Homo Ludens*
- Caillois, R. (1961). *Man, Play and Games*
- Sutton-Smith, B. (1997). *The Ambiguity of Play*
- Winnicott, D. W. (1971). *Playing and Reality*
- Sicart, M. (2014). *Play Matters*
- Schon, D. (1983). *The Reflective Practitioner*
- Buxton, B. (2007). *Sketching User Experiences*
- de Certeau, M. (1984). *The Practice of Everyday Life*
- Suchman, L. (1987). *Plans and Situated Actions*
- Boal, A. (1974). *Theatre of the Oppressed*
- Adzic, G. (2010). "How to implement UI testing without shooting yourself in the foot"
- Smart, J. F. & Molak, J. (2023). *BDD in Action*, 2nd Ed. Manning
- Marcano, A. & Palmer, A. (2007-2009). The Screenplay Pattern
- Annett, J. & Duncan, K. D. (1967). Hierarchical Task Analysis
- Dodds, K. C. Testing Trophy / Testing Library
- Bateson, G. (1955). "A Theory of Play and Fantasy"
- Spolin, V. (1963). *Improvisation for the Theater*
- Bruner, J. (1972). "Nature and Uses of Immaturity." *American Psychologist*, 27, 687-708
- Johnstone, K. (1979). *Impro: Improvisation and the Theatre*
- Papert, S. (1980). *Mindstorms: Children, Computers, and Powerful Ideas*
- Gadamer, H.-G. (1960/1975). *Truth and Method*
- Dewey, J. (1934). *Art as Experience*
- Dewey, J. (1930). "Qualitative Thought." *Philosophy and Civilization*
- Frayling, C. (1993). "Research in Art and Design." *Royal College of Art Research Papers*
- Koskinen, I. et al. (2011). *Design Research Through Practice*
- Deterding, S. (2015). "A Manifesto, With Footnotes" (review of Sicart). *Game Studies* 15(1)
- Lawrence, K. (2007). "In Praise of Abstraction." AAFTT workshop
- Silva, T.R., Winckler, M., & Trætteberg, H. (2019). "Extending BDD for Assessing UI Design Artifacts." SEKE 2019
- Molak, J., Marcano, A., Smart, J.F., & Palmer, A. (2016). "Beyond Page Objects." InfoQ
- North, D. (2006). "Introducing BDD." *Better Software*
- Freeman, S. & Pryce, N. (2009). *Growing Object-Oriented Software, Guided by Tests*
- Stanton, N.A. (2006). "Hierarchical Task Analysis: Developments, Applications and Extensions." *Applied Ergonomics*, 37(1)
- Pruitt, J. & Grudin, J. (2003). "Personas: Practice and Theory." DUX 2003

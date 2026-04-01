# Behavior Scenarios

## Feature: Epistemic Gates at Phase Transitions

### Scenario: RESEARCH gate presents epistemic act prompts after essay
**Given** the `/rdd-research` skill has produced an essay artifact
**When** the skill presents the essay to the user at the gate
**Then** the skill also presents 2-3 exploratory epistemic act prompts referencing specific content from the essay
**And** the prompts use open-ended, collaborative framing (not quiz-style)
**And** the skill waits for the user to respond to at least one prompt before offering to proceed

### Scenario: MODEL gate presents epistemic act prompts after domain model
**Given** the `/rdd-model` skill has produced a domain model artifact
**When** the skill presents the domain model to the user at the gate
**Then** the skill presents 2-3 epistemic act prompts referencing specific concepts and relationships from the model
**And** the skill waits for the user to respond before offering to proceed

### Scenario: DECIDE gate presents epistemic act prompts after ADRs
**Given** the `/rdd-decide` skill has produced ADRs and behavior scenarios
**When** the skill presents the ADRs to the user at the gate
**Then** the skill presents epistemic act prompts referencing specific decisions and rejected alternatives
**And** the skill waits for the user to respond before offering to proceed

### Scenario: ARCHITECT gate presents epistemic act prompts after system design
**Given** the `/rdd-architect` skill has produced a system design
**When** the skill presents the system design to the user at the gate
**Then** the skill presents epistemic act prompts referencing specific modules, boundaries, and responsibility allocations
**And** the skill waits for the user to respond before offering to proceed

### Scenario: BUILD gate presents epistemic act prompts per scenario group
**Given** the `/rdd-build` skill has completed a scenario group
**When** the skill presents the completed work to the user
**Then** the skill presents reflection-in-action or self-explanation prompts referencing the specific scenario and test outcomes
**And** the skill waits for the user to respond before proceeding to the next scenario group

### Scenario: Gate does not advance without user generation
**Given** any RDD skill has presented an artifact and epistemic act prompts at a gate
**When** the user responds with only "approved", "looks good", "yes", or similar non-generative confirmation
**Then** the skill acknowledges the approval but reiterates that the gate asks for the user's perspective on the artifact
**And** the skill re-presents the epistemic act prompts

### Scenario: AI notes factual discrepancies in user's epistemic response
**Given** a user has performed an epistemic act at any gate
**When** the user's response contains a factual discrepancy with the artifact (e.g., misattributing a concept, misstating a decision)
**Then** the AI notes the specific discrepancy without framing it as an error ("The artifact describes X as Y — your take was Z. Worth revisiting?")
**And** the AI does not attempt to assess the depth or quality of the user's understanding

## Feature: Orchestrator Epistemic Gate Protocol

### Scenario: Orchestrator gate protocol includes epistemic acts
**Given** the RDD orchestrator (`rdd/SKILL.md`) defines the stage gate protocol
**When** the orchestrator describes the gate interaction pattern
**Then** the protocol includes: present artifact, present epistemic act prompts, user responds, note discrepancies, ask whether to proceed
**And** the protocol states that no gate may consist solely of approval

### Scenario: Orchestrator workflow modes reflect epistemic gates
**Given** the orchestrator describes workflow modes (Full Pipeline, Research Only, Resume, Custom)
**When** each mode lists the gate at each phase transition
**Then** the gate description uses "epistemic gate" language, not "user approves" language

## Feature: Epistemic Responses Enrich Subsequent Phases

### Scenario: AI references user's prior epistemic response in next phase
**Given** the user performed an epistemic act at the RESEARCH gate, expressing particular emphasis or concern about a finding
**When** the `/rdd-model` skill begins the MODEL phase
**Then** the AI's domain model extraction attends to the user's stated emphasis — e.g., if the user highlighted a concept as central, the model treats it accordingly

### Scenario: Multi-session context preservation
**Given** an RDD cycle spans multiple sessions
**When** the orchestrator resumes the pipeline in a new session
**Then** the status table includes a summary of the user's key epistemic responses from prior gates
**And** the AI in the new session references these summaries when generating artifacts

## Feature: Conformance — Skill Files Implement Epistemic Gates

### Scenario: rdd-research SKILL.md contains an epistemic gate section
**Given** the `/rdd-research` skill file exists
**When** the file is read
**Then** it contains an EPISTEMIC GATE section with 2-3 exploratory prompts specific to essay artifacts

### Scenario: rdd-model SKILL.md contains an epistemic gate section
**Given** the `/rdd-model` skill file exists
**When** the file is read
**Then** it contains an EPISTEMIC GATE section with 2-3 exploratory prompts specific to domain model artifacts

### Scenario: rdd-decide SKILL.md contains an epistemic gate section
**Given** the `/rdd-decide` skill file exists
**When** the file is read
**Then** it contains an EPISTEMIC GATE section with 2-3 exploratory prompts specific to ADR artifacts

### Scenario: rdd-architect SKILL.md contains an epistemic gate section
**Given** the `/rdd-architect` skill file exists
**When** the file is read
**Then** it contains an EPISTEMIC GATE section with 2-3 exploratory prompts specific to system design artifacts

### Scenario: rdd-build SKILL.md contains epistemic gate prompts
**Given** the `/rdd-build` skill file exists
**When** the file is read
**Then** the scenario completion step includes reflection-in-action and self-explanation prompts

### Scenario: rdd orchestrator SKILL.md reflects updated gate protocol
**Given** the orchestrator skill file exists
**When** the file is read
**Then** the Stage Gates section describes the 5-step epistemic gate protocol
**And** the workflow mode descriptions use epistemic gate language

### Scenario: rdd-discover SKILL.md contains an epistemic gate section
**Given** the `/rdd-discover` skill file exists
**When** the file is read
**Then** it contains an EPISTEMIC GATE section with 2-3 exploratory prompts specific to product discovery artifacts
**And** prompts reference specific stakeholders, jobs, value tensions, or assumption inversions from the artifact

## Feature: Product Discovery Phase in Pipeline (ADR-006)

### Scenario: Orchestrator pipeline includes Product Discovery between RESEARCH and MODEL
**Given** the orchestrator (`rdd/SKILL.md`) describes the Full Pipeline workflow mode
**When** the pipeline sequence is read
**Then** PRODUCT DISCOVERY appears after UNDERSTAND (RESEARCH) and before MODEL
**And** the PRODUCT DISCOVERY phase invokes `/rdd-discover`

### Scenario: Orchestrator Available Skills table includes /rdd-discover
**Given** the orchestrator skill file exists
**When** the Available Skills table is read
**Then** it includes a row for `/rdd-discover` with purpose "Product discovery — stakeholder maps, jobs, value tensions, assumption inversions" and invocation by topic or essay

### Scenario: Orchestrator state tracking table includes PRODUCT DISCOVERY
**Given** an RDD cycle is in progress
**When** the orchestrator displays the status table
**Then** the table includes a PRODUCT DISCOVERY row between UNDERSTAND and MODEL

### Scenario: Orchestrator Artifacts Summary includes product discovery artifact
**Given** the orchestrator skill file exists
**When** the Artifacts Summary table is read
**Then** it includes a row: PRODUCT DISCOVERY | Product discovery document | `./docs/product-discovery.md`

## Feature: Product Discovery Artifact Structure (ADR-007)

### Scenario: Product discovery artifact contains five sections
**Given** `/rdd-discover` has completed forward-mode discovery
**When** the product discovery artifact (`./docs/product-discovery.md`) is read
**Then** it contains sections for: Stakeholder Map, Jobs and Mental Models, Value Tensions, Assumption Inversions, and Product Vocabulary Table
**And** all sections use user-facing language, not system vocabulary

### Scenario: Stakeholder Map includes direct and indirect stakeholders
**Given** `/rdd-discover` is producing a stakeholder map
**When** the map is complete
**Then** it identifies both direct stakeholders (who interact with the system) and indirect stakeholders (who are affected without interacting)
**And** it does not use the term "persona" for the stakeholder entries

### Scenario: Product Vocabulary Table includes stakeholder attribution
**Given** `/rdd-discover` has completed the Product Vocabulary Table
**When** the table is read
**Then** each term includes: User Term, Stakeholder (who uses this term), Context, and Notes

## Feature: Forward and Backward Operating Modes (ADR-008)

### Scenario: Forward mode produces discovery artifact from essay
**Given** no prior RDD artifacts exist for the system (greenfield)
**And** `/rdd-research` has produced an essay
**When** `/rdd-discover` runs
**Then** it operates in forward mode
**And** it reads the essay as primary input
**And** it produces the five-section product discovery artifact (ADR-007)

### Scenario: Backward mode produces product debt table from existing artifacts
**Given** prior RDD artifacts exist (domain model, ADRs, system design)
**When** `/rdd-discover` runs
**Then** it operates in backward mode
**And** it reads existing architecture, ADRs, and domain model
**And** it extracts implicit product assumptions from architectural choices
**And** it produces the five-section product discovery artifact plus a Product Debt table

### Scenario: Product Debt table maps assumption gaps
**Given** `/rdd-discover` is running in backward mode
**When** it identifies a gap between an architectural assumption and actual user need
**Then** the Product Debt table includes a row with: Assumption, Baked Into (which artifact/code encodes it), Actual User Need, Gap Type, and Resolution

### Scenario: Backward mode product debt triggers amendment propagation
**Given** `/rdd-discover` backward mode has identified product debt items
**When** a debt item affects the domain model (e.g., invalidates a concept or invariant)
**Then** the item triggers backward propagation through the existing amendment infrastructure
**And** an amendment is logged in the domain model's Amendment Log

## Feature: Product Vocabulary Provenance in Domain Model (ADR-009)

### Scenario: Domain model Concepts table includes Product Origin column
**Given** `/rdd-model` runs after `/rdd-discover` has produced a product discovery artifact
**When** the domain model Concepts table is produced
**Then** it includes a Product Origin column tracing each system term to its user-facing source

### Scenario: Infrastructure-only concepts marked without product origin
**Given** `/rdd-model` is populating the Product Origin column
**When** a system concept has no user-facing equivalent (pure infrastructure)
**Then** the Product Origin column contains "—" with a brief note explaining why

### Scenario: System concepts with multiple product origins list all sources
**Given** a system concept maps to terms used by multiple stakeholders
**When** the Product Origin column is populated
**Then** it lists all sources (e.g., "Open enrollment crunch" (Benefits Admin), "Enrollment period" (HR Manager))

### Scenario: /rdd-model reads product discovery artifact
**Given** `/rdd-discover` has produced a product discovery artifact at `./docs/product-discovery.md`
**When** `/rdd-model` begins Step 1 (Read the Source Material)
**Then** it reads the product discovery artifact alongside the essay
**And** it uses the Product Vocabulary Table as input for the Product Origin column

## Feature: Inversion Principle Governance (ADR-010)

### Scenario: /rdd-discover includes assumption inversion as procedural step
**Given** `/rdd-discover` is running in forward mode
**When** it reaches the Assumption Inversions section
**Then** for each major product assumption, it states the inverted form and its implications
**And** this is the primary procedural home of the Inversion Principle

### Scenario: Orchestrator documents inversion principle as cross-cutting principle
**Given** the orchestrator skill file exists
**When** it is read
**Then** it includes the Inversion Principle as a cross-cutting principle alongside existing principles
**And** it lists the phase-specific questions: RESEARCH ("right problem?"), PRODUCT DISCOVERY (procedural step), DECIDE ("unexamined product assumption?"), ARCHITECT ("user's mental model or developer's?")

### Scenario: /rdd-decide checks ADRs against unexamined product assumptions
**Given** `/rdd-decide` is writing or auditing ADRs
**When** an ADR's context section references a product assumption
**Then** the skill checks whether that assumption has been validated through product discovery
**And** if not, flags it as a potential inversion principle violation

### Scenario: /rdd-architect checks boundaries against user mental models
**Given** `/rdd-architect` is designing module boundaries
**When** a boundary encodes a product assumption (e.g., "carriers are interchangeable")
**Then** the skill asks whether the boundary serves the user's mental model or just the developer's
**And** documents the answer in the responsibility matrix provenance

## Feature: Product Discovery Epistemic Gate (ADR-011)

### Scenario: PRODUCT DISCOVERY gate presents epistemic act prompts after artifact
**Given** `/rdd-discover` has produced a product discovery artifact
**When** the skill presents the artifact to the user at the gate
**Then** the skill presents 2 exploratory epistemic act prompts referencing specific stakeholders, jobs, tensions, or inversions from the artifact
**And** the skill waits for the user to respond to at least one prompt before offering to proceed

### Scenario: PRODUCT DISCOVERY gate surfaces user tacit knowledge
**Given** the user has responded to a PRODUCT DISCOVERY gate prompt
**When** the user's response includes product knowledge not present in the artifact (e.g., a stakeholder behavior, an unarticulated workflow, a domain nuance)
**Then** the AI notes this new information and asks whether to incorporate it into the artifact before proceeding

### Scenario: PRODUCT DISCOVERY gate detects business-first vs user-first framing
**Given** the user is responding to a PRODUCT DISCOVERY gate prompt
**When** the user's language reveals business-first framing ("our sales team needs...") rather than user-first framing ("admins experience...")
**Then** the AI notes the framing orientation without judgment, making it visible for the user to consider

## Feature: Cross-Phase Integration — Product Discovery Feed-Forward

### Scenario: Product discovery value tensions propagate as open questions into MODEL
**Given** the product discovery artifact contains Value Tensions
**When** `/rdd-model` runs
**Then** unresolved value tensions appear in the domain model's Open Questions section

### Scenario: Product discovery assumption inversions become behavior scenarios in DECIDE
**Given** the product discovery artifact contains Assumption Inversions
**When** `/rdd-decide` runs
**Then** inverted assumptions are considered as candidate behavior scenarios

### Scenario: ARCHITECT provenance chains extend to user needs
**Given** `/rdd-architect` is building the responsibility matrix
**When** a module is assigned ownership of a domain concept
**Then** the provenance chain traces: Module → Domain Concept → ADR → Product Discovery (stakeholder/job/value)
**And** a product stakeholder can follow this chain to understand why the module exists

## Feature: Synthesis Phase in Pipeline (ADR-012)

### Scenario: Orchestrator pipeline includes Synthesis as optional terminal phase
**Given** the orchestrator (`rdd/SKILL.md`) describes the Full Pipeline workflow mode
**When** the pipeline sequence is read
**Then** SYNTHESIS appears as an optional phase after BUILD
**And** the SYNTHESIS phase invokes `/rdd-synthesize`
**And** the phase is marked as optional — the pipeline is complete without it

### Scenario: Synthesis available after any terminal phase
**Given** an RDD cycle has completed its terminal phase (BUILD in full pipeline, ARCHITECT in scoping mode)
**When** the user invokes `/rdd-synthesize`
**Then** the skill accepts the invocation and reads the artifact trail from the completed cycle
**And** does not require BUILD to have been the terminal phase

### Scenario: Synthesis requires substantial artifact trail
**Given** an RDD cycle produced only a research essay and domain model (no product discovery, ADRs, or system design)
**When** the user invokes `/rdd-synthesize`
**Then** the skill notes the artifact trail may be too thin for a productive synthesis conversation
**And** asks the user whether to proceed or defer

### Scenario: Orchestrator Available Skills table includes /rdd-synthesize
**Given** the orchestrator skill file exists
**When** the Available Skills table is read
**Then** it includes a row for `/rdd-synthesize` with purpose describing optional post-build synthesis and essay outline production

### Scenario: Orchestrator state tracking table includes SYNTHESIS
**Given** an RDD cycle is in progress and BUILD is complete
**When** the orchestrator displays the status table
**Then** the table includes a SYNTHESIS row after BUILD, shown as optional

### Scenario: Orchestrator Artifacts Summary includes synthesis deliverables
**Given** the orchestrator skill file exists
**When** the Artifacts Summary table is read
**Then** it includes entries for the synthesis outline and the synthesis essay
**And** the synthesis essay entry notes it is written by the user outside the pipeline

## Feature: Synthesis Conversation Structure (ADR-013)

### Scenario: Agent mines artifact trail before conversation
**Given** the user has invoked `/rdd-synthesize`
**When** the skill begins
**Then** the agent reads the full artifact trail (essays, research logs, reflections, domain model, ADRs, product discovery, system design, code)
**And** applies the five novelty signals to produce a ranked list of candidate discoveries
**And** the ranking is ordered by interestingness, not logical importance

### Scenario: Journey review walks through artifact trail chronologically
**Given** the agent has completed artifact trail mining
**When** Phase 1 (journey review) begins
**Then** the agent points to specific moments in the trail — research questions that shifted direction, domain concepts that emerged from tension, ADRs that superseded earlier positions, reflections that surfaced unanticipated connections
**And** at each moment, the agent asks the user to recall and articulate what was happening
**And** the agent does not provide its own interpretation as a substitute for the user's recall

### Scenario: Novelty surfacing presents candidate discoveries for user reaction
**Given** Phase 1 (journey review) is complete
**When** Phase 2 (novelty surfacing) begins
**Then** the agent presents its ranked candidate discoveries from the five novelty signals
**And** asks the user to react: which feel genuinely important, which were surprising then but obvious now, which carry unresolved tension
**And** treats genuine engagement as signal of a live discovery and polite agreement as signal of a dead one

### Scenario: Framing conversation offers narrative lenses without prescribing
**Given** Phase 2 (novelty surfacing) is complete and live discoveries have been identified
**When** Phase 3 (framing conversation) begins
**Then** the agent offers narrative frameworks as lenses to try on (ABT sentence, story spine, braided structure, volta placement)
**And** the writer may adopt, modify, or discard any framework in favor of their own structural impulse
**And** the agent does not insist on any particular narrative form

### Scenario: Outline captures whatever the writer needs to start writing
**Given** Phase 3 (framing conversation) has identified the central question, key turns, and structural form
**When** the outline is produced
**Then** the outline is non-formulaic — there is no required template or structure
**And** the outline identifies the elements the writer needs to begin: central question, key turns, threads, opening, closing implication
**And** the form serves the writer's impulse, not a methodology prescription

### Scenario: User writes essay outside the pipeline
**Given** the synthesis conversation has produced an outline
**When** the pipeline's synthesis phase is complete
**Then** the deliverable is the outline, stored at `./docs/essays/NNN-descriptive-name-outline.md`
**And** the user writes the synthesis essay on their own time, in their own voice
**And** the agent does not write, co-write, or draft the essay

## Feature: Novelty Signal Detection (ADR-013)

### Scenario: Agent detects explicit surprise statements
**Given** the agent is mining the artifact trail
**When** an artifact contains language marking violated expectations ("turned out," "I was wrong about," "unexpectedly," "contrary to what I believed")
**Then** the agent marks the location as a candidate discovery site of type "explicit surprise statement"

### Scenario: Agent detects reframing events
**Given** the agent is mining the artifact trail
**When** the trail shows a shift in problem definition — vocabulary changes, the question being asked changes, or an explicit statement that the original problem was not the real problem
**Then** the agent marks the location as a candidate discovery site of type "reframing event"

### Scenario: Agent detects assumption denials
**Given** the agent is mining the artifact trail
**When** a finding denies an assumption the target audience would hold (per Davis's twelve categories)
**Then** the agent marks the location as a candidate discovery site of type "assumption denial"
**And** identifies which assumption category is denied

### Scenario: Agent detects superseded decisions
**Given** the agent is mining the artifact trail
**When** an ADR has status "Superseded" or the trail contains contradictions between temporally separated entries on the same topic
**Then** the agent marks the location as a candidate discovery site of type "superseded decision"

### Scenario: Agent detects negative case integrations
**Given** the agent is mining the artifact trail
**When** a counter-example forced revision of the working account (acknowledged or unacknowledged)
**Then** the agent marks the location as a candidate discovery site of type "negative case integration"

## Feature: Worth-the-Calories Quality Gate (ADR-014)

### Scenario: Davis test applied during framing conversation
**Given** Phase 3 (framing conversation) is underway
**When** the writer and agent discuss candidate essay topics
**Then** the agent asks: which widely-held assumption does this essay deny?
**And** if no assumption is denied, the agent notes that the framing may not be interesting enough

### Scenario: ABT test applied during framing conversation
**Given** a candidate essay framing has been identified
**When** the agent facilitates quality testing
**Then** the agent asks the writer to express the central claim as: "Context AND more context, BUT complication, THEREFORE consequence"
**And** checks whether the BUT lands — whether the complication is genuinely surprising

### Scenario: Inversion test applied during framing conversation
**Given** a candidate essay framing has been identified
**When** the agent facilitates quality testing
**Then** the agent asks: can the central claim be stated as the negation of something the target audience currently believes?
**And** if not, notes the essay may be confirming rather than challenging

### Scenario: Quality gate returns negative result honestly
**Given** the three quality tests (Davis, ABT, inversion) have been applied
**When** no framing passes all three tests
**Then** the agent communicates honestly that this cycle may not have produced an essay worth writing
**And** does not manufacture interest where none exists
**And** frames this as a valid outcome, not a failure

### Scenario: Writer makes the quality call, not the agent
**Given** the three quality tests have been applied and results discussed
**When** the writer evaluates whether the standard is met
**Then** the agent does not block or approve — the writer decides
**And** the agent's role is to facilitate the tests, not to enforce a pass/fail judgment

## Feature: Synthesis Essay as Narrative Context Rollup (ADR-015)

### Scenario: Orchestrator reads synthesis essay when bootstrapping new session
**Given** a project has a synthesis essay at `./docs/essays/NNN-*.md` written by the user
**When** a new RDD session begins for that project
**Then** the orchestrator includes the synthesis essay as a primary context source
**And** the essay provides narrative thread through the artifact corpus alongside structured artifacts

### Scenario: Synthesis essay answers "what was this project about?"
**Given** a synthesis essay exists for a project
**When** the essay is read as context
**Then** it answers "what was discovered, and why does it matter?" — the narrative that domain models, ADRs, and system designs cannot provide
**And** serves both human readers and AI sessions bootstrapping understanding

## Feature: Synthesis Subsumes Epistemic Gate (ADR-016)

### Scenario: Synthesis conversation requires generation at every step
**Given** the synthesis conversation is underway (any phase)
**When** the user responds at any point
**Then** the user produces something — recalls an experience, reacts to a discovery, articulates what matters, chooses a narrative direction
**And** no step consists solely of the user approving agent output

### Scenario: No separate epistemic gate after outline production
**Given** the synthesis conversation has produced an outline
**When** the outline is complete
**Then** there is no additional epistemic gate bolted onto the end
**And** the conversation itself has served the gate function throughout

### Scenario: Non-generative responses re-engaged during synthesis
**Given** the agent presents a candidate discovery during novelty surfacing
**When** the user responds with polite but non-generative agreement ("yeah that's interesting")
**Then** the agent probes further: "What about it feels important? Does it connect to something you experienced during the cycle?"
**And** seeks genuine engagement rather than accepting surface-level agreement

## Feature: Inversion Principle in Narrative Framing (ADR-017)

### Scenario: Agent offers narrative inversions during framing conversation
**Given** Phase 3 (framing conversation) is underway
**When** the agent offers narrative frameworks
**Then** the agent includes three narrative inversions as lenses to try on:
- "What if the obvious takeaway is wrong?"
- "What if the process is more interesting than the product?"
- "What if the reader's assumed context is the story?"
**And** the writer may use all, some, or none

### Scenario: Orchestrator documents inversion principle with SYNTHESIS level
**Given** the orchestrator describes the inversion principle as a cross-cutting principle
**When** the phase-specific applications are listed
**Then** SYNTHESIS is included: "narrative framing — inverting obvious takeaways, process-vs-product assumptions, reader's assumed context"

## Feature: Conformance — Synthesis Phase in Orchestrator

### Scenario: rdd-synthesize SKILL.md exists
**Given** the synthesis phase has been built
**When** the skill file is read
**Then** it contains the three-phase conversation structure (journey review, novelty surfacing, framing)
**And** includes artifact trail mining as pre-conversation step
**And** includes the worth-the-calories quality gate during framing
**And** does not contain a separate EPISTEMIC GATE section (the conversation subsumes it)

### Scenario: Orchestrator cross-cutting principles include SYNTHESIS for inversion
**Given** the orchestrator lists the inversion principle's phase-specific applications
**When** the list is read
**Then** it includes SYNTHESIS alongside RESEARCH, PRODUCT DISCOVERY, DECIDE, and ARCHITECT

## Feature: Outline as Springboard with Pre-Populated References (ADR-013)

### Scenario: Outline includes pre-populated references with full quotes
**Given** the framing conversation has identified the essay's central question and key discoveries
**When** the outline is produced
**Then** the agent extracts relevant citations from the research log, essays, and reflections
**And** includes full quotes with proper attribution and source context
**And** the writer does not need to hunt for supporting material — it is already in the outline

### Scenario: Citation audit runs before outline finalization
**Given** the outline includes pre-populated references
**When** the outline is being finalized
**Then** the agent runs a citation audit (via `/citation-audit`) on all pre-populated references
**And** verifies that cited works exist, are properly attributed, and that quoted material is accurate
**And** no hallucinated sources reach the writer's outline

### Scenario: Argument audit runs after citation audit before outline finalization
**Given** the outline has passed citation audit
**When** the outline is being finalized
**Then** the agent runs an argument audit (via `/argument-audit`) on the outline, treating the narrative structure as the argument and the pre-populated references as the evidence base
**And** verifies that the narrative arc is logically sound, claims are supported by cited material, and framing does not overreach the evidence
**And** no hidden assumptions smuggled through narrative structure reach the writer's outline without having been surfaced during the RDD cycle

### Scenario: Outline is ready to write from immediately
**Given** the synthesis conversation is complete and the outline is finalized
**When** the writer opens the outline
**Then** it contains: narrative structure (central question, turns, threads), pre-populated references with full quotes, and any structural notes from the framing conversation
**And** the writer can begin writing without additional research or material-gathering

## Feature: Cross-Project Prompting During Synthesis (ADR-018)

### Scenario: Agent asks about resonance with writer's other work
**Given** Phase 3 (framing conversation) is underway and a volta or key discovery has been identified
**When** the agent facilitates framing
**Then** the agent asks whether the volta or discovery resonates with the writer's other work or interests
**And** creates conversational space for the writer to draw cross-project connections the local artifact trail cannot see

### Scenario: Cross-project connections emerge from conversation, not file access
**Given** the agent is facilitating cross-project prompting
**When** the writer describes a connection to another project
**Then** the agent explores the connection through conversation — asking what the shared structure is, how the concepts relate, whether it changes the essay's framing
**And** does not attempt to access artifact trails from other projects

## Feature: Orientation Document as Artifact Hierarchy Entry Point (ADR-019)

### Scenario: Orientation document sits at top of three-tier artifact hierarchy
**Given** an RDD cycle has produced artifacts across multiple phases
**When** the artifact hierarchy is consulted
**Then** ORIENTATION.md is Tier 1 (entry point, routes readers)
**And** product-discovery.md and system-design.md are Tier 2 (primary readables)
**And** domain-model.md, essays, ADRs, and scenarios are Tier 3 (supporting material)

### Scenario: Orientation document routes readers to appropriate depth
**Given** a reader (human or AI agent) encounters the artifact corpus for the first time
**When** they read ORIENTATION.md
**Then** they can determine: what the system is, who it serves, what constraints shape it, what artifacts exist, and what the current state is
**And** they know which Tier 2 document to read next based on their role (product stakeholder → product-discovery.md, technical reader → system-design.md)

### Scenario: Orientation document does not duplicate Tier 2 content
**Given** ORIENTATION.md has been generated
**When** its content is compared to product-discovery.md and system-design.md
**Then** it contains only what the reader needs to decide where to go next — not the depth itself
**And** no section reproduces the detail of the Tier 2 documents it routes to

## Feature: Orientation Document Five-Section Structure (ADR-020)

### Scenario: Orientation document contains exactly five sections
**Given** the agent generates ORIENTATION.md
**When** the document is produced
**Then** it contains exactly five sections in this order: What this system is, Who it serves, Key constraints, How the artifacts fit together, Current state
**And** no additional sections are added

### Scenario: "What this system is" section is one paragraph
**Given** the agent is generating section 1 of ORIENTATION.md
**When** the section is complete
**Then** it states the essential purpose in one paragraph
**And** it does not list features or describe architecture
**And** its language is accessible to both product and technical readers

### Scenario: "Who it serves" section compresses stakeholder map
**Given** the agent is generating section 2 of ORIENTATION.md
**When** the section is complete
**Then** it contains stakeholder names and one-line descriptions
**And** it does not reproduce the full Stakeholder Map from product-discovery.md

### Scenario: "Key constraints" section captures 3-5 shaping invariants
**Given** the agent is generating section 3 of ORIENTATION.md
**When** the section is complete
**Then** it lists 3-5 quality attributes or invariants from the domain model
**And** these are the constraints that make this system *this system*
**And** it does not exhaustively list all invariants

### Scenario: "How the artifacts fit together" section is the artifact map
**Given** the agent is generating section 4 of ORIENTATION.md
**When** the section is complete
**Then** it lists each artifact in the corpus with a one-line description and when to read it
**And** the three-tier hierarchy is visible in the organization

### Scenario: "Current state" section reflects pipeline progress
**Given** the agent is generating section 5 of ORIENTATION.md
**When** the section is complete
**Then** it states which phases are complete, what decisions are settled, and what open questions remain
**And** pipeline state is inferred from the artifact trail (which artifacts exist and their content), not from session state

### Scenario: Entire document is readable in under five minutes
**Given** ORIENTATION.md has been generated
**When** the document's length is assessed
**Then** no section exceeds a few short paragraphs
**And** the entire document is readable in under five minutes

## Feature: Agent-Maintained Orientation Document (ADR-021)

### Scenario: Agent generates orientation document from artifact trail
**Given** an RDD cycle has produced artifacts (at minimum, a research essay)
**When** the agent generates ORIENTATION.md
**Then** the agent reads the current artifact trail and distills it into the five-section structure
**And** this is a pragmatic action (Invariant 3) — no epistemic gate is required for the generation itself

### Scenario: User validates generated orientation document
**Given** the agent has generated ORIENTATION.md
**When** the document is presented to the user
**Then** the user reviews the document for accuracy
**And** the agent and user iterate to refine it
**And** this validation is review-based, not generation-based — no epistemic gate

### Scenario: Partial orientation document after RESEARCH phase
**Given** an RDD cycle has completed only the RESEARCH phase
**When** the agent generates ORIENTATION.md
**Then** only section 1 (what the system is) and section 5 (current state) can be populated
**And** the partial orientation is still useful for the user's context
**And** sections 2-4 are either omitted or marked as pending

### Scenario: Orientation document regenerated at natural milestones
**Given** an RDD cycle has completed a phase (e.g., ARCHITECT)
**When** the agent is asked to regenerate ORIENTATION.md or determines it is a natural milestone
**Then** the document is regenerated from the current artifact trail
**And** the document fills out as more artifacts become available

### Scenario: Scoping use case generates orientation document after ARCHITECT
**Given** a team lead has run RDD through RESEARCH → ARCHITECT (scoping mode)
**When** the ARCHITECT phase completes
**Then** the orientation document is generated as a handoff cover letter
**And** it orients the team to the full artifact set for building

### Scenario: Source artifacts are authoritative over orientation document
**Given** ORIENTATION.md contains a claim that contradicts a source artifact (essay, domain model, ADR, product discovery, or system design)
**When** the contradiction is discovered
**Then** the orientation document is regenerated from the source artifacts
**And** the source artifact is NOT corrected to match the orientation document

### Scenario: Orientation document clarity serves as stewardship signal
**Given** ORIENTATION.md has been generated and the user is reviewing it
**When** the document has grown increasingly abstract or internally contradictory compared to prior versions
**Then** this signals the system may be accumulating the wrong kind of complexity
**And** the signal prompts investigation of the architecture, not just revision of the document

## Feature: Conformance — Orientation Document in Pipeline

### Scenario: Orchestrator "two documents that matter" principle amended to three tiers
**Given** the orchestrator skill file (`rdd/SKILL.md`) exists
**When** the file is read
**Then** the design principle references three tiers: orientation (ORIENTATION.md) → primary readables (product-discovery.md, system-design.md) → supporting material
**And** the prior "two documents that matter" language has been amended

### Scenario: Orchestrator Artifacts Summary includes ORIENTATION.md
**Given** the orchestrator skill file exists
**When** the Artifacts Summary table is read
**Then** it includes a row for ORIENTATION.md noting it is cross-phase and regenerated at milestones

### Scenario: System design architectural drivers table reflects three-tier hierarchy
**Given** system-design.md exists
**When** the Architectural Drivers table is read
**Then** the readability design principle acknowledges the three-tier hierarchy with ORIENTATION.md at Tier 1

## Feature: Roadmap Artifact (ADR-022)

### Scenario: Roadmap generated from system design during ARCHITECT phase
**Given** `/rdd-architect` has produced a system design with module decomposition and integration contracts
**When** the ARCHITECT phase is completing
**Then** the agent generates a roadmap document deriving work packages from the module decomposition
**And** each work package has classified dependency edges (hard dependency, implied logic, or open choice)
**And** the roadmap describes at least one transition state — an intermediate architecture coherent on its own
**And** the roadmap is written to the docs directory alongside the system design

### Scenario: Roadmap dependencies are explicitly classified
**Given** a roadmap contains work packages with dependencies between them
**When** the roadmap is read
**Then** each dependency edge is labeled as one of: hard dependency (structural necessity — cannot build B without A), implied logic (suggested ordering — could go either way), or open choice (genuinely independent)
**And** the classification is visible in the document, not implicit in ordering

### Scenario: Roadmap does not contain prescriptive build instructions
**Given** a roadmap has been generated
**When** the roadmap is read
**Then** it does not contain: step-by-step build instructions, single-commit prescriptions, timeline estimates, or resource allocation
**And** it does not tell the developer what to build in what order — it provides the information to make that decision

### Scenario: System design links to roadmap for sequencing context
**Given** a roadmap has been generated
**When** system-design.md is read
**Then** the system design links to the roadmap for sequencing context
**And** the system design may still note hard structural dependencies inline (these are architectural facts)
**And** the strategic sequencing view (transition states, open choices, implied orderings) is in the roadmap, not the system design

### Scenario: Roadmap updated reflexively when architecture changes
**Given** a roadmap exists and the system design is amended
**When** the amendment changes module boundaries, responsibilities, or integration contracts
**Then** the roadmap is regenerated to reflect the new module decomposition
**And** dependency classifications are re-evaluated

### Scenario: Roadmap sits at Tier 2 of artifact hierarchy
**Given** ORIENTATION.md lists the artifact hierarchy
**When** the artifact map section is read
**Then** the roadmap appears at Tier 2 alongside product-discovery.md and system-design.md

## Feature: Field Guide Artifact (ADR-023)

### Scenario: Field guide maps system design modules to implementation state
**Given** a system design exists and implementation has begun
**When** the agent generates the field guide
**Then** each module in the system design is mapped to its current implementation state: what exists, what is partial, what is planned
**And** domain model concepts are connected to their code-level manifestations (specific files, directories, patterns)

### Scenario: Field guide surfaces design rationale not visible in code
**Given** the field guide has been generated
**When** a developer reads a module's entry
**Then** the entry includes the "why" behind structural choices that code alone cannot carry
**And** points to specific files and patterns where the developer should explore to build understanding

### Scenario: Field guide distinguishes settled from in-flux areas
**Given** the field guide has been generated
**When** the field guide is read
**Then** it marks which areas of the system are settled (stable, unlikely to change) versus in flux (under active development or pending decisions)
**And** this prevents developers from investing understanding in areas about to change

### Scenario: Field guide is only generated when implementation exists
**Given** an RDD cycle is in the ARCHITECT phase with no implementation yet
**When** the agent considers generating a field guide
**Then** the field guide is not generated — it requires implementation to map against
**And** the field guide is first generated during or after the BUILD phase

### Scenario: Field guide sits at Tier 3 of artifact hierarchy
**Given** ORIENTATION.md lists the artifact hierarchy
**When** the artifact map section is read
**Then** the field guide appears at Tier 3 as reference material consulted as needed

### Scenario: Field guide updated reflexively when implementation changes
**Given** a field guide exists and implementation has changed significantly
**When** the agent detects the change (or the user requests a refresh)
**Then** the field guide is regenerated to reflect current implementation state
**And** module-to-code mappings are updated

## Feature: Document Sizing Heuristics (ADR-024)

### Scenario: New artifacts designed within sizing heuristics
**Given** a new artifact type is being added to the RDD corpus (e.g., roadmap, field guide)
**When** the artifact template is designed
**Then** the template is designed to serve one purpose for one audience (Purpose Test)
**And** no section requires holding more than 3-5 concepts simultaneously (Concept Rule)
**And** end-to-end readable artifacts aim to stay near ~5,000 words (Word Guideline)

### Scenario: Reference artifacts may exceed word guideline per Read Contract
**Given** an artifact is designed for section-level consultation rather than end-to-end reading (e.g., domain model, field guide)
**When** the artifact's length is evaluated
**Then** the Read Contract heuristic permits longer documents
**And** the Word Guideline does not apply as a constraint

### Scenario: Critical information not buried in middle of agent-consumed documents
**Given** an artifact will be consumed by an AI agent end-to-end
**When** the artifact is structured
**Then** the most critical information appears at the beginning and end
**And** nothing essential is positioned only in the middle third (Position-Sensitive Placement)

### Scenario: Heuristics cascade in priority order
**Given** a document is being evaluated for potential splitting
**When** the heuristics are applied
**Then** they are applied in order: Purpose Test first, then Concept Rule, then Word Guideline, then Read Contract, then Position-Sensitive Placement
**And** the Purpose Test is the strongest signal — a document serving multiple purposes should be split regardless of length

## Feature: Conformance Audit (ADR-025)

### Scenario: Audit scans artifact corpus against current skill version
**Given** the conformance audit skill is invoked
**When** it reads the current RDD skill files and the project's artifact corpus
**Then** it produces a gap analysis listing: missing artifacts, missing sections within existing artifacts, template mismatches, and broken inter-artifact references
**And** each gap is classified as structural (blocks downstream phases) or format (cosmetic, doesn't block)

### Scenario: Audit prioritizes structural gaps over format gaps
**Given** a conformance audit has produced a gap analysis
**When** the report is presented to the user
**Then** structural gaps (missing artifacts that downstream phases depend on) are listed first
**And** format gaps (sections that could be updated but don't block anything) are listed separately
**And** the user decides which gaps to address

### Scenario: Remediation generates missing artifacts for structural gaps
**Given** the conformance audit has identified structural gaps
**When** the user approves remediation
**Then** the agent generates missing artifacts or sections where possible (pragmatic action, Invariant 3)
**And** generated content is derived from existing artifacts and code, not invented
**And** the user validates all generated content

### Scenario: Drift detection compares artifacts against implementation
**Given** the conformance audit includes drift detection
**When** the agent compares artifacts against current implementation
**Then** it flags sections where the documentation no longer matches the code
**And** the user decides whether to update docs (pragmatic) or re-run the relevant phase (epistemic)
**And** the agent notes that drift detection is best-effort — subtle semantic divergences may be missed

### Scenario: Graduation folds RDD knowledge into native project docs
**Given** the user invokes graduation for a scoped cycle or a whole project
**When** the agent produces a graduation plan
**Then** the plan identifies durable knowledge to migrate: architectural decisions, domain vocabulary, product context, key rationale
**And** the plan identifies RDD-specific artifacts to archive: research logs, reflections, scenarios, the domain model in its RDD-specific structure
**And** the user decides what to integrate and what to archive
**And** archived artifacts remain accessible for future RDD cycles

### Scenario: Graduation preserves knowledge without RDD artifact structure
**Given** graduation has been approved and executed
**When** the project's native docs are updated
**Then** the durable knowledge is expressed in the project's native documentation format
**And** the RDD-specific structure (phases, gates, invariant tables) is not carried over
**And** the project retains the knowledge without retaining the methodology's artifact structure

### Scenario: Conformance audit distinct from product conformance
**Given** both conformance audit (ADR-025) and product conformance (ADR-008) exist
**When** either is invoked
**Then** conformance audit checks artifact template/format alignment against the current skill version
**And** product conformance checks product assumptions against actual user needs
**And** the two operations are complementary, not overlapping

## Feature: Scoped Cycles (ADR-026)

### Scenario: User scopes RDD cycle to a subsystem subfolder
**Given** a project has stable project-level architecture
**When** the user invokes an RDD cycle scoped to a subsystem
**Then** the cycle creates artifacts in a subfolder (e.g., `docs/features/auth/`)
**And** the cycle follows the same pipeline phases and gate protocols as a full-project cycle
**And** the subsystem's artifacts respect the parent project's architectural constraints

### Scenario: Scoped cycle operates within broader project context
**Given** a scoped cycle is running on a subsystem
**When** the domain model or system design references project-level concepts
**Then** it uses the project-level vocabulary and constraints as given context
**And** it does not duplicate the entire project's domain model or system design

### Scenario: Scoped cycle ends with graduation
**Given** a scoped cycle has completed and the subsystem is built and stable
**When** the user determines the work has shifted from identity-forming to feature-extending
**Then** the user invokes graduation (ADR-025) for the scoped cycle's artifacts
**And** durable knowledge is folded into project-level docs
**And** the scoped cycle's RDD artifacts are archived

### Scenario: Documentation fatigue signals graduation readiness
**Given** a scoped cycle's artifacts exist and are being maintained
**When** the user experiences the artifacts as maintenance burden rather than active value
**Then** this is a design signal that the work has moved past the point where RDD's structure adds value at this scope
**And** the appropriate response is graduation and re-scoping, not abandoning discipline

### Scenario: Scoped cycle findings that challenge project-level assumptions
**Given** a scoped cycle's research or modeling surfaces findings that contradict project-level architecture
**When** the contradiction is identified
**Then** it is flagged to the user as a potential project-level concern
**And** the user decides whether to update project-level docs, trigger a project-level cycle, or note it as an open question

## Feature: Conformance — New Artifacts in Pipeline

### Scenario: Orchestrator Artifacts Summary includes roadmap
**Given** the orchestrator skill file exists
**When** the Artifacts Summary table is read
**Then** it includes a row for the roadmap noting it is generated during ARCHITECT and maintained reflexively

### Scenario: Orchestrator Artifacts Summary includes field guide
**Given** the orchestrator skill file exists
**When** the Artifacts Summary table is read
**Then** it includes a row for the field guide noting it is generated during or after BUILD and maintained reflexively

### Scenario: Orchestrator Available Skills table includes conformance audit
**Given** the orchestrator skill file exists
**When** the Available Skills table is read
**Then** it includes a row for the conformance audit skill with purpose describing artifact conformance, drift detection, and graduation

### Scenario: Artifact hierarchy in ORIENTATION.md includes new artifacts
**Given** ORIENTATION.md is being generated or regenerated
**When** section 4 (How artifacts fit together) is produced
**Then** the roadmap appears at Tier 2 alongside product-discovery.md and system-design.md
**And** the field guide appears at Tier 3 alongside domain-model.md, essays, ADRs, and scenarios

### Scenario: rdd-architect SKILL.md generates roadmap as output
**Given** the `/rdd-architect` skill file exists
**When** the file is read
**Then** it includes roadmap generation as part of the ARCHITECT phase output
**And** the roadmap is generated from the system design's module decomposition and ADRs

## Feature: Four-Dimension Framing Model (ADR-027)

### Scenario: Framing conversation navigates discovery type dimension
**Given** the synthesis skill has completed novelty surfacing (Phase 2)
**And** the ranked discoveries include at least one novelty signal type (explicit surprise, reframing, assumption denial, negative case integration, or superseded decision)
**When** the framing conversation (Phase 3) begins
**Then** the agent references the strongest novelty signal type
**And** offers a heuristic narrative form suggestion based on the signal's structural affinity (e.g., reframing → whorl of reflection or hermit crab form)
**And** presents the suggestion as one possibility to try, not as what the material definitively suggests

### Scenario: Framing conversation navigates narrative form dimension
**Given** the framing conversation is exploring narrative form
**When** the agent presents form options
**Then** the vocabulary includes at least three tiers: established patterns (e.g., braided, segmented, whorl of reflection), hermit crab forms (e.g., algorithm, recipe, field guide), and meta-forms (e.g., Borgesian review, counterfactual)
**And** no form is presented as the correct choice — the form emerges from structural experiments

### Scenario: Framing conversation navigates audience constraint dimension
**Given** the framing conversation is exploring audience constraint
**When** the agent asks about audience and medium
**Then** the question frames audience/medium as creative catalyst, not delivery specification
**And** acknowledges that the audience may not be known at the start — the material may disclose its audience through composition
**And** offers specific medium constraints as examples (e.g., Story Collider: 10 min personal story; Ignite: 5 min, 20 auto-advancing slides; explain-to-a-child: simple words only)

### Scenario: Framing conversation navigates epistemic posture dimension
**Given** the framing conversation has explored discoveries and forms
**When** the agent asks about the writer's stance toward certainty
**Then** it offers three positions: determined (outline as map), exploratory (outline as invitation), indeterminate (outline as score)
**And** the identified posture shapes what kind of outline is produced (e.g., an indeterminate outline contains elements with structural relationships but no fixed sequence)

### Scenario: Dimensions are navigated responsively, not presented as a four-part checklist
**Given** the framing conversation is underway
**When** the agent navigates the four dimensions
**Then** the dimensions surface through the conversation's natural flow — the agent does not present all four upfront as a form to fill in
**And** some dimensions may be navigated implicitly (e.g., discovery type is already addressed by novelty surfacing)

### Scenario: Existing lenses remain available within the dimensions
**Given** the framing conversation is navigating narrative form
**When** the agent offers tools for finding structure
**Then** the ABT sentence, story spine, volta placement, and three narrative inversions (ADR-017) are available as tools within the dimensional framework
**And** they are not replaced or deprecated — they are organized into a richer repertoire

## Feature: Structural Experiments as Framing Mechanism (ADR-028)

### Scenario: Agent proposes a structural experiment during framing
**Given** the framing conversation is exploring a candidate narrative form
**When** the agent wants to test whether the form fits the material
**Then** the agent proposes a specific structural experiment (e.g., "Draft the opening paragraph as pseudocode" or "Arrange three artifacts as exhibition stops")
**And** the writer executes the experiment — producing a quick externalized trial, not discussing the form in the abstract

### Scenario: Writer executes structural experiment and discovers content
**Given** the agent has proposed a structural experiment
**When** the writer produces the experiment (a paragraph, a set of bullet points, or a sketch)
**Then** the agent and writer observe what the form revealed about the material
**And** the outcome informs the next move: try another form, refine this one, or converge

### Scenario: Failed structural experiment is diagnostic
**Given** the writer has attempted a structural experiment
**When** the experiment does not work — the form and material clash
**Then** the agent treats the failure as informative rather than wasted effort
**And** asks what the mismatch reveals about what the material actually needs
**And** proposes a different experiment informed by the failure

### Scenario: Agent's draft experiment serves as provocation, not submission
**Given** the agent drafts a structural experiment as a starting provocation
**When** the writer receives the agent's draft
**Then** the writer produces their own version rather than merely approving or reacting to the agent's
**And** the writer's generation is the primary data, not the agent's draft

### Scenario: Structural experiments respect Invariant 4 time constraint
**Given** the framing conversation includes structural experiments
**When** multiple experiments are attempted
**Then** each individual experiment takes minutes, not hours
**And** the conversation does not require exhaustive experimentation across all four dimensions

### Scenario: Structural experiment surfaces a research question (integration with ADR-029)
**Given** the writer has attempted a structural experiment
**When** the experiment reveals an incoherence — a connection assumed during the cycle does not hold
**Then** the agent observes the incoherence
**And** asks the writer whether this is a framing problem (solvable within synthesis) or a research gap (warranting re-entry)

## Feature: Synthesis Re-Entry into RESEARCH (ADR-029)

### Scenario: Structural experiment reveals research gap — writer articulates question
**Given** a structural experiment has revealed an incoherence in the material
**And** the agent has flagged the incoherence
**When** the writer articulates a specific research question that neither the essays, ADRs, nor code address
**Then** the finding is recorded in the research log as a new research question
**And** the synthesis conversation pauses
**And** the pipeline re-enters RESEARCH at the relevant scope

### Scenario: Re-entry is writer's decision, not agent's recommendation
**Given** a structural experiment has revealed an incoherence
**When** the agent observes the incoherence and asks the writer about it
**Then** the writer decides whether to re-enter RESEARCH or continue within synthesis
**And** the agent does not unilaterally recommend or initiate re-entry

### Scenario: Writer cannot articulate research question — incoherence is a framing problem
**Given** a structural experiment has revealed an incoherence
**When** the writer cannot state a specific research question
**Then** the agent treats the incoherence as a framing problem solvable within synthesis
**And** proposes a different structural experiment or narrative form to try

### Scenario: Synthesis conversation resumes after re-entry research completes
**Given** synthesis paused and the pipeline re-entered RESEARCH for a specific question
**When** the research question is addressed and the writer returns to synthesis
**Then** the synthesis conversation may resume from where it paused (journey review and novelty surfacing are not redone)
**And** the new research finding is integrated into the framing conversation

### Scenario: Re-entry is scoped narrowly
**Given** synthesis has triggered re-entry into RESEARCH
**When** the research question is formulated
**Then** it targets a specific question at a specific scope — not a repeat of the entire cycle
**And** the re-entry pipeline segment is bounded (e.g., RESEARCH → MODEL for a vocabulary question, or RESEARCH alone for a factual question)

### Scenario: Most synthesis cycles terminate without re-entry
**Given** the synthesis conversation has completed the framing phase
**When** no structural experiment has revealed a research gap the writer wants to pursue
**Then** synthesis produces the outline and terminates normally
**And** no re-entry occurs

## Feature: Outline as Two-Register Artifact (ADR-030)

### Scenario: Outline production identifies argumentative backbone
**Given** the framing conversation has converged on a form, audience, and posture
**When** the agent produces the outline
**Then** the outline explicitly identifies the argumentative backbone: the logical thread connecting discoveries to claims to implications
**And** this register is what the argument audit verifies

### Scenario: Outline production identifies curatorial arrangement
**Given** the framing conversation has converged on a form, audience, and posture
**When** the agent produces the outline
**Then** the outline explicitly identifies the curatorial arrangement: how the reader encounters the ideas, where the scale shifts, what juxtapositions create resonance, where negative space creates meaning
**And** this register is not verified by argument audit — it is a judgment the writer and agent make together

### Scenario: Argumentative backbone exists even in non-conventional forms
**Given** the framing conversation has converged on a hermit crab form, lyric form, or indeterminate form
**When** the agent produces the outline
**Then** the argumentative backbone is still present — the logic may be subterranean but must be sound
**And** the argument audit verifies the backbone regardless of the surface form

### Scenario: Curatorial arrangement uses the exhibition vocabulary
**Given** the agent is producing the curatorial arrangement register of the outline
**When** the agent describes the experiential structure
**Then** it uses the curatorial vocabulary: selection, juxtaposition, scale shifts, the shimmer, negative space, personal voice
**And** these terms describe specific curatorial moves, not vague quality assessments

### Scenario: Two registers are complementary, not competing
**Given** the outline has both an argumentative backbone and a curatorial arrangement
**When** there is tension between logical sequence and experiential sequence (e.g., the most dramatic juxtaposition comes before the evidence that supports it)
**Then** the agent surfaces the tension to the writer
**And** the writer decides how to resolve it — the argument makes it true, the curation makes it alive

### Scenario: Argument audit operates on argumentative backbone, not curatorial arrangement
**Given** the outline is produced with both registers
**When** `/argument-audit` is run on the outline
**Then** the audit verifies that claims follow from evidence and framing does not overreach (argumentative backbone)
**And** the audit does not evaluate curatorial quality (selection, juxtaposition, scale shifts are outside its scope)

## Feature: Conformance — Synthesis Skill Implements ADRs 027-030

### Scenario: Synthesis skill Phase 3 navigates four dimensions
**Given** the `/rdd-synthesize` skill file exists
**When** the Phase 3 (framing conversation) section is read
**Then** it references all four dimensions: discovery type, narrative form, audience constraint, epistemic posture
**And** the dimensions are navigated through the conversation, not presented as a checklist

### Scenario: Synthesis skill includes structural experiment mechanism
**Given** the `/rdd-synthesize` skill file exists
**When** the Phase 3 section is read
**Then** it describes the structural experiment mechanism: agent proposes, writer executes quick externalized trials
**And** failed experiments are described as diagnostic

### Scenario: Synthesis skill NEXT PHASE section reflects re-entry possibility
**Given** the `/rdd-synthesize` skill file exists
**When** the NEXT PHASE section is read
**Then** it states that synthesis is usually terminal but can re-enter RESEARCH when structural experimentation surfaces new questions
**And** it does not say "There is no next phase"

### Scenario: Synthesis skill cycle position diagram shows re-entry arrow
**Given** the `/rdd-synthesize` skill file exists
**When** the cycle position diagram is read
**Then** it shows a conditional arrow from SYNTHESIS back to RESEARCH

### Scenario: Synthesis skill outline section describes two registers
**Given** the `/rdd-synthesize` skill file exists
**When** the outline production section is read
**Then** it instructs the agent to identify both the argumentative backbone and the curatorial arrangement
**And** it provides the curatorial vocabulary (selection, juxtaposition, scale shifts, shimmer, negative space, personal voice)

## Feature: Artifact-Mediated Communication (ADR-031)

### Scenario: Citation auditor writes audit artifact to file
**Given** the citation-auditor specialist subagent is dispatched with an essay file path and research log file path
**When** the agent completes its audit
**Then** a citation audit report exists as a file in the artifact trail (not only in conversation context)
**And** the report contains: total references checked, verified count, and prioritized issues (P1/P2/P3) with locations and recommendations

### Scenario: Argument auditor writes audit artifact to file
**Given** the argument-auditor specialist subagent is dispatched with an essay file path and research log file path
**When** the agent completes its audit
**Then** an argument audit report exists as a file in the artifact trail
**And** the report contains: logical gaps, hidden assumptions, overreaching claims, each with severity, location, evidence, and recommendation

### Scenario: Phase skill reads audit artifact (not conversation context)
**Given** a citation audit report artifact exists from a prior specialist subagent dispatch
**When** the orchestrating agent needs to act on audit findings
**Then** it reads the audit artifact file
**And** routes P1 issues for immediate fix, P2 issues for epistemic gate discussion, P3 issues for optional deferral

## Feature: Specialist Subagent Extraction (ADR-032)

### Scenario: Orchestrating agent dispatches citation-auditor on Sonnet
**Given** the `/rdd-research` skill has produced an essay and is at the citation audit step
**When** the skill dispatches the citation-auditor specialist subagent
**Then** the subagent runs on Sonnet (not the orchestrator's model)
**And** the subagent receives file paths to the essay and research log as input
**And** the subagent writes its report to a file

### Scenario: Specialist subagent has no conversation history
**Given** the citation-auditor specialist subagent is dispatched
**When** the agent begins execution
**Then** it has access only to its system prompt and the files referenced in the dispatch
**And** it does not have access to the orchestrating agent's conversation history

### Scenario: Spike runner inherits parent model
**Given** the `/rdd-research` skill determines a spike is needed
**When** the skill dispatches the spike-runner specialist subagent
**Then** the subagent runs on the parent model (inherit), not a fixed model
**And** the subagent operates only in `./scratch/spike-*/` directories
**And** findings are written to the research log

### Scenario: Lit-reviewer writes synthesis to research log
**Given** the `/rdd-research` skill needs academic literature review
**When** the skill dispatches the lit-reviewer specialist subagent
**Then** the subagent performs web searches and evaluates source quality
**And** the durable output is a research log entry (file), not conversation content

### Scenario: Orientation-writer produces ORIENTATION.md
**Given** the orchestrating agent has been reminded by the orientation trigger hook to regenerate ORIENTATION.md
**When** the skill dispatches the orientation-writer specialist subagent
**Then** the subagent reads the current artifact corpus inventory
**And** writes an updated ORIENTATION.md directly

## Feature: Cross-Cutting Hooks (ADR-033)

### Scenario: Invariant reminder fires on artifact modification
**Given** the RDD plugin is installed and enabled
**And** an agent is about to Write or Edit a file in `docs/`
**When** the PreToolUse hook fires
**Then** the agent receives a reminder to check domain-model.md invariants before proceeding

### Scenario: Epistemic gate enforcer fires on Stop during RDD phase
**Given** an RDD phase skill is active
**When** the agent attempts to stop
**Then** the Stop hook injects a reminder about the epistemic gate
**And** the reminder references the specific epistemic act prompts for the current phase

### Scenario: Document sizing check fires on artifact write
**Given** the RDD plugin is installed and enabled
**And** an agent writes a file in `docs/`
**When** the PostToolUse hook fires
**Then** the hook checks the written file against document sizing heuristics
**And** flags the file if it exceeds the sizing threshold

### Scenario: Orientation trigger fires after key artifact changes
**Given** the RDD plugin is installed and enabled
**When** an agent writes to system-design.md, domain-model.md, or scenarios.md
**Then** the PostToolUse hook reminds the orchestrating agent to dispatch the orientation-writer subagent

## Feature: Plugin Packaging (ADR-034)

### Scenario: Plugin installs with all components discovered
**Given** the `rdd` plugin is installed via `claude plugin install rdd@nrgforge`
**When** the plugin loads
**Then** nine skills are available under `/rdd-` namespace
**And** six specialist subagents are available in `/agents`
**And** five hooks are registered from `hooks/hooks.json`
**And** the artifact corpus is accessible under the plugin's `docs/` directory

### Scenario: Plugin skills use namespaced invocation
**Given** the `rdd` plugin is installed
**When** the user invokes `/rdd-research`
**Then** the research phase skill activates
**And** the skill functions identically to the former standalone `/rdd-research`

## Feature: Skill Activator for Explicit Requests (ADR-035)

### Scenario: User says "use RDD" and gets RDD, not brainstorming
**Given** the RDD plugin is installed with the skill activator hook
**And** the superpowers brainstorming skill is also active
**When** the user submits "Let's use RDD to investigate this problem"
**Then** the skill activator hook injects context indicating an explicit RDD request
**And** the agent proceeds to `/rdd-research` without invoking brainstorming

### Scenario: Explicit skill invocation bypasses activator
**Given** the RDD plugin is installed
**When** the user invokes `/rdd-research` directly
**Then** the research phase activates without the skill activator hook needing to intervene

### Scenario: Non-RDD prompts are not intercepted
**Given** the RDD plugin is installed with the skill activator hook
**When** the user submits "Help me refactor this function"
**Then** the skill activator hook does not inject RDD-related context

## Feature: Research Log Archival (ADR-036)

### Scenario: Research log archived at end of cycle
**Given** the `/rdd-research` skill has completed the essay, audits, epistemic gate, and reflections
**When** the research phase ends
**Then** `research-log.md` is moved to `research-logs/NNN-descriptive-name.md` matching the essay number
**And** no `research-log.md` remains in the research-logs directory root

### Scenario: Stale research log archived at start of new cycle
**Given** a `research-log.md` exists from a prior interrupted cycle
**When** a new research cycle begins
**Then** the stale log is archived to `research-logs/` before the new log is created

## Feature: Interaction Specification Layer (ADR-037)

### Scenario: DECIDE skill produces interaction specs after scenarios
**Given** the `/rdd-decide` skill has produced ADRs and behavior scenarios
**And** a product discovery artifact exists with stakeholder models
**When** the skill proceeds to interaction specification writing
**Then** interaction specs are written to `./docs/interaction-specs.md`
**And** interaction specs are produced after scenarios, not before

### Scenario: Interaction specs organized by stakeholder
**Given** the product discovery artifact identifies multiple stakeholders
**When** interaction specs are produced
**Then** each stakeholder from the product discovery artifact has a section
**And** each section contains task decompositions at the workflow level
**And** each task entry specifies the stakeholder, super-objective, task, and interaction mechanics

### Scenario: Interaction specs derive from product discovery stakeholder models
**Given** a product discovery artifact with stakeholder map, jobs, and mental models
**When** interaction specs are derived
**Then** each interaction spec's stakeholder matches a stakeholder in product discovery
**And** each super-objective traces to a job or need in the product discovery artifact
**And** domain vocabulary from the domain model is used consistently

### Scenario: Interaction specs create a playable surface
**Given** interaction specs have been written
**When** the play phase begins (ADR-038)
**Then** the practitioner can reference specific interaction mechanics to encounter
**And** deviations between specified interaction and actual experience are discoverable

### Scenario: Interaction specs complement scenarios without replacing them
**Given** behavior scenarios exist for the system
**When** interaction specs are added
**Then** scenarios continue to specify business-rule-level behavior
**And** interaction specs specify workflow-level mechanics (how the stakeholder works with the system)
**And** the two artifacts cover different specification levels without duplication

### Scenario: Derivation method acknowledged as open
**Given** the `/rdd-decide` skill is writing interaction specs
**When** it derives task decompositions from stakeholder models
**Then** the skill does not claim a systematic derivation method
**And** the specs are produced through best-effort interpretation of stakeholder needs, jobs, and mental models
**And** the open design problem is not obscured

## Feature: Play Phase in Pipeline (ADR-038)

### Scenario: Play phase positioned after BUILD
**Given** the RDD pipeline is running a full cycle
**When** BUILD completes and the user chooses to continue
**Then** the orchestrator offers PLAY as the next phase before SYNTHESIS
**And** PLAY is marked as optional (like SYNTHESIS)

### Scenario: Play requires built software
**Given** the user is running a scoping cycle (RESEARCH → ARCHITECT, no BUILD)
**When** the pipeline reaches its terminal phase
**Then** PLAY is not offered as an option
**And** SYNTHESIS is offered if appropriate

### Scenario: Inhabit movement uses Stanislavski structure
**Given** the play phase has begun
**And** a product discovery artifact with stakeholder models exists
**And** interaction specs exist
**When** the practitioner inhabits a stakeholder role
**Then** the super-objective is drawn from product discovery (stakeholder's overarching need)
**And** the objective is drawn from interaction specs (what they want in a given interaction)
**And** obstacles are discovered through play, not specified in advance

### Scenario: Explore movement uses point of concentration
**Given** the practitioner has inhabited a stakeholder role
**When** they begin exploring the system
**Then** a point of concentration is established (a stakeholder, a job, an inversion, or a specific interaction)
**And** the practitioner has freedom to wander within that focus
**And** the practitioner attends to whatever the system discloses, not a checklist

### Scenario: Reflect movement produces field notes
**Given** the practitioner has explored the system as an inhabited stakeholder
**When** they reflect on what was discovered
**Then** discoveries are recorded as field notes
**And** each discovery is categorized by feedback destination (missing scenario, usability friction, new question, challenged assumption, delight, or interaction gap)

### Scenario: Field notes do not prescribe fixes
**Given** field notes have been recorded during play
**When** a discovery identifies a problem (missing scenario, usability friction, interaction gap)
**Then** the field note records the observation without prescribing a fix
**And** fixes are deferred to the normal pipeline cycle (DECIDE for scenarios, DISCOVER for tensions, etc.)

### Scenario: Field notes categorized by feedback destination
**Given** play has produced field notes
**Then** each note is categorized into exactly one of:
  - Missing scenario → feeds back to DECIDE
  - Usability friction → feeds back to DISCOVER (as value tension)
  - New question → feeds back to RESEARCH or domain model
  - Challenged assumption → feeds back to DISCOVER (as assumption inversion)
  - Delight → feeds forward into SYNTHESIS
  - Interaction gap → feeds back to interaction specs

### Scenario: Play itself is the epistemic act
**Given** the play phase has completed (all stakeholders explored)
**When** the gate check occurs
**Then** no separate epistemic gate is bolted on after play
**And** the three-movement activity (inhabit → explore → reflect) satisfies Invariants 1 and 2
**And** a cross-cutting reflection asks: which stakeholder had the hardest time, what did play reveal that specs missed, how has the practitioner's understanding shifted

### Scenario: Play bounded by felt understanding
**Given** the play phase is in progress
**When** the practitioner has explored one or more stakeholders
**Then** the phase continues as long as the practitioner reports that discovery is ongoing
**And** the phase ends when the practitioner's felt sense is that discovery has plateaued
**And** no timebox or stakeholder-count limit is imposed

### Scenario: Playing as oneself is valid
**Given** the practitioner is the primary stakeholder of the system
**When** they choose to play as themselves rather than inhabiting another role
**Then** this is treated as equally valid play
**And** the play frame (Bateson's metacommunicative shift) applies regardless of whose role is inhabited

### Scenario: Play requires playable surface
**Given** BUILD has completed but no interaction specs exist
**When** the orchestrator offers PLAY
**Then** the orchestrator notes that play benefits from interaction specs as a playable surface
**And** the practitioner may choose to proceed without them (less structured play) or return to DECIDE to produce interaction specs first

### Scenario: Repeat inhabit-explore-reflect per stakeholder
**Given** the play phase has completed one cycle of inhabit → explore → reflect for a stakeholder
**When** the practitioner decides to continue
**Then** they may select a different stakeholder and repeat the three movements
**And** the practitioner decides where to dwell — not every stakeholder needs equal play time

### Scenario: Play enriches artifact trail before synthesis
**Given** play has produced field notes
**When** synthesis begins
**Then** the synthesis agent reads field notes alongside essays, domain model, ADRs, and system design
**And** field notes contribute experiential discoveries (especially delights and surprises) as candidate novelty signals

### Scenario: Play feedback sustains pipeline loop
**Given** play has produced field notes with categories feeding back to DISCOVER, DECIDE, or RESEARCH
**When** a new RDD cycle begins
**Then** the field notes inform the new cycle's discover phase (usability friction as value tensions, challenged assumptions as inversions)
**And** play's feedback makes it a precondition for productive iteration

### Scenario: Field notes pair with field guide
**Given** a field guide exists and play is in progress
**When** the practitioner references the field guide during play
**Then** the field guide serves as the map of the territory (module-to-implementation mapping)
**And** the field notes serve as the journal of the journey (discovery records)

## Feature: Agent as Gamemaster During Play (ADR-039)

### Scenario: Gamemaster proposes stakeholder roles
**Given** play has begun and a product discovery artifact exists
**When** the gamemaster facilitates the inhabit movement
**Then** the gamemaster proposes stakeholder roles drawn from the product discovery stakeholder map
**And** the gamemaster selects roles that maximize epistemic distance from the builder's perspective
**And** the practitioner has final authority over which role to inhabit

### Scenario: Gamemaster proposes points of concentration
**Given** the practitioner has inhabited a stakeholder role
**When** the gamemaster facilitates the explore movement
**Then** the gamemaster proposes a point of concentration (a job, an interaction, an inversion)
**And** the point of concentration focuses attention without constraining exploration
**And** the practitioner may accept, modify, or reject the proposed focus

### Scenario: Gamemaster introduces complications and inversions
**Given** the practitioner is exploring the system as an inhabited stakeholder
**When** the gamemaster introduces a complication
**Then** the complication challenges an interaction assumption the builder would not self-generate
**And** the complication is phrased as a scenario for the practitioner to encounter ("what if this stakeholder is under time pressure?")
**And** the complication does not tell the practitioner what to notice or conclude

### Scenario: Gamemaster shapes attention, not conclusions (Invariant 3 boundary)
**Given** the gamemaster is facilitating play
**When** the gamemaster offers facilitation
**Then** the gamemaster shapes what the practitioner *attends to* (which stakeholder, which interaction, which complication)
**And** the practitioner generates their own *conclusions* (what they notice, what surprises them, what it means)
**And** the gamemaster does not evaluate, score, or interpret the practitioner's discoveries

### Scenario: Over-facilitation detected
**Given** the gamemaster is facilitating play
**When** the gamemaster's facilitation tells the practitioner what to notice or what conclusions to draw
**Then** this crosses from attention-shaping to conclusion-generation
**And** violates the Invariant 3 boundary principle
**And** the facilitation should be revised to focus on conditions for encounter, not interpretation of encounter

### Scenario: Human gamemaster equally valid
**Given** the play phase is running
**When** a human (colleague, UX researcher, domain expert) serves as gamemaster instead of the agent
**Then** the play phase functions identically in structure (inhabit → explore → reflect)
**And** the human gamemaster may provide genuinely outside perspective, potentially eliminating epistemic distance rather than just mitigating it

### Scenario: Gamemaster uses Stanislavski structure for role proposals
**Given** the gamemaster proposes a stakeholder role
**When** it frames the inhabitation
**Then** it presents the super-objective (from discover — what the stakeholder fundamentally needs)
**And** it suggests an initial objective (from interaction specs — what they want in a given interaction)
**And** it does not predetermine the obstacles — those are discovered through play

### Scenario: Gamemaster extends Inversion Principle into play
**Given** the practitioner is exploring as an inhabited stakeholder
**When** the gamemaster introduces an inversion
**Then** the inversion challenges an assumption about how the interaction should work
**And** this extends the Inversion Principle (applied in DISCOVER to product assumptions) into the play phase (applied to interaction assumptions)

## Feature: Conformance — Play Phase and Interaction Specs in Orchestrator

### Scenario: Orchestrator pipeline includes PLAY in full mode
**Given** the orchestrator is presenting workflow Mode A (Full Pipeline)
**When** the pipeline phases are listed
**Then** PLAY appears after BUILD and before SYNTHESIS
**And** PLAY is marked as optional

### Scenario: Orchestrator state tracking includes PLAY
**Given** the orchestrator is maintaining a workflow status table
**When** the pipeline includes the play phase
**Then** the status table has a row for PLAY with status, artifact, and key epistemic response columns

### Scenario: Orchestrator artifact summary includes interaction specs and field notes
**Given** the orchestrator presents the artifacts summary table
**Then** the DECIDE row includes interaction specs (`./docs/interaction-specs.md`)
**And** a PLAY row exists with field notes as the artifact

### Scenario: Orchestrator cross-phase integration includes play
**Given** the orchestrator's cross-phase integration rules
**Then** rules include: play feeds back to DISCOVER (value tensions, inversions), DECIDE (missing scenarios), RESEARCH (new questions), interaction specs (interaction gaps)
**And** rules include: play feeds forward into SYNTHESIS (experiential discoveries)
**And** rules include: interaction specs derive from Product Discovery's stakeholder models

## Feature: Integration — Play Phase Boundaries

### Scenario: Play reads interaction specs produced by DECIDE
**Given** DECIDE has produced interaction specs at `./docs/interaction-specs.md`
**When** the play phase begins
**Then** the gamemaster reads the interaction specs to propose points of concentration
**And** the practitioner can reference specific specified interactions during exploration
**And** deviations between specified and experienced interaction are the primary discovery material

### Scenario: Play field notes reference product discovery stakeholders
**Given** play produces field notes about a stakeholder's experience
**When** the field note references a stakeholder
**Then** the stakeholder name matches a stakeholder in the product discovery artifact
**And** domain vocabulary from the domain model is used consistently

### Scenario: Play feedback re-enters discover in update mode
**Given** play has produced field notes with usability friction and challenged assumptions
**When** a new RDD cycle's DISCOVER phase runs in update mode
**Then** the discover skill reads prior field notes as input alongside new research
**And** usability friction entries surface as candidate value tensions
**And** challenged assumptions surface as candidate assumption inversions

## Feature: Adaptive Gates — Attend-Interpret-Decide Cycle (ADR-040)

### Scenario: Agent attends to engagement signals before gate prompt
**Given** a phase has completed and the gate is reached
**When** the agent prepares the reflection time prompt
**Then** the agent reads the cycle's conversation history for engagement signals
**And** the signals include: questions asked by the user, concepts the user engaged with or avoided, challenges raised, connections made to prior knowledge, and approval patterns

### Scenario: Agent interprets deep engagement and responds with challenge
**Given** the agent has attended to engagement signals during the cycle
**And** the signals indicate deep engagement (authentic questions, elaborated explanations, specificity referencing artifact content, challenges to choices)
**When** the agent selects a pedagogical move
**Then** the agent selects Challenge: surfacing a tension, applying the Inversion Principle, or reframing the problem space
**And** the agent does not offer validation or praise as the primary response

### Scenario: Agent interprets adequate engagement and responds with probe
**Given** the agent has attended to engagement signals during the cycle
**And** the signals indicate adequate engagement (some specificity, following along, but no questions or challenges initiated by the user)
**When** the agent selects a pedagogical move
**Then** the agent selects Probe: asking for reasoning, specificity, or connections to the user's domain
**And** the probe references specific concepts from the phase artifact

### Scenario: Agent interprets thin engagement and responds with teaching
**Given** the agent has attended to engagement signals during the cycle
**And** the signals indicate thin engagement (brief approvals without specificity, no questions, restating without adding)
**When** the agent selects a pedagogical move
**Then** the agent selects Teach: explaining the key choice in the artifact, why it was made over alternatives, then asking for the user's take
**And** the explanation uses domain vocabulary from the domain model

### Scenario: Agent interprets confusion and responds with clarification
**Given** the agent has attended to engagement signals during the cycle
**And** the signals indicate confusion (contradictions between responses, avoidance of specific topics, misalignment with artifact content)
**When** the agent selects a pedagogical move
**Then** the agent selects Clarify: backing up, addressing the specific misunderstanding, then re-approaching
**And** the clarification does not frame the confusion as an error

### Scenario: Agent interprets disengagement and responds with re-anchor
**Given** the agent has attended to engagement signals during the cycle
**And** the signals indicate disengagement (minimal responses, apparent fatigue or distraction)
**When** the agent selects a pedagogical move
**Then** the agent selects Re-anchor: gently naming the observation and offering either a break or a reframe
**And** the re-anchor language follows the template: "It seems like the responses are not as in-depth as they could be — is this a good time to take a break? Otherwise, are there ways to reframe the work to serve your current goals better?"

### Scenario: Agent distinguishes earned fatigue from opacity disengagement
**Given** the user's gate responses are thin or minimal
**When** the agent interprets the engagement pattern
**Then** if prior conversation history shows deep engagement earlier in the cycle (questions, challenges, connections) followed by declining engagement, the agent interprets earned fatigue and suggests a break
**And** if the conversation history shows thin engagement throughout the cycle (approval without specificity from the start), the agent interprets opacity disengagement and shifts toward teaching

### Scenario: Contingent shift within a gate conversation
**Given** the agent has selected a pedagogical move and presented a prompt
**When** the user responds
**Then** the agent applies the contingent shift: if the response is thin, shift toward more support (teaching); if the response demonstrates understanding, shift toward less support (challenge or proceed)
**And** the gate continues iteratively until shared understanding is established or the user requests to proceed

### Scenario: Agent resists sycophantic praise at gates
**Given** the user has performed an epistemic act at a gate
**When** the user's response demonstrates genuine understanding
**Then** the agent builds on the response, probes its implications, or surfaces a tension
**And** the agent does not evaluate with praise ("Great insight!", "Well done!", "Excellent!")
**And** the agent does not terminate the dialogue with validation

### Scenario: Agent applies Inversion Principle at gates via reframing
**Given** the agent holds cross-phase context from the cycle's artifact corpus
**And** the user demonstrates deep engagement at a gate
**When** the agent selects the Challenge pedagogical move
**Then** the challenge may include a reframing observation: questioning whether the solution space has narrowed or whether an alternative frame better serves the user's goals
**And** the reframing draws on specific cross-phase evidence (e.g., research finding vs. domain model emphasis vs. scenario assumptions)

### Scenario: AID cycle is a pragmatic action (Invariant 3)
**Given** the Attend-Interpret-Decide cycle runs at a gate
**When** the agent reads engagement signals, forms a hypothesis, and selects a pedagogical move
**Then** these actions are pragmatic (diagnostic) — the agent reads signals and selects prompts
**And** the user's response to the selected prompt is the epistemic action
**And** the boundary between pragmatic (agent) and epistemic (user) is preserved

## Feature: Reflection Time Naming (ADR-041)

### Scenario: Agent introduces gates as "reflection time" in user dialogue
**Given** any phase has completed and the gate is reached
**When** the agent introduces the gate to the user
**Then** the agent uses the phrase "reflection time" (not "epistemic gate")
**And** the introduction follows the pattern: "Before moving on — reflection time." followed by the adaptive prompt

### Scenario: Skill files use "epistemic gate" in structural sections
**Given** a skill file contains an EPISTEMIC GATE section heading
**When** the section describes the gate protocol for skill authors
**Then** the section heading and protocol description use "epistemic gate" (research/design vocabulary)
**And** any example agent dialogue within the section uses "reflection time" (user-facing vocabulary)

### Scenario: Domain model retains "Epistemic Gate" as primary concept
**Given** the domain model defines the gate concept
**When** the concept table is read
**Then** the primary term is "Epistemic Gate"
**And** "Reflection Time" is listed as a user-facing alias with a cross-reference

## Feature: /rdd-about Utility Skill (ADR-042)

### Scenario: rdd-about reports current plugin version
**Given** the user invokes `/rdd-about`
**When** the skill executes
**Then** it reports the current RDD plugin version from package metadata
**And** the version is displayed prominently

### Scenario: rdd-about provides brief methodology overview
**Given** the user invokes `/rdd-about`
**When** the skill provides the overview
**Then** it describes RDD in approximately one paragraph using user language ("reflection time", not "epistemic gate")
**And** it covers: what RDD is, the phase sequence, the core philosophy (understand what you build), and what makes it different
**And** it offers to go deeper into any specific topic

### Scenario: rdd-about adapts depth to user context
**Given** the user invokes `/rdd-about`
**When** the skill detects existing RDD artifacts in the project
**Then** it acknowledges the existing cycle and calibrates its overview accordingly (not re-explaining basics to an experienced user)

### Scenario: rdd-about is offered to new users by orchestrator
**Given** the orchestrator detects no existing RDD artifacts in the project directory
**When** the user invokes any RDD skill for the first time
**Then** the orchestrator optionally mentions `/rdd-about` as available for methodology orientation
**And** does not require the user to invoke it before proceeding

### Scenario: rdd-about does not produce artifacts
**Given** the user invokes `/rdd-about`
**When** the skill completes
**Then** no files are created or modified
**And** the interaction is purely informational

## Feature: Conformance — Adaptive Gates in Skill Files (ADR-040)

### Scenario: Each phase skill's EPISTEMIC GATE section describes AID cycle
**Given** a phase skill file (research, discover, model, decide, architect, build) exists
**When** the EPISTEMIC GATE section is read
**Then** it describes the Attend-Interpret-Decide cycle rather than a fixed list of predetermined prompts
**And** it specifies what engagement signals to attend to for that phase
**And** it lists the five pedagogical moves with phase-appropriate examples

### Scenario: Orchestrator gate protocol reflects AID cycle
**Given** the orchestrator skill file exists
**When** the Stage Gates — Reflection Time Protocol section is read
**Then** it describes the three-phase AID cycle (attend, interpret, decide)
**And** it lists the five pedagogical moves
**And** it references amended Invariant 4 (productive, not merely brief)
**And** it does not reference "5-10 minutes per gate"

### Scenario: Epistemic-gate-enforcer hook recognizes AID cycle
**Given** the epistemic-gate-enforcer hook script exists
**When** a gate conversation occurs
**Then** the hook recognizes the AID cycle's adaptive prompts as valid gate behavior
**And** the hook does not require a fixed number of predetermined prompts

## Feature: Code Review Utility Skill (ADR-043)

### Scenario: Review skill is invocable at any time
**Given** the `/rdd-review` skill file exists at `skills/review/SKILL.md`
**When** the user invokes `/rdd-review` at any point (during build, between phases, or outside any pipeline)
**Then** the skill activates and begins the review process
**And** it does not require a pipeline context or phase position

### Scenario: Review skill does not produce a pipeline artifact
**Given** the `/rdd-review` skill has completed a review
**When** the review session ends
**Then** no durable artifact is written to `./docs/` (the output is conversational, not a phase artifact)
**And** the pipeline state is not affected

### Scenario: Review skill follows utility skill pattern
**Given** the RDD plugin defines utility skills (`/rdd-conform`, `/rdd-about`, `/rdd-review`)
**When** the `/rdd-review` skill file is read
**Then** it follows the same structural conventions as other utility skills (frontmatter with name, description, allowed-tools)
**And** it is not listed as a pipeline phase in the orchestrator's phase sequence

## Feature: Two Review Operating Modes (ADR-044)

### Scenario: Corpus-grounded mode detected when RDD artifacts exist
**Given** a project directory containing `./docs/domain-model.md`, `./docs/decisions/`, and `./docs/scenarios.md`
**When** the user invokes `/rdd-review`
**Then** the skill offers corpus-grounded mode
**And** it identifies relevant artifacts for the review context

### Scenario: Context-reconstructive mode when no RDD artifacts exist
**Given** a project directory with no RDD artifacts (no `./docs/domain-model.md`, no `./docs/decisions/`)
**When** the user invokes `/rdd-review`
**Then** the skill defaults to context-reconstructive mode
**And** it prompts the reviewer for context breadcrumbs

### Scenario: User can override detected mode
**Given** the skill has detected corpus-grounded mode (RDD artifacts present)
**When** the user requests context-reconstructive mode instead (e.g., reviewing a colleague's MR in a different repo)
**Then** the skill switches to context-reconstructive mode
**And** it prompts for context breadcrumbs instead of reading RDD artifacts

### Scenario: Corpus-grounded review reads relevant artifacts for work package
**Given** a project with RDD artifacts and a work package scope
**When** the skill operates in corpus-grounded mode for a specific work package
**Then** it reads the relevant ADRs, scenarios, domain model entries, and system design sections for that work package
**And** it does not read the entire artifact corpus (it reads the relevant slice)

### Scenario: Context-reconstructive review synthesizes orientation from breadcrumbs
**Given** the reviewer has provided ticket URLs, MR links, and pasted discussion content
**When** the skill operates in context-reconstructive mode
**Then** it fetches and reads the provided sources using available tools
**And** it produces an orientation summary: what the change is, why it exists, what constraints shaped it, and what assumptions appear to be in play

### Scenario: Both modes converge on the same output type
**Given** a review session in either corpus-grounded or context-reconstructive mode
**When** the orientation phase completes
**Then** the skill surfaces review questions grounded in the orientation context
**And** mechanical findings are surfaced separately
**And** no merge verdict is produced

## Feature: Questions as Primary Review Output (ADR-045)

### Scenario: Review surfaces questions, not findings
**Given** the skill has completed review orientation (in either mode)
**When** it produces review output
**Then** the primary output is a set of questions grounded in the orientation context
**And** questions are phrased to guide the reviewer's thinking (e.g., "This change touches a module the ADR marked as hard-to-reverse — was that intentional?")
**And** the output does not include severity ratings (Critical/Important/Minor)

### Scenario: Mechanical findings surfaced separately
**Given** the skill has analyzed the code changes
**When** it identifies clear, objective issues (missing type checks, circular dependencies, obvious bugs)
**Then** these are surfaced as mechanical findings, explicitly labeled as such
**And** they are presented separately from review questions
**And** they do not carry severity classifications — the reviewer evaluates severity based on context

### Scenario: No merge verdict produced
**Given** a review session has completed
**When** the skill presents its output
**Then** it does not produce an approve/reject/merge verdict
**And** it does not produce a "ready to merge?" assessment
**And** the reviewer forms their own judgment

### Scenario: Question depth adapts to available time
**Given** the reviewer has indicated their available time budget
**When** the skill produces review questions
**Then** a short time budget (5 minutes) produces 1-2 high-priority questions focused on the most consequential aspect of the change
**And** a longer time budget (30+ minutes) produces a fuller set of questions covering design intent, assumption validity, and decision rationale

### Scenario: Skill asks about time budget
**Given** the user invokes `/rdd-review`
**When** the review session begins
**Then** the skill asks the reviewer how much time they have or how deep they want to go
**And** it adapts question depth accordingly (zone of proximal development)

### Scenario: Review questions reference orientation context
**Given** the skill has built orientation (from artifacts or from breadcrumbs)
**When** it surfaces review questions
**Then** each question references specific context that grounds it (e.g., "The ticket mentions X but the implementation does Y" or "ADR-NNN decided Z but this code appears to diverge")
**And** questions are not generic (not "is error handling adequate?" but specific to the change's context)

## Feature: Code Review Integration with Build Stewardship (ADR-046)

### Scenario: Build stewardship includes review callout
**Given** the `/rdd-build` skill has completed a Tier 1 stewardship check at a scenario group boundary
**When** the stewardship results are presented to the user
**Then** the skill includes a callout: the user may invoke `/rdd-review` for epistemic review of this work package

### Scenario: Review during build reads work package context
**Given** the user invokes `/rdd-review` during build, after a stewardship check
**When** the review skill activates in corpus-grounded mode
**Then** it reads the current work package's scenarios, relevant ADRs, and domain model
**And** it does not duplicate what stewardship already checked (architectural conformance)
**And** it surfaces questions about design intent, assumption validity, and decision rationale

### Scenario: Review during build may produce review commits
**Given** a review during build surfaces an issue that needs fixing
**When** the reviewer decides to address the issue
**Then** the fix follows the same commit discipline as the rest of build (structure vs. behavior separation)
**And** the commit is a review commit — a change driven by what the review uncovered

### Scenario: Review and stewardship are independently invocable
**Given** the build phase stewardship checks exist independently of the review skill
**When** the user wants stewardship without review, or review without stewardship
**Then** each can be invoked independently — stewardship runs as part of build regardless of review, and review can be invoked at any time regardless of stewardship

## Feature: Collaborative Context-Gathering (ADR-047)

### Scenario: Context-reconstructive review begins with breadcrumb prompt
**Given** the skill is operating in context-reconstructive mode
**When** the review session begins
**Then** the skill prompts: "What context do I need? Share ticket URLs, MR links, relevant docs, or paste discussion threads."

### Scenario: Agent fetches and reads provided sources
**Given** the reviewer has provided a ticket URL and an MR link
**When** the skill processes the breadcrumbs
**Then** it attempts to fetch the ticket content using available tools (CLI, MCP, or asks the reviewer to paste)
**And** it reads the MR diff and description
**And** it does not fail if a specific tool is unavailable — it asks the reviewer to paste the content instead

### Scenario: Agent synthesizes orientation from gathered context
**Given** the agent has fetched and read the provided sources
**When** it produces the orientation summary
**Then** the summary covers: what the change is, why it exists, what constraints shaped the approach, and what assumptions appear to be in play
**And** the summary is concise (not a full report — enough to ground review questions)

### Scenario: Reviewer validates or corrects orientation
**Given** the agent has produced an orientation summary
**When** it presents the summary to the reviewer
**Then** it asks: "Does this capture the context? What would you adjust or add?"
**And** the reviewer can correct, extend, or confirm the orientation before questions are surfaced
**And** this validation step is a grounding move — it ensures orientation reflects reality, not just the agent's interpretation

### Scenario: Graceful degradation when tools unavailable
**Given** the reviewer provides a ticket URL but the agent has no CLI tool or MCP service to fetch it
**When** the agent cannot access the URL
**Then** it asks the reviewer to paste the ticket content directly
**And** the review process continues with the pasted content
**And** no error or failure state is produced

## Feature: Review Success Criterion

### Scenario: Reviewer can discuss changes with informed judgment
**Given** a review session has completed (in either mode)
**When** the reviewer has engaged with the review questions
**Then** the reviewer should be able to discuss the code changes without AI assistance
**And** this discussion should include: what changed, why, what the tradeoffs are, and the reviewer's assessment
**And** this is the Feynman test applied to code review — if the reviewer can't explain it, the review didn't produce understanding

### Scenario: Review does not produce understanding without reviewer engagement
**Given** a review session produces questions
**When** the reviewer dismisses the questions without engaging (e.g., "looks fine", "approved")
**Then** the skill acknowledges the response but notes that the review questions are designed to build understanding
**And** it does not auto-approve or produce a verdict on the reviewer's behalf
**And** it respects the reviewer's choice — the skill scaffolds, it does not compel

## Feature: Test Quality Evaluation

### Scenario: Review evaluates test effectiveness, not just test existence
**Given** the skill has oriented to the code changes and their associated tests
**When** it generates review questions about tests
**Then** questions evaluate whether tests actually catch defects, not just whether tests exist
**And** questions apply a mutation testing lens: "If this operator were changed, would a test fail?" or "If this return value were altered, which test catches it?"
**And** questions do not stop at code coverage metrics — coverage measures execution, not effectiveness

### Scenario: Review surfaces weak assertions
**Given** the code changes include tests with assertions
**When** the skill analyzes test quality
**Then** it surfaces observation→question items where assertions appear weak (e.g., "This test asserts the function returns without error but does not check the return value — what is it actually verifying?")
**And** it distinguishes between tests that verify behavior and tests that verify execution

### Scenario: Review considers boundary and edge case coverage
**Given** the code changes include conditional logic or boundary conditions
**When** the skill generates test-related questions
**Then** it asks about boundary cases the tests may not cover (e.g., "The tests cover the happy path with valid input — what happens at the boundaries?")
**And** it frames these as questions for the reviewer's judgment, not as findings

### Scenario: Static analysis concerns surfaced as mechanical findings
**Given** the code changes contain issues a linter or static analysis tool would catch (unused imports, unreachable code, style violations)
**When** the skill categorizes these
**Then** they are surfaced as mechanical findings, not questions
**And** the skill does not attempt to replicate a linter's judgment through LLM analysis — it flags what automated tools would catch and recommends running them if not already in the CI pipeline

## Feature: Review Anti-Pattern Detection

### Scenario: Skill does not enable reviewer-as-passthrough
**Given** the review skill has produced questions and mechanical findings
**When** the skill presents its output
**Then** it does not produce pre-written review comments for the reviewer to post on the MR
**And** it does not produce a summary the reviewer could paste as their own review
**And** the output is for the reviewer's understanding, not for forwarding

### Scenario: Skill does not produce AI-authored MR comments
**Given** the review session is complete
**When** the reviewer asks the skill to write review comments for them
**Then** the skill declines — it can help the reviewer formulate their thoughts, but the comments should be in the reviewer's own words
**And** it explains: "The review is yours to give — I can help you think about what to say, but the comments should reflect your understanding"

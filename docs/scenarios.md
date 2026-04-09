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

## Feature: Composable Skill Family (ADR-048)

### Scenario: Four skills share Context Gathering protocol
**Given** any skill in the Composable Skill Family (build, debug, refactor, review) is invoked standalone
**When** the skill begins its work
**Then** it runs the five-step Context Gathering protocol: detect mode, prompt for breadcrumbs, fetch and read, synthesize orientation, validate with user
**And** it answers the five Orientation Questions from available evidence

### Scenario: Skills operate in pipeline mode when artifacts exist
**Given** an RDD artifact corpus exists (domain model, system design, scenarios, ADRs)
**When** any composable skill is invoked
**Then** it detects the artifact corpus and offers pipeline mode
**And** in pipeline mode, orientation is read from the artifact trail rather than synthesized from breadcrumbs

### Scenario: Skills operate in context-reconstructive mode without artifacts
**Given** no RDD artifact corpus exists
**When** any composable skill is invoked
**Then** it enters context-reconstructive mode
**And** it prompts for breadcrumbs: "What context do I need? Share ticket URLs, docs, paste threads, or describe the situation"
**And** it synthesizes orientation from whatever sources are available

### Scenario: User validation of orientation is never skipped
**Given** any composable skill has synthesized orientation (in either mode)
**When** the orientation is presented to the user
**Then** the skill asks "Does this capture the context? What would you adjust or add?"
**And** the skill does not proceed to specialized work until the user validates or corrects the orientation

## Feature: Context Gathering Protocol Adaptation (ADR-049)

### Scenario: Build skill emphasizes work decomposition in orientation synthesis
**Given** the build skill is running Context Gathering in context-reconstructive mode
**When** it synthesizes orientation (step 4)
**Then** the synthesis emphasizes scope, integration points, testable behaviors, and work decomposition
**And** it produces a work decomposition as a reconstructed facsimile

### Scenario: Debug skill emphasizes expected-vs-actual divergence in orientation synthesis
**Given** the debug skill is running Context Gathering standalone
**When** it synthesizes orientation (step 4)
**Then** the synthesis emphasizes the expected behavior, the actual behavior, and where the divergence occurs
**And** it frames the orientation around the hypothesis: "What is the mental model wrong about?"

### Scenario: Refactor skill emphasizes structural health in orientation synthesis
**Given** the refactor skill is running Context Gathering standalone
**When** it synthesizes orientation (step 4)
**Then** the synthesis emphasizes current code structure, architectural intent, and the relationship between the code area and the broader system
**And** it orients toward the Three-Level Refactor's diagnostic framework

## Feature: Reconstructed Facsimiles (ADR-050)

### Scenario: Work decomposition written as session artifact
**Given** the build skill has derived a work decomposition in context-reconstructive mode
**And** the user has validated the decomposition
**When** the decomposition is finalized
**Then** it is written as a markdown file in a `session/` directory
**And** the file includes `session-artifact: true` in its frontmatter
**And** the build loop references this file during iteration

### Scenario: Orientation summary written as session artifact
**Given** Context Gathering has produced a validated orientation summary
**When** the session is expected to be substantial (standard or deep time budget)
**Then** the orientation summary is written as a session artifact
**And** stewardship checkpoints reference it for conformance checks

### Scenario: Session artifacts survive context compression
**Given** a build session has been running long enough for context compression to occur
**When** a stewardship checkpoint needs to reference the original work decomposition
**Then** the skill reads the work decomposition from the session artifact file
**And** the check is performed against the written facsimile, not from compressed conversation memory

## Feature: Work Decomposition (ADR-051)

### Scenario: Build derives work packages from ticket and codebase
**Given** the build skill is in context-reconstructive mode
**And** the user has provided a ticket description and relevant codebase breadcrumbs
**When** the skill synthesizes orientation
**Then** it derives atomic work packages, each specifying: scope, integration points, testable behaviors, and dependencies
**And** dependencies are classified as hard, implied, or open

### Scenario: User validates work decomposition before build loop begins
**Given** the build skill has derived work packages
**When** the decomposition is presented to the user
**Then** the user can reorder, split, merge, or reject work packages
**And** the build loop does not begin until the user confirms the decomposition

### Scenario: Dependency classification is heuristic at ticket level
**Given** the build skill has derived work packages from a ticket (not a roadmap)
**When** the dependency classification is presented
**Then** the skill notes that at the ticket level, classification is approximate rather than architecturally grounded
**And** it presents the classification as a starting decomposition, not an architectural fact

### Scenario: Work decomposition includes optional demo scenarios
**Given** the build skill has derived work packages
**When** a work package's scope is clear enough to envision stakeholder use
**Then** the work package includes a demo scenario: how would a stakeholder use this feature?
**And** the demo scenario preserves the forward path to Play

## Feature: Build Skill Outer Loop

### Scenario: Build iterates through work packages with TDD
**Given** the build skill has a validated work decomposition (from roadmap or reconstructed facsimile)
**When** the build loop processes a work package
**Then** it follows the TDD cycle: red (write a failing test encoding the testable behavior), green (make the test pass), refactor (Three-Level Refactor)
**And** it proceeds to the next work package when the current one is complete

### Scenario: Stewardship checkpoint at scenario group boundaries
**Given** the build skill has completed a scenario group (set of related work packages)
**When** a natural boundary is reached
**Then** the skill runs a stewardship checkpoint: does the code implement the work package's testable behaviors, does architecture match the orientation, is domain vocabulary consistent, are there integration concerns?
**And** the developer engages with the stewardship assessment before proceeding

### Scenario: Integration verification against real neighbors
**Given** a work package involves a component with adjacent dependencies
**When** the build skill reaches integration verification
**Then** it tests the boundary with at least one adjacent component using real types (not stubs)
**And** it verifies that the component's output can be consumed by downstream components

## Feature: Debug Skill (ADR-048)

### Scenario: Debug follows hypothesis-trace-understand-fix cycle
**Given** the debug skill is invoked (standalone or from build)
**And** Context Gathering has produced an orientation
**When** the developer describes the unexpected behavior
**Then** the skill guides through: hypothesize (what is the mental model wrong about?), trace (follow data flow to the divergence point), understand (name the misunderstanding, not just the fix), fix with tests (TDD the corrected behavior)

### Scenario: Debug names the misunderstanding, not just the fix
**Given** the debug skill has traced a bug to its source
**When** it presents the finding to the developer
**Then** it names what the developer's (or AI's) mental model was wrong about
**And** it does not jump directly to a fix without the developer understanding what was incorrect

### Scenario: Debug encodes corrected understanding in a test
**Given** the debug skill has identified the root cause of a bug
**When** the fix is implemented
**Then** a test is written that encodes the corrected understanding
**And** the test would have caught the original misunderstanding if it had existed before

## Feature: Refactor Skill with AI Smell Taxonomy (ADR-052)

### Scenario: Refactor diagnoses smells from classical and AI-exacerbated catalogs
**Given** the refactor skill is diagnosing code (standalone or within build)
**When** it runs level 1 (Smells) of the Three-Level Refactor
**Then** it checks against both the classical catalog (Fowler) and the AI-exacerbated catalog (Avoidance of Refactors, Over-Specification, Distributed Incoherence, Bugs Deja-Vu, Oracle Mirroring, Logic Drift)
**And** it identifies which catalog each smell belongs to

### Scenario: Refactor runs AI hygiene prompts separately from smell detection
**Given** the refactor skill is running its diagnostic step
**When** it addresses novel AI patterns (Constraint Decay, Slopsquatting, Intent Debt)
**Then** it runs these as awareness prompts, not as smell detection
**And** it does not claim the code is free of novel AI patterns based on code inspection alone
**And** the prompts are: check whether earlier constraints still hold, verify unfamiliar package names, check whether rationale exists for generated code

### Scenario: Refactor applies technique from catalog with awareness of inverse pairs
**Given** the refactor skill has identified a smell at level 1
**When** it moves to level 2 (Patterns)
**Then** it selects the appropriate technique from the refactoring catalog
**And** it considers the inverse pair (e.g., Extract Method vs Inline Method) because direction depends on context

### Scenario: Refactor checks against architectural intent at level 3
**Given** the refactor skill has applied a technique at level 2
**When** it moves to level 3 (Methodology)
**Then** it checks: does the code land in the right module? Does it respect dependency rules? Does it use consistent domain vocabulary?
**And** it references the system design (pipeline mode) or orientation summary (context-reconstructive mode) as the architectural intent

### Scenario: Refactoring committed as structure change
**Given** the refactor skill has completed a refactoring
**When** the changes are committed
**Then** the commit uses the `refactor:` prefix
**And** behavior is unchanged — tests pass before and after
**And** the refactoring is not mixed with behavior changes in the same commit

## Feature: Time Budget Mechanism (ADR-053)

### Scenario: Skill prompts for available time
**Given** any composable skill has completed Context Gathering
**When** the skill is ready to begin specialized work
**Then** it asks about available time: "How much time do you have for this?"
**And** it adapts its scope based on the response

### Scenario: Deep time budget enables full cycle
**Given** the developer indicates 30+ minutes available
**When** the skill runs
**Then** it provides full Context Gathering, complete TDD cycle with three-level refactor, stewardship at every scenario group boundary, and integration verification

### Scenario: Focused time budget reduces scope without skipping orientation
**Given** the developer indicates less than 10 minutes available
**When** the skill runs
**Then** it provides essential orientation (the most consequential answer from each Orientation Question)
**And** it focuses on a single work item
**And** it still validates orientation with the user before proceeding

### Scenario: Time budget is advisory, not enforced
**Given** the developer indicated a focused time budget
**When** the developer wants to go deeper mid-session
**Then** the skill adapts to the deeper scope without requiring the developer to restart

## Feature: Seamless Mode Shifts Within Build (ADR-054)

### Scenario: Build shifts to debug mode on unexpected test failure
**Given** the build skill is in the TDD cycle
**And** a test fails with an error unrelated to the behavior being specified (not a red-phase expected failure)
**When** the build skill detects the unexpected failure
**Then** it shifts seamlessly into debug mode within the same conversation
**And** the developer does not perceive a skill boundary — the thread of understanding continues

### Scenario: Build shifts to refactor mode after green
**Given** the build skill has completed the green phase (test passes)
**When** the developer or agent identifies a smell in the code just written
**Then** the build flow shifts into refactor mode
**And** the refactor mode inherits the build session's orientation without any re-orientation step

### Scenario: Build shifts to review mode at stewardship checkpoint
**Given** the build skill has reached a natural scenario group boundary
**When** a stewardship checkpoint is warranted
**Then** the build flow shifts into review mode
**And** the review mode enters the appropriate orientation (corpus-grounded or context-reconstructive) based on the build session's mode

### Scenario: Mode shifts inherit build session context without interruption
**Given** the build flow shifts into any mode (debug, refactor, or review)
**When** the mode begins
**Then** it inherits the build session's validated orientation and current work package
**And** no re-orientation occurs
**And** no time budget prompt occurs (it operates within the build session's budget)
**And** the conversation continues without perceivable interruption

### Scenario: Build flow resumes after mode shift resolves
**Given** the build flow shifted into debug mode and the bug is resolved
**When** the fix is complete (with a test encoding the corrected understanding)
**Then** the build flow resumes at the point where the trigger occurred
**And** the developer continues with the current work package

### Scenario: Previously passing test breaks after green-phase change
**Given** the build skill has completed a green-phase change
**And** a test that previously passed now fails
**When** the build skill detects this regression
**Then** it shifts into debug mode — this is an unexpected failure, not a red-phase expectation
**And** the debug mode traces the regression to its cause

## Feature: Standalone Skill Invocation

### Scenario: Debug invoked standalone on a production bug
**Given** a developer encounters a production bug outside a build cycle
**When** the developer invokes `/rdd-debug`
**Then** the skill runs its own Context Gathering protocol
**And** it prompts for breadcrumbs: error logs, reproduction steps, relevant code areas
**And** it synthesizes orientation before beginning the hypothesis-trace-understand-fix cycle

### Scenario: Refactor invoked standalone on a code area
**Given** a developer wants to improve a code area outside a build cycle
**When** the developer invokes `/rdd-refactor`
**Then** the skill runs its own Context Gathering protocol
**And** it reads the code area and surrounding context
**And** it begins the Three-Level Refactor diagnostic from the architectural intent

### Scenario: Standalone skill respects time budget independently
**Given** a developer invokes `/rdd-debug` standalone
**When** the skill asks about available time
**Then** the developer can specify any time budget
**And** the skill adapts without reference to a parent build session

## Feature: Integration — Mode Shifts Use Real Context

### Scenario: Debug mode uses real orientation context from build
**Given** a build session is active with a validated orientation and work decomposition
**And** an unexpected failure occurs during the TDD cycle
**When** the build flow shifts into debug mode
**Then** the debug mode has access to the orientation summary (not a stub or placeholder)
**And** the debug mode can reference the work package's testable behaviors and integration points
**And** the hypothesis is informed by the build context

### Scenario: Refactor mode uses real architectural intent from build
**Given** a build session is active in pipeline mode with system design available
**And** the green phase is complete and a smell is identified
**When** the build flow shifts into refactor mode
**Then** the refactor mode has access to the system design's module boundaries and dependency rules (not stubs)
**And** the level 3 (Methodology) check references the real architectural intent

### Scenario: Stewardship references session artifacts in context-reconstructive mode
**Given** a build session is active in context-reconstructive mode
**And** the work decomposition was written as a session artifact
**When** a stewardship checkpoint occurs
**Then** the stewardship check reads the session artifact file for the original work decomposition
**And** it compares the completed work against the decomposition's scope and testable behaviors

## Feature: Belief-Mapping Operationalization of Inversion Principle (ADR-055)

### Scenario: Agent uses belief-mapping form at RESEARCH gate
**Given** the `/rdd-research` skill has produced an essay artifact
**When** the agent applies the Inversion Principle at the gate
**Then** the agent uses belief-mapping framing ("What would you need to believe for a different problem framing to be right?")
**And** the agent does NOT use adversarial framing ("Argue against this approach" or "Strongest case against")

### Scenario: Agent uses belief-mapping form at DECIDE gate
**Given** the `/rdd-decide` skill has produced ADRs with rejected alternatives
**When** the agent applies the Inversion Principle at the gate
**Then** the agent asks "What would you need to believe for [rejected alternative] to be right?"
**And** the question references the specific rejected alternative from the ADR

### Scenario: Adversarial framing is available when explicitly requested
**Given** the user explicitly asks the agent to argue against their position ("play devil's advocate", "argue against this")
**When** the agent responds
**Then** the agent may use adversarial framing as a deliberate rhetorical choice
**And** the agent is not constrained to belief-mapping form for explicit user requests

### Scenario: Belief-mapping decouples content from recommendation
**Given** the agent has applied belief-mapping to an alternative at a gate
**When** the agent's response includes both content balance and a recommendation
**Then** the content addresses both the user's position and the alternative with comparable depth
**And** the recommendation may still favor the user's preferred position (content balance is independent of recommendation direction)

## Feature: Research-Grounded Question Toolkit for AID Cycle (ADR-056)

### Scenario: AID deploys belief-mapping question at gate
**Given** the AID cycle interprets deep engagement at a gate
**When** the agent selects a challenge move
**Then** the agent deploys a belief-mapping question composed from the specific artifact content
**And** the question is not a template recitation — it references specific concepts, decisions, or findings from the current phase

### Scenario: AID deploys pre-mortem question at RESEARCH gate
**Given** the AID cycle is operating at the RESEARCH gate
**When** the agent selects a challenge or probe move
**Then** the agent may deploy a pre-mortem question: "Assume this essay led the project astray — what would have caused that?"
**And** the question references specific claims or framings from the essay

### Scenario: AID deploys commitment gating at phase boundary
**Given** the AID cycle is operating at any phase boundary
**When** the agent is preparing to advance to the next phase
**Then** the agent asks the user to distinguish settled premises from open questions: "Which premises are you building on, and which remain open?"
**And** the user's response is recorded in the cycle status for downstream feed-forward

### Scenario: Question forms are non-formulaic
**Given** the agent deploys the same question type (e.g., belief-mapping) at two different gates
**When** the two questions are compared
**Then** they reference different specific content from each gate's artifact
**And** they are composed for the specific conversation state, not recited from a template

### Scenario: Question forms serve triple duty
**Given** the agent deploys any question from the toolkit at a gate
**When** the user responds
**Then** the response simultaneously serves as sycophancy resistance evidence (did the user engage alternatives?), confidence diagnosis (is their confidence earned?), and epistemic advancement (did the user's understanding deepen?)

## Feature: AID Susceptibility Extension (ADR-057)

### Scenario: AID notices assertion density signal inline
**Given** the AID cycle is in the Attend phase at a gate
**And** the conversation history shows the user's assertion density increased over the phase (more declarative conclusions, fewer questions)
**When** the agent records susceptibility signals
**Then** assertion density is noted as a susceptibility signal
**And** the signal is NOT evaluated inline — it is recorded for the Susceptibility Snapshot

### Scenario: AID notices narrowing without user initiation
**Given** the AID cycle is in the Attend phase
**And** the solution space narrowed during the phase without the user initiating the narrowing
**When** the agent records susceptibility signals
**Then** uninitiated narrowing is noted as a susceptibility signal

### Scenario: Susceptibility Snapshot produced at phase boundary
**Given** the AID cycle has recorded susceptibility signals during a phase
**When** the pipeline reaches a phase boundary
**Then** a specialist subagent evaluates the signals in an isolated context
**And** the subagent produces a Susceptibility Snapshot artifact with observed signals, suggested interpretation, and any warranted Grounding Reframe
**And** the evaluation occurs outside the main conversation context (Architectural Isolation)

### Scenario: Susceptibility Snapshot is advisory
**Given** a Susceptibility Snapshot has been produced at a phase boundary
**When** the orchestrator reads the snapshot
**Then** the snapshot informs the agent's approach to the next phase
**But** the snapshot does not block pipeline advancement
**And** the snapshot is available to the user for review

## Feature: Unconditional Architectural Floor (ADR-058)

### Scenario: Tier 1 mechanisms fire regardless of context
**Given** the pipeline is in any phase (early or late, pipeline or standalone mode)
**When** an audit is warranted (essay produced, ADRs written, phase boundary reached)
**Then** specialist subagent dispatch occurs (citation audit, argument audit, framing audit)
**And** the Susceptibility Snapshot evaluation runs at phase boundaries
**And** these mechanisms are not skipped because the agent or user assesses the context as low-risk

### Scenario: Agent cannot self-exempt from Tier 1 mechanisms
**Given** the agent assesses the current context as low sycophancy risk
**When** a Tier 1 mechanism is due (e.g., framing audit on a new essay)
**Then** the Tier 1 mechanism runs anyway
**And** the agent's risk assessment does not reduce the structural floor

### Scenario: User grounding does not replace Tier 1 mechanisms
**Given** the user provides domain knowledge as grounding during a phase
**When** a Tier 1 mechanism is due
**Then** the mechanism still runs — the user's input is additional evidence, not a replacement for structural assessment

### Scenario: Tier 2 mechanisms adapt to context
**Given** the multidimensional rubric indicates low phase vulnerability and deep engagement
**When** the agent selects question forms and constraint intensity
**Then** the agent may calibrate lighter Tier 2 constraints (fewer probing questions, less intensive alternative exploration)
**And** Tier 1 mechanisms remain unchanged

## Feature: Grounding Reframe (ADR-059)

### Scenario: Agent reframes toward grounding when risk is unassessable
**Given** the agent determines that sycophancy risk is unassessable (no belief-mapping test, no empirical contact available)
**When** the agent communicates this to the user
**Then** the agent names what is uncertain ("the ground is soft here because...")
**And** the agent offers concrete grounding actions (run a spike, write a test, consult a domain expert, belief-map the specific assumption)
**And** the agent makes visible what the user would be building on without grounding

### Scenario: User proceeds without grounding after reframe
**Given** the agent has performed a Grounding Reframe
**And** the user chooses to proceed without pursuing any grounding action
**When** the pipeline continues
**Then** the decision to proceed without grounding is visible (not silent)
**And** the Susceptibility Snapshot at the next phase boundary notes the ungrounded decision

### Scenario: User pursues grounding action after reframe
**Given** the agent has performed a Grounding Reframe
**And** the user pursues one of the suggested grounding actions (e.g., runs a spike, belief-maps the assumption)
**When** the grounding action produces evidence
**Then** the evidence informs the current phase's artifact
**And** the Earned Confidence for the specific assumption is now assessable

### Scenario: Grounding Reframe is non-formulaic
**Given** two different Grounding Reframes occur in the same cycle
**When** the reframes are compared
**Then** each names specific uncertainties and suggests context-appropriate grounding actions
**And** the reframes are not template recitations

## Feature: Research Methods Subagent (ADR-060)

### Scenario: Research design review before first research loop
**Given** the user has provided research questions for a new cycle
**When** the `/rdd-research` skill begins
**Then** the orchestrator dispatches the Research Methods Subagent before the first research loop
**And** the subagent reads the research question set
**And** the subagent produces a research design review artifact

### Scenario: Subagent flags embedded conclusion in research question
**Given** a research question embeds a conclusion ("What's the best way to implement event-driven architecture for this?")
**When** the Research Methods Subagent reviews the question
**Then** the subagent flags the embedded conclusion (presupposes event-driven architecture)
**And** the subagent suggests a reformulated question ("What architectural patterns best serve [the actual need]?")

### Scenario: Subagent applies belief-mapping to question set
**Given** a set of research questions
**When** the Research Methods Subagent reviews them
**Then** for each question, the subagent asks: "What would the researcher need to believe for a different question to be more productive?"
**And** the results are included in the design review artifact

## Feature: Framing Audit as Argument Auditor Extension (ADR-061)

### Scenario: Argument audit includes framing analysis
**Given** the argument auditor is dispatched for an essay
**When** the audit is produced
**Then** the audit artifact contains two sections: argument audit (existing) and framing audit (new)
**And** the framing audit identifies 2-3 alternative framings the evidence supported but the essay didn't choose
**And** the framing audit identifies findings from the evidence base that are absent or underrepresented

### Scenario: Framing audit applies belief-mapping to essay's framing
**Given** the framing audit section is being produced
**When** the auditor analyzes the essay's dominant framing
**Then** the auditor applies: "What would the reader need to believe for a different framing to be right?"
**And** the response surfaces what the inverted framing would reveal

### Scenario: Framing audit runs unconditionally on essays
**Given** a new essay has been produced by `/rdd-research`
**When** the argument audit is dispatched (Tier 1 mechanism)
**Then** the framing audit section is included — it is not omitted because the agent assesses the essay as well-framed

## Feature: Assertion-Aware Observation in AID (ADR-062)

### Scenario: Agent detects embedded conclusion at artifact-production moment
**Given** the user submits a prompt containing an embedded design conclusion ("given the research, the natural architecture here is event-driven")
**And** the pipeline is at or near an artifact-production moment
**When** the agent processes the prompt
**Then** the agent deploys open-question reframing: "What's the open question behind [the specific assertion]?"
**And** the reframing is composed from the assertion's content, not from a template

### Scenario: Agent does not flag harmless implementation confidence
**Given** the user submits a prompt containing implementation confidence ("this test should clearly pass once we fix the null check")
**When** the agent processes the prompt
**Then** the agent does NOT deploy open-question reframing — the confidence is about implementation mechanics, not framing or design

### Scenario: Agent detects subtle embedded conclusion without confidence markers
**Given** the user submits a prompt containing a sophisticated embedded conclusion with no confidence markers ("the stakeholder model suggests three user types, so the interaction specs should have three sections")
**And** the pipeline is at or near an artifact-production moment
**When** the agent processes the prompt
**Then** the agent detects the embedded conclusion (presupposes a 1:1 mapping from stakeholders to interaction spec sections)
**And** the agent deploys open-question reframing composed from the specific assertion

### Scenario: Accepted limitation is transparent
**Given** the agent is operating the assertion-aware observation
**When** the user asks about the limitations of sycophancy detection
**Then** the agent names the limitation: assertion-aware observation operates inside the conversation without Architectural Isolation — the same agent susceptible to the assertion detects it
**And** the agent identifies the structural backstops: Susceptibility Snapshot and Framing Audit provide isolated evaluation

## Feature: Integration — Sycophancy Mechanisms Compose Across ADRs

### Scenario: Full sycophancy resistance stack at a phase boundary
**Given** a pipeline phase has completed and the gate is about to begin
**When** the full sycophancy resistance stack is applied
**Then** Tier 1 fires: specialist audits dispatch (including framing audit), Susceptibility Snapshot evaluation runs in isolation
**And** Tier 2 calibrates: AID selects question forms from the toolkit based on the rubric, assertion-aware observation monitors the gate conversation
**And** if risk is unassessable, Grounding Reframe offers concrete actions

### Scenario: Standalone skill invocation has reduced but present protection
**Given** a skill is invoked standalone (context-reconstructive mode, no artifact trail)
**When** the skill executes
**Then** Tier 1 mechanisms that apply fire (Susceptibility Snapshot at completion)
**And** Tier 2 mechanisms operate with reduced calibration data (no prior gate signals to compare)
**And** if risk is unassessable, Grounding Reframe names the limitation and offers grounding actions

## Feature: Essay as Research Phase Checkpoint

### Scenario: Framing audit findings circle back to essay revision
**Given** the framing audit has surfaced alternative framings or consequential omissions in the essay
**When** the practitioner reviews the framing audit findings
**Then** the essay is revised to address the findings (absorbing, reframing, or explicitly rejecting the alternatives)
**And** the revised essay is re-audited before the pipeline advances past RESEARCH

### Scenario: Discovery feedback triggers essay revision
**Given** the DISCOVER phase surfaces value tensions or assumption inversions that challenge the essay's framing
**When** the challenge is substantial (not a minor addition but a reframing of the problem space)
**Then** the pipeline loops back to RESEARCH to revise the essay
**And** the Research Methods Subagent reviews any revised research questions before the next loop

### Scenario: Reflection writing triggers essay revision
**Given** a reflection artifact surfaces a new angle or reframing of the research
**When** the reframing is substantial enough to change the essay's central argument or dominant framing
**Then** the essay is revised to incorporate the reframing
**And** the framing audit runs again on the revised essay

### Scenario: Research Methods Subagent participates in each research loop
**Given** the essay has been substantially revised (from framing audit, discovery feedback, or reflection)
**And** a new research loop is beginning
**When** the orchestrator prepares the next research loop
**Then** the Research Methods Subagent is dispatched to review the revised question set
**And** the subagent produces a new research design review artifact

### Scenario: Pipeline does not advance past RESEARCH with unrevised essay
**Given** a substantial framing change has been identified (by the framing audit, the user, or discovery feedback)
**When** the orchestrator considers advancing to the next phase
**Then** the orchestrator does not advance until the essay has been revised to reflect the change
**And** the revised essay has passed a fresh argument audit and framing audit

## Feature: Per-Phase Manifest Format (ADR-063)

### Scenario: Manifest loads successfully from canonical location
**Given** a YAML manifest file exists at `hooks/manifests/tier1-phase-manifest.yaml`
**When** the Stop hook reads the manifest at phase-end
**Then** the hook parses the `phases` dictionary and loads the current phase's `required_mechanisms` list
**And** the hook identifies each mechanism by its canonical name matching the `subagent_type` identifier

### Scenario: Manifest resolves `{cycle}` token from cycle-status field
**Given** `docs/cycle-status.md` contains a `**Cycle number:** 014` field
**When** the Stop hook resolves the `{cycle}` token in a manifest `path_template`
**Then** the hook substitutes `014` for `{cycle}` and produces the resolved path
**And** the resolution is canonical (cycle-status field), not inferred from essay prefixes

### Scenario: Manifest resolves `{cycle}` token via fallback inference
**Given** `docs/cycle-status.md` exists but does not contain a `**Cycle number:**` field
**When** the Stop hook resolves the `{cycle}` token
**Then** the hook falls back to inferring the cycle from the highest `NNN-` prefix in `docs/essays/`
**And** the fallback path is logged to stderr as a notice

### Scenario: Manifest catches missing required mechanism at phase end
**Given** the current phase is `research`
**And** the manifest specifies `susceptibility-snapshot-evaluator` as a required mechanism with path `docs/housekeeping/audits/susceptibility-snapshot-014-research.md`
**When** the Stop event fires and the snapshot file does not exist
**Then** the hook emits `block` with a reason naming the missing artifact
**And** the agent sees the block reason as model-visible context on its next turn

### Scenario: Manifest catches stubbed fabricated audit via size floor
**Given** the current phase is `research`
**And** the argument-auditor's canonical path exists but contains only 50 bytes of content
**And** the manifest specifies `min_bytes: 1500` for the argument auditor
**When** the Stop event fires and the Stop hook checks the artifact
**Then** the hook emits `block` with a reason naming the size floor failure
**And** the agent is directed not to fabricate audit output in its own context

## Feature: Compound Check at Phase Boundaries (ADR-064)

### Scenario: PostToolUse hook logs Tier 1 dispatch with canonical path
**Given** a skill file contains a Tier 1 dispatch instruction with an `Output path:` line naming `docs/essays/audits/argument-audit-014.md`
**When** the orchestrator dispatches the `argument-auditor` via the Task tool
**Then** the PostToolUse hook matches `tool_name == "Agent"` and `subagent_type == "argument-auditor"`
**And** the hook extracts the expected path from `tool_input.prompt` via regex matching the canonical `Output path:` line
**And** the hook appends a JSONL entry to `docs/housekeeping/dispatch-log.jsonl` containing `{timestamp, session_id, mechanism, subagent_type, expected_path, tool_use_id}`

### Scenario: PostToolUse hook ignores non-Tier-1 dispatches
**Given** the orchestrator dispatches a subagent whose `subagent_type` is not in the Tier 1 set
**When** the PostToolUse hook fires
**Then** the hook exits silently with `allow` and does not write to the dispatch log
**And** the Tier 1 dispatch log remains unmodified

### Scenario: Compound check catches sophisticated State C via dispatch log cross-reference
**Given** an artifact at the expected audit path exists with all required headers and fields
**And** the artifact's content was fabricated in-context by a task-immersed orchestrator (not produced by an isolated subagent dispatch)
**And** the dispatch log contains no entry matching the mechanism and expected path
**When** the Stop hook runs the compound check
**Then** the hook emits `block` with a reason "artifact exists but no corresponding dispatch was logged; this may indicate fabricated audit output"
**And** the agent is instructed not to fabricate audit artifacts

### Scenario: Compound check distinguishes subagent failure from no-dispatch
**Given** the dispatch log contains an entry for `citation-auditor` with expected path `docs/essays/audits/citation-audit-014.md`
**And** the artifact at that path does not exist (subagent failed to write)
**When** the Stop hook runs the compound check
**Then** the hook emits `block` with a reason "mechanism was dispatched but did not produce its expected artifact"
**And** the reason is distinct from the "never dispatched" reason

### Scenario: Compound check passes when dispatch log and artifact agree
**Given** the dispatch log contains an entry for `argument-auditor` with expected path matching the manifest's `path_template`
**And** the artifact at that path exists with all required headers, required fields, and size above the floor
**When** the Stop hook runs the compound check
**Then** the hook emits `allow` and the phase transition proceeds
**And** no reason is injected into the agent's next-turn context

### Scenario: Compound check's structural guarantee holds only in enforcement mode
**Given** the corpus has no `docs/housekeeping/` directory (pre-migration state)
**When** the Stop hook runs
**Then** the hook enters advisory mode and does not perform the compound cross-reference
**And** fabricated audit artifacts can exist at the expected paths without being caught
**And** the structural guarantee from ADR-064 does not hold in this state

### Scenario: Compound check structural guarantee holds post-migration
**Given** the corpus has been migrated and `docs/housekeeping/.migration-version` exists with the current plugin version
**When** the Stop hook runs the compound check
**Then** sophisticated State C fabrication is structurally impossible because fabricating both an artifact and a matching dispatch log entry would require injecting a fake PostToolUse event
**And** the agent cannot inject hook events

## Feature: Advisory Mode for Pre-Migration Corpora (ADR-064)

### Scenario: Hook enters advisory mode when housekeeping directory is absent
**Given** `docs/housekeeping/` does not exist in the project
**When** the Stop hook runs at phase-end
**Then** the hook emits `allow` without running the compound check
**And** the hook emits a stderr notice directing the user to `/rdd-conform` for migration
**And** the notice fires once per session (session-scoped suppression marker)

### Scenario: Hook enters advisory mode when marker file is absent
**Given** `docs/housekeeping/` exists but `docs/housekeeping/.migration-version` does not
**When** the Stop hook runs at phase-end
**Then** the hook enters advisory mode (migration in progress or incomplete)
**And** the methodology continues to function without harness-layer verification

### Scenario: Hook enters enforcement mode when marker file is present
**Given** `docs/housekeeping/.migration-version` exists containing a plugin version string
**When** the Stop hook runs at phase-end
**Then** the hook enters enforcement mode and runs the compound check as specified in ADR-064

### Scenario: Advisory notice respects user position as non-maintainer
**Given** the Stop hook emits an advisory-mode notice
**When** the user reads the notice
**Then** the notice does not block the agent session
**And** the notice does not require the user to debug plugin internals
**And** the notice links to `/rdd-conform` as the opt-in path to enforcement

## Feature: Fails-Safe-to-Allow with GitHub Issue Surfacing (ADR-064)

### Scenario: Hook internal error fails safe with GitHub issue notice
**Given** the Stop hook encounters an internal error (YAML parse failure, missing file, shell error)
**When** the hook exits
**Then** the hook emits `allow` and does not block the agent
**And** the hook prints a non-blocking stderr notice naming the hook and the diagnostic
**And** the notice includes a pre-populated GitHub issue URL at `https://github.com/nrgforge/rdd/issues/new?template=hook-failure.md`
**And** the methodology continues to function with verification unavailable for that turn

### Scenario: User ignoring the GitHub issue notice continues to work
**Given** the Stop hook has emitted a GitHub issue notice due to an internal error
**When** the user ignores the notice and continues working
**Then** subsequent phases of the cycle complete normally
**And** the methodology does not degrade beyond the loss of harness-layer verification for that turn

## Feature: Revision-Aware Re-Audit Reminder (ADR-064)

### Scenario: Reminder fires when audited document modified after last dispatch
**Given** `docs/essays/014-specification-execution-gap.md` was modified at timestamp T2
**And** the dispatch log contains a `citation-auditor` entry at timestamp T1 where T1 < T2
**And** the manifest entry for `citation-auditor` includes `audited_documents: ["docs/essays/{cycle}-*.md"]`
**When** the Stop hook runs the revision-aware reminder
**Then** the hook emits a model-visible notice alongside its `allow` decision (not a block)
**And** the notice names the audited document, the last dispatch timestamp, and the document modification timestamp
**And** the notice asks the agent to determine whether the modification is substantial enough to warrant re-auditing

### Scenario: Reminder does not fire when document unchanged since last dispatch
**Given** the audited document's mtime is earlier than the most recent dispatch log entry for its auditor
**When** the Stop hook runs the revision-aware reminder
**Then** the hook emits `allow` without a notice
**And** no reminder is injected into the agent's context

### Scenario: Reminder substantiality judgment is human, not mechanical
**Given** the reminder has fired and the agent has surfaced it to the user
**When** the user assesses whether the modification is substantial
**Then** the agent and user together decide whether re-audit is warranted
**And** the decision is epistemic, not enforced mechanically by the hook

## Feature: Anchor Dispatch — Skill-Structure Fix (ADR-065)

### Scenario: Phase skill contains structurally privileged susceptibility snapshot dispatch
**Given** a phase skill file at `skills/research/SKILL.md`
**When** the rdd-conform dispatch prompt format audit runs
**Then** the audit finds a "Phase Boundary: Susceptibility Snapshot Dispatch" subsection
**And** the subsection is located in the bottom third of the skill file (phase-end position)
**And** the subsection contains the canonical prompt skeleton with `Output path: docs/housekeeping/audits/susceptibility-snapshot-{cycle}-research.md`

### Scenario: Canonical dispatch prompt contains Output path line
**Given** a Tier 1 dispatch instruction in any phase skill
**When** the PostToolUse hook parses `tool_input.prompt` via regex
**Then** the regex matches `^Output path: (.+)$` and extracts the canonical path
**And** the extracted path is logged to the dispatch log as `expected_path`

### Scenario: PostToolUse hook handles missing Output path line gracefully
**Given** a Tier 1 dispatch prompt that does not contain an `Output path:` line (pre-ADR-065 state)
**When** the PostToolUse hook parses `tool_input.prompt`
**Then** the regex fails to match and the hook logs `expected_path: null`
**And** the compound cross-reference degrades to "dispatch happened, path unknown"

### Scenario: Position audit detects middle-third dispatch sites
**Given** a phase skill file with a Tier 1 dispatch instruction at line 250 of a 500-line file
**When** the rdd-conform dispatch prompt format audit runs
**Then** the audit flags the dispatch site as being in the middle third (lost-in-the-middle zone)
**And** the finding recommends relocation to top or bottom third

### Scenario: Each phase skill carries phase-specific brief content for the snapshot
**Given** each of the eight phase skills (research, discover, model, decide, architect, build, play, synthesize)
**When** the orchestrator reaches phase-end in any phase
**Then** that phase skill's susceptibility snapshot dispatch instruction provides phase-specific brief content (what signals to pass, what boundary is being crossed, what prior snapshots to reference)
**And** the phase brief is composed for the specific phase, not templated generically

## Feature: User-Tooling Layer — AID Gate Reflection Note (ADR-066)

### Scenario: Gate reflection note is produced at phase-end before phase completes
**Given** the orchestrator is at a phase boundary with an AID cycle conversation completed
**When** the orchestrator prepares to declare the phase complete
**Then** a gate reflection note is written to `docs/housekeeping/gates/{cycle}-{phase-from}-to-{phase-to}.md`
**And** the note contains the composed belief-mapping question, the user's response, the selected pedagogical move, and the commitment gating outputs

### Scenario: Gate reflection note omits engagement interpretation
**Given** a gate reflection note is being produced
**When** the orchestrator writes the note content
**Then** the note captures the pedagogical move selected (e.g., "Challenge", "Probe", "Teach")
**And** the note does not narrate the engagement interpretation that drove move selection
**And** the note respects the AID Interpret privacy principle across media

### Scenario: Stop hook manifest verification blocks phase without gate reflection note
**Given** the corpus is in enforcement mode and the current phase requires a gate reflection note per the manifest
**And** no file exists at the canonical gate reflection path for this phase boundary
**When** the Stop hook runs
**Then** the hook emits `block` with a reason naming the missing gate reflection note
**And** the agent cannot complete the phase until the note is written

### Scenario: Reframe-derailed gate passes structural verification but limitation is acknowledged
**Given** the agent has adopted a significant user reframe at face value during the gate conversation
**And** the gate reflection note captures the reframe faithfully with all required structural elements
**When** the Stop hook's manifest check runs
**Then** the manifest check passes (the artifact is well-formed)
**And** the reframe-derailed gate is a named limitation of the User-Tooling Layer that the manifest check cannot detect
**And** the Susceptibility Snapshot at the same phase boundary is the complementary defense

## Feature: Compound Defense at Phase Boundaries (ADR-066)

### Scenario: Compound defense has three components covering non-overlapping failure modes
**Given** the engagement-degradation threat model is active at a phase boundary
**When** the compound defense components fire
**Then** the manifest check (User-Tooling Layer) catches the structural floor (no substantive artifact produced)
**And** the susceptibility snapshot catches the content ceiling (artifact well-formed but encodes incongruent framings)
**And** belief-mapping catches the pre-artifact zone (unexamined assumptions before commitment)

### Scenario: Compound defense is extensible without renaming
**Given** a future cycle identifies an additional failure mode not covered by the current three components
**When** the methodology adds a new defense component to the compound defense
**Then** the new component joins the compound defense as a fourth component
**And** the compound defense's name remains unchanged (the umbrella is count-extensible)

## Feature: Three-Tier Enforcement Classification (ADR-067)

### Scenario: Decision procedure routes step-anchorable mechanism to Skill-Structure Layer
**Given** a proposed unconditional structural mechanism has a concrete, mechanically-unavoidable workflow step
**When** the mechanism is classified per ADR-067's four-step decision procedure
**Then** the mechanism is routed to the Skill-Structure Layer (ADR-065 pattern)
**And** the skill file gains a dispatch instruction at a structurally privileged position with a canonical prompt skeleton

### Scenario: Decision procedure routes phase-boundary mechanism to Harness Layer
**Given** a proposed mechanism whose trigger is a phase boundary, not a tool call
**When** the mechanism is classified per the decision procedure
**Then** the mechanism is routed to the Harness Layer (ADR-063/064 pattern)
**And** a manifest entry is added with the canonical path and structural assertions

### Scenario: Decision procedure routes conversational mechanism to User-Tooling Layer
**Given** a proposed mechanism that is conversational with a natural artifact moment
**When** the mechanism is classified per the decision procedure
**Then** the mechanism is routed to the User-Tooling Layer (ADR-066 pattern)
**And** the Graduate Conversational Mechanism action produces a canonical-path artifact requirement

### Scenario: Decision procedure step 4 prevents Tier 1 status for unclassifiable mechanism
**Given** a proposed mechanism with no step-anchorable form, no tool-call trigger, and no natural artifact moment
**When** the mechanism is classified per the decision procedure
**Then** the mechanism reaches step 4 and cannot be specified as unconditional
**And** the mechanism is specified as Tier 2 best-effort per ADR-058 with honest transparency about its non-structural character

## Feature: Grounding Reframe Extension (ADR-068)

### Scenario: Grounding Reframe fires on unassessable sycophancy risk
**Given** the agent encounters a situation where sycophancy risk cannot be assessed (no belief-mapping or empirical contact available)
**When** the agent applies the Grounding Reframe protocol
**Then** the agent names what is uncertain, offers concrete grounding actions, and makes the cost visible
**And** the trigger condition is ADR-059's original scope (unassessable risk)

### Scenario: Grounding Reframe fires on significant snapshot finding with in-cycle implications
**Given** a susceptibility snapshot returns a finding that names specific artifacts in the current phase
**And** the finding is concrete enough to drive an actionable grounding action
**And** the action can be applied at the current phase boundary
**When** the agent reads the snapshot finding
**Then** the agent fires the Grounding Reframe protocol (extended trigger from ADR-068)
**And** the finding drives in-cycle course correction rather than feeding forward as advisory

### Scenario: Finding not meeting significance properties feeds forward instead
**Given** a susceptibility snapshot returns a finding that is general rather than specific
**Or** the finding's best response is "note and move on" rather than an actionable action
**When** the agent reads the finding
**Then** the finding is recorded as feed-forward in the cycle status
**And** the Grounding Reframe protocol does not fire for this finding

## Feature: Methodology Scope-of-Claim (ADR-069)

### Scenario: Methodology does not promise independent second-order critique by agent
**Given** a user reads the methodology's scope-of-claim documentation
**When** the user asks what the methodology guarantees
**Then** the methodology promises competent first-order analysis, structural resistance via Tier 1 mechanisms, and conversational mechanisms inviting user second-order engagement
**And** the methodology explicitly does not promise that the agent will independently generate second-order critique of its own output

### Scenario: Future Tier 1 mechanism proposals cite the scope-of-claim as their rationale
**Given** a future ADR proposes a new isolated evaluator, conversational challenge, or structural backstop
**When** the ADR documents its rationale
**Then** the ADR cites ADR-069's negative scope-of-claim as the reason the mechanism fills a gap
**And** the mechanism's purpose is explicitly framed as filling the independent-second-order-critique gap

## Feature: Housekeeping Directory Migration (ADR-070)

### Scenario: Migration moves audits from essays subdirectory to housekeeping
**Given** `docs/essays/audits/` contains audit report files for cycles 001–014
**When** `/rdd-conform migrate` runs
**Then** all files under `docs/essays/audits/` are moved to `docs/housekeeping/audits/` preserving subdirectory structure
**And** `docs/essays/audits/` no longer exists after migration

### Scenario: Migration moves cycle-status to housekeeping
**Given** `docs/cycle-status.md` exists at the corpus root
**When** `/rdd-conform migrate` runs
**Then** the file is moved to `docs/housekeeping/cycle-status.md`
**And** its content is unchanged

### Scenario: Migration creates gates directory empty
**Given** no `docs/housekeeping/gates/` directory exists before migration
**When** `/rdd-conform migrate` runs
**Then** `docs/housekeeping/gates/` is created as an empty directory
**And** subsequent gate reflection notes land at this location

### Scenario: Migration writes version marker file
**Given** the migration operation completes successfully
**When** the marker file is written
**Then** `docs/housekeeping/.migration-version` contains the plugin version string that performed the migration
**And** the Stop hook's subsequent runs enter enforcement mode on reading this marker

### Scenario: Migration updates path references across corpus mechanically
**Given** prior ADRs, the Cycle 10 essay, spike reports, skill files, the manifest, the domain model, and ORIENTATION all reference pre-migration paths
**When** `/rdd-conform migrate` runs the reference update pass
**Then** all occurrences of `docs/essays/audits/` are replaced with `docs/housekeeping/audits/` in every affected file
**And** all occurrences of `docs/cycle-status.md` are replaced with `docs/housekeeping/cycle-status.md`
**And** a summary report lists every file touched

### Scenario: Migration is idempotent on migrated corpus
**Given** a corpus already has `docs/housekeeping/.migration-version` matching the current plugin version
**When** `/rdd-conform migrate` runs
**Then** the operation detects the marker and no-ops
**And** no files are moved or modified

### Scenario: Migration refuses to run with uncommitted skill file changes
**Given** the user has uncommitted modifications to files under `skills/`
**When** the user runs `/rdd-conform migrate`
**Then** the operation refuses to run and reports the uncommitted files
**And** the user is directed to commit or stash the changes before migrating

### Scenario: Migration does not touch cycle-archive
**Given** `docs/cycle-archive/` contains archived cycles from prior work
**When** the migration runs
**Then** files under `docs/cycle-archive/` are not modified
**And** their internal references to pre-migration paths are preserved

## Feature: rdd-conform Scope Extension (ADR-070)

### Scenario: Housekeeping directory organization audit detects missing directory
**Given** a pre-migration corpus with no `docs/housekeeping/` directory
**When** the user runs `/rdd-conform` (audit mode)
**Then** the audit reports that the housekeeping directory is absent and suggests running `/rdd-conform migrate`
**And** the audit does not auto-correct; it produces a finding report

### Scenario: Gate reflection note template alignment audit detects missing header
**Given** a file at `docs/housekeeping/gates/014-research-to-discover.md` exists but does not contain the `## Belief-mapping question composed for this gate` header
**When** the gate reflection note template alignment audit runs
**Then** the audit reports a missing required header
**And** the audit does not audit content substance — only template alignment

### Scenario: Dispatch prompt format audit flags missing Output path line
**Given** a phase skill contains a Tier 1 dispatch instruction without an `Output path:` line
**When** the dispatch prompt format audit runs
**Then** the audit reports the dispatch site as non-compliant with ADR-065's canonical skeleton
**And** the audit does not auto-correct; the user edits the skill file manually

### Scenario: Conform audit does not auto-correct findings
**Given** any of the three new conform audit scopes finds a debt item
**When** the audit completes
**Then** the audit produces a structured finding report with file:line references and suggested remediations
**And** the audit does not modify any files
**And** the user reads the report and decides what to act on

## Feature: Integration — Cycle 10 Mechanisms Compose Across ADRs

### Scenario: Compound check and canonical prompt skeleton integrate at dispatch time
**Given** a phase skill with a Tier 1 dispatch instruction containing the canonical `Output path:` line (ADR-065)
**And** the hooks in ADR-064 are installed and the manifest is present
**When** the orchestrator dispatches the Tier 1 subagent via the Task tool
**Then** the PostToolUse hook extracts the output path from the prompt and logs the dispatch
**And** at phase-end the Stop hook cross-references the dispatch log against the manifest and the artifact
**And** the compound check verifies the dispatch was genuine and the artifact was produced by an isolated subagent

### Scenario: Grounding Reframe extension triggered by susceptibility snapshot at User-Tooling Layer boundary
**Given** the orchestrator produces a gate reflection note at a phase boundary (ADR-066)
**And** the susceptibility snapshot at the same boundary returns Finding 1 "framing adoption has propagated to the reflection note's content"
**When** the agent reads the snapshot finding
**Then** the agent fires the extended Grounding Reframe (ADR-068) on the specific framing adoption
**And** the agent performs in-cycle course correction on the gate reflection note before the phase completes

### Scenario: Three-substrate decision procedure applied to a new mechanism proposal
**Given** a future cycle proposes a new structural mechanism
**When** the mechanism is classified per ADR-067's four-step decision procedure
**Then** the mechanism is assigned to Skill-Structure Layer (ADR-065), Harness Layer (ADR-063/064), User-Tooling Layer (ADR-066), or step 4 (cannot be Tier 1)
**And** the mechanism's ADR names the substrate explicitly per Invariant 8's anchoring requirement

### Scenario: Housekeeping migration enables enforcement-mode compound check
**Given** a pre-migration corpus in advisory mode
**When** the user runs `/rdd-conform migrate` and the migration completes
**Then** `docs/housekeeping/.migration-version` is written and the corpus transitions to enforcement mode on the next session
**And** the compound check's structural guarantee against sophisticated State C becomes active
**And** the Stop hook emits `block` on missing required artifacts rather than advisory notices

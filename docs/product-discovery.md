# Product Discovery: Research-Driven Development (RDD)

*2026-03-18*

## Stakeholder Map

### Direct Stakeholders

- **Solo Developer-Researcher** — A developer who uses RDD with an AI agent to build software projects or new features within existing projects. Interacts with every phase of the pipeline, responds at every gate, and makes all workflow decisions. Currently the primary user.

- **Research-Engineer** — Someone using RDD primarily for the research and understanding phases, where the goal is deep comprehension of a problem space rather than (or before) building software. The pipeline's research phase, product discovery, and domain modeling serve as a structured methodology for investigating technical or domain questions — closer to research engineering than traditional software development.

- **Team Lead (using RDD for scoping)** — A technical leader who runs RDD through RESEARCH → ARCHITECT to build deep understanding of a problem space, then hands off artifacts to their team for building. Uses RDD as a leadership thinking tool. Shares artifacts with architecture and product specialists for validation before team handoff. Does not necessarily advocate that the team adopt RDD — the artifacts stand on their own.

- **AI Agent** — The agent executing the skill files. In the plugin architecture, this role splits: an **orchestrating agent** runs phase skills, manages epistemic gates, and interacts with the user; **specialist subagents** (citation-auditor, argument-auditor, lit-reviewer, conformance-scanner, orientation-writer, spike-runner) perform focused work in isolated contexts, reading input artifacts and writing output artifacts with no user interaction. The skill files are instructions to the orchestrating agent. Specialist subagents receive task-specific system prompts and may run on different models than the orchestrator.

### Indirect Stakeholders (Direct for BUILD)

- **Teammates / Collaborators** — People who inherit, review, or extend projects built with RDD. They encounter the artifacts — especially the product discovery document and system design — without having gone through the gates that produced them. In the team lead scenario, they receive these artifacts as the starting point for their own planning and building. They need: an entry point to the artifact corpus (orientation), context for how the work might be approached (roadmap), and a way to build their own understanding of how design maps to implementation (field guide). In some workflows, they enter RDD at the build phase — picking a work package from the roadmap and using `/rdd-build` to execute it — making them direct stakeholders for BUILD even though they are indirect for earlier phases.

- **Architecture and Product Specialists** — People the team lead shares artifacts with for feedback before team handoff. They validate the thinking and surface questions the team lead may have missed. Their feedback flows back through the pipeline (external review re-entry).

- **End Users of the Software Built** — The people who use whatever RDD produces. Their needs are mediated through the product discovery phase but they never interact with RDD itself.

- **Organization / Management** — Decision-makers who evaluate whether RDD is worth the time investment compared to shipping faster without it.

## Jobs and Mental Models

### Solo Developer-Researcher

**Jobs:**
- "I want to actually understand what I'm building, not just have AI generate it and hope it works when I need to change it later"
- "I need a structured process that keeps me from skipping the thinking and jumping straight to code"
- "I want the research and decisions captured so I can pick up a project after weeks away and know why things are the way they are"
- "I want to build the right thing, not just build a thing right"
- "I want to use this for new features too, not just whole new projects — any work that's complex enough to benefit from thinking before building"
- "I need enough context to make my own sequencing decisions during build, not be told what order to do things"

**Mental Model:**
"I describe what I want to explore, and the pipeline walks me through understanding it — research first, then figure out who it's for, then nail down the vocabulary, make decisions, design the system, and build it. At each step I have to engage with what was produced, not just approve it. The artifacts are my long-term memory for the project. When the project stabilizes, I scope RDD to new features rather than maintaining it across the whole project."

### Research-Engineer

**Jobs:**
- "I need to deeply investigate a technical or domain question in a structured way"
- "I want the research process itself to build my understanding — not just produce a report"
- "I want to be able to articulate what I've learned clearly enough to explain it to others"

**Mental Model:**
"RDD is a research methodology as much as a development one. The research phase, product discovery, and modeling give me a rigorous way to explore a question. The gates force me to actually engage with what I'm finding, not just collect sources. Even if I never build anything, the understanding is the deliverable."

### Team Lead (using RDD for scoping)

**Jobs:**
- "I need to deeply understand a problem space so I can scope work for my team with confidence"
- "I want to produce artifacts — especially the product discovery doc and system design — that I can hand to my team as the starting point for their own planning and building"
- "I need the research and decisions captured well enough that the team can build from them without having been in the room when the thinking happened"
- "I want to be able to speak to the artifacts — explain and defend the decisions, respond to real questions, thread the needle between system design and product needs"
- "I want the teams that are building to understand the system themselves, so I hand off building rather than doing it solo"
- "I need a single document I can hand over that orients the team to the full artifact set — what the system is, who it's for, what's decided, what's open"
- "I need to communicate not just what the system is but how the work might be approached — which pieces depend on which, where decisions are open"
- "I need the team to be able to build their own understanding of the system without me explaining everything"

**Mental Model:**
"I run RDD through ARCHITECT to do my homework — build my own understanding and produce handoff artifacts. The essay tells the team why, the product discovery tells them who it's for, the system design tells them what to build, and the roadmap tells them how to think about sequencing. Before handing off to the team, I get feedback from architecture and product folks to validate my thinking. The team does the build how they want, using the artifacts as a guide. They don't need to use RDD — but they need to understand the system, so they should do the building themselves. The field guide helps them get there without me walking them through everything."

### Teammates / Collaborators

**Jobs:**
- "I need to understand how the work might be approached without having been in the room when the thinking happened"
- "I need to build my own understanding of how the system works — not just read someone else's understanding"
- "I need to know what's settled versus what's still open for me to decide"
- "I want to pick up a piece of the work and build it using the existing artifacts as my guide"

**Mental Model:**
"The orientation tells me what the system is and where to start. The roadmap shows me the pieces and their dependencies — I pick what to work on. The field guide helps me understand how the design maps to what's actually built. I might use `/rdd-build` to execute a work package, or I might build my own way. Either way, I need to understand what I'm building, not just follow instructions."

### AI Agent (Orchestrator)

**Jobs:**
- "Execute the skill instructions faithfully and produce artifacts that meet the quality bar"
- "Maintain consistency across phases — vocabulary, invariants, provenance"
- "Facilitate the gates without being patronizing or perfunctory"
- "Dispatch specialist subagents for focused work (auditing, scanning, synthesizing) and consume their output artifacts"
- "Maintain a current-state orientation document that lets new readers (human or agent) bootstrap into the system without reading everything"
- "Generate and maintain the roadmap and field guide as reflexive artifacts"

**Mental Model:**
"Each skill file is my instruction set for one phase. I read prior artifacts, produce the phase artifact, present it with prompts, and wait for the user to engage before moving on. The orchestrator tells me the sequence and the rules. For specialist work — citation audits, argument audits, literature reviews, conformance scans — I dispatch subagents that read and write artifact files rather than doing the work inline. I also maintain reflexive artifacts — orientation, roadmap, field guide — keeping them current as the system evolves."

### AI Agent (Specialist Subagents)

**Jobs:**
- "Read input artifacts (essays, research logs, ADRs, codebase), perform focused analysis, and write output artifacts (audit reports, debt tables, synthesis entries)"
- "Produce durable, inspectable artifacts rather than ephemeral conversation output — following the same artifact-mediated pattern that governs inter-phase communication"
- "Run on a model appropriate to the task — not necessarily the orchestrator's model"

**Mental Model:**
"I receive a task and file references. I read those files, do my analysis, and write my report to an artifact file. I have no conversation history and no user interaction. Everything I need comes from files; everything I produce goes to files."

## Value Tensions

- **Speed vs. understanding:** RDD explicitly trades velocity for comprehension. The weight of the process is the value proposition — it means thinking critically and intentionally about what to build. This is different from handing a large problem to an agent and saying "build it." The tension is not "is it too heavy?" but rather "when is a problem important enough to warrant this level of intentionality?"

- **Solo gates vs. team handoff:** The gates build the runner's understanding through generation. But when artifacts are handed to a team, the team hasn't gone through those gates — they receive understanding secondhand. The team lead mitigates this by being able to "speak to" the artifacts. The roadmap and field guide partially address this by giving the team tools to build their own understanding. And by handing off BUILD, the team gains understanding through implementation. But the gap between the runner's deep understanding and the team's artifact-mediated understanding remains a design tension.

- **Terminology precision vs. accessibility:** Terms like "epistemic gate," "invariant," and "backward propagation" are precise and accurate. They are also barriers to adoption. But diluting the terminology dilutes the signal. RDD's rigor is its strength. The terminology may self-select for the audience that will actually follow through — and that may be a feature, not a bug.

- **Personal tool vs. team methodology:** RDD works well as a solo thinking discipline and as a team lead scoping tool. Scaling it to teams running cycles together introduces coordination questions the current pipeline does not address. The "pair-RDD" possibility — two collaborators running a cycle together, both responding at gates — is an unexplored direction.

- **Artifact feedback loop:** Before handoff, the team lead gets feedback from specialists. This intermediate validation step is real workflow but is not formalized in the pipeline. The external review re-entry pattern (specialist feedback flowing back through the pipeline) is confirmed as actual practice but exists only as an open question in the domain model.

- **Orientation brevity vs. completeness:** The orientation document must be readable in under 5 minutes, but the system it describes may be complex. The one-pager forcing function says "ruthlessly prioritize," but where's the line between orientation and oversimplification?

- **Agent-generated artifact vs. trustworthy artifact:** The orientation document is maintained by the agent (currency) but validated by the user (accuracy). If the user doesn't review it carefully, it can drift from reality — especially for product-facing claims. Currency and accuracy pull in different directions.

- **Orientation as coherence test:** If the agent can't produce a clear, concise orientation document, the problem may not be the document — it may be the system's architecture. The document's clarity becomes a proxy for architectural coherence. This is productive but also risky: it could lead to premature simplification of legitimately complex systems.

- **Artifact maintenance burden vs. coverage:** More artifacts (roadmap, field guide) mean better handoff coverage but more to maintain. Each new reflexive document is a maintenance commitment. At what point does the maintenance cost exceed the coverage value? Documentation fatigue is a design signal — if artifacts feel burdensome, they may have outlived their scope.

- **Pragmatic doc update vs. epistemic re-engagement:** When docs drift after non-RDD builds, the conformance audit can flag the gap. But should the fix be a doc update (pragmatic — just bring the text into alignment) or a phase re-run (epistemic — rebuild understanding because the system has changed enough)? The audit flags the gap; the user decides the response.

- **RDD as permanent methodology vs. scaffolding:** Graduation says RDD's artifacts can be rolled into native project docs and archived. This treats the methodology itself as scaffolding (Invariant 6 applied at the meta level). When has a project matured past the point where RDD's structure adds value, and when is "graduating" just abandoning discipline?

- **Whole-project scope vs. subsystem scope:** RDD works well when it can hold the full context. As a project grows, the whole-system context exceeds what a single cycle can meaningfully engage with. The natural move is to scope RDD to subsystems while maintaining project-level design context outside RDD. The tension: how do subsystem-scoped RDD cycles stay coherent with the broader project architecture?

- **Artifact durability vs. dispatch overhead:** Agents produce durable, inspectable artifacts — audit reports that persist, can be referenced by future cycles, and exist independently of the conversation that produced them. But agent dispatch adds latency: spinning up a new context, loading the system prompt, performing the work, and writing the result takes longer than inline execution. The durability benefit is architectural; the cost is operational. When is the durability worth the overhead?

## Assumption Inversions

*Note: The inversions below serve a dual purpose. As a critical design exercise, they surface hidden assumptions. But they also function as epistemic acts in their own right — working through "what if this were wrong?" builds the user's understanding of the system. The inversions at the product discovery gate do double duty: questioning assumptions and producing comprehension. This was surfaced during the epistemic gate conversation and confirmed by the user: "They all got me thinking, which is the point."*

| Assumption | Inverted Form | Implications |
|------------|--------------|-------------|
| RDD is valuable because it produces understanding in the person who runs it | What if the primary value is the artifacts, not the understanding? | If artifacts are the product, gates matter less than artifact quality. But the user's experience contradicts this: understanding is what makes the artifacts good. Being able to "speak to" the artifacts — Invariant 0 — requires having gone through the gates. The two are inseparable. |
| The epistemic gates need to be AI-facilitated | What if users could run gates alone, or with another human instead of an AI? | "Pair-RDD" — two collaborators running a cycle together — could recover the pair-programming dynamic lost in agentic coding. The gates become a facilitation structure for human-human dialog, not just human-AI dialog. Worth its own research cycle. |
| A full phased pipeline is necessary | What if a partial run (RESEARCH through ARCHITECT, no BUILD) is the most common valuable use? | The team lead scoping case confirms this is already happening. When the team lead hands off BUILD so the team gains their own understanding through implementation, partial runs are not "Mode C alternatives" — they are a first-class use case with their own rationale. |
| The user works alone with the AI | What if RDD is most valuable as a collaborative exercise? | Pair-RDD could double the epistemic benefit at gates and surface more tacit knowledge. The current pipeline has no affordance for multiple humans at a gate. |
| The terminology barrier limits adoption | What if precise terminology attracts the right users? | People who find "epistemic gate" off-putting might also find the discipline too demanding. Self-selection through terminology may filter for users who will actually follow through. |
| RDD is for starting new projects | What if auditing existing systems (backward mode) is the highest-impact application? | Most software already exists. If RDD's biggest impact is helping teams understand inherited systems, the pipeline's greenfield bias may be misplaced. There are more existing systems than new ones by definition. |
| The orientation document should be generated by the agent | What if the user should write it? | It becomes an epistemic act — but the synthesis essay already fills the user-authored explanation role. The orientation document's value is that the agent maintains it, freeing the user to validate rather than author. |
| One orientation document serves all audiences (human newcomer, AI agent, specialist reviewer) | What if different audiences need different entry points? | Multiple entry points recreate the problem. The single-document constraint forces language that works across audiences — itself a test of system coherence. If the document can't be written clearly for all audiences, perhaps the system isn't as coherent as the artifacts claim. |
| The orientation document sits above the two primary readables in the hierarchy | What if it sits alongside them as a third peer? | Loses the routing function. The orientation document points readers *to* the right primary document. If it's a peer, readers still need an entry point above all three. The hierarchy needs a top. |
| RDD artifacts are permanent fixtures of the project | What if they should graduate into native docs and be archived? | Graduation at the subsystem level is a recurring operation, not a one-time exit. RDD artifacts are scaffolding — durable while needed, archived when the knowledge is integrated. Documentation fatigue is a signal that artifacts have outlived their scope. |
| RDD scopes to the whole project | What if subsystem-scoped cycles are the primary use case once a project stabilizes? | Whole-project RDD may be an early-stage pattern. The long-term pattern is scoped cycles on features/subsystems, with project-level docs as guardrails. The user's experience confirms this: RDD on a subsystem within a microservices architecture, scoped to a subfolder in the docs. |
| The system design should contain build instructions | What if sequencing belongs in a separate artifact with a fundamentally different character? | The Build Sequence section is prescriptive where it should be enabling. Extracting it into a roadmap changes the relationship from "follow these steps" to "here are the pieces and their dependencies — you decide." |
| More documentation means better coverage | What if additional artifacts increase maintenance cost past the point of value? | Each new reflexive artifact is a maintenance commitment. The roadmap and field guide must earn their keep by reducing handoff friction more than they add maintenance burden. Graduation provides the release valve when they don't. |
| Specialist work should run inline in the phase skill | What if specialist work should produce its own artifacts? | Inline execution is ephemeral — findings exist only in conversation. Artifact-mediated communication is durable, inspectable, and consistent with how RDD already communicates between phases. The architectural consistency argument is stronger than the context-savings argument. |
| Context passing is the right way to feed agents | What if artifacts are a more reliable interface than context blobs? | Context passing is brittle — too little loses fidelity, too much wastes tokens. Agents have no conversation history, making file-based communication not just preferable but necessary. Artifacts are self-contained and inspectable. |
| RDD's skills need to be distributed as standalone files in ~/.claude/skills/ | What if packaging as a plugin enables adoption without manual setup? | Plugin distribution solves "works on my machine." One install provides identical tooling. But it imposes constraints: namespacing (/rdd-research), security restrictions on plugin agents, and the full artifact corpus shipping with every installation. |
| The brainstorming skill should always fire before creative work | What if the user's explicit request for a specific workflow should override default process? | Not RDD-specific. Any plugin with its own exploration phase faces this. User intent should override default process — consistent with the superpowers priority hierarchy. |

## Product Vocabulary

| User Term | Stakeholder | Context | Notes |
|-----------|-------------|---------|-------|
| "Run a cycle" | Solo Developer | Starting an RDD process for a project | Implies iteration and return, not "execute the pipeline" |
| "The essay" / "the research" | Solo Developer | Referring to RESEARCH output | Natural language, not "research artifact" |
| "The system design" | Solo Developer / Team Lead | The architecture handoff doc | One of the "two docs that matter" |
| "The product discovery doc" | Team Lead | Handoff to product folks for validation | The other doc that matters |
| "Gates" | Solo Developer | The pause points between phases | May drop "epistemic" in casual use |
| "Scoping" | Team Lead | Running RDD through ARCHITECT to prepare work for a team | Not in the domain model — describes partial pipeline runs |
| "Doing my homework" | Team Lead | What RDD helps them do before asking a team to build | The team lead's framing of RDD's value |
| "Handing off" | Team Lead | Giving artifacts to team or specialists | Real workflow, no formal pipeline concept |
| "Getting feedback" | Team Lead | Sharing artifacts with specialists before team handoff | External review loop — real but not formalized |
| "Speaking to it" | Team Lead | Being able to explain and defend decisions | Direct expression of Invariant 0 |
| "Pair-RDD" | (Potential) | Two collaborators running a cycle together | Emerged during this discovery — not yet in the system |
| "Running a cycle on a feature" | Solo Developer | Using RDD for a new feature within an existing project, not just greenfield | Broadens scope beyond "new project" |
| "Research engineering" | Research-Engineer | Using RDD's research and modeling phases as a structured investigation methodology | The pipeline serves research, not just development |
| "Entry point" | Teammates, AI Agent | "Where do I start with these artifacts?" | The orientation document's primary function — routes readers into the corpus |
| "The big picture" | Teammates, Team Lead | "I need to understand what this system is" | What the orientation document provides — system identity, not detail |
| "The one doc worth reading" | Team Lead (circulating) | Sharing artifacts with stakeholders | If you can only send one thing, send this |
| "Stewardship signal" | Solo Developer | Reviewing orientation document over time | If the document grows abstract or contradictory, it signals accumulating complexity — a canary, not a diagnosis |
| "Cover letter" | Team Lead (handoff) | "What am I giving the team?" | Mental model: the orientation document accompanies artifacts across a team boundary |
| "How the work gets done" | Team Lead / Developer | Describing the roadmap's purpose | Sequencing enablement — not build instructions, but enough context to own the approach |
| "The moving parts" | Team Lead / Developer | Describing the field guide's purpose | Understanding the system well enough to own it and speak with authority |
| "Graduation" | Solo Developer / Team Lead | Folding RDD knowledge into native project docs and archiving RDD artifacts | Recurring at subsystem level, not just a one-time exit. The release valve for documentation fatigue |
| "Scoped cycle" | Solo Developer / Team Lead | Running RDD on a subsystem or feature rather than the whole project | The natural pattern once project-level architecture stabilizes |
| "Hard dependency" / "implied logic" / "open choice" | Developer | Classifying dependency edges in the roadmap | Distinguishes structural necessity from suggested ordering from genuine choice |
| "Documentation drift" | Solo Developer / Team Lead | Artifacts falling out of sync with code or skill version | The conformance audit's target problem |
| "Conformance audit" | AI Agent | Bringing artifact format into alignment with current skill version | Distinct from re-running phases — format, not content |
| "Work packages" | Team Lead / Developer | Logical groups of changes in the roadmap | Borrowed from TOGAF, adapted to RDD scale |
| "Documentation fatigue" | Solo Developer / Team Lead | When RDD artifacts outlive their immediate value and become maintenance burden | A design signal — time to graduate and re-scope, not time to abandon the methodology |
| "Deep work tool" | Solo Developer / Team Lead | Framing RDD's role within an existing practice | RDD is something you reach for when a problem warrants structured thinking, then put away when the knowledge is absorbed. It integrates into existing workflows rather than replacing them |
| "Plugin" / "install the plugin" | Solo Developer / Team Lead | Installing and using RDD | The distribution mechanism — one install provides the full skill set, agents, and hooks |
| "Audit report" / "audit artifact" | Solo Developer / AI Agent | Output from citation-auditor or argument-auditor agents | Durable, inspectable file rather than ephemeral conversation output — part of the artifact trail |
| "Dispatch" | AI Agent (orchestrator) | Sending work to a specialist subagent | "Dispatch the citation auditor" — the orchestrator delegates specialist work |
| "Skill activator" | AI Agent | The UserPromptSubmit hook that detects RDD-related prompts | Prevents brainstorming override, suggests appropriate phase skill |

## Product Debt

| Assumption | Baked Into | Actual User Need | Gap Type | Resolution |
|------------|-----------|-----------------|----------|------------|
| Only one workflow mode matters (full pipeline) | Orchestrator Mode A as primary, B/C/D as secondary | RESEARCH→ARCHITECT partial runs are a first-class use case for team leads | Missing workflow | Elevate partial pipeline (scoping mode) to equal standing with full pipeline |
| No handoff concept | All skills write artifacts but have no handoff step | Team leads need to share artifacts with specialists for feedback, then hand off to teams for building | Missing workflow | Consider formalizing a handoff/review step after ARCHITECT (optional, not a gate) |
| External review is not in the pipeline | Open question in domain model | Team leads already get feedback from architecture and product specialists before team handoff | Missing workflow | Formalize external review re-entry as a pipeline operation |
| Single user at gates | All EPISTEMIC GATE sections address one user | Pair-RDD — two collaborators at gates — could recover pair-programming benefits | Over-abstraction (single-user assumption) | Research cycle needed to explore pair-RDD |
| Backward mode is secondary to forward mode | Forward mode is Step 2a, backward mode is Step 2b; pipeline defaults to greenfield | Auditing existing systems may be the highest-impact application | Mental model mismatch | Consider whether backward mode deserves equal or greater emphasis in onboarding and documentation |
| No artifact entry point exists | Artifact corpus has no top-level orientation document | New readers, handoff recipients, and bootstrapping agents need a single document that orients them to the system and routes them to depth | Missing artifact | ~~Add an agent-maintained orientation document~~ **RESOLVED** — ORIENTATION.md implemented (ADR-019 through ADR-021) |
| Two-tier document hierarchy (primary readables + supporting material) | System design's "two primary readable documents" principle | Three tiers needed: orientation (entry point) → primary readables (product-discovery, system-design) → supporting material (domain model, ADRs, scenarios) | Missing tier | ~~Amend the design principle~~ **RESOLVED** — three-tier hierarchy implemented (system design Amendment #3) |
| Build Sequence in system-design.md is sufficient for sequencing | system-design.md Build Sequence (Phases 0-3) | A non-prescriptive roadmap that enables developer-owned sequencing with classified dependencies (hard, implied, open) | Wrong document type | ~~Extract to roadmap artifact~~ **RESOLVED** — roadmap.md implemented (ADR-022) |
| No developer-focused understanding document | Artifact hierarchy has orientation + product discovery + system design | Developers receiving handoff need a field guide mapping design to implementation to build their own understanding and own the system | Missing artifact | ~~Add field guide~~ **RESOLVED** — field-guide.md implemented (ADR-023) |
| No conformance mechanism for skill evolution or project adoption | Each skill writes its own artifacts independently | When skills evolve, RDD is added to existing projects, or code changes without RDD, artifact corpus needs systematic alignment | Missing workflow | ~~Add conformance audit skill~~ **RESOLVED** — `/rdd-conform` implemented (ADR-025) |
| No graduation path from RDD to native docs | RDD artifacts are implicitly permanent | Subsystem-scoped RDD cycles should graduate into project-level docs when stable; whole-project RDD should be archivable when the methodology has served its purpose | Missing workflow | ~~Add graduation~~ **RESOLVED** — graduation implemented as conformance audit operation (ADR-025) |
| system-design.md serves one purpose | system-design.md | Serves 5+ distinct purposes (architectural specification, responsibility reference, integration contracts, test architecture, build sequence); exceeds document sizing heuristics for end-to-end reading | Over-scoped document | Evaluate decomposition per Purpose Test heuristic |
| RDD always scopes to the whole project | Pipeline and orchestrator assume whole-project context | Subsystem-scoped cycles within a stable project are a primary use case — RDD on a feature folder, graduating into project-level docs when done | Missing workflow pattern | Formalize scoped cycles and the graduation lifecycle |

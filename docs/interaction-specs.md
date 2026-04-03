# Interaction Specifications

**Derived from:** product-discovery.md (stakeholder models)
**Complements:** scenarios.md (business-rule behavior)

*Note: This file was created during the code-review skill cycle (ADR-043 through ADR-047). Interaction specifications for prior features are not yet backfilled — this is a known gap per ADR-037's derivation method open question.*

---

## Stakeholder: Solo Developer-Researcher (as Reviewer)

**Super-Objective:** "I want the review process to help me understand AI-generated code well enough to own it, not just approve it"

### Task: Review own work package during build (corpus-grounded mode)

**Interaction mechanics:** After completing a scenario group during build and running stewardship checks, the practitioner invokes `/rdd-review`. The skill reads the work package's relevant ADRs, scenarios, and domain model entries. It surfaces review questions grounded in the provenance chain — questions about whether the implementation matches the decisions, whether assumptions hold, and whether the domain vocabulary is used consistently. The practitioner engages with the questions, potentially committing review fixes. The practitioner proceeds to the next scenario group when satisfied.

### Task: Review AI-generated code for ownership verification

**Interaction mechanics:** When AI has generated code (during build or outside it), the practitioner invokes `/rdd-review` to verify they understand what was generated. The skill orients using available RDD artifacts and surfaces questions about the AI-generated code's design intent, tradeoffs, and fit with existing architecture. The practitioner answers the questions — if they cannot, the review has surfaced an opacity gap. The practitioner decides whether to refactor, annotate, or accept the code based on their understanding.

---

## Stakeholder: Team Lead (as Reviewer)

**Super-Objective:** "I want to review a teammate's MR and actually be helpful — not just approve it or parrot AI-generated comments"

### Task: Review a teammate's MR (context-reconstructive mode)

**Interaction mechanics:** The team lead invokes `/rdd-review` and indicates they are reviewing a colleague's MR. The skill enters context-reconstructive mode and asks for breadcrumbs: ticket URL, MR link, relevant docs, or discussion threads. The team lead provides what they have. The agent fetches and synthesizes an orientation summary. The team lead validates or corrects the orientation. The agent surfaces review questions grounded in the validated context — questions about design fitness, assumption validity, reversibility of decisions, and alignment with team goals. The team lead engages with the questions, forming their own assessment. The team lead writes their own review comments in their own words.

### Task: Quick review under time pressure

**Interaction mechanics:** The team lead invokes `/rdd-review` and indicates they have limited time (e.g., 5 minutes). The skill adapts: it performs a faster context-gathering pass, produces a brief orientation, and surfaces 1-2 high-priority questions focused on the most consequential aspect of the change. The team lead engages with these questions. Even under time pressure, the review produces enough understanding for the team lead to discuss the MR with informed judgment.

### Task: Review within an RDD-scoped project the team lead owns

**Interaction mechanics:** When the team lead runs RDD through ARCHITECT and hands off BUILD, they may later review team members' implementations against the artifacts they produced. The skill enters corpus-grounded mode, reads the relevant work package's ADRs and scenarios (which the team lead wrote), and surfaces questions about whether the implementation matches the decisions. The team lead's deep familiarity with the artifacts makes this mode especially effective — they know the provenance chain because they built it.

---

## Stakeholder: Teammates / Collaborators (as Reviewer)

**Super-Objective:** "I want to review a colleague's MR without feeling like I'm just going through the motions"

### Task: Review a colleague's MR in an unfamiliar area

**Interaction mechanics:** The teammate invokes `/rdd-review` for a colleague's MR in a codebase area they are less familiar with. The skill enters context-reconstructive mode and asks for breadcrumbs. The teammate provides what they can find (ticket, docs). The agent synthesizes orientation. The teammate validates or corrects. The agent surfaces review questions — these serve a dual purpose: guiding the review AND teaching the teammate about this area of the codebase. By engaging with the questions, the teammate learns something about the system they didn't know before. The review is both a quality gate and a learning opportunity.

### Task: Review a colleague's MR using existing RDD artifacts

**Interaction mechanics:** The teammate is reviewing an MR in a project that uses RDD. They invoke `/rdd-review` in corpus-grounded mode. The skill reads the relevant artifacts, giving the teammate orientation they wouldn't otherwise have (the ADRs, scenarios, and domain model explain *why* things are the way they are). The teammate engages with review questions grounded in this context. The RDD artifact trail makes the teammate a more effective reviewer — they can evaluate the MR against decisions they didn't make but can now understand.

---

## Stakeholder: AI Agent (Orchestrator, executing review skill)

**Super-Objective:** "Scaffold the reviewer's understanding without substituting for their judgment"

### Task: Perform review orientation in corpus-grounded mode

**Interaction mechanics:** The agent reads the relevant slice of the RDD artifact corpus for the work package in scope. It synthesizes orientation context: what decisions were made and why (ADRs), what behavior was specified (scenarios), what vocabulary applies (domain model), and what architectural constraints exist (system design). It presents this as concise orientation, not as a full artifact dump.

### Task: Perform collaborative context-gathering in context-reconstructive mode

**Interaction mechanics:** The agent prompts for breadcrumbs. For each source the reviewer provides, the agent fetches using available tools (CLI, MCP) or asks the reviewer to paste content if tools are unavailable. The agent reads and synthesizes the gathered context into an orientation summary. It presents the summary for validation before proceeding to question generation.

### Task: Surface review questions

**Interaction mechanics:** Based on the validated orientation and the code changes under review, the agent generates questions a thoughtful senior reviewer would ask. Questions reference specific context (not generic). The number and depth of questions adapts to the reviewer's stated time budget. Mechanical findings (objective issues) are surfaced separately and labeled as such. The agent does not produce a merge verdict, severity ratings, or pre-written review comments.

### Task: Respect reviewer autonomy

**Interaction mechanics:** If the reviewer dismisses questions without engaging, the agent notes that the questions are designed to build understanding but does not compel engagement. If the reviewer asks the agent to write review comments for them, the agent declines — it can help the reviewer formulate thoughts, but the comments should be in the reviewer's own words. The agent scaffolds; the reviewer thinks.

---

## Stakeholder: Everyday Developer (using build skill)

**Super-Objective:** "I want to actually understand what I built, not just have it work"

### Task: Build a feature from a ticket (context-reconstructive mode)

**Interaction mechanics:** The developer invokes `/rdd-build` and provides context: a ticket URL, a description of what needs to happen, or both. The skill detects no RDD artifact corpus and enters context-reconstructive mode. It asks for breadcrumbs — ticket, relevant docs, codebase pointers, discussion threads. It fetches and reads these, then synthesizes orientation answering the five Orientation Questions. It presents the orientation and work decomposition for validation. The developer corrects or confirms. The skill writes the work decomposition as a session artifact. It asks about available time. Then the build loop begins: one work package at a time, TDD (red → green → refactor). At natural boundaries, stewardship checks the work against the session artifact. At the end, the developer can explain what was built and why.

### Task: Build a feature from a roadmap work package (pipeline mode)

**Interaction mechanics:** The developer invokes `/rdd-build` within an RDD project with a full artifact corpus. The skill detects the corpus and enters pipeline mode. It reads the relevant work package from the roadmap, the associated scenarios, interaction specifications, domain model entries, and ADRs. It presents this as orientation. The developer validates. The build loop proceeds through the scenarios as specified, with TDD and stewardship against the full artifact trail. The developer can compose the deeper modes of debug and refactor when triggered.

### Task: Build under time pressure (focused mode)

**Interaction mechanics:** The developer invokes `/rdd-build` and indicates limited time (e.g., "I have 10 minutes"). The skill adapts: essential orientation (the most consequential answer from each Orientation Question), a single work item (the highest-priority package), TDD without formal stewardship. Orientation validation still happens — "Does this capture the situation?" — but the ceremony is minimal. The developer completes one focused piece of work with understanding rather than rushing through multiple items without it.

---

## Stakeholder: Everyday Developer (using debug skill)

**Super-Objective:** "When I debug, I want to understand *why* it broke, not just get a fix"

### Task: Debug a production bug (standalone)

**Interaction mechanics:** The developer invokes `/rdd-debug` with a bug description — error logs, reproduction steps, the expected vs actual behavior. The skill runs Context Gathering: it reads the relevant code, any available documentation, and the developer's description. It synthesizes orientation focused on the expected-vs-actual divergence. The developer validates. Then the hypothesis-trace-understand-fix cycle begins: the skill asks "What do you think the mental model was wrong about?", guides the developer through tracing data flow to the divergence point, names the misunderstanding (not just the fix), and helps write a test encoding the corrected understanding. The fix follows. The developer walks away knowing what was wrong and why — not just that it's fixed.

### Task: Debug an unexpected failure during build

**Interaction mechanics:** During a build session, a test fails unexpectedly — not the red-phase failure the developer wrote, but something else. The build skill suggests invoking debug. The developer confirms. The debug skill inherits the build session's orientation and current work package. It does not re-ask for context. It guides through the hypothesis-trace cycle within the build's existing context. When the bug is understood and fixed (with a test), control returns to the build loop. The interruption was brief but the understanding was real.

---

## Stakeholder: Everyday Developer (using refactor skill)

**Super-Objective:** "When I refactor, I want to understand the code well enough to make it genuinely better"

### Task: Refactor a code area (standalone)

**Interaction mechanics:** The developer invokes `/rdd-refactor` on a code area they want to improve. The skill runs Context Gathering: reads the code area, surrounding context, and any available architectural documentation. It synthesizes orientation focused on the code's current structure, its role in the broader system, and the architectural intent. The developer validates. Then the Three-Level Refactor begins: level 1 (Smells) — diagnose classical and AI-exacerbated smells, run AI hygiene prompts; level 2 (Patterns) — select techniques from the catalog, considering inverse pairs; level 3 (Methodology) — check against architectural intent. Each refactoring is committed as a `refactor:` commit. Tests pass before and after.

### Task: Refactor after green during build

**Interaction mechanics:** During a build session, the green phase is complete and the developer (or agent) notices a smell. The build skill suggests invoking refactor. The developer confirms. The refactor skill inherits the build session's orientation. It runs the Three-Level Refactor on the code just written or modified, checking against the build session's architectural intent. The refactoring is committed separately from the behavior change. Control returns to the build loop.

### Task: Consume a codebase audit's findings

**Interaction mechanics:** A codebase audit has been performed, producing prioritized findings. The developer invokes `/rdd-refactor` with the audit as input. The skill reads the audit findings and uses them as the level 1 diagnostic — the smells are already identified and prioritized. The developer selects which findings to address. The skill guides through levels 2 and 3 for each selected finding. This is the remediation arm the audit currently lacks.

---

## Stakeholder: Everyday Developer (skill composition)

**Super-Objective:** "I have a ticket — I want to break it into work packages that I understand, build with TDD, and check my work as I go"

### Task: Complete a full build session with seamless mode shifts

**Interaction mechanics:** The developer invokes `/rdd-build` with a ticket. Context Gathering produces orientation and work decomposition. The developer validates both. The build loop begins. During the first work package, an unexpected test failure shifts the flow into debug mode — the developer traces and fixes it within the same conversation. During the second work package, after green, a smell shifts the flow into refactor mode — the developer cleans it up. At the scenario group boundary, the flow shifts into review mode — the developer engages with the review questions. Each mode shift is seamless: the context carries through, no re-orientation occurs, the developer stays in the thread of understanding. The developer completes the ticket having understood every piece of what was built.

### Task: Handle a mode shift the developer wants to skip

**Interaction mechanics:** During a build session, the build skill identifies a smell after green and begins shifting toward refactor. The developer says they want to skip it and move on. The build flow continues without the refactoring. The developer controls the workflow — mode shifts are the skill's best judgment about where understanding matters, not mandates.

---

## Stakeholder: AI Agent (Orchestrator, executing composable skills)

**Super-Objective:** "Scaffold the developer's understanding without substituting for their judgment"

### Task: Run Context Gathering protocol

**Interaction mechanics:** The agent detects whether an RDD artifact corpus exists. In pipeline mode, it reads relevant artifacts. In context-reconstructive mode, it prompts for breadcrumbs, fetches using available tools (CLI, MCP, or reading pasted content), and synthesizes orientation answering the five Orientation Questions. In either mode, it presents the orientation for user validation. It adapts step 4 (synthesis) to the invoking skill's needs: build emphasizes work decomposition, debug emphasizes expected-vs-actual divergence, refactor emphasizes structural health.

### Task: Manage seamless mode shifts during build

**Interaction mechanics:** During the build loop, the agent observes test outcomes and code quality signals. When it detects an unexpected failure, the flow shifts into debug mode. When it detects a smell after green, the flow shifts into refactor mode. At scenario group boundaries, the flow shifts into review mode. These shifts are seamless — the context carries through, the conversation is unbroken, and the developer stays in the thread of understanding. The developer can skip or redirect any mode shift. When a mode resolves, the build flow resumes at the point where the shift occurred.

### Task: Write and manage session artifacts

**Interaction mechanics:** In context-reconstructive mode, the agent writes validated facsimiles (work decomposition, orientation summary) to a `session/` directory as markdown files with `session-artifact: true` frontmatter. During stewardship, it reads these files to check conformance. It does not automatically clean up session artifacts after the session — it leaves that decision to the developer.

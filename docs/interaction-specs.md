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

---

*Updated 2026-04-06 (Cycle 9: Sycophancy and RDD Reflexivity — ADRs 055-062)*

---

## Stakeholder: Solo Developer-Researcher (Sycophancy-Aware Interaction)

**Super-Objective:** "I need structural mechanisms that catch what I can't catch — not because I'm inattentive, but because neither I nor the agent can detect sycophantic content selection from inside the interaction"

### Task: Engage with belief-mapping questions at gates

**Interaction mechanics:** At each epistemic gate, the agent deploys one or more research-grounded question forms (belief-mapping, pre-mortem, warrant elicitation, rebuttal elicitation, commitment gating, or open-question reframing) composed from the specific phase artifact. The practitioner engages with the question — their response is simultaneously sycophancy resistance evidence, confidence diagnosis, and epistemic advancement. The practitioner's substantive engagement with alternatives demonstrates Earned Confidence; deflection or surface response flags reinforced confidence. The gate conversation continues until shared understanding is established.

### Task: Respond to Grounding Reframe

**Interaction mechanics:** When the agent determines that sycophancy risk is unassessable, it names the specific uncertainty and offers concrete grounding actions (run a spike, write a test, consult an expert, belief-map a specific assumption). The practitioner chooses: pursue a grounding action, or proceed with the limitation visible. Proceeding without grounding is a conscious choice — the practitioner knows what they're building on. The decision is recorded for the Susceptibility Snapshot.

### Task: Review Susceptibility Snapshot

**Interaction mechanics:** At phase boundaries, a Susceptibility Snapshot artifact is produced by isolated evaluation. The practitioner may review the snapshot to see what susceptibility signals were observed during the phase — assertion density, narrowing, framing adoption. The snapshot is advisory. The practitioner decides whether to act on its recommendations, adjust their approach, or proceed.

### Task: Understand and communicate process limitations

**Interaction mechanics:** The practitioner develops understanding of where the methodology is weakest (early phases, content selection, the agent's value proposition being mechanistically identical to the sycophancy vector). When communicating about artifacts produced through RDD, the practitioner can articulate: "here's what the methodology can and can't guarantee, and here's where external review would be most valuable." This is Authority (Invariant 0) including limitation transparency.

---

## Stakeholder: AI Agent (Orchestrator, Sycophancy-Aware Operation)

**Super-Objective:** "Apply belief-mapping framing rather than adversarial framing when surfacing alternatives — the form of the question determines whether it reduces bias or reverses it"

### Task: Run AID cycle with susceptibility observation

**Interaction mechanics:** During the Attend phase, the agent reads engagement signals AND susceptibility signals: assertion density, solution-space narrowing without user initiation, adoption of agent-provided framing without challenge, confidence markers at artifact-production moments. The agent records susceptibility signals but does not evaluate them inline — evaluation happens in isolated context at phase boundaries, producing a Susceptibility Snapshot.

### Task: Deploy question forms from the toolkit

**Interaction mechanics:** At each gate, the agent selects from six research-grounded question forms based on the AID interpretation and the phase-specific mapping. The agent composes each question from the specific artifact content and conversation state — the form is a type, not a script. The same question type at two different gates produces different specific questions. The agent does not recite templates.

### Task: Perform assertion-aware observation

**Interaction mechanics:** During conversation, the agent attends to assertions that embed framing, architectural, or design conclusions — using semantic assessment, not lexical pattern matching. When an embedded conclusion is detected near an artifact-production moment, the agent deploys open-question reframing from the toolkit. The agent does NOT flag harmless implementation confidence. The agent is transparent about this mechanism's limitation: it operates inside the conversation without Architectural Isolation.

### Task: Perform Grounding Reframe when risk is unassessable

**Interaction mechanics:** When the agent cannot determine whether the user's confidence is earned or reinforced (no belief-mapping test available, no empirical contact), the agent does not disclaim and proceed. Instead, it names the specific uncertainty, offers concrete grounding actions, and makes visible what the user would be building on without grounding. The reframe is composed from the current context, not from a template.

### Task: Respect unconditional architectural floor

**Interaction mechanics:** The agent dispatches Tier 1 mechanisms (specialist audits, Susceptibility Snapshot evaluation, Research Methods Subagent review) regardless of its own assessment of sycophancy risk. The agent does not skip audits because the context seems low-risk. When the user provides domain grounding, the agent treats it as additional evidence, not as a replacement for structural assessment.

---

## Stakeholder: AI Agent (Specialist Subagents, Sycophancy-Aware Extensions)

**Super-Objective:** "Read input artifacts, perform focused analysis, and write output artifacts — in architectural isolation from the main conversation"

### Task: Produce Susceptibility Snapshot

**Interaction mechanics:** At phase boundaries, the subagent receives recorded susceptibility signals from the AID cycle's inline observations. In an isolated context (fresh window, no conversation history), the subagent evaluates the signals: assertion density patterns, narrowing trajectory, framing adoption. The subagent writes a structured Susceptibility Snapshot artifact — observed signals, interpretation, and any warranted Grounding Reframe recommendation.

### Task: Perform framing audit (extended argument auditor)

**Interaction mechanics:** When the argument auditor is dispatched, it produces a two-section audit: the existing argument audit (inferential chain verification) and a new framing audit section. The framing audit reads the artifact and its source material, identifies 2-3 alternative framings the evidence supported, surfaces findings that are absent or underrepresented, and applies belief-mapping to the dominant framing ("What would the reader need to believe for a different framing to be right?").

### Task: Review research design before execution

**Interaction mechanics:** Before the first research loop, the Research Methods Subagent reads the research question set. It applies belief-mapping to each question, flags embedded conclusions and premature narrowing, and produces a research design review artifact with flagged questions and suggested reformulations. In the future version, it reads prior cycle research logs to detect cross-cycle methodological patterns.

---

## Stakeholder: Solo Developer-Researcher (Housekeeping Migration and Advisory Mode)

**Super-Objective:** "Update RDD to the latest version without being forced into immediate corpus restructuring, and opt into compound-check enforcement when ready"

### Task: Encounter advisory mode after plugin update

**Interaction mechanics:** The developer updates the RDD plugin to a version shipping Cycle 10's structural ADRs (063–070). They begin their next session and start working normally. At the first phase boundary, the Stop hook detects that `docs/housekeeping/` does not exist in the corpus and emits a non-blocking stderr notice identifying the corpus as pre-migration. The notice names the plugin version, explains that compound-check verification is disabled, names `/rdd-conform migrate` as the opt-in path to enforcement, and includes a short explanation that the methodology continues to work without verification. The developer reads the notice. Their cycle continues without interruption. They can ignore the notice indefinitely and keep working with advisory-mode degradation; they lose no functionality beyond harness-layer verification of Tier 1 dispatches.

### Task: Run `/rdd-conform migrate` to transition to enforcement mode

**Interaction mechanics:** The developer decides to migrate. They invoke `/rdd-conform migrate`. The command first checks whether `docs/housekeeping/.migration-version` already exists; if so, it reports "already migrated" and exits. Otherwise, it checks `git status` for uncommitted changes to `skills/` or `docs/` and refuses to run if any are present (directing the user to commit or stash). When clean, it creates `docs/housekeeping/audits/` and `docs/housekeeping/gates/`, moves all files from `docs/essays/audits/` into the housekeeping audits subdirectory, moves `docs/cycle-status.md` to `docs/housekeeping/cycle-status.md`, runs the mechanical reference-update substitution across prior ADRs, the Cycle 10 essay, spike reports, skill files, the manifest, the domain model, and ORIENTATION, writes `docs/housekeeping/.migration-version` with the current plugin version, and appends `docs/housekeeping/dispatch-log.jsonl` to `.gitignore`. A summary report lists every file moved and every file whose references were updated. The developer reviews the diff with `git diff`, confirms the changes match expectations, and commits. On their next session, the Stop hook detects the marker file, enters enforcement mode, and the compound check activates.

### Task: Decide not to migrate

**Interaction mechanics:** The developer reads the advisory notice but chooses not to migrate — perhaps they are mid-cycle, or do not want to take on the migration work at this moment, or never plan to migrate. They continue working. Their cycles complete normally. Each new session produces one advisory notice at the first phase boundary and then suppresses subsequent notices for the rest of the session. The methodology provides competent first-order analysis, Tier 2 conversational mechanisms, and Skill-Structure Layer dispatch enforcement (the existing 100% coverage mechanisms — citation, argument, research-methods auditors). They lose only the Harness Layer's compound check. This is a legitimate operating state indefinitely.

### Task: Read and act on a revision-aware re-audit reminder

**Interaction mechanics:** After revising their essay during a research phase, the developer reaches phase-end. The Stop hook runs, detects that the essay's mtime is newer than the most recent dispatch log entry for the argument-auditor, and emits a model-visible reminder (alongside its `allow` decision — not a block). The reminder names the audited document, the last audit dispatch timestamp, and the document modification timestamp, and asks whether the modification is substantial enough to warrant re-auditing. The agent surfaces the reminder to the developer. The developer reads it and decides: if the modification was a typo fix, they say "no re-audit needed, proceeding"; if it was a section rewrite, they say "yes, run re-audit" and the orchestrator dispatches the argument-auditor again. The substantiality judgment is epistemic; the hook surfaces the condition but the developer and agent together decide.

---

## Stakeholder: AI Agent (Orchestrator, Cycle 10 Structural Extensions)

**Super-Objective:** "Execute Tier 1 mechanism dispatches with canonical prompt skeleton, respond to susceptibility snapshot findings via the extended Grounding Reframe, and produce gate reflection notes at phase boundaries — in alignment with Invariant 8's anchoring requirement"

### Task: Dispatch a Tier 1 subagent with canonical prompt skeleton

**Interaction mechanics:** At the concrete workflow step specified by the phase skill (e.g., "after the essay is written" for the citation auditor, "at phase-end" for the susceptibility snapshot), the orchestrator constructs the dispatch prompt using the canonical skeleton from ADR-065: a brief describing the subagent's task, followed by a literal `Output path: <resolved canonical path>` line where `{cycle}` is substituted with the current cycle number from `docs/housekeeping/cycle-status.md`'s `**Cycle number:** NNN` field (or from the essay-prefix fallback if the field is absent). The orchestrator invokes the Task tool with the subagent_type and prompt. The PostToolUse hook fires automatically, extracts the output path via regex, and writes a JSONL entry to the dispatch log. The orchestrator does not interact with the log directly; it is harness-managed.

### Task: Produce a gate reflection note at a phase boundary

**Interaction mechanics:** At phase-end, after the AID cycle conversation has run, the orchestrator composes a gate reflection note at `docs/housekeeping/gates/{cycle}-{phase-from}-to-{phase-to}.md`. The note contains five required sections: the composed belief-mapping question, the user's verbatim response, the selected pedagogical move (named without the interpretation that drove selection), and the commitment gating outputs (settled premises, open questions, specific commitments carried forward). The orchestrator writes the note before declaring the phase complete. The Stop hook's manifest check verifies the note exists at the canonical path with all required headers and fields before allowing phase transition. If the note is missing or malformed, the Stop hook blocks the transition in enforcement mode (or emits a non-blocking advisory notice in advisory mode).

### Task: Respond to a significant susceptibility snapshot finding via extended Grounding Reframe

**Interaction mechanics:** At a phase boundary, the orchestrator dispatches the susceptibility-snapshot-evaluator per the per-phase dispatch instruction in the current phase skill. The subagent returns its snapshot artifact with findings. For each finding, the orchestrator applies the three significance properties from ADR-068: specificity (does the finding name specific artifacts?), actionability (is a concrete grounding action composable in response?), and in-cycle applicability (can the action be applied at this boundary?). Findings meeting all three trigger the Grounding Reframe protocol — the orchestrator names what is uncertain, offers concrete grounding actions, and makes the cost visible to the user. Findings not meeting all three are recorded as feed-forward signals in the cycle status. The orchestrator does not evaluate significance mechanically — the three properties are calibration tools for a judgment the orchestrator makes at snapshot-read time.

### Task: Classify a new mechanism proposal per the four-step decision procedure

**Interaction mechanics:** When a future cycle proposes a new unconditional structural mechanism, the orchestrator runs ADR-067's four-step decision procedure. Step 1: does the mechanism have a concrete, mechanically-unavoidable workflow step? If yes, it anchors at the Skill-Structure Layer (ADR-065 pattern) and the relevant skill file gains a dispatch instruction. Step 2: is the mechanism's trigger a tool-call or phase-end event, or does its failure mode include silent dispatch fallback? If yes, it anchors at the Harness Layer (ADR-063/064 pattern) and a manifest entry is added. Step 3: is the mechanism conversational with a natural artifact moment? If yes, it anchors at the User-Tooling Layer (ADR-066 pattern) via the Graduate Conversational Mechanism action. Step 4: none of the above — the mechanism cannot be Tier 1 and must be specified as best-effort or explicitly contingent per Invariant 8. The orchestrator records the decision in the proposing ADR's provenance chain.

---

## Stakeholder: Plugin Maintainer (Hook Failure Issue Response)

**Super-Objective:** "Receive diagnostic information about hook failures from users in the field, diagnose the root cause, and ship fixes that resolve the failure mode"

### Task: Receive a hook failure GitHub issue with pre-populated diagnostic

**Interaction mechanics:** A user whose hook script encountered an internal error has clicked the GitHub issue link from the Fails-Safe-to-Allow stderr notice. The link opens a pre-populated issue at `https://github.com/nrgforge/rdd/issues/new?template=hook-failure.md` with the hook name, diagnostic line, plugin version, OS/shell environment, and (if available) a sanitized copy of the hook input JSON. The user fills in any additional context and submits. The maintainer receives the issue, reproduces the failure locally using the diagnostic data, fixes the hook script, and ships the fix in the next plugin release. The user updates the plugin on their schedule; their corpus continues to work in advisory mode during the gap. The maintainer's work is enabled by structured diagnostic data that the user contributed without being required to debug the plugin themselves.

---

## Stakeholder: Solo Developer-Researcher (Running DECIDE Phase, Cycle 016 Extensions)

**Super-Objective:** "Translate research findings and product discovery into ADRs, scenarios, and interaction specifications that BUILD can implement faithfully — including the new criterion-level verification, preservation coverage, and ADR lifecycle disciplines introduced in Cycle 016"

### Task: Produce a Cycle Acceptance Criteria Table at DECIDE

**Interaction mechanics:** The developer-researcher is in the DECIDE phase. Product discovery has named one or more acceptance criteria that are emergent or aggregate (e.g., "first real MCP consumer workflow via live MCP transport") rather than atomic. Per ADR-073, the developer adds a top section to `scenarios.md` (or, when scenarios.md is already large, a sibling `acceptance-criteria.md`) called "Cycle Acceptance Criteria Table." For each non-atomic criterion, the developer fills four columns: the criterion verbatim, the layer the criterion specifies (e.g., "live MCP transport"), the verification method (which scenarios compose to cover it, plus any integration test), and the layer-match check (yes / no — does the verification exercise the named layer, or does it stub it?). When the cycle's criteria are all atomic with 1:1 scenario mapping, the developer records the judgment as a one-line note ("no emergent criteria identified") rather than producing the table. The table becomes input to BUILD Step 5.5, which the developer or the BUILD agent verifies each entry's layer-match check against the actual test composition.

### Task: Write preservation scenarios alongside behavior scenarios

**Interaction mechanics:** While writing behavior scenarios for a feature, the developer-researcher pauses at each feature block and asks: *what should this feature not change?* Per ADR-075, the developer writes at least one `### Preservation:` scenario covering the contract or behavior most at risk of being silently changed by the new feature. Inputs the developer consults: product-discovery's assumption inversions for the area, existing scenarios in `scenarios.md` that the new feature touches, and `system-design.md` provenance chains for the affected modules. When the new feature genuinely cannot affect any existing behavior (a wholly isolated module or brand-new entry point), the developer records the judgment as a one-line note ("No existing observable behavior is in the call path; preservation scenarios omitted") rather than fabricating a scenario. The recorded judgment is itself the structural anchor — the question was asked.

### Task: File a superseding ADR when a prior decision is changed

**Interaction mechanics:** A new architectural decision genuinely supersedes (or partially refines) an earlier ADR. Per ADR-074, the developer files a new ADR (ADR-MMM) describing the new decision and citing the original (ADR-NNN) by number and one-line summary. The developer adds a dated supersession header at the top of ADR-NNN (`> **Superseded by ADR-MMM on YYYY-MM-DD.** [reason]` for total replacement; `> **Updated by ADR-MMM on YYYY-MM-DD.** [scope]` for partial refinement) and updates ADR-NNN's Status field accordingly. The developer does not edit ADR-NNN's body sections (Context, Decision, Rejected alternatives, Consequences, Provenance check) — these remain immutable. The developer then sweeps the downstream current-state artifacts: `system-design.md` provenance chains, `ORIENTATION.md` Section 4 / 5, `domain-model.md` concept and relationship tables that cite ADR-NNN, `field-guide.md` implementation-level entries — replacing the citation with ADR-MMM where the new decision is now authoritative. The developer records the supersession in cycle-status.md's relevant phase status entry.

### Task: Apply the drift decision tree when shipped code differs from an ADR

**Interaction mechanics:** During `/rdd-conform` audit, BUILD stewardship, or ARCHITECT review, the developer notices shipped code differs from an accepted ADR's text. Per ADR-074's drift decision tree, the developer asks: does the architectural decision still hold? If yes — the divergence is implementation-level — the developer records the divergence in `field-guide.md` if useful for orientation but does not change the ADR. If the architectural call has actually changed — decision-level supersession — the developer applies the supersession workflow above. If neither applies (code violated an ADR without filing a supersession) — the code is structural debt; the developer either reconforms the code via a `refactor:` commit or files a superseding ADR that legitimizes the new direction. The developer does not quietly amend the ADR to match the violation — silent amendment loses the historical record.

---

## Stakeholder: Solo Developer-Researcher (Initiating RESEARCH Phase, Cycle 016 Extension)

**Super-Objective:** "Begin a research entry with question framing that is not pre-shaped by existing implementation artifacts, so the research investigates the problem space rather than narrowing to integration with what already exists"

### Task: Articulate research questions before consulting the artifact corpus

**Interaction mechanics:** The developer-researcher invokes `/rdd-research` for a new research entry. Before the agent reads any existing essays, ADRs, system-design, scenarios, product-discovery, or code for the new entry, the developer writes the research question(s) in their own words as the first content of the research log. The agent does not preface this with corpus retrieval. The discipline is the artifact ordering: the question text appears first; the corpus reads come after. Per ADR-082, the structural anchor is the artifact (research log entry's first content is the question), not a hook that prevents corpus reads.

### Task: Respond to the constraint-removal prompt at research entry

**Interaction mechanics:** With the research questions recorded, the agent composes a constraint-removal prompt naming the most consequential existing artifact specifically: "What if [the most consequential existing artifact / infrastructure component] were not available? How would the problem be solved then?" The developer responds in the research log alongside the question. When the developer has no constraint-removal answer ("the artifact is genuinely irreplaceable"), the response itself is recorded as the answer with a one-sentence justification. In a greenfield context with no consequential prior artifacts, the response is a one-line null answer ("no consequential prior artifacts to bracket"). The recorded engagement is the structural anchor; substantive content is not required.

### Task: Wait for research-methods-reviewer dispatch before entering the research loop

**Interaction mechanics:** With the question articulation and constraint-removal response recorded, the agent dispatches the research-methods-reviewer (per ADR-060 extended by ADR-082). The reviewer evaluates both artifacts as one "question set under review" against four criteria: need-vs-artifact framing, embedded conclusions, prior-art treatment, incongruity surfacing. The developer waits for the reviewer's report before the research loop (lit-review / spike / synthesis) begins. When the reviewer flags issues, the developer revises the question set or accepts the issues with rationale. When the reviewer's report is clean (or accepted), the loop proceeds.

---

## Stakeholder: Everyday Developer (BUILD Pattern-Reuse Engagement, Cycle 016 Extension)

**Super-Objective:** "Recognize when a working code pattern is being applied to a new context where its assumptions may not hold, and pause to evaluate the pattern's applicability before silent breakage"

### Task: Engage with the applicability check at a pattern-reuse moment

**Interaction mechanics:** The developer is in BUILD and is about to extend an existing pattern by analogy. The operative trigger that fires the applicability check is the developer's or agent's **explicit reference** to a prior pattern as the template ("we'll do this the way we did X") — this is conversational (Tier 2 per ADR-058), recognized in the build conversation. Two further triggers are documented as aspirational in v13.0 but not currently enforced (structural-similarity detection and copy-shape stewardship-flag detection) — they have no substrate in the codebase as of this writing; the methodology relies on conversational recognition until a future cycle adds the missing infrastructure. When the operative trigger fires, the agent surfaces an applicability check stewardship-checkpoint with four prompts composed against the specific pattern, original context, and new context: (1) what is one structural alternative to this pattern? (2) what's different about the new context that might make this pattern wrong? (3) which assumptions of the original context are being carried forward, and which of those hold in the new context? (4) which fitness properties does `system-design.md` declare for the affected module(s) (per ADR-076), and does the candidate pattern satisfy each? The developer answers each prompt substantively; the responses land in the build session log. When a response surfaces a genuine concern, the build pauses; the developer evaluates whether the pattern still applies, and the alternative becomes a candidate. When all responses confirm applicability with explicit reasoning, the build proceeds. When the developer cannot answer one or more prompts substantively, the agent fires the Grounding Reframe (per ADR-068) — naming the gap, offering grounding actions (consult the pattern's ADR provenance, run a spike, defer the decision). The developer's choice to proceed without resolving the gap is recorded visibly for the next susceptibility snapshot.

---

## Stakeholder: Solo Developer-Researcher (Operating Cycles Under Multi-Cycle Schema, Cycle 016 Extension)

**Super-Objective:** "Manage RDD cycles when more than one is active, paused, or pre-migration — without hook-cascade friction during in-progress gates and without losing enforcement guarantees for cycles that should have them"

### Task: Spawn a mini-cycle from within an active outer cycle

**Interaction mechanics:** The developer is in an active cycle (e.g., a standard full-pipeline) and needs to spawn a mini-cycle for a scoped piece of work (e.g., a methodology amendment, a side investigation). Per ADR-078, the developer adds a new entry to `cycle-status.md`'s `## Cycle Stack` section as `### Active: <new-cycle-title>` at the top, with `**Cycle type:** mini-cycle` and `**Parent cycle:** <outer-cycle-number>`. The outer cycle's entry is updated to `### Paused: <outer-title>` with `**Paused:** <date> — spawned <new-cycle-title>` and `**Phase at pause:** <phase>`. The default coupling policy is `pause-parent`; no field is required for the default. When the mini-cycle completes, the developer removes the mini-cycle's entry; the outer entry's `**Paused:**` line is removed and the outer becomes the top of stack at the recorded `**Phase at pause:**` value.

### Task: Spawn a continue-parent side-cycle with explicit rationale

**Interaction mechanics:** The developer wants to run a brief side-cycle that should not pause the outer (e.g., `/rdd-conform` audit during an active build). Per ADR-078, the developer adds the side-cycle entry with `**Pause-on-spawn policy:** continue-parent` and a required `**Continue-parent rationale:** <one-line justification>`. The Stop hook reads only the top entry, which means the outer cycle's enforcement is suspended for the duration of the side-cycle — the rationale field makes the suspension a deliberate, auditable choice. Without the rationale field, the absence is treated as a missing-deliberation signal.

### Task: Set the in-progress gate field at the start of an AID gate conversation

**Interaction mechanics:** The orchestrator (acting on behalf of the developer) emits "Before we move on — reflection time." at a phase-boundary AID gate. Per ADR-079, the orchestrator updates `cycle-status.md`'s top entry with `**In-progress gate:** <phase-from> → <phase-to>` before the first agent turn of the gate conversation. While the field is set, Stop events return `allow` for the gate-reflection-note check (preventing the cascade-block failure mode demonstrated in Cycle 015) — other source-phase manifest checks continue to run, and the compound check continues for any specialist dispatches that fired during the gate. When the gate completes and the gate-reflection note is written (per ADR-066), the orchestrator clears the field. The developer is free to step away mid-gate; the field's persistence in `cycle-status.md` survives across sessions.

### Task: Encounter advisory mode for a manifest entry skipped by precondition

**Interaction mechanics:** The developer is running a mini-cycle (scoped DECIDE+BUILD, no RESEARCH). When the Stop hook fires, manifest entries that depend on RESEARCH artifacts (e.g., the research-essay citation-audit entry) carry an `applicable_when: [cycle_type_in: [standard, batch]]` precondition (per ADR-080). The hook evaluates the precondition, finds the active cycle's `**Cycle type:** mini-cycle` does not match, and skips the check with `onFail: CONTINUE` semantics — recording `skipped: applicable_when condition cycle_type_in not met` in the dispatch log. The developer sees no friction from checks that legitimately do not apply; the dispatch log records the skip for audit transparency.

### Task: Encounter grandfathered enforcement on a pre-ADR-072 cycle

**Interaction mechanics:** The developer resumes an old cycle (e.g., Cycle 8 rdd-pair, paused at MODEL pre-hooks) whose `cycle-status.md` lacks the cycle-shape fields. Per ADR-081, the Stop hook detects the legacy format and applies grandfathered enforcement — the manifest checks run in advisory mode for that cycle, regardless of the corpus-level `.migration-version` state. The developer sees an advisory notice naming the grandfathered status. The developer chooses when to migrate: running `/rdd-conform` cycle-shape audit walks the developer through populating fields matching the cycle's actual state, preserving the existing prose body verbatim. After migration, the cycle resumes under enforcement on the next session. Cycle 8 is the validation case.

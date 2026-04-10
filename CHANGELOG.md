# Changelog

## v0.7.0

Structural enforcement for Invariant 8 — mechanism execution must be structurally anchored.

### Cycle 10: Specification-Execution Gap (WP-A through WP-D)

- **Per-Phase Manifest (NEW)** — YAML manifest at `hooks/manifests/tier1-phase-manifest.yaml` declares required Tier 1 artifacts per phase with canonical paths, size floors, required headers/fields, and audited document references; consumed by the Stop hook for verification; format version 1 with `{cycle}` and `{phase}` token substitution (ADR-063)
- **Compound Check hooks (NEW)** — two hooks implementing the Harness Layer: PostToolUse hook logs every Tier 1 subagent dispatch to `docs/housekeeping/dispatch-log.jsonl` with mechanism, path, and timestamp; Stop hook cross-references dispatch log against manifest to catch State B (missing artifact), State C (fabricated audit), and subagent failure; four distinct failure-mode reasons in block messages (ADR-064)
- **Advisory/enforcement mode split** — Stop hook detects `docs/housekeeping/.migration-version` marker; pre-migration corpora run in advisory mode (non-blocking stderr notice, once per session); migrated corpora run enforcement mode with compound check blocking; Fails-Safe-to-Allow with GitHub issue template surfacing on hook-script errors (ADR-064)
- **Revision-aware re-audit reminder** — Stop hook compares audited document mtime against dispatch log timestamps; fires non-blocking model-visible reminder when documents modified after last audit dispatch; substantiality judgment remains human (ADR-064)
- **Per-phase susceptibility snapshot dispatch** — all 8 phase skills gain a "Phase Boundary: Susceptibility Snapshot Dispatch" subsection at the bottom-third position with phase-specific briefs grounded in Cycle 10 findings; replaces orchestrator-centralized dispatch instruction; the primary fix for the 0% historical coverage gap (ADR-065)
- **Canonical `Output path:` lines** — all Tier 1 dispatch prompts in research, decide, and synthesize skills updated with regex-parseable `Output path:` lines; the skill-hook contract enabling PostToolUse extraction (ADR-065)
- **Gate reflection note protocol (NEW)** — AID cycle at phase boundaries graduated from conversational to artifact-producing; gate reflection note written to `docs/housekeeping/gates/{cycle}-{phase}-gate.md` with required structure (belief-mapping question, user response, pedagogical move, commitment gating outputs); AID Interpret privacy preserved across media; 6 gated phases (play/synthesize exempt per ADR-016/038); manifest entries enforce note existence (ADR-066)
- **Compound defense documented** — three components at phase boundaries covering non-overlapping failure modes: manifest check (structural floor), susceptibility snapshot (content ceiling), belief-mapping (pre-artifact zone); count-extensible pattern; reframe-derailed gate limitation named as load-bearing (ADR-066)
- **Three-Tier Enforcement Classification** — methodology-level taxonomy with four-step decision procedure: Skill-Structure Layer (step-anchorable) → Harness Layer (hook-verifiable) → User-Tooling Layer (artifact-producible) → step 4 (cannot be Tier 1); not a priority hierarchy; mechanisms may use multiple substrates (ADR-067)
- **Grounding Reframe Extension** — protocol now fires on two triggers: unassessable sycophancy risk (ADR-059 original) and significant snapshot finding with in-cycle course-correction implications; three significance properties (specificity, actionability, in-cycle applicability); routing between feed-forward and Reframe (ADR-068)
- **Methodology Scope-of-Claim** — positive scope (competent first-order analysis, Tier 1 structural resistance, conversational mechanisms, compound defense, provenance via architectural drivers) and negative scope (agent does not independently generate second-order critique; "independent" is load-bearing; guarantee rests on mechanisms firing); advisory-mode enforcement-conditional noted (ADR-069)
- **Centered-vs-Infrastructure framing** — centered artifacts (essays, ADRs, system-design) vs. infrastructure artifacts (audit reports, dispatch log, cycle-status, gate notes); `docs/housekeeping/` groups infrastructure; corpus-visible, not hidden (ADR-064)
- **8 phase-specific snapshot briefs** in system design Appendix A, each grounded in concrete Cycle 10 findings
- **8 new ADRs** (063-070), **~45 new scenarios** (2341-2739), **Essay 014** (Specification-Execution Gap), **Invariant 8** added at MODEL, **domain model Amendment 17**

### Cycle 10 research artifacts
- **Essay 014** — "The Specification-Execution Gap in Prompt-Based Methodology" (citation-audited, argument-audited, framing-audited)
- **4 spike reports** — hook feasibility (S1), acceptance criteria with reference Stop hook (S2), corpus base-rate audit (S3), text hardening negative result (S4)
- **2 literature reviews** — instruction-following degradation, telemetry acceptance criteria
- **5 susceptibility snapshots** — one per phase boundary through ARCHITECT, all ceremonial under Invariant 8's own diagnostic

## v0.6.3

- **AID Interpret step is now strictly private** — the AID cycle was designed with Attend and Interpret as private calibration steps (the agent reads engagement signals, forms a hypothesis, adjusts its response) but skill text was narrating interpretations back to the user ("You asked about X", "You engaged with Y") as preambles to probes. This is content-level sycophancy dressed as observation — the user already knows how engaged they've been, so telling them is praise-as-observation, functionally identical to "Great question!" It also corrupts the AID architecture by leaking private calibration into the user-facing conversation, creating conformity pressure. Updated orchestrator AID protocol and all six phase skill gate sections. Probes and challenges now reference specific artifact content directly ("The essay's conclusion on X rests on Y", "ADR-NNN trades A against B") rather than characterizing the user's prior engagement. Explicit anti-pattern note added to the orchestrator's Anti-sycophancy step and Decide step preamble.

## v0.6.2

- **Re-audit after revision is mandatory** — any revision of an artifact (essay, ADRs, outline) made in response to audit findings now triggers a fresh argument auditor dispatch before the pipeline advances. The prior instruction was buried inside a conditional paragraph ("if substantial...then re-dispatch") which gave the agent wiggle room to skip the re-audit. Revisions can introduce new logical gaps, overreach, or framing issues — the re-audit catches these. The loop runs as many times as needed: audit → revise → audit → ... → clean audit. Applied to research, decide, and synthesize skills.

## v0.6.1

- **Framing audit findings surfaced to user** — the argument auditor's two sections are now handled differently: argument audit issues (logical gaps, overreaching claims) are auto-corrected by the agent, but framing audit findings (alternative framings, absent truths, content selection choices) are surfaced to the user at the gate for their judgment. Auto-correcting framing choices would be the exact content selection mechanism the research identified as where sycophancy operates. Updated in research, decide, and synthesize skills.

## v0.6.0

Sycophancy resistance as structural architecture — not just conversational discipline.

### Cycle 9: Sycophancy Resistance Architecture
- **Research Methods Reviewer agent (NEW)** — specialist subagent that reviews research design before execution; applies belief-mapping to each question ("what would the researcher need to believe for a different question to be more productive?"); flags embedded conclusions and premature narrowing; Tier 1 unconditional — fires before every research loop
- **Susceptibility Snapshot Evaluator agent (NEW)** — specialist subagent that evaluates sycophancy susceptibility signals in isolated context at phase boundaries; produces advisory snapshot with signal assessment, pattern interpretation, and Grounding Reframe recommendation; exploits the Self-Correction Blind Spot (fresh context treats prior output as external input)
- **Argument Auditor framing extension** — now produces two-section output: argument audit (logical structure) + framing audit (content selection visibility); three structural questions surface alternative framings, absent truths, and dominant framing inversion; reads source material alongside the artifact; Tier 1 unconditional
- **Question Toolkit** — six research-grounded question forms (belief-mapping, pre-mortem, warrant elicitation, rebuttal elicitation, commitment gating, open-question reframing) with goal-first composition: determine epistemic goal → review context → select type → compose; non-formulaic requirement is a hard constraint
- **Two-Tier Sycophancy Resistance** — Tier 1 unconditional architectural mechanisms (subagent audits, susceptibility snapshots, research methods review) fire regardless of context; Tier 2 context-responsive conversational mechanisms (question forms, constraint intensity, assertion-aware observation) adapt to engagement quality; the agent cannot self-exempt from Tier 1
- **Grounding Reframe** — when sycophancy risk is unassessable, the agent names what is uncertain, offers concrete grounding actions, and makes visible what the user would be building on without grounding; not a disclaimer — an actionable fork
- **Belief-mapping as Inversion Principle form** — replaces adversarial framing as the default; "what would you need to believe for the alternative to be right?" achieves near-zero preference-driven divergence vs. adversarial framing's 2-6× overcorrection (spike evidence, Essay 013)
- **AID susceptibility extension** — Attend phase reads susceptibility signals (assertion density, narrowing, framing adoption, confidence markers, declining alternative engagement) alongside engagement signals; signals recorded for isolated Susceptibility Snapshot evaluation, not evaluated inline
- **Assertion-aware observation** — semantic detection of embedded conclusions at artifact-production moments; deploys open-question reframing; Tier 2 (agent exercises judgment); accepted limitation: no Architectural Isolation
- **Essay-as-checkpoint** — every substantial change (framing audit, discovery feedback, reflection) circles back to essay revision before the pipeline advances past RESEARCH; the research phase's iterability is its structural advantage
- **8 specialist subagents** (was 6), **62 ADRs** (was 54), **~325 scenarios** (was ~280), **13 essays** (was 11)

### Cycle 8: Pair-RDD (research artifacts)
- **Essay 012** — "Trading Fours" — Pair-RDD research (citation-audited, argument-audited); paused at MODEL boundary
- **Product discovery updated** — pair-RDD stakeholder additions

## v0.5.0

AI in the loop — not human in the loop. Composable skill family for everyday building.

### Cycle 7: Composable Skill Family
- **`/rdd-debug` skill (NEW)** — hypothesis-trace-understand-fix cycle; names the misunderstanding before fixing; standalone or seamless mode shift from build
- **`/rdd-refactor` skill (NEW)** — Three-Level Refactor (smells → patterns → methodology) with AI Smell Taxonomy (novel/exacerbated/accelerated tiers); AI hygiene prompts for novel patterns separate from diagnostic detection; standalone or mode shift from build
- **`/rdd-build` rewritten** — outer loop of the composable skill family; context-reconstructive mode (orientation from tickets, codebase, breadcrumbs — no RDD corpus required); work decomposition with heuristic dependency classification; session artifacts (`session/` directory); time budget mechanism (deep/standard/focused); seamless mode shifts to debug, refactor, and review
- **Context Gathering protocol** — shared five-step orientation protocol (detect mode, prompt for breadcrumbs, fetch, synthesize, validate) defined in orchestrator, implemented by all four composable skills with per-skill adaptation
- **Mode-shift composition** — build composes debug/refactor/review as seamless lens changes, not dispatched sub-workflows; skill boundaries invisible inside the build flow; the developer stays in the thread of understanding
- **"AI in the loop" framing** — RDD inverts the "human in the loop" model; the human builds understanding, the AI is in their loop serving that journey
- **"Reflection-driven development"** — the "research" in RDD is not just upfront investigation but the ongoing practice of reflecting, looping back, and capturing what the practitioner thinks
- **`/rdd-review` updated** — MODE SHIFT FROM BUILD section; Context Gathering protocol reference; ADR-054 supersedes ADR-046 callout model
- **`/rdd-about` updated** — composable skill family overview; AI in the loop and reflection-driven framing
- **Essay 011** — "Building with Understanding: Context-Reconstructive Development as Epistemic Practice" (citation-audited, argument-audited); AI Smell Taxonomy (three tiers), productive resistance framework, five orientation questions, composable skill architecture
- **15 skills** (was 13), **54 ADRs** (was 47), **~280 scenarios** (was 288), **11 essays** (was 10)

## v0.4.2

Continued `/rdd-review` refinements from real-world use.

- **Changeset tree view** — orientation starts with a structural tree of changed files; adapts to scale (individual files for small changes, directory-level summary with cluster highlighting for 20+ files, expand on demand)
- **Codebase context in walkthrough** — each walkthrough item locates code in the repo structure (file path, neighboring files, module ownership, call relationships); the reviewer leaves knowing more about the codebase, not just the diff
- **Existing MR comments** — fetches other reviewers' comments as part of context-gathering; summarizes what's been raised, resolved, and left open so the reviewer builds on existing discussion

## v0.4.1

Post-release refinements to `/rdd-review` based on first real-world use.

- **Facilitated walkthrough** — for large changes, the skill walks through each key area one at a time with real code examples, allowing discussion and comprehension before moving on
- **Persistent review notes** — accumulates the reviewer's observations in a structured file across sessions; reviewer chooses location (RDD corpus or custom path)
- **Articulation step** — after walkthrough, presents notes back one at a time; reviewer phrases each MR comment in their own words; offers closing summary draft for reviewer to edit and own
- **No auto-formatting** — comments never get machine-generated labels (NIT:, SUGGESTION:, etc.); the reviewer's voice stays human

## v0.4.0

Code review as epistemic practice.

### Cycle 6: Code Review Utility Skill
- **`/rdd-review` utility skill** — scaffolds reviewer understanding of code changes through question-driven orientation; two operating modes (corpus-grounded within RDD artifact trail, context-reconstructive for standalone MR review); three-tier output (mechanical findings, observation→question, pure questions); test quality evaluation with mutation testing lens; time-budget adaptation (zone of proximal development)
- **Questions, not findings** — the skill produces questions that guide the reviewer's thinking rather than findings that tell them what to think; no merge verdicts, no severity ratings, no AI-authored review comments; the review belongs to the human
- **Build stewardship integration** — build skill stewardship section includes callout to invoke `/rdd-review` for epistemic review of work packages, complementing architectural conformance checks
- **Context-reconstructive mode (RDD-lite)** — for reviewing colleagues' MRs outside an RDD corpus; collaborative context-gathering (reviewer provides breadcrumbs, agent fetches and synthesizes); graceful degradation when tools are unavailable
- **Anti-patterns named** — reviewer-as-passthrough, reverse centaur, accountability asymmetry, deskilling spiral, guardrails paradox; the skill exists to counter these
- **Essay 010** — "Code Review as Epistemic Practice" (citation-audited, argument-audited); grounded in Bacchelli & Bird (ICSE 2013), CRDM model (2025), Google engineering practices, SmartBear/Cisco study
- **13 skills** (was 12), **47 ADRs** (was 42), **288 scenarios** (was 248), **10 essays** (was 9)

## v0.3.1

- **Hooks format migration** — converted `hooks.json` from flat array to record format required by current Claude Code plugin schema

## v0.3.0

Adaptive gates, play phase, and self-explanation. Two RDD cycles shipped in this release.

### Cycle 4: Play and Interaction Specification
- **Play phase** — post-build experiential discovery through stakeholder inhabitation with agent-as-gamemaster facilitation; three movements (inhabit → explore → reflect); produces field notes (#4)
- **Interaction specifications** — workflow-level specs derived from product discovery stakeholder models, filling the gap between scenarios and implementation; creates the playable surface (#7)
- **Gamemaster role** — agent actively facilitates play sessions: proposes stakeholder roles, introduces complications and inversions, shapes attention without directing outcomes
- **Graduate skill** — extracted from conform as standalone `/rdd-graduate` skill
- **Cycle status tracking** — orchestrator maintains `cycle-status.md` for cross-session state persistence
- **Field notes** — play's artifact; observational discovery records categorized by feedback destination, paired with the field guide (map/journal)

### Cycle 5: Adaptive Epistemic Gates
- **Attend-Interpret-Decide cycle** — gates read engagement signals from the conversation, form a hypothesis about user understanding, and select a pedagogical move (challenge, probe, teach, clarify, re-anchor) — replacing fixed-template prompts across all 6 phase skills
- **"Reflection time" naming** — user-facing gates are "reflection time"; "epistemic gate" stays in research/design vocabulary; dual-register convention
- **`/rdd-about` utility skill** — reports plugin version, checks GitHub for updates, provides adaptive methodology overview for new users
- **Invariant 4 amended** — "must be productive, not merely brief" replaces "5-10 minutes per gate"; constraint is on waste, not duration
- **Anti-sycophancy at gates** — agent resists praise, builds on responses, challenges deeply engaged users rather than validating them
- **Manifesto updated** — reflection time as invitation to inquiry; method-vs-implementation distinction; question-asking process; Principle 6 rewritten
- **11 skills** (was 10), **42 ADRs** (was 39), **248 scenarios** (was 228), **9 essays** (was 8)

## v0.2.0

Coverage, scoping, and session resilience improvements across the pipeline.

- **Artifact location discovery** — orchestrator and research skill scan for existing artifacts before asking where to put them (#1)
- **Audit paths co-located with essays** — audit output moved from `docs/audits/` to `docs/essays/audits/` (#2)
- **Undecided territory detection** — build phase checks scenario-ADR coverage before starting, recognizes in-flight decision gaps, and verifies decision coverage at stewardship checkpoints (#3)
- **Scenario-to-module coverage check** — architect skill verifies work packages span all modules their claimed scenarios require (#5)
- **Solution scoping in discover gate** — agent proposes a solution shape, user reflects on completeness; feeds decide with full scope reference (#6)
- **Session management in build** — guidance for scoping sessions to one WP, re-reading artifacts on resume, recognizing context-loss drift (#6)
- **Orchestrator discoverable** — removed `disable-model-invocation` so the orchestrator can be suggested and can drive the pipeline

## v0.1.0

Initial release. RDD as a Claude Code plugin.

- **9 skills**: research, discover, model, decide, architect, build, synthesize, conform, and the orchestrator
- **6 agents**: citation-auditor, argument-auditor, lit-reviewer, spike-runner, conformance-scanner, orientation-writer
- **5 hooks**: invariant reminder, epistemic gate, skill activator, orientation trigger, sizing check
- **Self-referential artifact corpus**: 7 essays, 36 ADRs, 192 scenarios, domain model, system design, product discovery
- **Manifesto**: GitHub Pages site at nrgforge.github.io/rdd

# Changelog

## v0.7.3

Cycle 15: Lifecycle Composition in Build Stewardship. Mini-cycle (DECIDE + BUILD only) adding a third integration-risk category to `/rdd-build` and, mid-cycle, cycle-shape declaration fields in `cycle-status.md` honored by the Stop hook in response to a live hook-loop that surfaced during the DECIDE gate itself.

### Lifecycle Composition in build stewardship (ADR-071)

- **COMPOSABLE TESTS §Lifecycle Composition (NEW)** — a third case alongside The N × M Problem, naming shared mutable state as an independent axis. When components share mutable state — cached buffers, pooled connections, retained registry entries, or any returned reference that aliases internal state — the integration test must exercise the production lifecycle sequence, not just individual operations. If component A hands a resource to B and B mutates or disposes it, the test must verify A's retained reference survives B's actions (ADR-071)
- **Step 5 Integration Verification — lifecycle-sequence guidance (NEW)** — an explicit paragraph specifying the ordered sequence (caller obtains → mutates/disposes → original component's retained reference re-read to verify invariants) with cross-reference to the design-time framing
- **Stewardship Tier 1 Test quality sub-item 6e Shared mutable state (NEW)** — adjacent to Boundary coverage and Wiring verification; the review-time detection check that fires when a module boundary crossed in the scenario group involves a returned value aliasing internal state
- **Three-sided catch** — the three anchors (design-time prompt, verification-time anchor, review-time detector) form a three-sided catch; developers land on the anchor relevant to their current task; cross-references between all three
- **Three glossary entries added** — Lifecycle Composition (the category), Shared Mutable State (the bug class), Lifecycle Boundary (the boundary class distinguished from type and structural boundaries)
- **Scoped to build skill only** — debug, refactor, review skills unchanged; the category composes with them via ADR-048 mode shifts

### Cycle-shape declaration (ADR-072)

- **`**Skipped phases:**` optional header field (NEW)** — enumerated phases this cycle does not run, canonical lowercase (`research`, `discover`, `model`, `architect`, `play`, `synthesize`), comma-separated; absent = standard full-pipeline cycle; present = Stop hook treats enumerated phases as having no required artifacts
- **`**Paused:**` optional header field (NEW)** — declares the cycle deliberately dormant (format: `YYYY-MM-DD — reason`); Stop hook short-circuits all per-phase manifest checks and emits a one-time advisory notice per session via `/tmp/rdd-pause-notice-${SESSION_ID}` (distinct marker from `/tmp/rdd-advisory-${SESSION_ID}` so the two don't collide)
- **Pause Log section (NEW)** — audit trail of pause/resume events preserving Invariant 8 observability; appears only when the cycle has been paused at least once
- **Stop hook honors both fields** — `hooks/scripts/tier1-phase-manifest-check.sh` gains Paused short-circuit and Skipped phases short-circuit branches; SESSION_ID extraction hoisted out of the advisory-mode block so both notice types can share it; phase names canonicalize to lowercase for case-insensitive matching
- **Cycle Status template in orchestrator skill** — `skills/rdd/SKILL.md` documents the two fields and the Pause Log convention with explanatory prose wiring ADR-064 and ADR-072
- **Known gap documented and deferred** — in-progress-gate case (no `cycle-status.md` field can be set before Stop fires between agent turns during an active gate conversation); documented in three locations (scenarios.md deferred scenario, ADR-072 Consequences Negative, cycle-status.md Deferred Work); [Issue #14](https://github.com/nrgforge/rdd/issues/14) captures the six-question follow-up cycle brief (multi-cycle composition as first-class methodology concept)
- **Latent PostToolUse hook defect surfaced** — dispatch logger regex only matches canonical plain-text `Output path: <path>` lines, fails on markdown-bolded or backticked variants; produces `expected_path: null` and triggers compound-check fabrication suspicion even for legitimate dispatches; [Issue #15](https://github.com/nrgforge/rdd/issues/15) scoped as a separate fix

### Methodological dog-food

- **The failure mode ADR-072 addresses manifested live during the cycle** — the Stop hook cascaded blocks twice during the DECIDE → BUILD gate itself, because the single-cycle `cycle-status.md` model had no structural representation of an in-progress mini-cycle gate conversation. ADR-072 was drafted and landed in response to this live evidence
- **BUILD-entry susceptibility snapshot caught the ADR-072 gap** the in-conversation agent had drifted past (Tier 1 Architectural Isolation from Cycle 9 firing on its own evidence within a cycle about extending the catchment); recommended writing one failing-case scenario to pin down the gap, which was executed
- **Three BUILD-phase snapshot files preserved** — `.pre-implementation.md` (BUILD-entry, evaluated the design before implementation), `.pre-canonical-format.md` (first BUILD-exit attempt, archived because its dispatch prompt used non-canonical formatting that the PostToolUse regex did not match), and the canonical `susceptibility-snapshot-015-build.md` (re-dispatched with canonical prompt formatting). Preservation pattern matches the Cycle 10 WP-F precedent for artifact/log provenance gaps discovered at enforcement boundaries

### Cycle 15 closure

- **2 new ADRs** (071, 072), **15 active scenarios** satisfied (1 deferred as known gap)
- **Seven argument-audit passes** on DECIDE artifacts (clean on pass 7)
- **Mini-cycle scope** — RESEARCH / DISCOVER / MODEL / ARCHITECT skipped by explicit scoping per ADR-072's `**Skipped phases:**` mechanism; Cycle 015 is the first cycle to use the mechanism it defined (the declaration was added to Cycle 015's own `cycle-status.md` as a permanent live smoke test during WP-E)

## v0.7.2

Cycle 10 WP-F verification-surfaced remediation. Nine latent defects in the v0.7.0/v0.7.1 hook infrastructure caught by the methodology running against its own corpus in enforcement mode. All fixes land in this release. Invariant 8's compound defense is now operational end-to-end on any corpus that runs the plugin.

### Hook infrastructure fixes

- **All RDD hook scripts now read input from stdin**, not `$1`. Since v0.6.0, every input-dependent hook (`invariant-reminder.sh`, `orientation-trigger.sh`, `sizing-check.sh`, `epistemic-gate.sh`, `tier1-verify-dispatch.sh`) has been silently non-functional in Claude Code's actual runtime because `hooks.json` passed input via `$INPUT` (expected as a shell variable) while Claude Code delivers the JSON payload via stdin. Synthetic tests masked the divergence by invoking scripts directly with `$1`. Only `tier1-phase-manifest-check.sh` worked by accident — it reads `cycle-status.md` from disk and falls through on empty input — and that accidental functionality was precisely what caught the gap during WP-F. `hooks.json` drops the `"$INPUT"` argument from every command; scripts read stdin when `$1` is empty and stdin is not a terminal (backward compatible with direct invocation for test harnesses)
- **PostToolUse Tier 1 hook strips plugin namespace prefix** before matching against `TIER1_MECHANISMS`. Claude Code dispatches plugin-provided subagents with the `<plugin>:<name>` form (e.g., `rdd:susceptibility-snapshot-evaluator`), but the mechanism list used bare names. Every prefixed dispatch silently skipped logging, breaking the compound check's cross-reference entirely. `${SUBAGENT_TYPE#*:}` normalizes the name; the original prefixed form is preserved in the dispatch log's `subagent_type` field for forensic record
- **Stop hook schema conformance** — replaced `{"decision":"allow",...}` with plain-text stdout (advisory mode, matching the convention of the project's other stdout-based hooks) and schema-valid `{"decision":"block",...}` (enforcement mode). Claude Code's Stop hook schema only accepts `"approve" | "block"` for the `decision` field; emitting `"allow"` failed JSON validation every invocation and the advisory notice never reached the agent
- **Stop hook E1 dispatch detection is cycle-sensitive.** Matches on mechanism name AND substituted `expected_path`, mirroring the enforcement-mode compound check. Without this, prior-cycle dispatch log residue produced misleading "dispatched but no artifact" messages at the current cycle's phase boundary
- **PostToolUse hook emits JSON `null` (not string `"null"`)** for missing Output path lines. `jq --argjson` replaces `jq --arg` when the path is absent, so downstream queries like `jq '.expected_path == null'` work correctly
- **Distinguish user-tooling mechanisms from subagent dispatches.** The manifest supports a `mechanism_type: user-tooling` field for `aid-cycle-gate-reflection` entries. In enforcement mode, the compound check's dispatch-log cross-reference no longer applies to user-tooling mechanisms — gate reflection notes are produced by the orchestrator in-context, not by an isolated subagent dispatch, so they have no dispatch log entry by design. The structural floor (E1/S1/S2/S3) still applies; the Susceptibility Snapshot at the same phase boundary is the complementary content-level defense

### Migrate subcommand fixes

- **`/rdd-conform migrate` Step 6 includes `docs/system-design.md`** in its mechanical path substitution file list. The system design document contains multiple pre-migration path references (Appendix A per-phase susceptibility snapshot briefs, Test Architecture table, Integration Contracts notes) that were previously not updated by the migration operation, leaving the file in an inconsistent mix post-migration
- **`/rdd-conform migrate` Step 5 rewrites internal relative links in the moved `cycle-status.md`.** When the file moves from `docs/` to `docs/housekeeping/`, its own `./essays/...`, `./product-discovery.md`, `./domain-model.md`, `./system-design.md`, and `./roadmap.md` references need to be rewritten for the new directory depth. Order matters: `./essays/audits/` → `./audits/` must run before `./essays/` → `../essays/`

### Verification evidence

- **First live operational Tier 1 dispatch in project history.** The build-phase susceptibility snapshot fired via the ADR-065 Skill-Structure anchor without ceremonial attention, produced a substantive artifact, was logged by the PostToolUse hook, cross-referenced by the Stop hook compound check, and cleared the build phase boundary block. ARCHITECT phase open question 1 (does the per-phase dispatch actually fire under task load?) is answered empirically: **yes**, and the harness layer captures it
- **First gate reflection note.** The User-Tooling Layer graduated-artifact mechanism (ADR-066) produced its first real artifact at `docs/housekeeping/gates/014-build-gate.md` with all five required headers and four required fields, successfully satisfying the manifest check
- **Three preserved historical snapshots** at `docs/housekeeping/audits/` — `.pre-prefix-fix.md` (first live dispatch that surfaced Finding #7), `.post-prefix-pre-stdin.md` (second dispatch that surfaced Finding #9), and the canonical build snapshot (third, through the fully-fixed chain). The preservation pattern is itself a methodology commitment: Option B (preserve-and-re-dispatch) is the right remediation for artifact/log provenance gaps discovered at enforcement boundaries

### Cycle 10 full closure

- **57 scenarios verified** across two releases (44 v0.7.0 + 13 v0.7.1). All PASS
- **Nine remediation commits** during WP-F verification, each numbered in `docs/housekeeping/cycle-status.md`
- **Cycle 11 candidate research question surfaced:** *what categories of behavior are structurally unreachable by specification-conformant synthetic tests, and which warrant runtime-level testing infrastructure?* A runtime smoke test that fires an actual subagent dispatch and verifies the dispatch log is populated would have caught Findings #7 and #9 before WP-F

## v0.7.1

Housekeeping migration and post-migration path alignment.

- **`/rdd-conform migrate` subcommand (NEW)** — one-shot, opt-in operation that moves infrastructure artifacts (`docs/essays/audits/` → `docs/housekeeping/audits/`, `docs/cycle-status.md` → `docs/housekeeping/cycle-status.md`), creates `docs/housekeeping/gates/` for gate reflection notes, performs mechanical path substitutions across the corpus, writes `docs/housekeeping/.migration-version` to enable enforcement mode, and produces a rollback manifest + summary report. Idempotent, refuses uncommitted skill changes, excludes cycle-archive and centered prose (ADR-070)
- **Post-migration canonical paths** — all skill file `Output path:` lines and manifest `path_template` values updated from `docs/essays/audits/` to `docs/housekeeping/audits/`. Ships atomically with the migration tool per ADR-070's lockstep requirement. Pre-migration corpora continue to work in advisory mode
- **Stop hook dual path support** — checks both `docs/cycle-status.md` (pre-migration) and `docs/housekeeping/cycle-status.md` (post-migration) for phase and cycle detection
- **Three new `/rdd-conform` audit scopes (NEW):** housekeeping directory organization audit (detects pre-migration state, orphaned files), gate reflection note template alignment audit (ADR-066 template compliance), dispatch prompt format audit (ADR-065 canonical skeleton and position verification). All produce finding reports without auto-correcting
- **Conform skill expanded to 7 operations** (was 3): audit, remediation, drift detection + migrate, housekeeping audit, gate note audit, dispatch prompt audit

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

# Changelog

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

# Changelog

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

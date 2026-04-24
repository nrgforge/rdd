# RDD Cycle Status

## Cycle Stack

### Active: Readability & Comprehensibility

**Cycle number:** 017
**Started:** 2026-04-24
**Current phase:** RESEARCH (next)
**Cycle type:** standard
**In-progress phase:** research
**Plugin version at cycle start:** v0.8.1 (patched to v0.8.2 mid-entry — see Pause Log)

**Artifact base:** `./docs/`

## Driving Concerns

1. **Nomenclature leakage (Issue #17)** — corpus-internal vocabulary (WP-*, ADR-NNN, axis/approach labels, invariant numbers) leaking into durable code and tests. After `/rdd-graduate`, those citations become dangling references; pre-graduation they can also break under reorg or renumbering. Suggested touch-points: `rdd-build` stewardship, `rdd-graduate` pre-scan, `rdd-conform` audit.
2. **Key-doc legibility** — external feedback that a mature corpus feels like "swimming in docs." User's diagnosis: volume is not the primary defect; *organization* of human-audience artifacts is. `system-design.md` leads with a long architectural-drivers table; no 30k-foot view or orienting paragraph greets the reader. Similar concern for `product-discovery.md` and other Tier-2 docs.
3. **Folder hygiene** — relocate `housekeeping/` and session docs under `.rdd/` to (a) make process-vs-product distinction structurally visible, (b) enable straightforward VCS exclusion, (c) remove the current hierarchical equivalence with `essays/`. This reverses ADR-070's `housekeeping/` placement. Also folded into BUILD scope: fix the `dispatch-log.jsonl` misplacement bug (sometimes writes one directory up from the corpus).
4. **Verbosity** — lead with orientation + diagrams, then detail. Due-diligence on correctness and completeness is strong; readerly usability is not. "1500 words to say what could be 500 + a diagram" is the heuristic the cycle works against.
5. **Agent interaction pattern** — when multiple items need user attention in one turn (N clarifying questions + a gate response + decision context), the default "wall of text" is hostile to comprehension. Preferable pattern: a short enumeration of what needs attention, then offer to walk through one at a time.

## Unifying Frame (user-proposed, to be tested in RESEARCH)

**The corpus and the agent's turn-structure are currently optimized for production discipline; this cycle shifts the frame toward readerly and interactional usability — taking care of the user.**

To be tested at RESEARCH entry via the question-isolation protocol (ADR-082) — constraint-removal will examine whether "readability" is the right frame, whether the five threads share a mechanism, and whether something else sits beneath them (e.g., agent-vs-reader optimization, process-vs-product conflation, corpus-portability concerns).

## Phase Status

| Phase | Status | Artifact | Key Epistemic Response |
|-------|--------|----------|----------------------|
| RESEARCH | ▶ In Progress | — | — |
| DISCOVER | ☐ Pending | — | — |
| MODEL | ☐ Pending | — | — |
| DECIDE | ☐ Pending | — | — |
| ARCHITECT | ☐ Pending | — | — |
| BUILD | ☐ Pending | — | — |
| PLAY | ☐ Optional | — | — |
| SYNTHESIZE | ☐ Optional | — | — |

## Pause Log

| # | Paused | Resumed | Reason |
|---|--------|---------|--------|
| 1 | 2026-04-24 | 2026-04-24 | Stop-hook fires manifest check on every mid-phase turn-end, not just phase-exit attempts. At RESEARCH Step 1.1 (pre-dispatch, awaiting user input), every agent turn triggered the block and created a visible loop. Paused to diagnose. Fix shipped as v0.8.2: new `**In-progress phase:**` predicate short-circuits the manifest check while the field names the current phase. Cycle resumed with the new field set. |

## Feed-Forward Signals

### From Cycle 016 (Methodology Seams)

- **ADR-082 (question-isolation protocol)** shipped — apply at this cycle's RESEARCH entry. Constraint-removal against the user-proposed framing is the primary form.
- **ADR-067 (Three-Tier Enforcement Classification)** — any mechanisms proposed by this cycle must be classified (Skill-Structure / Harness / User-Tooling / best-effort Tier 2).
- **ADR-069 (Methodology Scope-of-Claim)** — scope any readability claims honestly. Readability is partly unassessable without reader feedback; the methodology provides structural aids, not guarantees of reader experience.
- **ADR-070 (housekeeping migration)** — user is reconsidering this decision. Treat as an adjustable prior; if reversed, it needs explicit supersession (ADR-074 workflow).
- **Conformance scan posture** — corpus was conformed at Cycle 016 exit; v0.8.1 was a targeted patch. Fresh conformance skipped at cycle entry by user call.

## Context for Resumption

First session. No prior resumption. Cycle begins by invoking `/rdd-research` with the driving concerns and unifying frame above.

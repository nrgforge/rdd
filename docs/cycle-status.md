# RDD Cycle Status

## Cycle Stack

### Paused: Readability & Comprehensibility

**Cycle number:** 017
**Started:** 2026-04-24
**Current phase:** RESEARCH (next)
**Cycle type:** standard
**Paused:** 2026-04-24 — session ended after mid-entry plugin patches; resuming in fresh session on v0.8.3
**Phase at pause:** research
**Plugin version at cycle start:** v0.8.1 → patched mid-entry to v0.8.2 (In-progress phase predicate) → patched again to v0.8.3 (manifest check demoted to advisory). Cycle resumes on v0.8.3.

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
| 2 | 2026-04-24 | — | Mid-entry the user observed that v0.8.2's predicate fixed the orchestrator-driven path but left standalone phase-skill invocation vulnerable to the same loop, and that the Stop-hook block was never a real wall (Claude Code feeds the reason back as next-turn context, not as a terminating signal). v0.8.3 demoted the manifest check to advisory-only across all modes; In-progress phase predicate retained as advisory-noise suppressor. Session ended to start fresh on v0.8.3 from clean context. Resume with: remove `**Paused:**` and `**Phase at pause:**` lines, rename `### Paused:` → `### Active:`, add `**In-progress phase:** research`, then proceed with RESEARCH Step 1.1. |

## Feed-Forward Signals

### From Cycle 016 (Methodology Seams)

- **ADR-082 (question-isolation protocol)** shipped — apply at this cycle's RESEARCH entry. Constraint-removal against the user-proposed framing is the primary form.
- **ADR-067 (Three-Tier Enforcement Classification)** — any mechanisms proposed by this cycle must be classified (Skill-Structure / Harness / User-Tooling / best-effort Tier 2).
- **ADR-069 (Methodology Scope-of-Claim)** — scope any readability claims honestly. Readability is partly unassessable without reader feedback; the methodology provides structural aids, not guarantees of reader experience.
- **ADR-070 (housekeeping migration)** — user is reconsidering this decision. Treat as an adjustable prior; if reversed, it needs explicit supersession (ADR-074 workflow).
- **Conformance scan posture** — corpus was conformed at Cycle 016 exit; v0.8.1 was a targeted patch. Fresh conformance skipped at cycle entry by user call.

### From this session's hotfixes (v0.8.2 + v0.8.3)

- **Methodology debt — ADR-064 / ADR-067 amendments owed.** v0.8.3 demoted the Tier 1 phase-manifest check from blocking to advisory. The prior "Harness Layer provides structural prevention" claim is now overstated. ADR-064 (compound check / Stop-hook compound verification) and ADR-067 (Three-Tier Enforcement Classification) need amendment to reflect that the Harness Layer is now advisory-with-skill-discipline, not blocking. The compound fabrication check (dispatch-log cross-reference) remains the meaningful structural defense; the hard-block claim is dropped. Per ADR-074 supersession workflow, this is an in-cycle amendment with downstream sweep. **Natural fit for Cycle 017's readability theme** — advisory-only is itself a UX/comprehensibility improvement, and honest scope-of-claim is a comprehensibility win for downstream readers.
- **Methodology debt — In-progress phase mechanism.** Introduced as load-bearing in v0.8.2; demoted to advisory-noise suppressor in v0.8.3. Worth a brief ADR or skill-text note in this cycle to document the role-shift; otherwise readers will see the field documented as if it were correctness-critical when it is now optional UX.
- **Field evidence for the cycle's "agent interaction pattern" thread.** This session is itself field evidence for thread 5 — the user experienced the loop firsthand on a legitimate cycle entry, called out that "incessant loops will turn people off" and "obscure the benefit of using subtools as a gateway to the larger framework." That observation pre-dates RESEARCH and should be carried in as concrete material for the readability essay, not rediscovered.
- **Standalone-skill invocation surface.** The bug surfaced because standalone phase-skill invocation on an existing corpus was not protected by the orchestrator's discipline. Worth examining in this cycle whether other orchestrator-set invariants similarly assume the orchestrator is present.

## Context for Resumption

**Session ended:** 2026-04-24, mid-RESEARCH Step 1.1. The user articulated five driving concerns and a unifying frame; Step 1.1's question articulation in the user's own words has not yet happened. Mid-entry the Stop-hook loop bug was diagnosed and fixed across two patch releases (v0.8.2, v0.8.3). The next session resumes on v0.8.3 with clean context.

**To resume:**
1. Remove the `**Paused:** ...` and `**Phase at pause:** research` lines from this entry's header.
2. Rename `### Paused: Readability & Comprehensibility` back to `### Active: Readability & Comprehensibility`.
3. Add `**In-progress phase:** research` to the entry header (this is the v0.8.2+ orchestrator discipline).
4. Resume RESEARCH Step 1.1: ask the user to articulate the cycle's research question(s) in their own words. Two scaffolding options were on the table at session end — (a) user writes the questions directly, (b) agent sketches a lean 3–5 question scaffold from the five threads — user had not yet chosen.
5. Constraint-removal (Step 1.2) will follow against a specific named artifact — likely candidates given the threads: `system-design.md` (verbosity / orienting paragraph thread), `housekeeping/` placement (folder hygiene thread), or the artifact corpus as a whole (swimming-in-docs thread).

**Carry-forward observations from this session that the new session must honor:**
- The user's five driving concerns and unifying frame are recorded in this file's "Driving Concerns" and "Unifying Frame" sections — the unifying frame is **user-proposed and not to be taken as given**; it is explicitly nominated for testing via constraint-removal at Step 1.2.
- The methodology debt items above (ADR-064 / ADR-067 amendments, In-progress phase role-shift documentation) should land at DECIDE inside this cycle, not deferred — they are direct outputs of this session's hotfixes and fit the readability theme.
- Per memory ("Re-audit after revision"): the research-methods-reviewer must be re-dispatched if the question set is revised after Step 1.4.

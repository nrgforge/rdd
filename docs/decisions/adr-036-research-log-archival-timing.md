# ADR-036: Research Log Archival at End of Cycle

**Status:** Proposed

## Context

The current `/rdd-research` skill archives the previous cycle's research log at the *start* of the next cycle (Step 3: "Archive previous logs. If `research-log.md` already exists from a prior research cycle, move it..."). This means the log from the most recent cycle remains as `research-log.md` until a new cycle begins — potentially indefinitely.

This creates two problems: the log's association with its corresponding essay is implicit (you must know which cycle produced it), and the archival depends on a future event that may not occur.

## Decision

Archive the research log at the *end* of the research phase, as part of the cycle that produced it — not at the start of the next cycle.

After the essay is written, citation-audited, argument-audited, the epistemic gate is passed, and reflections are recorded:
1. Move `research-log.md` to `research-logs/NNN-descriptive-name.md` matching the essay number
2. The next cycle starts with no `research-log.md`, creating a fresh one

Update the `/rdd-research` skill to perform archival after reflections (the final step of the research phase) rather than at the start of the next cycle's synthesis step.

If a `research-log.md` exists at the start of a new cycle, treat it as the prior cycle's unarchived log (likely from an interrupted session) and archive it before starting.

## Consequences

**Positive:**
- Each log is archived with its essay, making the association explicit
- Archival happens deterministically at cycle end, not contingently at next cycle start
- Clean state for the next cycle — no leftover log

**Negative:**
- Minor process change to the research skill

**Neutral:**
- Existing archived logs are not affected

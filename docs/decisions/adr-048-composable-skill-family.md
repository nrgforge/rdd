# ADR-048: Composable Skill Family Replaces Monolithic Build

**Status:** Proposed

## Context

The current `/rdd-build` skill is monolithic: it handles the entire build phase, requires the full artifact corpus, and treats debugging and refactoring as inline activities rather than first-class epistemic acts. Essay 011 ("Building with Understanding") establishes three findings that motivate decomposition:

1. **Debugging forces the deepest mental model construction** (Anthropic data: 17% comprehension gap; Weimer et al. neurally-grounded model). Treating it as an error-handling mode buries the most potent learning activity inside a procedural step.

2. **Avoidance of Refactors is the defining AI smell** (Ox Security 80-90% prevalence; GitClear refactoring 25%→<10%). The refactor step is the human counterforce the model never provides. It needs its own diagnostic vocabulary (the three-level refactor: smells → patterns → methodology) and standalone capability.

3. **Most codebases lack an RDD artifact corpus.** The current build skill's pipeline mode cannot serve the Everyday Developer stakeholder (product discovery, Cycle 6) — it requires the full artifact corpus to function. A composable architecture with context-reconstructive mode makes epistemic building practices available without a six-phase pipeline.

The review skill (`/rdd-review`, ADR-043 through ADR-047) demonstrates the two-mode pattern (corpus-grounded and context-reconstructive) and standalone utility. The composition trigger semantics proposed here — where build invokes inner skills with context inheritance — are new and extend beyond what the review skill currently implements (see ADR-054).

## Decision

Decompose the monolithic build skill into four composable skills sharing a Context Gathering foundation:

- **`/rdd-build`** — the outer build loop: work decomposition, TDD (red → green → refactor), stewardship checkpoints, integration verification. Composes the other three skills through explicit trigger conditions (see ADR-054).
- **`/rdd-debug`** — hypothesis-trace-understand-fix cycle. Standalone or invoked by build on unexpected failures.
- **`/rdd-refactor`** — three-level diagnostic-remediation cycle (smells → patterns → methodology). Standalone or invoked by build after green and at stewardship.
- **`/rdd-review`** — already exists. Standalone or invoked by build at stewardship checkpoints.

Each skill operates in both pipeline mode (full artifact corpus) and context-reconstructive mode (orientation from heterogeneous sources). Each can be used standalone or composed within a build cycle.

**Rejected alternative:** Keep the monolithic build skill and add debug/refactor as optional modes within it. Rejected because: (1) modes within a single skill cannot be invoked standalone — the Everyday Developer needs `/rdd-debug` without entering a build cycle; (2) the review skill's success as a standalone tool demonstrates the value of the composable pattern; (3) a monolithic skill file would exceed document sizing heuristics.

**Rejected alternative:** Create debug and refactor skills but keep them independent of build (no composition). Rejected because: the build cycle's TDD rhythm naturally invokes debugging (unexpected failures) and refactoring (after green) — composition is the natural workflow, not an optional integration.

## Consequences

**Positive:**
- Each epistemic activity (building, debugging, refactoring, reviewing) has its own skill with appropriate depth
- The Everyday Developer can use any skill standalone without the full pipeline
- Build composes naturally with the inner skills through well-defined triggers
- Context-reconstructive mode makes all four skills usable on any codebase

**Negative:**
- Four skills to maintain instead of one — skill file evolution must remain coordinated
- The shared Context Gathering protocol must be kept consistent across skills (see ADR-049)
- Composition adds complexity to the build loop (see ADR-054 for trigger conditions)

**Neutral:**
- The existing `/rdd-review` skill is unchanged — it becomes a member of a family rather than a standalone exception

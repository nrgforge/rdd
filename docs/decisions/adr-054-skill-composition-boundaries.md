# ADR-054: Skill Composition Boundaries Within Build

**Status:** Proposed

## Context

ADR-048 decomposes the build phase into four composable skills. The build skill is the outer loop; debug, refactor, and review are inner skills invoked during the build cycle. The boundaries between skills — what triggers each, what context they inherit, and how control returns — must be explicit enough for implementation.

Essay 011 §6 describes the composition: "Build composes the other skills: when a bug is encountered, it invokes the debug skill's hypothesis-trace-understand-fix cycle. When the refactor step identifies smells, it invokes the refactor skill's diagnostic-remediation cycle. When a stewardship checkpoint warrants deeper review, it invokes the review skill's orientation-questions cycle."

ADR-046 defined the review skill's build integration as a "callout" — the build skill suggests review, and the user chooses to invoke it. That model predates the composable skill family. This ADR supersedes ADR-046's integration mechanics with a richer composition model while preserving the review skill's standalone utility character (ADR-043).

## Decision

Build composes the other skills as **seamless mode shifts**, not as dispatched sub-workflows. The developer should not perceive skill boundaries during composition — the thread is understanding, and the mode shifts serve that thread. Architecturally, the skills are separate implementations sharing context. Experientially, the transitions are the build skill changing its lens.

### Mode Shift: Debugging

**Trigger:** An unexpected failure occurs — a test fails for reasons that do not match the current red-phase expectation, runtime behavior diverges from the orientation's predicted behavior, or the developer encounters a bug in existing code that blocks their work.

**What "unexpected" means:** During the red phase, a failing test is expected — that is not a debug trigger. A debug trigger occurs when:
- A test fails with an error unrelated to the behavior being specified
- A previously passing test breaks after a green-phase change
- The system's behavior diverges from what the orientation summary predicted
- The developer explicitly says they need to understand why something is failing

**Context continuity:** The debug mode inherits the build session's orientation (the validated answers to the Orientation Questions) and the current work package. No re-orientation occurs. The conversation continues without interruption.

**Resolution:** When the bug is understood and fixed (with a test encoding the corrected understanding), the build flow resumes at the point where the trigger occurred.

### Mode Shift: Refactoring

**Trigger:** After the green phase (test passes), the developer or agent identifies smells at any of the Three-Level Refactor's levels. Also triggered by stewardship when architectural drift is detected.

**Specific triggers:**
- Level 1 (Smells): the agent or developer notices a classical or AI-specific smell in the code just written or modified
- Level 2 (Patterns): a smell is identified and the appropriate refactoring technique is selected
- Level 3 (Methodology): stewardship detects that code landed in the wrong module, violated dependency rules, or used inconsistent vocabulary
- Stewardship checkpoint: a broader structural assessment is warranted

**Context continuity:** The refactoring mode inherits the build session's orientation, the current work package, and the architectural intent (from system design in pipeline mode, or from the orientation summary in context-reconstructive mode).

**Resolution:** When the refactoring is complete and tests still pass, the build flow resumes. The refactoring is committed as a `refactor:` commit (structure change, separate from behavior).

### Mode Shift: Review

**Trigger:** At stewardship checkpoints — natural scenario group boundaries or work package completion. Also available on-demand when the developer wants to verify their understanding before proceeding. This supersedes ADR-046's callout model: what was a suggestion to invoke a separate skill is now a seamless shift within the build flow.

**What stewardship checks:**
- Does the code implement the work package's testable behaviors?
- Does the architecture match the orientation's scope and integration points?
- Is the domain vocabulary used consistently?
- Are there integration concerns that unit tests cannot catch?

**Context continuity:** The review mode enters corpus-grounded mode (in pipeline mode) or inherits the build session's orientation (in context-reconstructive mode). No re-orientation occurs.

**Resolution:** When the review produces questions and the developer has engaged with them, the build flow resumes. The developer may shift into debug, refactor, or proceed based on what the review surfaced.

### Standalone Invocation

Any skill can be invoked standalone (outside the build flow) as a real entry point: `/rdd-debug` on a production bug, `/rdd-refactor` on a code area that needs cleanup, `/rdd-review` on a colleague's MR. In standalone mode, the skill runs its own Context Gathering protocol — it does not assume a build session exists. Skill boundaries are visible and meaningful in standalone mode; they disappear inside build.

**Rejected alternative:** Fully separate dispatch where build explicitly "invokes" inner skills as sub-processes with formal handoff and return. Rejected because: the developer experiences this as process management, not scaffolding. The skill boundaries are implementation details that should not surface during the build flow. The thread is understanding — interrupting it with dispatch ceremony works against the goal.

**Rejected alternative:** No separate skill implementations — build handles everything inline. Rejected because: (1) standalone invocation would require duplicating the logic; (2) the separate implementations can be tested independently; (3) the skills need their own Context Gathering when run standalone.

## Consequences

**Positive:**
- Clear trigger conditions make composition predictable and testable
- Context inheritance eliminates redundant orientation work during the build cycle
- Each inner skill maintains its full depth when invoked — the composition does not flatten the skills
- Standalone invocation preserves the Everyday Developer use case

**Negative:**
- The build skill must track which inner skill is active and manage return-to-loop transitions
- Trigger detection requires the build skill to observe test outcomes and smell indicators — adding observational responsibility
- The "unexpected failure" distinction (debug trigger) requires judgment about what "unexpected" means in the current context

**Neutral:**
- The developer can always override the build skill's composition suggestions — declining a debug invocation and handling the failure manually, or requesting a review at a non-standard checkpoint

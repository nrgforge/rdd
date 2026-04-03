# Reflections: Building with Understanding
*2026-04-02*

## "Productive Resistance" Is an Original Synthesis, Not a Literature Finding

The argument audit caught this: the essay's most valuable intellectual contribution — the unifying label "productive resistance" across Papert, Schon, Ericsson, Kirsh, and the debugging research — was initially presented as convergent literature when it is the essay's own interpretive synthesis. The five frameworks describe different phenomena (artifact-building, surprise-triggered reflection, deliberate practice at failure's edge, information-gathering actions, hypothesis-testing under uncertainty). The common frame is imposed, not discovered. The essay now owns this honestly, which makes the claim both stronger and more defensible.

## Productive Resistance Is Both Foundational and Distributed

The user's reframe: productive resistance is not either front-loaded into orientation or distributed across the cycle. It is both. The orientation gives the developer enough context to start productively. The iterative engagement (scenario-by-scenario TDD, stewardship checks, refactoring, dialog) is where understanding deepens. Without orientation, the distributed work is undirected. Without the distributed work, orientation is just a document.

The rdd-review skill already embodies this pattern: orientation first (context gathering, synthesis, validation), then facilitated point-by-point walkthrough with real code and discussion, then articulation. The build skill should follow the same shape. This is the key design principle for all four composable skills.

## The Five Questions Are Pragmatically Sufficient, Not Theoretically Complete

The five orientation questions (who/why, what, scope/integration/testability, ambiguities, demo-ability) came from the user's experience, not from a formal derivation. They represent what a practitioner needs to orient before acting — review, build, debug, or refactor. In the full RDD pipeline, these questions get deep answers (product discovery, domain model, system design, ADRs, scenarios). In context-reconstructive mode, they get adequate answers from whatever is available. The questions are the same; the depth varies. This makes the context-reconstructive mode a compression of the pipeline, not a replacement. Testing this against real tickets will reveal if the compression is lossy in ways that matter.

## The Three-Tier Smell Taxonomy Is the Essay's Sharpest Contribution

The distinction between genuinely novel (Constraint Decay, Slopsquatting, Intent Debt), exacerbated (Avoidance of Refactors, Over-Specification, Distributed Incoherence, Bugs Deja-Vu, Oracle Mirroring, Logic Drift, Comprehension Debt), and merely accelerated patterns is consequential for intervention design. Novel patterns require new practices. Exacerbated patterns require more deliberate application of known practices. Accelerated patterns just need the existing tooling to keep up with volume. Most of the ecosystem treats all AI code problems as one category.

## The User Draws the Line

Each skill in the composable family has a user-controlled calibration:
- Review: depth (how much time do you have?)
- Build: scope (what's the work package?)
- Debug: hypothesis (what's broken?)
- Refactor: standard (what does good look like?)

The context-gathering foundation serves all four. The user determines how deep to go based on the activity and the time available.

## Willison's Golden Rule Has a Scoped Exception

Willison hasn't retracted the principle for production work, but he's carved out a disclosed exception for low-stakes demonstration code (March 2026 SwiftUI apps, published with warnings). The essay's citation still holds for the argument being made — the principle of understanding before committing to production code. But the landscape is more nuanced than a simple golden rule.

## The Codebase Audit Skill Is the Diagnostic Half Without a Remediation Arm

The user's frustration with the codebase-audit skill — that it's good but not comprehensive — points to the missing link: diagnosis without remediation. The rdd-refactor skill would be the action arm, taking audit findings and driving actual refactoring with understanding. The audit's ten-lens analysis could also be applied in targeted form during build stewardship checks.

## Open Question: Is Context Gathering a Shared Skill or a Shared Protocol?

The context-reconstruction step could be extracted as a separate skill (invoked by review, build, debug, refactor) or embedded as a shared protocol within each skill. The separate-skill approach prevents duplication and ensures consistency. The embedded-protocol approach avoids an extra invocation step. This is a DECIDE question, not a research question.

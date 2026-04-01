# ADR-046: Code Review Integration with Build Stewardship

**Status:** Accepted

## Context

The build phase (ADR-038, build skill) includes stewardship checkpoints that detect architectural drift: Tier 1 (responsibility conformance, dependency direction, cohesion, test quality, decision coverage) and Tier 2 (coupling analysis, intent-implementation alignment, invariant enforcement). These are valuable but architecturally focused — they check whether code conforms to the system design.

Code review as defined in Essay 010 and the domain model operates at a different level: it builds the reviewer's understanding of what was built and why, surfacing questions that a thoughtful senior reviewer would ask. The build phase stewardship checks and the code review skill serve complementary purposes — architectural conformance and epistemic understanding, respectively.

The product discovery identifies the solo developer-researcher as a stakeholder who "wants to catch architectural drift in my own work before it compounds — especially when AI generated the code and I need to verify it actually implements what I decided."

## Decision

The `/rdd-review` skill integrates with the build phase as an optional enhancement to stewardship checkpoints. After a Tier 1 stewardship check completes (at scenario group boundaries), the build skill may invoke `/rdd-review` in corpus-grounded mode to add epistemic review alongside architectural conformance.

**Integration mechanics:**
- During build, reviewing each work package is the expected rhythm — not mandatory, but the practical norm. The build skill's stewardship section includes a callout: "For epistemic review of this work package, invoke `/rdd-review`"
- When invoked during build, the review skill reads the current work package's scenarios, relevant ADRs, and the domain model to orient
- The review skill surfaces questions about the implementation — not duplicating what stewardship already checked (architectural conformance) but adding questions about design intent, assumption validity, and decision rationale
- The reviewer (the user running build) engages with the questions before proceeding to the next scenario group
- Review may surface issues that need fixing — these are review commits (structure or behavior changes driven by what the review uncovered), following the same commit discipline as the rest of build
- Review during build serves both purposes — building the reviewer's genuine understanding of what was implemented and confirming the implementation is good. The success criterion (can the reviewer discuss the changes with informed judgment?) captures both

**Outside build:** The review skill operates independently with no build integration. Context-reconstructive mode has no stewardship connection.

**Rejected alternative:** Merging review into the stewardship checks themselves. Rejected because: (1) stewardship is architectural conformance (pragmatic, Invariant 3); review is epistemic understanding (Invariant 1 — understanding requires generation). Mixing them conflates two different purposes. (2) The review skill needs to work standalone; embedding it in build makes standalone use impossible.

**Rejected alternative:** Automatic invocation of review after every stewardship check. Rejected because it adds mandatory overhead without the user choosing it. The user may want stewardship without review (when the code is straightforward) or review without stewardship (when reviewing a colleague's MR). Making it optional respects the user's judgment about when review adds value.

## Consequences

**Positive:**
- Build stewardship and code review complement each other without duplication
- The user controls when to add epistemic review to the build process
- The review skill remains independently invocable

**Negative:**
- Optional invocation means the user may skip review when it would have been valuable
- The build skill needs a minor update to include the callout

**Neutral:**
- No change to the stewardship checks themselves — they continue to function as designed
- The review skill's corpus-grounded mode reads the same artifacts the stewardship checks do, but asks different questions

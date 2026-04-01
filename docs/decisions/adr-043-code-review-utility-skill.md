# ADR-043: Code Review as Utility Skill

**Status:** Accepted

## Context

Essay 010 establishes that code review is an epistemic activity — a mechanism for knowledge transfer, shared understanding, and reviewer learning — not primarily a defect-finding exercise. The existing RDD pipeline has no dedicated code review capability. The build phase includes stewardship checks (Tier 1 and Tier 2) that detect architectural drift, but these are architectural conformance tools, not epistemic review. The product discovery identifies three stakeholders who need code review: the solo developer-researcher (reviewing their own AI-generated code within an RDD corpus), the team lead (reviewing teammates' MRs in a delivery context), and teammates (reviewing each other's MRs to build understanding of unfamiliar areas).

The code review skill must work both within the RDD pipeline (triggered during build stewardship) and outside it (standalone MR review with no artifact trail). This positions it as a utility — like `/rdd-conform` and `/rdd-about` — rather than a pipeline phase.

## Decision

Implement code review as a utility skill (`/rdd-review`) that can be invoked at any time, from any context. It is not a pipeline phase — it does not produce a phase artifact, does not have a fixed position in the pipeline sequence, and does not gate pipeline progression. It integrates with the build phase stewardship checks as an optional enhancement but does not replace them.

**Rejected alternative:** Making code review a pipeline phase (e.g., between BUILD and PLAY). Rejected because: (1) review needs to happen at variable granularity during build (per work package, per scenario group), not at a fixed pipeline position; (2) the standalone MR review use case has no pipeline context at all; (3) pipeline phases produce durable artifacts — the review skill's output (questions for the reviewer's consideration) is ephemeral by design. The review's value lives in the reviewer's mental model, not in a record of the questions — durable review records would extend the provenance chain, but the success criterion (can the reviewer discuss the changes with informed judgment?) tests internalized understanding, not documentation.

**Rejected alternative:** Embedding review logic directly into the build skill's stewardship section. Rejected because: (1) the standalone use case would be unsupported; (2) the stewardship checks serve a different purpose (architectural conformance) than epistemic review (building understanding); (3) keeping them separate allows each to evolve independently.

## Consequences

**Positive:**
- The skill can be used within or outside RDD, supporting all three stakeholder use cases
- Build stewardship and code review remain independent — each can be invoked without the other
- The skill follows the established utility pattern (`/rdd-conform`, `/rdd-about`)

**Negative:**
- As a utility, the skill has no guaranteed invocation point — the user must choose to run it
- No pipeline gate enforces review completion before proceeding

**Neutral:**
- The skill file lives at `skills/review/SKILL.md`, following plugin conventions
- No new agent type is needed — the orchestrating agent runs the skill directly

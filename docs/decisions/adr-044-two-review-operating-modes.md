# ADR-044: Two Review Operating Modes

**Status:** Accepted

## Context

Essay 010 identifies two distinct review contexts that require different approaches to review orientation — the cognitive phase where the reviewer builds context before evaluating code (CRDM model, ~27% of cognitive effort).

When reviewing within an RDD corpus, orientation context already exists: research essays explain why the problem matters, ADRs record decisions and rationale, scenarios define expected behavior, and the domain model provides ubiquitous language. The reviewer inherits a provenance chain.

When reviewing a colleague's MR outside an RDD corpus, no such context exists. The reviewer must reconstruct orientation from available sources — tickets, docs, discussion threads — before meaningful analysis can begin. The product discovery identifies this as the team lead's primary use case: "I need to quickly build enough understanding of a change to ask the right questions."

The CRDM model shows that skipping orientation degrades analysis quality — most review tools send reviewers straight to a diff. Both modes need adequate orientation; they differ in how orientation is achieved.

## Decision

The `/rdd-review` skill operates in two modes, determined by context:

**Corpus-grounded review** — invoked within an RDD project, scoped to a work package. The skill reads relevant RDD artifacts (ADRs, scenarios, domain model, system design) for the work package in scope, synthesizes them into orientation context, and surfaces review questions grounded in the provenance chain. The reviewer can check whether code implements what was decided, using the language that was agreed upon.

**Context-reconstructive review (RDD-lite)** — invoked for any code review outside an RDD corpus. The skill begins with collaborative context-gathering: the reviewer provides breadcrumbs (ticket URLs, MR links, doc pointers, discussion threads) and the agent fetches and synthesizes them. The agent then performs lightweight discovery — surfacing assumptions, identifying constraints, considering inversions — to reconstruct orientation context before surfacing review questions.

Mode detection: if RDD artifacts exist in the project (`./docs/domain-model.md`, `./docs/decisions/`, `./docs/scenarios.md`), offer corpus-grounded mode. The skill then checks whether the specific work package or affected modules have corresponding corpus entries (relevant ADRs, scenarios). If the corpus is present but the relevant artifacts are absent for this specific change, the skill surfaces this explicitly and may fall back to context-reconstructive mode for the uncovered areas. The user can override mode in either direction.

**Rejected alternative:** A single mode that always reconstructs context. Rejected because it wastes the provenance chain that RDD already provides — when ADRs and scenarios exist, the reviewer should leverage them, not reconstruct context from scratch.

**Rejected alternative:** Corpus-grounded only (no standalone mode). Rejected because the most common review use case — reviewing a colleague's MR on a delivery team — typically has no RDD artifact trail. The team lead stakeholder explicitly needs standalone review support.

## Consequences

**Positive:**
- Each mode optimizes for its context — provenance chain when available, discovery when not
- The standalone mode makes the skill useful beyond RDD-adopting projects
- Mode detection is automatic but overridable

**Negative:**
- Two modes means two code paths to maintain
- The context-reconstructive mode depends on external tool availability (CLI tools, MCP services) for fetching context

**Neutral:**
- Both modes converge on the same output: review questions grounded in orientation context
- Both modes serve the same success criterion: the reviewer can discuss changes with informed judgment

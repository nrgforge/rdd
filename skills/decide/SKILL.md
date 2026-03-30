---
name: rdd-decide
description: Decide phase of RDD. Produces ADRs (Architecture Decision Records), refutable behavior scenarios, and interaction specifications using domain vocabulary. Use after /rdd-model to capture decisions and define what the software should do before building.
allowed-tools: Read, Grep, Glob, WebSearch, WebFetch, Write, Edit
---

You are a software architect focused on capturing decisions and defining behavior. The user has completed research (essay) and domain modeling (glossary). Your job is to produce thin ADRs for each architectural decision, refutable behavior scenarios, and interaction specifications that will drive the build phase.

$ARGUMENTS

---

## RDD CYCLE POSITION

```
research → product → model → DECIDE → architect → build → synthesis
                              ^^^^^^
                            YOU ARE HERE
```

---

## PROCESS

### Step 1: Read Prior Artifacts

Read the domain model invariants FIRST (`./docs/domain-model.md`, § Invariants). These are the constitutional authority — the highest-precedence statements in the entire artifact set. Then read:
- Essays (`./docs/essays/`) — the research context
- Product discovery artifact (`./docs/product-discovery.md`) — stakeholder needs, value tensions, assumption inversions
- Research log (`./docs/essays/research-logs/research-log.md`) — for additional context if needed
- Prior ADRs (`./docs/decisions/`) — existing decisions

If any prior ADR or essay contradicts a current invariant, flag it immediately — do not treat the contradicting document as authoritative. The invariant wins.

Identify decisions that need to be made. These typically emerge from:
- Tradeoffs surfaced in the essay
- Technology choices implied by the research
- Structural choices about how concepts relate in code
- Integration boundaries and protocols

### Step 2: Write ADRs

One ADR per decision. Use this template:

```markdown
# ADR-NNN: [Decision Title]

**Status:** Proposed | Accepted | Superseded by ADR-XXX

## Context

[What situation or finding from the essay motivates this decision?
Use domain vocabulary from the glossary.]

## Decision

[The decision. Concrete and specific.]

## Consequences

**Positive:**
- ...

**Negative:**
- ...

**Neutral:**
- ...
```

Write ADRs to `./docs/decisions/adr-NNN-<slug>.md`.

### ADR Principles

- **One decision per ADR** — don't bundle unrelated decisions
- **Stop at the first point of uncertainty** — if a decision depends on something you haven't learned yet, flag it. The user may need to go back to `/rdd-research`
- **Context comes from the essay** — don't introduce new framing; reference what was already learned
- **Thin, not exhaustive** — capture the decision and key consequences, not every possible consideration
- **Use domain vocabulary** — every noun and verb should come from the glossary
- **Check for unexamined product assumptions** — if an ADR's context references a product assumption (how users work, what they need, which workflows matter), check whether that assumption has been validated through product discovery. If not, flag it as a potential inversion principle violation

Present ADRs to the user for approval before proceeding.

### Step 3: Argument Audit

After ADRs are written, dispatch the **argument-auditor** specialist subagent. Provide it with:
- The essay file path (evidence/reasoning layer)
- The new ADR file paths and any prior ADRs they depend on (decision/conclusion layer)
- An output path for the audit report (e.g., `./docs/essays/audits/argument-audit-decide-NNN.md`)

The agent runs on Sonnet in an isolated context, maps inferential chains from essay evidence to ADR decisions, and writes a structured audit report.

After the agent completes, read the audit report and apply fixes:
1. **P1 issues (before accepting ADRs):** Fix logical gaps, soften overreaching claims, resolve contradictions
2. **P2 issues (before building):** Make hidden assumptions explicit, address missing counterarguments
3. **P3 issues (nice to have):** Clarify justifications, note interactions between mechanisms
4. **Update prior documents** if the audit reveals inconsistencies in existing ADRs or domain model — evaluate whether the new work or the prior work needs to change

### Step 3.5: Conformance Audit

After the argument audit passes, dispatch the **conformance-scanner** specialist subagent. Provide it with:
- The ADR file paths (both new and prior)
- The codebase root path
- An output path for the conformance report (e.g., `./docs/essays/audits/conformance-scan-NNN.md`)

The agent runs on Sonnet in an isolated context, scans the codebase against ADR declarations, and writes a structured conformance debt table with file:line references for violations.

After the agent completes, read the conformance report. This debt informs scenario writing — some scenarios become structural cleanup (`refactor:` commits) rather than new features.

### Step 3.7: Backward Propagation

**This step is mandatory when an ADR introduces or changes a domain model invariant.** It prevents stale assumptions from surviving into future sessions.

When invariants change:
1. **Identify** which invariant(s) were added, changed, or strengthened
2. **Sweep** ALL prior ADRs and essays for language that contradicts the new invariant
3. **Supersede** — for each contradiction, add a supersession note to the old document (e.g., `> **Superseded:** The claim below is contradicted by [Invariant X] as established in ADR-NNN.`)
4. **Log** — update the domain model's Amendment Log with the invariant change, date, and list of documents that were updated
5. **Present** the propagation summary to the user: what changed, what was swept, what was marked superseded

If no invariants changed in this decision cycle, skip this step.

### Step 4: Behavior Scenarios

After audit fixes are applied and conformance debt is documented, produce refutable behavior scenarios in plain language. These describe what the software should do, using domain vocabulary. Writing scenarios after the audit ensures they are built on a consistent, audited foundation.

If a product discovery artifact exists, consider its assumption inversions as candidate scenarios — inverted assumptions often reveal important edge cases or failure modes that need explicit behavior specification.

```markdown
# Behavior Scenarios

## Feature: [Name using domain vocabulary]

### Scenario: [Descriptive name]
**Given** [precondition using domain terms]
**When** [action using domain terms]
**Then** [observable outcome using domain terms]

### Scenario: [Descriptive name]
**Given** [precondition]
**When** [action]
**Then** [outcome]
```

Write scenarios to `./docs/scenarios.md`.

**Refutable** means each scenario can be clearly true or false when tested against the running software. Vague outcomes like "the system works correctly" are not refutable. Each Then clause must be observable and verifiable.

**Integration scenarios.** For each new component, include at least one scenario that tests the boundary with an adjacent component using real (not stubbed) types. If the component accepts input from another component, write a scenario where that component produces the input. If the component's output feeds into another, write a scenario verifying the downstream component can consume it.

Example pattern:
```
### Scenario: Coordinator dispatches to SemanticAdapter with real input type
**Given** an ExtractionCoordinator with a registered SemanticAdapter (not a stub)
**When** the coordinator processes an extract-file input
**Then** SemanticAdapter receives input it can downcast without error
```

### Step 4.5: Interaction Specifications

After scenarios are written, produce interaction specifications — the workflow-level specification of how each stakeholder works with the system. Interaction specifications fill the gap between business-rule scenarios (which specify *what* happens) and technical implementation (which specifies *how* it's built). Scenarios and interaction specifications operate at different specification levels and do not duplicate each other.

Read the product discovery artifact (`./docs/product-discovery.md`) — specifically the Stakeholder Map, Jobs/Mental Models, and Product Vocabulary sections. For each stakeholder, derive task decompositions at the workflow level: what the stakeholder does, and the mechanics of how they do it.

**The derivation method from stakeholder model to task decomposition is an open design problem.** The systematic method for going from stakeholder models to interaction specifications remains unresolved. Produce interaction specifications through best-effort interpretation of stakeholder needs, jobs, and mental models from product discovery. Do not claim a systematic derivation method, and do not obscure this open problem.

Write interaction specifications to `./docs/interaction-specs.md`. Use this template:

```markdown
# Interaction Specifications

**Derived from:** product-discovery.md (stakeholder models)
**Complements:** scenarios.md (business-rule behavior)

## Stakeholder: [Name from product discovery]

**Super-Objective:** [The stakeholder's overarching need — from product discovery's stakeholder map and jobs]

### Task: [What the stakeholder does at the workflow level]

**Interaction mechanics:** [How the task is performed — concrete enough to create a playable surface, abstract enough to survive UI changes]

### Task: [Next task for this stakeholder]

**Interaction mechanics:** [...]

---

[Repeat for each stakeholder]
```

Each interaction specification entry must:
- Reference a **stakeholder** that exists in the product discovery artifact
- Include a **super-objective** that traces to a job or need in product discovery
- Describe **tasks** at the workflow level — more concrete than scenarios, more stable than implementation details
- Specify **interaction mechanics** — how the task is performed, concrete enough that the play phase can encounter deviations between specified and actual interaction
- Use **domain vocabulary** from the domain model consistently

### Step 5: Present for Approval

Present the complete set — ADRs + scenarios + interaction specifications + audit findings and fixes — to the user. Highlight:
- Decisions where alternatives were close calls
- Scenarios that cover edge cases vs. happy paths
- Interaction specifications and how they relate to the stakeholder models they derive from
- Any points where you stopped due to uncertainty
- Audit findings that changed the ADRs or prior documents

### EPISTEMIC GATE

After presenting the complete set, run the epistemic gate protocol before proceeding to the next phase.

Present 2 of the following prompts, filling in the bracketed references with specific decisions, rejected alternatives, and scenario details from the ADRs just produced:

- **Elaborative interrogation:** "Any of these rejected alternatives you're not fully comfortable letting go of?"
- **Reflection:** "Which decision feels least certain? What about it makes you uneasy?"

Wait for the user to respond to at least one prompt. If the user responds with only non-generative approval ("looks good", "approved"), acknowledge it but gently re-present the prompts — the gate asks for the user's perspective on the decisions, not just confirmation.

After the user responds, note any obvious factual discrepancies between their response and the ADRs without framing it as an error ("ADR-NNN describes the tradeoff as X — your take was Y. Worth revisiting?"). Do not assess the quality of the user's understanding.

Then ask whether to proceed to the next phase, revise the ADRs, or revisit research.

---

## IMPORTANT PRINCIPLES

- **Decisions are cheap to record, expensive to discover late**: Write the ADR even if the decision seems obvious. It costs a minute now and saves an argument later.
- **Stop at uncertainty**: If a decision or scenario depends on something unknown, surface it. Don't speculate past what the research established.
- **Scenarios are a contract**: They define what `/rdd-build` will implement. Be precise enough that someone could write a test from each scenario without ambiguity.
- **Domain vocabulary is mandatory**: Every term in scenarios and ADR context must come from the glossary. If you need a new term, the domain model needs updating first.

---

## NEXT PHASE

When ADRs, scenarios, and interaction specifications are approved and the user is ready to proceed, advance to **`/rdd-architect`**. The architecture phase decomposes the system into modules using the ADRs as constraints and scenarios as behavioral requirements. The `/rdd-build` skill reads interaction specifications alongside scenarios. The `/rdd-play` skill reads interaction specifications as the playable surface for experiential discovery.

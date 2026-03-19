# ADR-002: Each Skill Owns Its Epistemic Gate Definition

**Status:** Proposed

## Context

The RDD pipeline is implemented as a set of independent skill files (`rdd-research/SKILL.md`, `rdd-model/SKILL.md`, etc.) coordinated by an orchestrator (`rdd/SKILL.md`). Epistemic gates (ADR-001) must be embedded somewhere in this structure. Two options exist: centralize all gate definitions in the orchestrator, or distribute them so each skill defines its own gate.

Each phase produces a different kind of artifact (essay, domain model, ADRs, system design, code) and requires different epistemic acts to engage with effectively. The essay (§6) maps specific frameworks to specific gates — self-explanation works best for essay engagement, retrieval practice works best for knowledge-dense artifacts like the domain model.

## Decision

Each skill defines its own epistemic gate as a new section in its SKILL.md file. The orchestrator defines the protocol (every gate must include at least one epistemic act; the user must produce something before advancing) but does not prescribe the specific prompts. Skills craft gate prompts tailored to their artifact type.

The orchestrator's gate section updates from:
```
1. Present the gate artifact to the user
2. Ask the user whether to proceed, revise, or go back
3. Never auto-advance without explicit user confirmation
```

To:
```
1. Present the gate artifact to the user
2. Present the epistemic act prompts defined by the skill
3. User performs at least one epistemic act
4. Acknowledge the response, surface divergences, ask whether to proceed
5. Never auto-advance without explicit user confirmation
```

## Consequences

**Positive:**
- Gate prompts are tailored to the artifact type — a domain model gate asks different questions than a system design gate
- Skills remain self-contained — a skill file contains everything needed to run the phase, including the gate
- Adding or modifying gate prompts requires changing only one file

**Negative:**
- Risk of inconsistency between skills if gate protocols diverge
- The orchestrator cannot enforce gate quality — it trusts each skill to implement a meaningful gate

**Neutral:**
- The orchestrator still controls the pipeline sequence and can refuse to advance if no epistemic act response is provided

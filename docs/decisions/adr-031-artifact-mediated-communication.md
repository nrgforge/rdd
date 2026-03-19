# ADR-031: Artifact-Mediated Communication for Specialist Work

**Status:** Proposed

## Context

RDD phases already communicate through durable artifacts — the research phase produces an essay, the model phase reads it; the decide phase produces ADRs, the architect phase reads them. No phase passes understanding to the next via conversation context.

However, specialist work *within* a phase (citation auditing, argument auditing, literature review, conformance scanning) currently runs inline, communicating through ephemeral conversation context. Findings exist only in the session; they cannot be reviewed later, referenced by future cycles, or read independently of the conversation that produced them.

With 1M token context windows, this is not a space constraint — it is an architectural inconsistency. If inter-phase communication uses artifacts, intra-phase specialist work should follow the same pattern. The motivation is provenance and durability: after completing an RDD cycle, the user should be able to trace every claim to its verification. Ephemeral audit results break this chain. (Reflection 007: "artifact-mediated communication as a safety harness for provenance.")

## Decision

Specialist work within RDD phases communicates through artifact files, not conversation context. Specialist subagents read input artifacts and write output artifacts. The orchestrating agent reads those output artifacts. No specialist work produces findings that exist only in conversation.

This applies to all proposed specialist subagents: citation-auditor, argument-auditor, lit-reviewer, conformance-scanner, orientation-writer, and spike-runner.

Whether this is a hard rule ("always artifact") or context-dependent ("more involved = artifact") is left as an open question for operational testing. The initial implementation treats it as a hard rule for consistency.

## Consequences

**Positive:**
- Architectural consistency with inter-phase communication
- Audit artifacts persist for future reference, provenance, and user review
- Supports Invariant 0 — the user can verify the research was properly audited

**Negative:**
- Agent dispatch adds latency compared to inline execution
- More files in the artifact trail to maintain

**Neutral:**
- Open question remains on whether lightweight specialist work (e.g., a quick three-reference check) warrants a full artifact file

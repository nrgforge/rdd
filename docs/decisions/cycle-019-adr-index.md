# Cycle 019 ADR Reading Path

**Cycle:** 019 — Does RDD Over-Engineer?
**Date:** 2026-05-22
**Audience:** future practitioners or readers consulting Cycle 019's methodology amendments.

This is a navigational artifact for the five ADRs Cycle 019 produced. The cycle's research found that research-surveyed possibilities surviving into ADRs without empirical filter is the C7 over-engineering failure mode (essay-outline-018). Five mechanisms address different facets; each lives in its own ADR for decision-record integrity. **Read in the order below.** The total reading load is ~20 minutes; reading only the central commitment is ~5.

The reading-path artifact itself addresses the working-memory-budget concern the practitioner surfaced at the DECIDE gate — *with ~100 ADRs governing methodology behavior, the practitioner cannot hold the corpus in full view.* Rather than deleting decision records to reduce corpus weight (which loses the standalone rationale chains the audits established), the cycle adds this short index as the navigation layer.

---

## Central commitment — read this first

### [ADR-097: Empirical-Grounding Filter at DECIDE](./adr-097-empirical-grounding-filter-at-decide.md) — Tier-2

The cycle's load-bearing decision. When an ADR commits to a feature based on research-surfaced possibility, the practitioner applies a felt-trigger question at ADR-drafting time: *is this empirically grounded by PLAY evidence, stakeholder demand, spike validation, or structural operationalization?* Four grounding-mechanism paths; when none applies, the ADR is either marked Conditional Acceptance or filed with the `adr-deferred-` filename pattern (institutional patterns from llm-orc).

**Read this if:** you want to understand the cycle's central methodology commitment. The other four ADRs operationalize specific aspects of the same C7 failure mode at different workflow points.

---

## Supporting mechanisms — read in any order

### [ADR-094: Audit Round-Count Convergence-Saturation Signal](./adr-094-audit-round-count-convergence-saturation.md) — Skill-Structure Layer

Calibrates iterative audit-round-count via a structured verdict-line at round-end. Default 3 rounds; rounds 4–5 only when the signal does not trigger. Includes the **form-change baseline-reset rule** (added at R3 when this rule's absence was operationally demonstrated by Cycle 019's own R3 audit). Skill-text amendment site: `agents/argument-auditor.md` (covering both the argument-audit and framing-audit sections per ADR-061) + `agents/citation-auditor.md`.

**Read this if:** you are amending the argument-auditor or citation-auditor skill text, or you want to understand how the methodology calibrates iterative audit work.

### [ADR-095: Agent Outcome Test](./adr-095-agent-outcome-test.md) — Tier-2

Admissibility criterion for agent-facing artifacts (ADRs, scenarios, domain model, system design, audit reports), parallel to ADR-083's Outcome Test for human-facing artifacts. Asks at artifact-creation: *does this artifact produce direct agent consumption without re-orientation cost?* Tier-2 felt-trigger; no Skill-Structure Layer enforcement.

**Read this if:** you are proposing a new agent-facing artifact at any phase, or you want to understand why corpus weight grows and how the methodology recognizes it.

### [ADR-096: RESEARCH Patch-Switching Criterion](./adr-096-research-patch-switching-criterion.md) — Skill-Structure Layer

Pirolli & Card (1999) information-foraging patch-switching applied at the `/rdd-research` loop boundary. Practitioner-and-agent dyad applies a felt-trigger question at loop-end and records a structured verdict (CONTINUE-this-patch / SWITCH-patch / SWITCH-to-synthesis). Skill-text amendment site: `skills/research/SKILL.md` at the loop-again decision point.

**Read this if:** you are amending the `/rdd-research` skill text, or you want to understand how the methodology calibrates research-loop iteration.

### [ADR-098: Methodology Audit Gap — Named Deferrals (FF1 + FF3)](./adr-098-methodology-audit-gap-deferrals.md) — Named-deferral

Records two methodology-level audit gaps the cycle's MODEL gate surfaced: practitioner-originated framing audit gap (FF1) and Essay-Outline amendment re-audit protocol (FF3). Both deferred to a future cycle with named two-direction graduation triggers (harm evidence OR reliance evidence).

**Read this if:** you are tracking which methodology amendments are deferred and what evidence would graduate them to structural enforcement; or you want to understand the limits of the methodology's compound defense at gate conversations.

---

## Cross-cutting context

- **The four ADRs at Tier-2 (095, 097, 098 — plus the Three-Application F-P2 Pattern held in 097) acknowledge the same structural limit:** Tier-2 vocabulary scaffolds practitioner judgment but does not constrain practitioners who fail to apply the felt-trigger. The graduation triggers in each ADR name the conditions under which Skill-Structure Layer enforcement would be warranted.
- **The two Skill-Structure Layer ADRs (094, 096) encode stopping behaviors** (saturation signal at audit-round-end; patch-switching at research-loop-end). The framing audit (R1 FA-P2) noted the cross-ADR asymmetry: stopping mechanisms are encoded structurally; grounding/filtering mechanisms remain Tier-2 vocabulary. The asymmetry may reflect mechanism tractability (stopping is mechanical; grounding requires judgment).
- **The Three-Application F-P2 Pattern** (six scope-limiting choices in the cycle; held explicitly in ADR-097 and ADR-098) is the cycle's reflexive question: are the cycle's outputs coherent application of the Empirical-Grounding Filter to its own scope choices, or content-selection toward methodology-overhead-minimization? The multi-cycle graduation triggers are the structural test.

## Provenance

- **Cycle 019 research:** `docs/essays/essay-outline-018-does-rdd-over-engineer.md` (citation-audited, argument-audited, framing-audited; R5 narrowed at MODEL gate 2026-05-22).
- **Cycle 019 domain-model amendments:** #25 (24 new concepts; 5 new actions; ~25 new relationships; 6 open questions), #26 (R5 narrowing; PLAY-as-Filter / Distributed Remedy Architecture / Kitchen-Sink Outcome qualified), #28 (this restoration; consolidation reversal).
- **Cycle 019 audit corpus:** `argument-audit-decide-019.md` (R1), `argument-audit-decide-019-r2.md` (R2 TRIGGERED on five-ADR set), `argument-audit-decide-019-r3.md` (R3 narrow audit on briefly-consolidated form; restored), `argument-audit-019-r5.md` (Essay-Outline R5 narrow re-audit), three Cycle 019 susceptibility snapshots (research / discover / model / decide), `conformance-scan-decide-019.md` (clean).
- **Cycle 019 gate reflection notes:** `.rdd/gates/019-research-gate.md`, `019-discover-gate.md`, `019-model-gate.md`, `019-decide-gate.md`.

## Reading-burden honest characterization

This index is the structural response to a real reading-burden concern. The five ADRs together are ~1,500 lines; this index is ~120. The index does not eliminate the reading work — it ranks and contextualizes it. Future practitioners who only need the central commitment can read ADR-097 alone (~250 lines, ~5 minutes); those amending specific skill texts read the relevant supporting ADR; those tracking deferred methodology amendments read ADR-098.

**The reading-path artifact is itself an agent-facing artifact subject to ADR-095's Agent Outcome Test.** Intended consumer: future practitioners or readers consulting Cycle 019's methodology amendments; layer-match: navigation/orientation; not duplicative of the ADRs themselves (which carry the rationale chains) or of the cycle-status (which tracks active-cycle progress). The test passes — the consumer-naming produces an actionable distinction (read this first; skip to ADR-097 if that's all you need). Whether this index pattern should generalize to other multi-ADR cycles is a future-cycle question; the knowledge-graph corpus collapse research topic in the domain model Open Questions is where that question lives.

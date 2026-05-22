# ADR-094: Audit Round-Count Calibration via Convergence-Saturation Signal

**Status:** Accepted

## Context

The argument-auditor and citation-auditor specialist subagents (per ADR-058 / ADR-060 / ADR-061 / ADR-093) run iterative audit rounds against RESEARCH artifacts. The methodology does not currently specify how many rounds to run — Cycle 018 ran citation audits across four rounds and argument audits across two before the practitioner accepted a Methodology Compromise (Cycle 018 reflections) of stopping at P2-targeted edits. Cycle 019 ran argument audits across four rounds (R1 through R4) before reaching a clean verdict.

Cycle 018's reflections named the **Iterative-Audit Pattern** in the domain model: each correction pass introduces 3–5 new issues that the previous pass did not surface; the issue count converges across rounds but does not asymptote to zero on any single cycle's evidence. The pattern shows two readings — genuine error-correction (the methodology working) and auditing-around-the-edges of a fixed framing center (the methodology elaborating without challenging the core). Single-cycle data does not separate the readings.

Without a saturation signal, the practitioner-and-agent dyad has two failure modes:

- **Under-audit:** stopping at R1 or R2 when later rounds would surface load-bearing P1 issues (Cycle 019 R3 surfaced the framing finding that downgraded ADR-019.4 from Skill-Structure Layer to Tier-2 — a load-bearing methodology choice; R4 confirmed the downgrade integrated cleanly).
- **Over-audit:** running R4, R5, R6 chasing diminishing returns. The methodology's compound defense (multi-round audit + susceptibility snapshot + AID gate) does not require unbounded rounds; the marginal P1/P2 yield of additional rounds falls.

The cycle's Essay-Outline Section 10 names ADR-CANDIDATE-019.1 as a Calibration Move (per Cycle 019 domain-model vocabulary) addressing this gap: a Convergence-Saturation Signal at the audit boundary.

## Decision

The argument-auditor and citation-auditor specialist subagents adopt a **Convergence-Saturation Signal** for audit round-count calibration.

**Default audit round count: 3.** R1 + R2 + R3 is the methodology's default discipline.

**Round 4 fires when the Convergence-Saturation Signal does not trigger by R3.** The signal triggers when:

- R3's P1 finding count is zero, AND
- R3's new (non-carry-over) P2 finding count is at or below 1, AND
- R3's findings are not introducing new framings or new claim-scope expansions that R1 and R2 did not see.

**Round 5 fires only if R4 itself surfaces a new P1 finding.** If R4 is clean or introduces only P2/P3 polish, R4 is the final round.

**Rounds beyond R5 require explicit practitioner authorization** — they are not part of the methodology's default discipline. The practitioner records the rationale in the audit dispatch (e.g., "user requested R6 to verify Z").

**Standard sequence vs. re-audit-after-revision (P3-R5-1 clarification):** The signal applies to the cycle's primary audit sequence (R1, R2, R3, ...) where each round is dispatched as the next round in the iterative audit cycle. A re-audit dispatched specifically to verify the repair of a prior round's P1 findings is **not counted in the standard-sequence round count** — it runs unconditionally per the orchestrator's re-audit-after-revision rule and does not append a Convergence-Saturation Signal verdict line. **Dogfooding exception (per P2-R2-1):** when a re-audit is also the first operational application of the verdict-line mechanism itself, the verdict line may be appended as a calibration artifact with a note distinguishing this from a standard-sequence round verdict.

**Form-change baseline-reset rule (per R3 audit P2-R3-3 2026-05-22):** form-change events (document restructuring, consolidation, or replacement rather than in-place revision) **reset the round-count baseline**: the first audit on the new form is treated as R1 for saturation-signal purposes, not as a continuation of the prior document's round count. A TRIGGERED verdict on a prior form does not carry over to the new form; the new form's first audit is its R1. This rule was operationally demonstrated when the Cycle 019 R3 narrow audit on the consolidated form of ADR-097 found P2-new = 3 (above the ≤1 threshold) where the prior R2 TRIGGERED verdict on the five-ADR set would have suppressed the dispatch if erroneously carried over.

**"No new framings" criterion is practitioner-judgment-anchored (per P2-R5-2):** the agent cannot reliably distinguish practitioner-introduced framings from agent-introduced framings under task load (Cycle 019 R5 audit operational evidence). The criterion's operational form: the agent reports new warrants or claim-scope expansions that R1 and R2's finding records did not name; the practitioner reads the verdict line and assesses whether the new entries represent material framing shifts. Where the agent is uncertain, the verdict line reads "ESCALATE for practitioner judgment" and the practitioner reviews the round's findings before deciding the next-round action.

The signal is **Skill-Structure Layer** (per ADR-067) — encoded in the agent definitions for `argument-auditor.md` (covering both the argument-audit section and the framing-audit section of the combined dispatch per ADR-061) and `citation-auditor.md`. Per ADR-061, the framing audit is Section 2 of the argument-auditor's dispatch, not a separate subagent file; the signal evaluates both sections at the combined dispatch's end. Each agent's skill text reads the signal-evaluation step into its workflow at the round-end position. The orchestrator dispatching the audit reads the signal from the audit artifact's verdict line; round-count decisions are observable rather than implicit.

### Signal-evaluation step (skill-text amendment)

At the end of each audit round, the agent appends a structured verdict line to the audit artifact:

```
**Convergence-Saturation Signal:** [TRIGGERED | NOT TRIGGERED]
- P1 count this round: N
- P2 count this round (new, non-carry-over): N
- New framings or claim-scope expansions: [list, or "none"]
- Recommendation: [STOP at this round | CONTINUE to next round | ESCALATE for practitioner judgment]
```

The orchestrator reads the verdict line and decides round-count action. If TRIGGERED at R3, the audit cycle stops; if NOT TRIGGERED, the orchestrator dispatches R4 with the prior rounds' findings as context.

## Rejected alternatives

**A. Fixed round count (e.g., always 3, always 4).** Rejected because the marginal yield varies by cycle and artifact complexity. Cycle 019 needed R3 to surface the framing finding; Cycle 018 cited convergence but lacked a structural test for it. A fixed count under-fits some cycles and over-fits others.

**B. Practitioner-only round-count judgment (status quo).** Rejected because it requires the practitioner to know what each additional round costs and what its marginal yield distribution looks like. The methodology's role is to scaffold this judgment with a structural signal the agent computes; the practitioner can still override but does not have to make the decision from raw audit-report content.

**C. Token-budget-bounded auditing (stop when tokens reach N).** Rejected because token budget is a proxy for cost, not for yield saturation. A high-yield R3 should run; a low-yield R3 should stop. Budget-bounded auditing optimizes the wrong axis.

**D. Single-round auditing (R1 only) as the default.** Rejected because Cycle 018 and Cycle 019 evidence shows R1 misses load-bearing issues that R2 + R3 catch (Cycle 019's framing finding at R3 is the most consequential example). The methodology's accumulated practice supports multi-round as the floor.

**E. Skill-Structure Layer with hook-based enforcement (compound check per ADR-088).** Rejected for this ADR because the signal is agent-computed, not file-system-observable in a way the Stop hook can verify. The Skill-Structure Layer alone is appropriate — the agent definition embeds the signal-evaluation step at a concrete workflow position; the orchestrator reads the verdict line. This is Skill-Structure Layer primary per ADR-067.

## Consequences

**Positive:**
- Audit round-count is calibrated to artifact complexity, not to a fixed default.
- The Iterative-Audit Pattern is operationalized at the workflow level — each round's marginal yield is visible.
- The methodology-recognized stopping criterion makes Methodology Compromise (Cycle 018 reflections) less necessary — the practitioner can stop on the signal rather than declaring a compromise.
- The Convergence-Saturation Signal verdict line is a durable artifact for retrospective evaluation: future cycles can measure whether the signal correctly predicted R4's marginal yield.
- The form-change baseline-reset rule (added at R3) prevents the signal from spuriously carrying a prior form's TRIGGERED verdict over to a new form; operationally validated by R3's own discovery of three P2-new findings on the consolidated form that would have been suppressed by an erroneous carry-over.

**Negative:**
- Two agent-definition files need amendment (`argument-auditor.md` covering both the argument-audit and framing-audit sections per ADR-061; `citation-auditor.md`). Each amendment is a small skill-text addition (the signal-evaluation step). The framing-audit signal-evaluation is added within the existing framing-audit section of the argument-auditor, not as a separate file (per ADR-061).
- The signal's thresholds (P1 = 0, P2-new ≤ 1, no new framings) are agent-judgment-applied at the round-end position. Cycle 019's R5 audit demonstrated that practitioner-originated framings can be hard for the agent to distinguish from agent-introduced framings — the signal's "no new framings" criterion inherits this difficulty.
- Round-count discipline is now visible in the audit artifact; if a cycle runs R6 without justification, the deviation is also visible. The methodology's accountability surface expands.

**Neutral:**
- The signal is not a substitute for practitioner judgment. R6 remains available with explicit practitioner authorization. The signal scaffolds the judgment; it does not replace it.
- ADR-093 (Argument Auditor Graph Traversal) already specifies the argument auditor's workflow; this ADR adds the signal-evaluation step without changing the graph-traversal mechanism.

**Calibration trigger for threshold values (P2-R5-1 per R2 audit 2026-05-22):** The threshold values (P1 = 0; P2-new ≤ 1) are drafting-time synthesis calibrated to Cycle 019's audit evidence (R1-R4 sequence; R3 framing finding's marginal yield; R4 clean verdict). After 2–4 cycles apply the signal, retrospective evaluation of whether TRIGGERED recommendations at R3 correctly predicted R4's marginal yield is the calibration mechanism:
- If TRIGGERED at R3 is followed by high-yield R4s (false positives for saturation), threshold tightening is indicated.
- If NOT TRIGGERED at R3 is routinely followed by low-yield R4s (false negatives for saturation), threshold loosening is indicated.

The verdict-line artifact is the retrospective evidence; a future-cycle ADR update to the threshold is the named adjustment mechanism. The graduation trigger is parallel to ADR-097's and ADR-098's — multi-cycle empirical evidence supersedes single-cycle drafting-time synthesis.

## Provenance check

- **Iterative-Audit Pattern** as named concept: domain model Amendment #23 (Cycle 018, MODEL phase).
- **Methodology Compromise** as named concept: domain model Amendment #23 (Cycle 018, MODEL phase).
- **Calibration Move** as named concept: domain model Amendment #25 (Cycle 019, MODEL phase).
- **Convergence-Saturation Signal** as named concept: domain model Amendment #25 (Cycle 019, MODEL phase).
- **Essay-Outline-018 §10 ADR-CANDIDATE-019.1** specifies the Branch B remedy. **Naming clarification per conformance-scan-decide-019.md 2026-05-22:** `framing-auditor.md` does not exist as a separate file per ADR-061; this ADR's two-file amendment scope (argument-auditor covering both sections; citation-auditor) is the operationally precise restatement.
- **Form-change baseline-reset rule** added at R3 (P2-R3-3) per the audit's discovery that the consolidated ADR-097 produced new P2-news that the R2 verdict on the five-ADR set could not have surfaced.
- **Cycle 019 R5 narrowing** (2026-05-22): R5 was a narrow re-audit, not a full standard-sequence round.
- **Driver chain:** Essay-Outline-018 §10 ADR-CANDIDATE-019.1 → Cycle 019 MODEL gate commitment → ADR-094.

Drafting-time synthesis (not from the driver chain): the specific threshold values (P1 = 0; P2-new ≤ 1) and the verdict-line format are drafting-time synthesis. The driver chain specifies "round 3 default; rounds 4–5 only when convergence does not signal," but does not specify the threshold values or the artifact format. These are agent-proposed at ADR-drafting time and are subject to revision based on multi-cycle operational evidence.

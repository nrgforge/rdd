# Research Log: Cycle 016 — Multi-Issue Batch Cycle
*Started 2026-04-15*

**Driving issues:** [#10](https://github.com/nrgforge/rdd/issues/10), [#11](https://github.com/nrgforge/rdd/issues/11), [#12](https://github.com/nrgforge/rdd/issues/12), [#13](https://github.com/nrgforge/rdd/issues/13), [#14](https://github.com/nrgforge/rdd/issues/14), [#15](https://github.com/nrgforge/rdd/issues/15), [#16](https://github.com/nrgforge/rdd/issues/16)

**Planned essay:** `015-[tbd].md` (title to emerge from findings — not pre-committed)

**Cycle shape:** Batch cycle with mixed research depth per issue. Not themed. Experimental shape testing multi-cycle composition (#14) by doing it.

**Reviewer audit:** [`./docs/housekeeping/audits/research-design-review-016.md`](../../housekeeping/audits/research-design-review-016.md) — Tier 1 dispatch executed; findings adopted in full.

---

## Issue Depth Calibration

| # | Title | Research Depth | Rationale |
|---|-------|---------------|-----------|
| #15 | PostToolUse regex defect | None | Defect with specified fix + test fixtures; validate via spike |
| #10 | Lifecycle composition in BUILD | None | ADR-071 shipped in Cycle 015; live validation through this cycle's BUILD |
| #11 | Cycle acceptance criteria traceability | Reconnaissance | Lit-review: traceability + BDD on emergent criteria |
| #12 | ADR supersession workflow | Reconnaissance | Lit-review: ADR practitioners on mutability + IETF/RFC supersession |
| #13 | Pattern reuse without applicability check | Moderate | Lit-review: analogical transfer / case-based reasoning failure |
| #14 | Multi-cycle composition | Investigative + live | Lit-review: nested workflow state; this cycle as natural experiment |
| #16 | Research-phase solution-anchoring | Investigative | Lit-review: anchoring / debiasing, building on Essay 013 as prior art |

---

## Research Methods Reviewer Findings (recorded for in-context-recall mitigation)

Full report: [`./docs/housekeeping/audits/research-design-review-016.md`](../../housekeeping/audits/research-design-review-016.md)

### Top-level findings

1. **11.2 — "layer-match" coinage creates circular search risk.** Project-internal term; the literature uses different concepts (test pyramid violations, contract testing, integration test scope). Reformulated to open the terminology question explicitly.

2. **14.4 — embedded conclusion about scope-adaptive enforcement.** "How can" presupposed scope-adaptivity is the right solution. The alternative — scope-conditional vacuity (requirements exist but are vacuously satisfied when preconditions don't apply) — was not considered. Reformulated to name both mechanisms and make the tradeoff question explicit.

3. **X.1 — structurally mispositioned.** Should run before per-track research, not after. The answer changes what Tracks #13 and #16 should look for. Repositioned as pre-research question with provisional answer from Essay 013. Second clause also embedded a consolidation-favoring assumption — reformulated.

4. **16.2 — "experimentally validated" bar misleading.** Some listed interventions (devil's-advocate) have mixed/negative records. Essay 013's spike is direct prior art not referenced. Reformulated to include ecological validity and prior art baseline.

5. **16.3 — scope too narrow.** Expanded to include systematic review methodology and peer review design.

6. **13.2 — "reliably trigger" presupposes the bar is met.** Reformulated to stay open to a null finding.

### Coverage gaps added

- **11.4:** Failure-severity question for #11 — when does the gap produce real failures vs. benign simplification?
- **12.4:** Cost of ADR immutability — what breaks when treating ADRs as immutable historical records?
- **14.6:** ADR-072 in-progress gate case specifically — schema change, protocol change, or hook-behavior change?

### Cross-track risks flagged

- Track #14 (scope-adaptive enforcement) and Track #11 (acceptance criteria) share an invisible dependency — recommendations may be incoherent if produced independently. Check coherence before delivering findings.
- Track #16 risks rediscovering Essay 013 findings. Must start from Essay 013 as prior art baseline, not from scratch.

### Depth allocation recommendation (adopted)

Tracks #11, #12, #13: reconnaissance depth. Tracks #14, #16: investigative depth. Batch format creates pressure toward equal-depth treatment — resist.

---

## Pre-Research: Provisional Answer to X.1

**Question (repositioned):** Do #13 and #16 share a common mechanism — existing-artifact gravity suppressing inversion-questioning — or are they distinct failure modes? If shared: does a shared mechanism imply a unified procedural home, or can the same mechanism require intervention at different pipeline stages? If distinct: what are the implications of treating them as if they were the same?

**Prior art from Essay 013:**

Essay 013 §7 (spike experiment) established that sycophancy operates through **content selection** — what gets surfaced vs. omitted. The mechanism is trained-in (RLHF), compounds across sequential artifacts (Finding 4), and is addressable through epistemic question forms that sidestep compliance dynamics (Finding 3, belief-mapping). Essay 013 §6 (sycophancy gradient) established that early pipeline phases (RESEARCH, DISCOVER, MODEL) have the weakest structural resistance because the artifact corpus is thinnest and structural constraints on content selection are weakest.

**Provisional answer:**

The underlying mechanism is likely **shared**: existing context (artifacts for #16, working code for #13) functions as a frame that constrains what gets attended to — a form of content selection driven by contextual priming rather than conversational sycophancy. Both #13 and #16 describe existing artifacts narrowing the search space before the methodology's inversion questions trigger.

However, the **intervention points are necessarily different**:
- **#16** activates at **research phase entry** — before questions are formed. The existing artifacts shape which questions feel relevant. The intervention must fire before question formation.
- **#13** activates at **BUILD phase pattern application** — before a solution is committed. The working code shapes which solutions feel applicable. The intervention must fire before pattern transfer.

**Provisional conclusion:** Shared mechanism does NOT imply unified procedural home. It implies the Inversion Principle needs **reliable triggers at both stages** — not consolidation into one. The triggers must be stage-appropriate: constraint-removal questioning at research entry (#16), applicability questioning at pattern application (#13). The shared mechanism is the WHY (contextual priming narrows search); the separate triggers are the WHERE (different pipeline stages where the mechanism activates).

**Test this against research findings:** Track #13 should look for whether the analogical-transfer literature distinguishes the cognitive mechanism from broader anchoring/priming effects. Track #16 should look for whether the debiasing literature's interventions differ at question-formation vs. solution-application stages. If they don't differ, the provisional answer weakens.

---

## Adopted Question Set (Round 1)

Five tracks. Twenty-one active questions. Reviewer-flagged questions marked with (R) and reformulated.

### Pre-research question

| # | Question | Status |
|---|---|---|
| **X.1** (R) | Do #13 and #16 share a common mechanism — existing-artifact gravity suppressing inversion-questioning — or are they distinct failure modes that appear superficially similar? If shared: does a shared mechanism imply a unified procedural home, or can the same mechanism require intervention at different pipeline stages? If distinct: what are the implications of treating them as if they were the same? | **Provisionally answered above — test against research findings** |

### Track #11 — Cycle acceptance criteria traceability (4 questions, reconnaissance)

| # | Question |
|---|---|
| **11.1** | How does the requirements-traceability literature handle verification of aggregate or emergent acceptance criteria that no atomic test case captures? |
| **11.2** (R) | In BDD/ATDD practice, is there a recognized failure mode where a behavioral criterion specifying integration-level behavior is satisfied by a test that operates at a lower layer (unit or stub boundary)? What terminology does the literature use for this, and what verification mechanisms have been proposed? |
| **11.3** | Is the gap this issue names ("scenario-level coverage implies criterion-level coverage") documented as a known failure mode in software testing literature, and what terminology / mitigations are established? |
| **11.4** (NEW) | Under what conditions does scenario-level coverage falsely satisfying criterion-level coverage produce real failures vs. when is it a benign simplification? |

### Track #12 — ADR supersession workflow (4 questions, reconnaissance)

| # | Question |
|---|---|
| **12.1** | What do established ADR practitioners (Nygard, Tyree/Akerman, ThoughtWorks Radar, AWS Well-Architected) say about ADR mutability — which fields are intended immutable vs. mutable, and under what circumstances ADRs may be amended? |
| **12.2** | Is the role separation this issue proposes — ADRs as historical record vs. current-state documents (system-design, ORIENTATION) as current truth — present in existing methodologies, or is it novel? |
| **12.3** | What supersession workflows exist in adjacent fields (RFC processes, IETF/W3C standards, API deprecation, versioned architecture) for preserving historical fidelity while keeping current-state readers accurate? |
| **12.4** (NEW) | What are the known costs of treating ADRs as immutable historical records — what breaks, what becomes hard to maintain, what creates reader confusion? |

### Track #13 — Pattern reuse without applicability check (3 questions, moderate)

| # | Question |
|---|---|
| **13.1** | What does the cognitive psychology literature on analogical transfer and case-based reasoning identify as primary failure modes when a known solution is applied to a structurally similar but not identical problem? |
| **13.2** (R) | What mitigations — checklists, prompts, structured questioning, negative-transfer detection — have been studied for triggering applicability questioning before pattern application, and what evidence exists about their reliability in practice vs. experimental settings? |
| **13.3** | Does software-engineering literature on design pattern misuse / framework migration / code reuse antipatterns name this failure mode, and how does it relate to the broader analogical-transfer literature? |

### Track #14 — Multi-cycle composition (6 questions, investigative)

| # | Question |
|---|---|
| **14.1** | What prior art exists for representing nested / concurrent / paused workflow state — workflow engines (Temporal, Cadence, Airflow), hierarchical state machines, continuation-passing style, git worktree/stash/rebase-in-progress — and what abstractions has each settled on? |
| **14.2** | For workflows where the executor may be interrupted mid-step (e.g., user stepping away mid-gate), what patterns distinguish "in-progress" from "paused" and "active"? What concrete data representations are used? |
| **14.3** | What interaction patterns exist between nested workflows and composition operations (graduation, close, archive) — do outer-workflow close operations cascade, error out, or require explicit unwinding? |
| **14.4** (R) | For enforcement systems designed around full-pipeline execution, what mechanisms exist for handling smaller-scoped work units — and what tradeoffs have been made between scope flexibility and structural guarantee preservation? What prior art exists under terms like scope-adaptive enforcement, conditional preconditions, or policy applicability? |
| **14.5** | For migration from single-cycle to multi-cycle representation — what strategies exist in comparable systems (schema evolution for config files, versioned state machines), and what is the cost profile of automated migration vs. user-walkthrough migration for pre-existing cycles? |
| **14.6** (NEW) | Does the in-progress gate case (ADR-072's known gap) require a schema change, a protocol change, or a hook-behavior change — and what are the backward compatibility implications for existing cycle-status files? |

### Track #16 — Research-phase solution-anchoring (3 questions, investigative)

**Prior art baseline:** Essay 013 §7 (spike experiment). The belief-mapping framing achieved near-zero preference-driven divergence; adversarial framing overcorrected. This track extends those findings to the specific problem of existing-artifact anchoring, not rediscovering them.

| # | Question |
|---|---|
| **16.1** | What does behavioral-decision-research literature (Tversky & Kahneman 1974 and subsequent replications) identify as the mechanisms by which existing context / prior exposure narrows search in subsequent decision-making? |
| **16.2** (R) | What interventions — constraint-removal questioning, inversion, counterfactual reasoning, devil's-advocate framings — have been studied for reducing anchoring in research / design / creative work? What does the literature say about ecological validity — do lab-demonstrated effects transfer to naturalistic settings? |
| **16.3** (R) | In research methodology literature (qualitative research, design research, systematic review methodology, and peer review design), what practices exist for mitigating the effect of existing artifacts / prior work on research question formation, and how effective are they? |

### Cross-track notes (from reviewer)

- **#14 × #11 coherence check:** If both tracks produce design recommendations independently, verify they are coherent with each other. Track #14's scope-adaptive enforcement must still preserve whatever structural guarantee acceptance criteria (#11) provide.
- **#12 analogy mapping:** For 12.3, be explicit about which aspects of adjacent-field supersession workflows map to the ADR problem and which do not. The analogy mapping is a research task, not a given.
- **#14 convergence gaps:** For 14.1, be alert to subfields where "settled abstractions" don't exist (e.g., git's ad hoc extensions). Finding divergence is as useful as finding convergence.

### Out of scope for research

- **#15** — defect with specified fix; validate via spike against the seven fixtures in the issue body, then skip to DECIDE/BUILD
- **#10** — live validation through this cycle's BUILD; no research question open

### Round-2 candidates (deferred until Round 1 findings)

- **R2-a:** Does Cycle 015's BUILD-exit hook-cascade friction (direct evidence) generalize across multi-cycle composition patterns, or was it specific to ADR-072's implementation?
- **R2-b:** For #11, what telemetry would let a cycle detect its own acceptance-criteria-coverage gap?

---

## Round 1 Findings

*(Dispatching lit-reviewers — findings below as they return)*

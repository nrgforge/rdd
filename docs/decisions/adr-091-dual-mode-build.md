# ADR-091: Dual-Mode BUILD — Auto-Mode and Gated-Mode as Methodology-Recognized Patterns

**Status:** Proposed

## Context

The `/rdd-build` skill describes a single canonical pattern: scenario-by-scenario TDD with an EPISTEMIC GATE per scenario group, an Attend-Interpret-Decide cycle at each gate, and stewardship checkpoints surfaced for user input. The pattern assumes the practitioner is in the loop at scenario-group boundaries throughout the BUILD phase.

In practice, BUILD often runs differently. Cycle 017's BUILD phase ran in **auto mode** following the practitioner's high-level direction at the start ("Let's commit and start build"). The agent (Claude Opus 4.7) executed all seven work packages across seven commits in a single session. Practitioner engagement was concentrated at the start (direction), at one mid-cycle directive (migrate + push), and at the end (cycle close). No engagement at scenario-group boundaries within BUILD; stewardship checks were self-administered by the agent.

The build-phase Susceptibility Snapshot (`docs/housekeeping/audits/susceptibility-snapshot-017-build.md`) named this as **Feed-forward Signal E to the methodology itself**: the AID cycle's user-engagement moments are designed to surface design-alternative examination and scoping-judgment surfacing. Self-administered stewardship correctly handles conformance verification (does the code conform to the responsibility matrix?) and test verification (do the tests pass?), but does not reach two failure modes:

- **Design-alternative examination.** When the agent chooses an implementation pattern (e.g., the FAILURES_PHASE / FAILURES_COMPOUND partition in Cycle 017 WP-D), no alternative is surfaced for the practitioner to evaluate. The pattern works; the alternative is not examined. The snapshot called this a *narrow circularity* — agent-authored constraint language at DECIDE driving agent-authored implementation at BUILD without an external check between them.
- **Scoping-judgment surfacing.** When a work-package spec admits multiple legitimate scopes (e.g., Cycle 017 WP-E specced as "regenerate field-guide.md"; the agent delivered targeted updates and called the result a regeneration), the scoping choice does not surface as a user-reviewable decision.

The methodology currently has no language naming auto-mode BUILD as a legitimate pattern. The gated pattern is the only described pattern; auto-mode happens by practitioner choice without methodology-level framing. This ADR names both patterns as legitimate, names the conditions distinguishing them, and lets the practitioner-and-agent dyad pick the right pattern for the cycle's actual character.

The decide → architect → build pipeline already does most of the heavy lifting that gated stewardship is designed to catch — claims have been audited at RESEARCH, ADRs have been argument-audited at DECIDE, the system design has been validated at ARCHITECT. BUILD's per-scenario-group gates exist for the residual generative cases: scenario gaps, design flaws, undecided territory the prior phases missed. When that residual is small, gated mode imposes cost without commensurate catch.

## Decision

The methodology recognizes **two BUILD patterns as legitimate**, distinguished by which residual generative risks the cycle is exposed to:

### 1. Gated mode (the existing canonical pattern)

The pattern `/rdd-build` currently describes. Per-scenario-group EPISTEMIC GATES with the AID cycle. Stewardship checkpoints surfaced for practitioner input. Mode shifts to Debug / Refactor / Review proposed for practitioner approval. The practitioner is in the loop throughout BUILD.

**When to use:** the BUILD scope is likely to reveal new questions, undecided territory, or design flaws prior phases missed. The practitioner is available and wants engagement at scenario-group boundaries. The work's surface area is large or the cycle's stakes warrant distributed cognitive load.

### 2. Auto mode

The agent executes the BUILD scope autonomously after high-level practitioner direction. Stewardship checks run as self-administered conformance passes. Work-package commits are the natural review points; the practitioner engages at the start (direction), at mid-cycle break points (course corrections), and at the end (cycle close).

**When to use:** the BUILD scope is mostly anchored in audited ADRs (the prior phases have done the heavy lifting); the work is largely mechanical (scenarios are well-specified, decisions are settled). The practitioner is not available for distributed engagement, or prefers concentrated review at start-and-end. The cycle's stakes are bounded — measured along epistemic dimensions (would a missed design alternative or scoping compression be expensive to undo?) as much as along reversibility dimensions. Auto mode is appropriate when the epistemic cost of self-administered stewardship is small: the design space is well-explored upstream and the scoping choices are constrained by ADRs.

### 3. Mode-selection axes

The choice between modes is judgment-applied along four axes:

#### Axis 1 — Mechanical vs. generative work character (primary)

| Signal | Auto mode | Gated mode |
|---|---|---|
| Work-package decomposition | Inherited from a clean roadmap; WPs trace 1:1 to ADRs | Some WPs lack ADR coverage or anchor in undecided territory |
| Scenario specification | Scenarios are precise; Given/When/Then is unambiguous | Scenarios admit interpretation; ambiguity is expected to surface during build |
| Argument-audit history | The phase's ADRs have been audited (passes recorded) | Audit residue exists; some claims are not yet validated |
| Anticipated discovery | Few scenario gaps anticipated; design is settled | New questions or design flaws likely to surface during implementation |

#### Axis 2 — Practitioner availability and cognitive budget

Auto mode shifts cognitive load to start (direction) and end (review). Gated mode distributes it across scenario-group boundaries. Auto mode is appropriate when the practitioner is unavailable for distributed engagement, when the cycle is being run in a single session that the practitioner wants to push through, or when the practitioner prefers reviewer-after-the-fact engagement on this specific cycle.

#### Axis 3 — Cycle stakes and reversibility

Auto mode is more appropriate for low-stakes, reversible work — methodology-internal changes, mechanical refactors, well-tested implementations where bugs surface as test failures. Gated mode is more appropriate for high-stakes work where the cost of a missed design-alternative is expensive to undo: production-system changes affecting external users, architectural decisions that will propagate across the codebase, work in unfamiliar domains.

#### Axis 4 — Stewardship locality (catching vs. teaching)

Stewardship serves two functions: **catching** (drift detection — does the code conform to the responsibility matrix? do tests pass? are integration boundaries verified?) and **teaching** (building the practitioner's understanding through the act of engagement — surfacing design alternatives, prompting reflection-in-action, naming scoping choices).

- **Catching alone** is sufficient for auto mode. The agent's self-administered conformance pass catches drift; tests catch implementation correctness; the build snapshot catches the residual.
- **Teaching** requires gated mode. The practitioner only learns by engaging at the moments where teaching has purchase — the scenario-group boundaries the gates anchor.

When catching is the primary need, auto mode delivers it. When teaching is a significant need (e.g., the practitioner is new to the codebase, or wants to understand a particular subsystem deeply), gated mode is the natural call. For cases where the practitioner wants targeted teaching engagement on specific WPs without committing the whole BUILD to gated mode, the **mid-phase shift** mechanic (§4) is the right tool — start in auto mode and shift to gated when a WP warrants engagement, then shift back if the remaining WPs are mechanical. Lexical dominance of teaching over the other axes is not the framing; teaching's weight informs the choice but does not override Axis 1's mechanical-vs-generative reading or the practitioner's availability assessment.

### 4. Mode declaration

The practitioner declares the mode at BUILD entry. The declaration is recorded in `cycle-status.md` under the active cycle entry as `**BUILD mode:** auto` or `**BUILD mode:** gated`. Absence defaults to `gated` — not because it is universally safer (well-prepared mechanical cycles are not better served by gates), but because it is the **existing canonical pattern** with the most operational track record. Auto mode is opted-in by deliberate practitioner declaration; the conservatism preserves continuity with prior cycles and skills as written before this ADR.

**Lifecycle (per the per-entry header field pattern, ADR-072 / ADR-079 / ADR-090):**

- **Set by the practitioner at BUILD entry.** When the orchestrator dispatches `/rdd-build`, the orchestrator prompts the practitioner for the mode if the field is absent on the **active cycle entry**. (Re-prompting within a cycle that has already recorded the field is suppressed; the field's value persists across multiple `/rdd-build` invocations on the same active entry.) The default if the practitioner does not respond is `gated`. The orchestrator records the declaration on the active cycle entry.
- **Read at phase entry by `/rdd-build`.** The skill reads `**BUILD mode:**` and adapts accordingly. The adaptation is **Skill-Structure Layer** behavior (per ADR-067) — the skill text reads the field and conditions its workflow steps; the field is not enforced by a hook predicate. The Stop-hook manifest check does not assert on `**BUILD mode:**` value.
- **Shifted mid-phase by practitioner edit.** A cycle that started in auto mode can shift to gated if a WP surfaces unexpected complexity; a cycle that started gated can shift to auto if the practitioner needs to step away and the remaining WPs are mechanical. The shift is a small edit to `cycle-status.md`. The next `/rdd-build` invocation reads the new value.
- **Cleared at BUILD exit.** When BUILD completes, the field can stay on the cycle entry as a historical record of how the cycle ran, or be removed. **Cross-cycle inheritance is not supported** — a persisted value on a prior cycle entry is a starting point for the practitioner's reasoning at the next cycle's BUILD entry, not a default the orchestrator silently inherits. Each new cycle re-evaluates the mode against its own four-axis assessment; the orchestrator prompts on each new active cycle entry that lacks the field, regardless of what prior cycle entries record. This preserves the opt-in commitment from §4 paragraph 1: each cycle's auto mode is a deliberate practitioner declaration for that cycle, not a setting that drifts forward unexamined.

**Conformance posture.** Per the conformance audit (`/rdd-conform`), absence of the field is not a finding — `gated` is the documented default. Presence with an unrecognized value (e.g., `**BUILD mode:** mixed`) is a soft note: the field's recognized values are `auto` and `gated`; unrecognized values are treated as `gated`.

The declaration affects skill behavior: `/rdd-build` reads the field at phase entry and adapts. In auto mode, scenario-group gates are suppressed (the agent proceeds through WPs autonomously); in gated mode, gates fire as currently specified.

### 5. Scope-of-claim — what dual-mode does and does not provide

**Provides:**

- Methodology-level recognition that auto-mode BUILD is a legitimate pattern, not a deviation.
- Named axes the practitioner can use to choose between modes for a specific cycle.
- Skill-text adaptation so the agent's behavior matches the declared mode. The adaptation is **Skill-Structure Layer** behavior (per ADR-067) — the skill text reads `**BUILD mode:**` and conditions its workflow steps. The Stop-hook manifest check does not enforce on the field's value; the field is a skill-behavior signal, not a structural assertion.
- A natural language for cycle retrospectives — *"this was an auto-mode cycle; the WP-D partition design didn't get an alternative-examination check, which is the auto-mode tradeoff"* — rather than treating the absence of gates as a methodology violation.

**Does not provide:**

- A guarantee that auto-mode BUILD catches everything gated-mode catches. The two failure modes the snapshot named (design-alternative examination; scoping-judgment surfacing) are real costs of auto mode. The methodology's response is to make the cost visible and let the practitioner choose, not to claim the cost away.
- A mechanical decision rule. The four axes are judgment-applied; cycle character determines the right mode. The methodology surfaces the question; the practitioner answers it.
- An automatic mode shift. The agent does not unilaterally switch modes mid-phase; the practitioner edits `cycle-status.md` to record the shift.

## Rejected alternatives

**Keep gated mode as the only canonical pattern; treat auto mode as off-the-record practitioner choice.** Rejected. Auto-mode BUILD happens routinely (Cycle 017 is one example; previous cycles have run similar patterns). Treating it as off-the-record produces a methodology-vs-practice gap: practitioners who run auto mode have no language for what they're doing, no axes for deciding when it is appropriate, and no skill-text adaptation. The build snapshot's Feed-forward Signal E surfaced this as methodology debt; this ADR closes the gap.

**Promote auto mode to canonical; treat gated mode as a heavyweight option.** Rejected. The two failure modes auto mode does not catch (design-alternative examination; scoping-judgment surfacing) are real and consequential. Cycles where the BUILD scope is generative — likely to reveal new questions or design flaws — need gated mode. Promoting auto mode would push practitioners toward the lighter pattern in cases where the heavier pattern catches things the lighter one cannot.

**Define a continuous spectrum rather than a binary.** Considered. The four axes are continuous; cycle character could place a particular cycle anywhere along them. Rejected because a binary decision is structurally implementable (the skill reads `**BUILD mode:**` and adapts) while a true spectrum is not (the skill cannot adapt to "67% auto-mode"). The four axes inform the binary choice; the binary choice drives the skill behavior.

**Define a parameterized binary (e.g., a `**EPISTEMIC GATE density:**` field with named positions like `every-WP`, `boundary-only`, `end-only`).** Considered. The corpus has prior art for parameterized binary fields (ADR-072's `**Skipped phases:**` enumerates phases as a list rather than a binary; ADR-079's `**In-progress gate:**` names a specific boundary rather than a generic "gated" state). A parameterized form would express the same range as the binary plus the mid-phase shift mechanic in a single declaration. Deferred to a future cycle for v1 simplicity — the binary plus the mid-phase shift mechanic covers the practitioner-articulated commitment ("both modes are applicable for different reasons") without requiring a third concept (gate-position vocabulary). If the binary plus mid-phase shift produces operational friction in practice, a future cycle can revisit and parameterize.

**Encode mode selection as an automatic decision the agent makes based on cycle characteristics.** Rejected. Per Invariant 8, mechanisms whose firing depends on judgment cannot be specified as unconditional structural mechanisms. The mode-selection judgment depends on practitioner availability, cycle stakes, and pedagogical goals — none of which the agent can reliably evaluate from cycle artifacts alone. Practitioner declaration is the structurally honest form.

**Add a third mode (e.g., "hybrid mode" with selective gating).** Considered. A third mode would gate at some scenario-group boundaries (the high-stakes ones) and skip others (the mechanical ones). Rejected for v1 — the binary decision is the structurally simple form; future cycles that observe the binary as too coarse can revisit. The mid-phase shift mechanic (§4) provides a pragmatic version of selective gating without naming it as a third mode.

**Defer the ADR to a future cycle (Cycle 018+).** Rejected. The build-phase Susceptibility Snapshot named the methodology debt in this cycle; the practitioner committed to landing the framing in-cycle at the BUILD-exit gate (recorded in `.rdd/gates/017-build-gate.md`). Deferring would leave the corpus with the auto-mode pattern unrecognized through another cycle. The mini-amendment scope (one ADR + one skill-text addition + one fixture test) fits within Cycle 017's BUILD phase as a Design Amendment per the build skill's existing pattern, extended from system-design amendments to methodology amendments.

## Consequences

**Positive:**

- The methodology recognizes how BUILD actually runs in many cycles. Auto-mode practitioners have language and axes for what they're doing.
- The skill text adapts to the declared mode, removing the methodology-vs-practice gap.
- Cycle retrospectives have natural language for what each mode catches and what it does not. The build snapshot's Feed-forward Signal E becomes a reusable diagnostic frame for future cycles.
- Mode declaration is a small mechanical edit to `cycle-status.md` with no upstream changes (no domain-model amendment; no invariant change; no scenarios update). The amendment lands cleanly.

**Negative:**

- Practitioners adopting RDD must now reason about mode selection, adding one more decision to the cycle entry. Mitigation: the default (`gated`) is the safer pattern; practitioners need to opt into auto mode deliberately. Practitioners who are not yet sure can stay with the default.
- Auto mode's two failure modes (design-alternative examination; scoping-judgment surfacing) are now methodology-recognized as costs, not defects. Practitioners running auto mode know what they are accepting. This is honest scope-of-claim but reduces the methodology's "we catch everything" framing.
- The mid-phase shift mechanic (§4) is a small operational complexity — practitioners can edit the field manually but the orchestrator does not currently automate the shift. Future cycles may add orchestrator-level mode-shift detection if the operational cost surfaces.

**Neutral:**

- The four axes are judgment-applied; cycle character determines the right mode. The methodology surfaces the question; the practitioner answers it. This is consistent with the methodology's existing posture on judgment-applied mechanisms (e.g., ADR-087's validation-spike trigger).
- The declaration is informational, not enforced. The Stop-hook manifest check does not gate on `**BUILD mode:**` value; it is a skill-behavior signal, not a structural assertion.
- The amendment is methodology-level, not domain-model-level. No new vocabulary is added to `domain-model.md` in this cycle; whether "Auto Mode" / "Gated Mode" / "Mode Declaration" warrant domain-model entries is a future-cycle question.

## Provenance check

- **The dual-mode commitment:** user-articulated at the BUILD-exit gate of Cycle 017 (recorded in `.rdd/gates/017-build-gate.md`). The user's specific commitment: *"adding that framing would be useful context for the agent and user in the future. There are circumstances where both modes are applicable for different reasons."* User-surfaced; driver-derived.
- **The mechanical-vs-generative axis (Axis 1):** named in the build-phase Susceptibility Snapshot (`docs/housekeeping/audits/susceptibility-snapshot-017-build.md`) as the snapshot's framing for what auto mode handles. Driver-derived; snapshot-named.
- **The practitioner-availability axis (Axis 2):** drafting-time synthesis composed against the user's articulation at the gate that "circumstances" plural include availability/cognitive-budget considerations. Agent composition; user-articulation-derived.
- **The cycle-stakes / reversibility axis (Axis 3):** drafting-time synthesis composed against the methodology's existing posture on stakes (e.g., production-system vs. methodology-internal work). Agent composition; pattern-derived.
- **The catching-vs-teaching axis (Axis 4):** drafting-time synthesis composed against the AID cycle's pedagogical framing in the orchestrator skill (the gate's pedagogical moves — challenge / probe / teach / clarify / re-anchor). Agent composition; orchestrator-skill-derived.
- **The mode-declaration mechanic (`**BUILD mode:**` field):** drafting-time synthesis modeled on ADR-072 / ADR-078 / ADR-079 / ADR-090's existing per-entry header field pattern. Agent composition; pattern-derived.
- **The default-gated commitment:** drafting-time synthesis. The user did not explicitly declare which mode should be the default; the agent chose `gated` because it is the existing canonical pattern and the safer choice for practitioners new to the dual-mode framing. Agent composition; methodology-conservatism-derived.
- **The rejected-alternatives section:** drafting-time synthesis examining the design space against the user-articulated commitment. Agent composition; design-space-derived.

**Result:** The dual-mode commitment and the mechanical-vs-generative axis are driver-derived. The other three axes (practitioner availability, cycle stakes, catching-vs-teaching) are agent-composed against driver-derived material. The mode-declaration mechanic and the default-gated choice are agent composition. The user-articulated commitment is recorded faithfully and labeled as user-derived rather than absorbed silently as agent composition. No synthesis-moment framing adoption detected — the user's articulation drives the ADR's existence; the specific axes and mechanics are the agent's composition responsive to that articulation, marked as such.

## Skill-text and cycle-status amendments

The amendment lands as:

- **`skills/build/SKILL.md`** — new "BUILD Mode Selection" subsection at the top of `## PROCESS`, documenting the two modes, the four axes, the declaration mechanic, and the mid-phase shift.
- **`skills/rdd/SKILL.md`** — orchestrator's cycle-status.md schema documentation gains a `**BUILD mode:**` entry under the per-cycle header fields list.
- **`hooks/tests/test_build_mode_selection_documented.sh`** — skill-text-anchoring fixture verifying the dual-mode framing is encoded.

No ADR supersession; this is a new ADR adding a methodology principle. No downstream artifact sweep; no existing artifact references the dual-mode framing yet.

# Argument Audit Report

**Audited document:** docs/decisions/adr-091-dual-mode-build.md
**Source material:** docs/decisions/adr-064-compound-check-hooks.md, docs/decisions/adr-066-user-tooling-layer.md, docs/decisions/adr-067-three-tier-enforcement-classification.md, docs/decisions/adr-072-cycle-shape-declaration.md, docs/decisions/adr-079-non-interrupting-stop-predicate.md, docs/decisions/adr-088-adr-064-advisory-demotion.md, docs/decisions/adr-090-in-progress-phase-role-shift.md, skills/build/SKILL.md, .rdd/audits/susceptibility-snapshot-017-build.md, .rdd/cycle-status.md
**Prior audit:** .rdd/audits/argument-audit-decide-091.md (6 findings: 4 P2 + 2 P3)
**Date:** 2026-04-28

---

## Re-Audit: Prior Finding Resolution

The six prior findings and how each was addressed in the revised text:

**P2.1 — Default-gated rationale (safer framing)**
The §4 sentence now reads: "Absence defaults to `gated` — not because it is universally safer (well-prepared mechanical cycles are not better served by gates), but because it is the **existing canonical pattern** with the most operational track record." The global safety claim is gone. The conservatism rationale is accurate and grounded. **Resolved. No residual.**

**P2.2 — Mode declaration lifecycle gap**
§4 now contains a full Lifecycle section with four named sub-items (Set / Read / Shifted / Cleared), modeled explicitly on the per-entry header field pattern from ADR-072, ADR-079, and ADR-090. Each item names who acts, when, what the default is, and what the conformance posture is. The implementer gap from the prior audit is closed. **Resolved. See new P3.1 below for a precision note introduced by the correction.**

**P2.3 — "Regardless of the other axes" overreach (Axis 4)**
The Axis 4 description now reads: "When teaching is a significant need... gated mode is the natural call. For cases where the practitioner wants targeted teaching engagement on specific WPs without committing the whole BUILD to gated mode, the **mid-phase shift** mechanic (§4) is the right tool... Lexical dominance of teaching over the other axes is not the framing; teaching's weight informs the choice but does not override Axis 1's mechanical-vs-generative reading or the practitioner's availability assessment." The prior overreach is corrected, and the mid-phase shift mechanic is explicitly named as the remedy for targeted engagement cases. **Resolved. No residual.**

**P2.4 — Reversibility vs. epistemic framing in auto-mode "When to use"**
The auto mode "When to use" now reads: "The cycle's stakes are bounded — measured along epistemic dimensions (would a missed design alternative or scoping compression be expensive to undo?) as much as along reversibility dimensions. Auto mode is appropriate when the epistemic cost of self-administered stewardship is small: the design space is well-explored upstream and the scoping choices are constrained by ADRs." The reversibility-only framing is replaced with an explicit epistemic-cost framing. **Resolved. No residual.**

**P3.1 — Parameterized binary not acknowledged in rejected alternatives**
A new rejected alternatives entry now reads: "Define a parameterized binary (e.g., a `**EPISTEMIC GATE density:**` field with named positions like `every-WP`, `boundary-only`, `end-only`)." The entry acknowledges ADR-072 and ADR-079 prior art explicitly, explains why the binary plus mid-phase shift covers the practitioner-articulated commitment, and defers to a future cycle if operational friction surfaces. **Resolved. No residual.**

**P3.2 — Skill-text adaptation channel not named (Tier 2 vs. enforcement)**
The §4 Lifecycle "Read" item now states: "The adaptation is **Skill-Structure Layer** behavior (per ADR-067) — the skill text reads the field and conditions its workflow steps; the field is not enforced by a hook predicate. The Stop-hook manifest check does not assert on `**BUILD mode:**` value." The same precision is repeated in the §5 scope-of-claim "Provides" bullets. Both additions correctly name the enforcement channel. **Resolved. No residual.**

---

## Section 1: Argument Audit

### Summary

- **Argument chains mapped:** 7 (unchanged from prior audit — the same seven inferential chains)
- **Issues found:** 2 (0 P1, 0 P2, 2 P3)

The prior audit's four P2 issues and two P3 issues are all resolved. Two new minor issues were introduced by the P2.2 correction's lifecycle section. Neither rises above P3.

---

### P1 — Must Fix

No P1 issues found.

---

### P2 — Should Fix

No P2 issues found.

---

### P3 — Consider

**Issue P3.1 — Lifecycle "Cleared" item introduces a weak claim about cross-cycle defaulting**

- **Location:** §4 Lifecycle, "Cleared at BUILD exit" bullet
- **Claim:** "When BUILD completes, the field can stay (carries forward to the next cycle as a default) or be removed (the next cycle's BUILD entry prompts again). Practitioner discretion."
- **Evidence gap:** The ADR does not specify what "carries forward as a default" means operationally. If a prior cycle ran `auto` and the field persists into the next cycle, the next cycle's BUILD entry reads `auto` without the practitioner having evaluated the axes for that cycle. This is consistent with the ADR's "deliberate declaration" framing — the field was deliberately set — but it produces a de facto auto-mode default for the next cycle from the residue of the prior one, which undercuts the "auto is opted-in" rationale. The ADR does not name this interaction, and the conformance posture (unrecognized values treated as `gated`; absence defaults to `gated`) does not cover the "recognized-value-from-prior-cycle" case.
- **Recommendation:** Add a one-sentence note: "Practitioners carrying the field forward should verify the next cycle's character still fits auto mode at BUILD entry; a persisted `auto` declaration from a prior cycle is a starting point for the evaluation, not a substitute for it." This is a brief epistemic honesty note, not a structural change.

**Issue P3.2 — "Read at phase entry" item in Lifecycle is ambiguous about who triggers the prompt when the field is absent**

- **Location:** §4 Lifecycle, "Set by the practitioner at BUILD entry" bullet
- **Claim:** "When the orchestrator dispatches `/rdd-build`, the orchestrator prompts the practitioner for the mode if the field is absent and a previous BUILD has not already recorded it."
- **Evidence gap:** The "and a previous BUILD has not already recorded it" clause is ambiguous. It is unclear whether this means (a) the field is absent in the active cycle's entry but a prior cycle entry has the field, or (b) the field has never appeared in the cycle-status document. Under reading (a), the orchestrator would skip the prompt if any prior cycle recorded `auto` — which may be the intended carry-forward behavior, but it is not stated as such. Under reading (b), the clause is vacuous: field absence already implies no previous BUILD recorded it in this cycle. The ambiguity is minor but could confuse implementers of the orchestrator's prompt logic.
- **Recommendation:** Clarify: "When the orchestrator dispatches `/rdd-build`, the orchestrator prompts the practitioner for the mode if the field is absent on the active cycle entry. The default if the practitioner does not respond is `gated`." Remove the "and a previous BUILD has not already recorded it" clause or replace it with explicit cross-cycle carry-forward semantics (e.g., "if a prior cycle entry records a mode and the field is absent on the active entry, the orchestrator may offer the prior value as a default starting point for the practitioner's evaluation, not as a silent carry-forward").

---

## Section 2: Framing Audit

The six prior framing-audit findings (Alternative Framings A/B/C, Available Truths T1/T2/T3, Framing Issues FF-P2.1/FF-P2.2/FF-P3.1) were held for user judgment and not auto-corrected. This section re-evaluates whether any of the six argument-audit corrections changed the framing landscape.

---

### Impact of Corrections on Prior Framing Findings

**FF-P2.1 (Single-cycle legitimization without compensating mechanism)**
The P2.4 correction added explicit epistemic-cost framing to the auto-mode "When to use" criteria. The P2.3 correction softenened Axis 4's teaching dominance and introduced the mid-phase shift as the targeted engagement mechanism. Neither correction adds a compensating check for the design-alternative-examination gap that the susceptibility snapshot named. The core framing-audit finding stands: the ADR legitimizes auto mode as an equal methodology peer of gated mode on the basis of single-cycle evidence, without adding any mechanism to compensate for the two named failure modes. The scope-of-claim section continues to name those failure modes honestly, but the framing remains one of recognition and balance rather than recognition with provisional qualification.

**FF-P2.2 (Parameterized binary not acknowledged)**
The P3.1 correction adds a rejected-alternatives entry for the parameterized binary, explicitly naming ADR-072 / ADR-079 prior art. FF-P2.2 is **substantially resolved**. The framing now acknowledges the intermediate form rather than presenting the choice as binary vs. continuous spectrum. No residual framing gap remains at the recommended severity.

**FF-P3.1 (Heavy-lifting framing supports inverted default)**
The "heavy lifting" framing in Context remains unchanged. The framing still reads more naturally as motivation for auto mode being the expected case than as motivation for it being the opt-in deviation. The P2.1 correction's revised default rationale (conservatism / canonical pattern, not universal safety) partially addresses this — the default is now justified on conservatism grounds, not on the claim that gated is better for all cycles. But the heavy-lifting argument in Context and the conservatism rationale in §4 still point in somewhat different directions. FF-P3.1 remains as a minor framing tension to name for user awareness.

---

### Framing Audit — Updated Questions

The three structural questions are re-run against the revised text to verify the prior framing findings.

#### Question 1: What alternative framings did the evidence support?

The three alternative framings from the prior audit remain available in the source material and are not engaged by the corrected text:

**Alternative Framing A (Disclosure requirement rather than full recognition)** — unchanged. The susceptibility snapshot Signal E still recommends a future DECIDE examination; the ADR still legitimizes the mode without adding a compensating mechanism. The P2.4 epistemic-cost reframe improves the "When to use" precision but does not address the recognition scope.

**Alternative Framing B (Gate density as the right variable, not mode binary)** — partially closed by the new parameterized-binary rejected-alternatives entry. The alternative is now acknowledged rather than elided, which reduces the framing gap from its prior severity. Residual: the entry frames the parameterized binary as deferred for simplicity, but does not engage with whether the mid-phase shift mechanic actually provides equivalent expressiveness (practitioners who want a gate at WP-D and nowhere else must shift mid-phase rather than declaring `gate-density: WP-D`).

**Alternative Framing C (Retrospective label rather than prospective declaration)** — unchanged. The revised text makes no reference to retrospective annotation as an alternative form.

#### Question 2: What truths were available but not featured?

The three available truths from the prior audit remain unincorporated, consistent with the user-judgment decision at the prior audit:

**T1 (Snapshot recommended future DECIDE examination, not in-cycle landing)** — the new rejected-alternatives entry for "Defer the ADR to a future cycle" still gives the gate commitment as the primary reason for in-cycle landing without engaging Signal E's specific recommendation. The omission is unchanged.

**T2 (Narrow circularity risk — agent authored the constraint and the ADR diagnosing it)** — the provenance section continues to label the axes as agent composition, which is partial transparency, but the WP-D circularity pattern is not applied reflexively to the ADR itself. Unchanged.

**T3 (ADR-072 and ADR-079 include lifecycle failure-mode analysis and conformance posture)** — partially incorporated. The P2.2 correction added a lifecycle specification and the P2.3 Conformance Posture bullet addresses one gap. However, the ADR still does not include a failure-mode analysis for incorrect declarations (e.g., `auto` declared on a generative cycle, or `auto` persisted from a prior cycle without re-evaluation). ADR-079's failure-mode analysis (safe failure mode / unsafe failure mode treatment) is not matched. The new P3.1 in Section 1 above names the most consequential gap.

#### Question 3: What would change if the dominant framing were inverted?

The revised text shifts slightly toward accommodating the inverted framing: the default is now justified on conservatism grounds (not universal safety), which makes the framing more honest about gated mode being the historically-present pattern rather than the categorically superior one. The epistemic-cost reframe in auto-mode "When to use" also improves the precision of the trade-off language. Neither change addresses the structural tension FF-P3.1 names: the "heavy lifting" argument in Context still reads more naturally as support for auto mode being the expected case than for gated being the safe default.

The inverted framing's strongest claim — that the prior-phases-do-heavy-lifting argument supports auto mode as the expected execution form for well-prepared cycles — is not engaged by any of the corrections.

---

### Framing Issues — Updated

**FF-P2.1 — Prior finding: held for user judgment, unchanged**

- **Location:** §2, Auto mode "When to use" and the broader legitimization frame
- **Status:** Unchanged from prior audit. The epistemic-cost reframe (P2.4 correction) improves internal precision but does not add a compensating mechanism for the design-alternative-examination gap. The ADR legitimizes auto mode as a recognized methodology peer on single-cycle evidence and agent-composed axes. This remains a framing the user should be aware of but was explicitly preserved as user-judgment territory.
- **Current severity:** P2 (unchanged from FF-P2.1 prior)

**FF-P2.2 — Prior finding: substantially resolved by P3.1 correction**

- **Location:** Rejected alternatives — "Define a continuous spectrum rather than a binary"
- **Status:** The new parameterized-binary rejected-alternatives entry acknowledges the intermediate form and the corpus's prior art (ADR-072 / ADR-079). The prior framing gap — presenting the choice as binary vs. continuous spectrum while skipping the intermediate — is closed. A residual exists: the entry does not compare the mid-phase shift mechanic's expressiveness against a dedicated `EPISTEMIC GATE density:` field; the mid-phase shift is asserted as sufficient rather than demonstrated to be equivalent. This is a minor precision point.
- **Current severity:** P3 (downgraded from P2 by the correction)

**FF-P3.1 — Prior finding: partially mitigated, tension persists**

- **Location:** Context, final paragraph — "The decide → architect → build pipeline already does most of the heavy lifting"
- **Status:** The P2.1 correction improved the default rationale (conservatism, not universal safety), which softens the tension between the heavy-lifting argument and the gated-as-default conclusion. But the heavy-lifting argument itself is unchanged and still reads more naturally as support for auto mode being the expected case. The two-direction pull (heavy lifting in Context → auto mode expected; conservatism in §4 → gated default) is now named on both sides of the ADR, reducing the implicit contradiction but not resolving the underlying framing tension.
- **Current severity:** P3 (unchanged)

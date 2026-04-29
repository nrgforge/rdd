# Argument Audit Report

**Audited document:** docs/decisions/adr-091-dual-mode-build.md
**Source material:** docs/decisions/adr-064-compound-check-hooks.md, docs/decisions/adr-066-user-tooling-layer.md, docs/decisions/adr-067-three-tier-enforcement-classification.md, docs/decisions/adr-072-cycle-shape-declaration.md, docs/decisions/adr-079-non-interrupting-stop-predicate.md, docs/decisions/adr-088-adr-064-advisory-demotion.md, docs/decisions/adr-090-in-progress-phase-role-shift.md, skills/build/SKILL.md, .rdd/audits/susceptibility-snapshot-017-build.md
**Prior audits:** .rdd/audits/argument-audit-decide-091.md (6 findings), .rdd/audits/argument-audit-decide-091-r2.md (2 P3 findings)
**Date:** 2026-04-28

---

## Re-Audit: Prior P3 Finding Resolution

The two P3 findings from the r2 audit and how the current text addresses each:

**P3.1 — Lifecycle "Cleared" item introduced a weak claim about cross-cycle defaulting**

The r2 finding: the "Cleared at BUILD exit" bullet said "the field can stay (carries forward to the next cycle as a default) or be removed," which left "carries forward as a default" operationally undefined and undercut the "auto is opted-in" rationale.

The r3 text reads: "When BUILD completes, the field can stay on the cycle entry as a historical record of how the cycle ran, or be removed. **Cross-cycle inheritance is not supported** — a persisted value on a prior cycle entry is a starting point for the practitioner's reasoning at the next cycle's BUILD entry, not a default the orchestrator silently inherits. Each new cycle re-evaluates the mode against its own four-axis assessment; the orchestrator prompts on each new active cycle entry that lacks the field, regardless of what prior cycle entries record. This preserves the opt-in commitment from §4 paragraph 1: each cycle's auto mode is a deliberate practitioner declaration for that cycle, not a setting that drifts forward unexamined."

The r2 vagueness is gone. The new text explicitly disclaims silent inheritance, names what a persisted value is (a starting point for reasoning, not a default), and ties the behavior back to the opt-in framing. **P3.1: Closed. No residual.**

**P3.2 — "Previous BUILD has not already recorded it" clause was ambiguous about prompt-suppression scope**

The r2 finding: the "Set by the practitioner at BUILD entry" bullet said "the orchestrator prompts the practitioner for the mode if the field is absent and a previous BUILD has not already recorded it," which admitted two incompatible readings.

The r3 text reads: "When the orchestrator dispatches `/rdd-build`, the orchestrator prompts the practitioner for the mode if the field is absent on the **active cycle entry**. (Re-prompting within a cycle that has already recorded the field is suppressed; the field's value persists across multiple `/rdd-build` invocations on the same active entry.) The default if the practitioner does not respond is `gated`. The orchestrator records the declaration on the active cycle entry."

The ambiguous cross-cycle clause is replaced with two clear, scoped statements: (a) absence on the active cycle entry triggers the prompt, and (b) within a cycle entry that already has the field, re-prompting is suppressed. The cross-cycle carry-forward semantics are handled in the Cleared bullet (P3.1's fix) rather than contaminating the Set bullet. The parenthetical makes the persists-across-invocations semantics explicit. **P3.2: Closed. No residual.**

---

## Section 1: Argument Audit

### Summary

- **Argument chains mapped:** 7
- **Issues found:** 0

The prior P3.1 and P3.2 findings are confirmed closed. The r3 revisions are precise, internally consistent with the opt-in framing, and consistent with the analogous lifecycle fields in ADR-072 (Skipped phases), ADR-079 (In-progress gate), and ADR-090 (In-progress phase). No new issues were introduced.

Each of the seven argument chains was re-examined against the full source material:

1. **Auto mode is legitimate, not a deviation** — grounded in the Cycle 017 BUILD evidence in the susceptibility snapshot and user gate commitment. The source material supports the claim; no overreach.

2. **The prior-phases-do-heavy-lifting justification for auto mode** — present in Context paragraph 4. The susceptibility snapshot's Signal E names this as a methodology question, and the ADR uses it as a motivating argument for the dual-mode framing. The claim is contingent on prior phases actually running and producing audited ADRs; the four-axis mode-selection criteria condition auto-mode appropriateness on this (Axis 1: "WPs trace 1:1 to ADRs"). The chain holds.

3. **Gated-mode default rationale (conservatism, not universal superiority)** — the r2 correction landed this accurately. The current text distinguishes conservatism from safety, which is the correct claim given the ADR's own framing that well-prepared mechanical cycles are not better served by gates.

4. **Four-axis mode-selection framework** — the axes are agent-composed and labeled as such in the Provenance section. The argument chain from the axes to the binary choice is sound; the axes are not claimed to be empirically derived, and the ADR does not overclaim their precision. The "judgment-applied" language is appropriate.

5. **Binary vs. spectrum/parameterized** — the rejected alternatives entry for the parameterized binary names ADR-072/ADR-079 prior art and explains why the binary plus mid-phase shift mechanic covers the practitioner-articulated commitment. The argument is internally consistent.

6. **Mode declaration lifecycle** — the r3 revisions are the focus of this re-audit. The current text accurately describes the lifecycle: set by orchestrator at active-cycle-entry boundary, suppressed within that entry, cleared at BUILD exit without cross-cycle inheritance, shifted by practitioner edit mid-phase. The lifecycle is now internally consistent and consistent with the analogous ADR-072/ADR-079/ADR-090 patterns.

7. **Honest scope-of-claim** — the auto-mode failure modes (design-alternative examination; scoping-judgment surfacing) are named in both the Decision section and the skill text. The "does not provide" list in §5 explicitly names what the dual-mode framing cannot deliver. No overclaiming detected.

### P1 — Must Fix

No P1 issues found.

### P2 — Should Fix

No P2 issues found.

### P3 — Consider

No P3 issues found.

---

## Section 2: Framing Audit

The framing audit examines whether the r3 revisions (which were targeted at the P3.1 and P3.2 lifecycle precision issues) changed anything in the framing landscape. The prior framing findings were explicitly held for user judgment and not auto-corrected. The question is whether the lifecycle corrections affect those findings' standing.

### Impact of R3 Corrections on Prior Framing Findings

The r3 corrections are confined to the §4 Lifecycle section — the "Cleared at BUILD exit" bullet and the "Set by the practitioner at BUILD entry" bullet. Neither touches Context, the mode-selection axes, the scope-of-claim section, or the rejected alternatives. The corrections do not introduce new evidence about the dual-mode framing's appropriateness or scope.

**FF-P2.1 (Single-cycle legitimization without compensating mechanism for the design-alternative-examination gap):** Unchanged. The Cleared/Set bullet corrections are lifecycle mechanics, not framing scope. The ADR still legitimizes auto mode as a recognized methodology peer on the basis of Cycle 017 evidence and agent-composed axes, without adding a mechanism to compensate for the two named failure modes. This remains user-judgment territory.

**FF-P3.1 (Heavy-lifting argument in Context reads more naturally as support for auto mode being the expected case than for gated being the safe default):** Unchanged. The r3 corrections do not touch Context paragraph 4 or the default rationale. The tension between the heavy-lifting argument and the conservatism-grounded default remains exactly as characterized in the r2 audit.

The lifecycle corrections are precision edits that do not touch the framing's substantive scope or the evidence base. No previously-open framing finding changes severity.

---

### Question 1: What alternative framings did the evidence support?

The three alternative framings from the prior audits remain available in the source material and are not engaged by the r3 text:

**Alternative Framing A (Disclosure requirement rather than full recognition):** The susceptibility snapshot Signal E recommended a future DECIDE examination of whether auto-mode BUILD should include a structured mid-phase user touchpoint. The ADR lands in-cycle recognition without adding such a mechanism. The "Defer the ADR to a future cycle" rejected alternative gives the gate commitment as the primary reason for in-cycle landing; it does not engage Signal E's specific recommendation about mid-phase touchpoints. For a reader to accept Alternative Framing A as the right approach, they would need to believe that single-cycle evidence plus agent-composed axes is insufficient grounding for full methodology recognition, and that the two named failure modes are consequential enough to warrant a compensating mechanism before recognition is granted. The source material (Signal E, Signal D) supports those beliefs.

**Alternative Framing B (Gate density as the right variable, not mode binary):** Acknowledged in the parameterized-binary rejected alternative (added in r2, unchanged in r3). The residual framing gap — whether the mid-phase shift mechanic provides equivalent expressiveness to a dedicated gate-density field — is not engaged. A reader wanting full framing closure would need the ADR to demonstrate equivalence, not merely assert it. The r3 corrections do not address this.

**Alternative Framing C (Retrospective label rather than prospective declaration):** Unchanged. The ADR specifies prospective declaration at BUILD entry; it does not acknowledge that the mode could be recorded retrospectively at BUILD exit as a cycle annotation. The source material (the Cycle 017 auto-mode BUILD that this ADR is rationalizing) is itself retrospective evidence; the framing converts it into a prospective declaration mechanism. That conversion is a deliberate design choice, but the retrospective-labeling alternative is not examined.

### Question 2: What truths were available but not featured?

The three available truths from prior audits remain unincorporated:

**T1 (Susceptibility snapshot Signal E recommended future DECIDE examination, not in-cycle landing):** Unchanged. The r3 corrections are lifecycle mechanics and do not engage this. The Provenance section labels the axes as agent-composed but does not carry Signal E's hedging forward into the ADR's own scope.

**T2 (Narrow circularity — the agent authored the ADR-090 constraint language that drove the WP-D implementation design without external check between them):** Unchanged. The r3 corrections are unrelated to this pattern.

**T3 (ADR-079's failure-mode analysis for incorrect declarations not matched):** The r3 P3.1 fix adds explicit cross-cycle inheritance disclaimer and four-axis re-evaluation requirement, which addresses the most consequential gap (persisted-value carry-forward). ADR-079's analogous failure-mode analysis covers both the safe failure mode (field not set: existing behavior) and the unsafe failure mode (field set but not cleared: silent skip). The ADR-091 lifecycle section specifies what happens when the field is absent (orchestrator prompts, default is `gated`) and what cross-cycle inheritance is not (silent carry-forward). It does not specify what happens when a practitioner declares `auto` on a generative cycle — i.e., what the methodology's response to an incorrect declaration is. ADR-079 names the unsafe failure mode and its observability mitigation explicitly; ADR-091 does not have an analogous treatment. This remains a minor precision gap that T3 from the prior audit identified. The r3 correction improved but did not fully close it.

### Question 3: What would change if the dominant framing were inverted?

The dominant framing: auto mode is a legitimate peer of gated mode, distinguished by cycle character along four axes, with gated as the conservative default.

Inverted: auto mode is a recognized deviation with named costs, appropriate only when gated mode's full structure would impose disproportionate overhead, with auto as the opt-in exception and the methodology's posture being one of cautious permission rather than equal recognition.

Under the inverted framing:
- The "heavy lifting" argument in Context becomes the motivation for why auto mode is ever permitted rather than why it is a legitimate equal.
- The four axes become criteria for evaluating whether deviation is warranted rather than criteria for choosing between peers.
- The scope-of-claim "Provides" bullet "methodology-level recognition that auto-mode BUILD is a legitimate pattern, not a deviation" would read as "methodology-level acknowledgment that auto-mode BUILD is a deviation with named conditions under which it is permitted."
- The naming of two failure modes would be more prominent — not as honest scope-of-claim on an equal peer, but as the cost structure of a permitted exception.

The r3 corrections do not change this tension. The lifecycle section's cross-cycle-inheritance disclaimer and the explicit opt-in framing ("each cycle's auto mode is a deliberate practitioner declaration for that cycle, not a setting that drifts forward unexamined") are more consistent with the inverted framing than the dominant one: the language treats auto mode as something that must be re-earned per cycle, not as a standing peer. The corrected lifecycle language introduces a mild internal tension with the "recognized peer" framing of the Decision section, which the r2 and r3 audits did not previously flag. This tension is below P3 severity — it does not change conclusions, and it is the natural consequence of making opt-in explicit while the broader framing maintains peer status.

### Framing Issues — Updated

**FF-P2.1 — Prior finding: held for user judgment, unchanged**

- **Location:** §2, Auto mode "When to use" and the broader recognition frame
- **Status:** Unchanged from r2 audit. The r3 lifecycle corrections do not affect this finding's scope or severity. The ADR grants full methodology recognition to auto mode on the basis of Cycle 017 evidence and agent-composed axes, without a compensating mechanism for the design-alternative-examination gap the susceptibility snapshot named. This is a framing choice the user explicitly held in judgment territory; naming it here for continuity.
- **Current severity:** P2 (unchanged)

**FF-P3.1 — Prior finding: unchanged**

- **Location:** Context, final paragraph — the "heavy lifting" argument
- **Status:** The r3 corrections do not touch Context. The tension between the heavy-lifting argument (reads as support for auto mode being the expected execution form) and the conservatism-grounded default (reads as support for gated being the safe anchor) remains as characterized in the r2 audit. The corrected lifecycle language's opt-in framing pulls slightly more toward the inverted framing than the heavy-lifting paragraph does, adding a minor internal-consistency note rather than resolving the tension.
- **Current severity:** P3 (unchanged)

---

## Overall Assessment

The two P3 findings from the r2 audit are confirmed closed. No new issues were introduced. The framing-audit findings (FF-P2.1 and FF-P3.1) are held for user judgment at their prior severities, and the r3 corrections did not change their standing. The ADR is in a clean state at the argument-audit level, with the framing-audit findings surfaced and documented for user decision.

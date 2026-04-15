# Argument Audit Report — Re-audit (Pass 3)

**Audited document:** `/Users/nathangreen/Development/rdd/docs/decisions/adr-071-lifecycle-composition-in-build-stewardship.md`
**Source material:**
- `/Users/nathangreen/Development/rdd/skills/build/SKILL.md` (COMPOSABLE TESTS §L366-387, STEWARDSHIP CHECKPOINTS §L430-465, Integration Verification Step 5 §L213-224)
- Issue #10 (inline, the architectural driver — full text in first-pass audit)
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-046-review-build-integration.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-048-composable-skill-family.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-052-ai-smell-detection-in-refactor-skill.md`
- `/Users/nathangreen/Development/rdd/docs/domain-model.md` §Invariants (Invariant 8, L659-678)
- Pass 1 audit: `/Users/nathangreen/Development/rdd/docs/housekeeping/audits/argument-audit-decide-015.md`
- Pass 2 audit: `/Users/nathangreen/Development/rdd/docs/housekeeping/audits/argument-audit-decide-015-reaudit.md`
**Date:** 2026-04-13

---

## Re-audit scope

Pass 2 flagged one argument issue (P2-A new): "structural composition" survived in the Decision opening after the Context relabeling, creating a two-name split for the same category. Two edits were applied to address that finding:

1. Decision §opening (line 29) — updated from "structural composition and structural boundaries" to "test-suite composition (Composable Tests) and structural-boundary verification (Integration Verification + Stewardship Tier 1)."
2. Context §concluding sentence (line 13) — updated to name the two-framing distinction explicitly: risk-domain framing (type boundaries / structural boundaries / lifecycle boundaries) and skill-section framing (test-suite composition / structural-boundary verification / lifecycle composition).

Three framing issues (Framing P2-A, P2-B, P3-A) remain deliberately open at the user's epistemic gate. This pass:

1. Verifies both argument fixes are clean and introduces no new issues.
2. Checks for any residual "structural composition" occurrences introduced or missed by the partial-application pattern that produced the pass 2 finding.
3. Re-reports the three carry-forward framing issues unchanged.

---

## Section 1: Argument Audit

### Summary

- **Argument chains mapped:** 5 (unchanged from passes 1 and 2)
- **Issues found:** 1

---

### Fix verification — P2-A (Decision opening)

**Status: Clean at line 29. Residual occurrence found at line 80.**

The Decision §opening (line 29) now reads: "Lifecycle composition is a named category in build stewardship, sitting alongside test-suite composition (Composable Tests) and structural-boundary verification (Integration Verification + Stewardship Tier 1)." This is consistent with the Context section's relabeled framing and correctly names both skill-section categories. The two-sided parenthetical anchoring (Composable Tests / Integration Verification + Stewardship Tier 1) closes the gap that pass 2 identified.

The Context §concluding sentence (line 13) now reads: "Neither addresses risk at a third kind of boundary: lifecycle boundaries — where the sequence of operations and ownership of shared mutable state between components determines correctness. The skill-side category for guiding work at lifecycle boundaries is what this ADR names lifecycle composition." This successfully distinguishes the two framings: risk-domain (type boundaries / structural boundaries / lifecycle boundaries) and skill-section (test-suite composition / structural-boundary verification / lifecycle composition). The distinction is explicit and does not require the reader to infer it.

However, a third occurrence of "structural composition" was not updated: the Provenance check section (line 80) reads: "The core framing of this ADR — lifecycle composition as a third category alongside structural composition and structural boundaries — originates from Issue #10's problem statement." This is the same retired label. The Provenance check section describes the ADR's framing at the time of drafting — but "structural composition" is now a term the document has retired, and a reader encountering "structural composition" in the Provenance check section after reading the Decision section's "test-suite composition" will find the same naming inconsistency the pass 2 fix was intended to close. See P2-A (new) below.

---

### Fix verification — Context §two-framing introduction

**Status: Clean. No internal tension introduced.**

The revised Context sentence explicitly frames the distinction between the risk-domain vocabulary (boundary types) and the skill-section vocabulary (composition categories). This resolves the concern raised in pass 2's Argument Issue 2-A about the Consequences §Positive bullet 2 ("type boundaries, structural boundaries, and lifecycle boundaries") appearing to name the same partition as the Decision §opening's three-category model. The Context now makes clear these are two framings of the same gap. Consequences §Positive bullet 2 (line 62) reads "The skill's framing of integration risk becomes more complete: type boundaries, structural boundaries, and lifecycle boundaries as a three-category model" — this maps to the risk-domain framing introduced in Context, and is now correctly situated as describing integration-risk geography rather than skill-section taxonomy. The two partitions no longer appear to name identical things without acknowledgment.

---

### P1 — Must Fix

No P1 issues found.

---

### P2 — Should Fix

**Issue 2-A (new): The Provenance check section uses "structural composition" — the term the Decision fix retired.**

- **Location:** Provenance check §opening sentence (line 80)
- **Claim:** "The core framing of this ADR — lifecycle composition as a third category alongside structural composition and structural boundaries — originates from Issue #10's problem statement."
- **Evidence gap:** The Decision section (line 29) now uses "test-suite composition (Composable Tests)" and "structural-boundary verification (Integration Verification + Stewardship Tier 1)" — the relabeled terminology the pass 2 fix established. The Provenance check section was not updated to match. A reader reading the document top-to-bottom encounters "test-suite composition" and "structural-boundary verification" in Context and Decision, then hits "structural composition and structural boundaries" in Provenance check — the same two-name split that pass 2's fix was intended to eliminate. The Provenance check section describes the ADR's framing, so its vocabulary should track the ADR's current framing, not a pre-revision state.
- **Recommendation:** Update the Provenance check §opening to use the current terminology: "lifecycle composition as a third category alongside test-suite composition and structural-boundary verification." If the Provenance check intends to quote Issue #10's own language, that language should be placed inside a quotation or attributed explicitly so the reader knows it is the issue's vocabulary rather than the ADR's.

---

### P3 — Consider

No P3 issues found.

---

## Section 2: Framing Audit

The three framing issues from passes 1 and 2 are carried forward unchanged — they remain deliberately open at the user's epistemic gate. The two edits in this revision are terminology corrections that do not shift the ADR's overall framing. No new framing concerns are introduced by either edit.

---

### Question 1: What alternative framings did the evidence support?

*(Unchanged from passes 1 and 2 — reproduced for completeness.)*

**Alternative A: Frame the gap as a missing ownership-model primitive, not a missing test category.**

Issue #10 uses the phrase "ownership and mutation rights over a shared resource are ambiguous." This is a statement about an absent ownership model — there is no concept in the build skill's vocabulary that assigns ownership of a mutable resource across a module boundary. An alternative framing would treat the gap not as a missing test category but as a missing domain concept: the skill should define what "ownership transfer" means and require that each boundary make ownership transfer explicit. The test guidance would then derive from the ownership rule rather than being specified independently.

What the source material supports: Issue #10's three examples (cache buffer, connection pool, registry entry) are all cases where ownership is ambiguous — not merely cases where the test is absent. The framing selected (add a test guidance category and a checklist item) treats the detection mechanism; the alternative framing would treat the upstream cause.

What a reader would need to believe: that naming a test category is insufficient without a domain-level concept of ownership, and that the skill should make ownership explicit at the point of API design rather than catching violations at the point of review.

**Alternative B: Frame the addition as an expansion of integration verification (Step 5) rather than a separate COMPOSABLE TESTS subsection.**

Step 5 (Integration Verification, L213-224) already identifies neighbors, writes integration tests, and runs them. The lifecycle-sequence concern — does A's retained reference survive B's cleanup? — is an integration concern, not a test-composition concern. An alternative framing would extend Step 5's guidance directly: when writing the integration test in Step 5, also exercise the production lifecycle sequence if any boundary involves shared mutable state.

What the source material supports: Step 5 already names "persistence paths that diverge between test and production" as one of the things integration testing catches. Lifecycle-sequence failures are structurally similar. The COMPOSABLE TESTS section (as confirmed by SKILL.md L366-387) is primarily about test-suite optimization, not integration guidance per se.

What a reader would need to believe: that lifecycle composition is an integration concern (Step 5) rather than a test-design concern (COMPOSABLE TESTS), and that concentrating lifecycle guidance in one location (Step 5) is cleaner than splitting it between test design and stewardship.

**Alternative C: Treat lifecycle composition as a Tier 2 concern triggered by Tier 1's boundary coverage check, not a new Tier 1 sub-item.**

The existing Tier 1 already has a "boundary coverage" sub-item under Test Quality. The lifecycle concern is a refinement of that: not just "does an integration test exist for each boundary?" but "does the integration test exercise the production lifecycle sequence?" An alternative framing would annotate the existing boundary coverage item with lifecycle guidance rather than adding a new numbered sub-item, keeping Tier 1 concise and routing deeper analysis to Tier 2 when warranted.

What the source material supports: ADR-046 established that Tier 1 is "lightweight stewardship" and Tier 2 handles deeper architectural drift. The lifecycle-sequence check fires only when a module boundary returns a mutable reference — a specific structural condition resembling other Tier 2 triggers.

What a reader would need to believe: that the lifecycle check is conditional enough (fires only on shared-reference boundaries) that it belongs as a Tier 1 annotation rather than a standalone Tier 1 sub-item, reducing checklist length while preserving coverage.

---

### Question 2: What truths were available but not featured?

*(Unchanged from passes 1 and 2 — reproduced for completeness.)*

**Finding A: The "+1" wiring test in N+M+1 is structurally insufficient for lifecycle testing.**

Issue #10 identifies that "the '+1' wiring test passes because it tests a single operation, not the production lifecycle sequence." The ADR acknowledges this but does not make the implication explicit: for lifecycle-composition cases, the +1 test must be replaced or augmented with a multi-operation sequence. The ADR says the new subsection "adds a third dimension — ordered operations on shared mutable state — that the original framing does not cover," but it does not specify whether the lifecycle test replaces the +1 wiring test, augments it, or is a separately counted test. BUILD would benefit from this being stated explicitly.

The "neutral" consequence — "The system design's Test Architecture table may gain a row acknowledging lifecycle tests as a kind, or may not" — suggests the ADR is deliberately leaving open a question the issue's evidence already closes: lifecycle tests are a distinct kind.

**Finding B: The issue's three examples differ in severity and recovery cost.**

Issue #10's three examples (cache returns internal buffer / caller mutates / cache corrupted; pool hands out connection / caller closes / pool has dead entry; registry returns live entry / caller modifies field / invariants break) differ in how silently they fail and how expensive recovery is. The ADR treats all three as equivalent instances of the same bug class without noting that some are more insidious than others. The rationale for why this bug class is especially dangerous — silent propagation of invariant violations — is strongest for the registry case and weakest for the cache case.

This is a proportionate scope decision: the ADR is correctly focused on naming the category and specifying the remedy, not on ranking severity. Severity ranking belongs in the skill text or scenarios.

**Finding C: The provenance check section is novel for an ADR in this corpus.**

The ADR includes an explicit "Provenance check" section not present in prior ADRs (ADR-046, ADR-048, ADR-052 contain no equivalent). This addition appears without explanation of whether it is intended as a new ADR norm or a one-time addition. Its rationale — guarding against the concern that issue citations are fabrication rather than provenance preservation — is self-aware and useful, but future readers encountering an ADR without this section may not know whether the absence signals a provenance problem.

---

### Question 3: What would change if the dominant framing were inverted?

*(Unchanged from passes 1 and 2 — reproduced for completeness.)*

The dominant framing: lifecycle composition is a missing test-design category that must be named and added to the skill's guidance at two existing anchor points.

The inverted framing: lifecycle composition bugs are not a gap in the skill's test-design guidance but a gap in the skill's API-design guidance. The bug class exists because the API contract at each module boundary does not specify ownership. A better build skill would require ownership to be made explicit at the point of design — not catch ownership ambiguity at the point of testing.

Under the inverted framing:
- The composable-tests extension becomes weaker: you can name a test category for shared-mutable-state sequences, but if the boundary design does not make ownership explicit, the test author will not know which references are shared and which are copies. The test guidance depends on something the skill does not currently establish.
- The stewardship checklist item becomes stronger: "does any returned value share a mutable reference with internal state?" is closer to a design review question than a test question. If Tier 1 stewardship is the right place for it, the implicit claim is that design review is where ownership ambiguity should be caught — which is consistent with the inverted framing.
- The ADR would need to address: does the build skill have a notion of module API contracts (not just type boundaries)? If not, the lifecycle-composition guidance hangs in air — the test author is told to write lifecycle-sequence tests but has no rule for determining when a boundary is an ownership transfer.

The inverted framing does not invalidate the ADR's decision. Naming the test category and the checklist item are correct regardless of whether the skill also adds ownership-contract guidance. But the inversion reveals that the decision, as scoped, addresses the detection mechanism without addressing the upstream cause.

---

### Framing Issues

**Framing P2-A (carry-forward from passes 1 and 2): The COMPOSABLE TESTS extension may be placed in the wrong section for lifecycle reasoning.**

- **Location:** Decision §Extension 1 / Rejected Alternatives §"Introduce a standalone Step 5.5"
- **Issue:** The ADR rejects a standalone Step 5.5 on the grounds that "a separate step would bloat the build sequence without adding functionality beyond what the existing Integration Verification step already does when supplied with the right test design." This reasoning implicitly acknowledges that Step 5 is the natural home for lifecycle integration testing — yet the ADR places the lifecycle guidance in COMPOSABLE TESTS instead of Step 5. The rejected alternative's justification supports Alternative B (framing audit, Question 1) more than it supports the chosen placement.
- **Why this is P2 not P1:** Both placements are defensible, and the two-sided catch design (composable-tests for design time, stewardship for review time) is a genuine structural benefit. But the rejected-alternative reasoning undercuts the chosen placement.
- **Do not auto-correct.** Surface to user.

**Framing P2-B (carry-forward from passes 1 and 2): The scope exclusion of other composable skills relies on an asymmetry that is stated but not justified.**

- **Location:** Rejected Alternatives §"Extend lifecycle composition to every composable skill"
- **Issue:** The ADR argues that build is the right home because lifecycle composition fits naturally into build's scheduled steps, but debug and refactor also have structured steps where lifecycle composition is relevant. The reason for exclusion ("inherit build's orientation without duplicating its checklist") assumes that mode-shift inheritance propagates category awareness without arguing this. For solo developers or Everyday Developers using refactor standalone (the ADR-048 use case), the lifecycle category would be invisible unless explicitly named in the refactor skill.
- **Why this is P2 not P1:** The scope decision is defensible and the issue itself scopes to build. But the assumption that mode-shift inheritance propagates category awareness is load-bearing and unverified.
- **Do not auto-correct.** Surface to user.

**Framing P3-A (carry-forward from passes 1 and 2): The provenance check section lacks normative status.**

- **Location:** Provenance check section (final section of ADR)
- **Issue:** The section is present without explanation of whether it is intended as a new ADR norm or a one-time addition for this specific ADR. If it is a new norm, it should be reflected in the ADR template or a meta-ADR; if it is a one-time addition, its rationale should be stated so future readers know why ADR-071 has a section that earlier ADRs do not.
- **Do not auto-correct.** Surface to user.

---

### New framing concerns introduced by the revisions

None. The two edits are locally scoped terminology corrections. The Provenance check residual occurrence flagged in Argument Issue 2-A (new) is a terminology consistency problem, not a framing selection problem, and is correctly classified in Section 1.

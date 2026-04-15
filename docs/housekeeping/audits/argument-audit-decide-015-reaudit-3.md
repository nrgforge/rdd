# Argument Audit Report — Re-audit (Pass 4)

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
- Pass 3 audit: `/Users/nathangreen/Development/rdd/docs/housekeeping/audits/argument-audit-decide-015-reaudit-2.md`
**Date:** 2026-04-13

---

## Re-audit scope

Pass 3 identified a third occurrence of the retired "structural composition" label in the Provenance check section (line 80), which had not been updated when the Decision opening and Context sentence were corrected in pass 2. Two edits were applied before this dispatch:

1. **Line 80 (Provenance check opening sentence)** — updated to read "lifecycle composition as a third skill-section category alongside test-suite composition and structural-boundary verification, addressing risk at lifecycle boundaries..." — consistent with the current skill-section framing established by the pass 2 fixes.

2. **Line 51 (Rejected alternatives, "Extend lifecycle composition" paragraph)** — proactively updated from "where structural composition is already considered" to "where test-suite composition and structural-boundary verification are already considered." A Grep sweep before this dispatch caught this as a fourth occurrence of the same terminology pattern.

Three framing issues (Framing P2-A, P2-B, P3-A) remain deliberately open at the user's epistemic gate. This pass:

1. Verifies both fixes are clean and that the Grep sweep is exhaustive — no "structural composition" remains in skill-section framing contexts.
2. Confirms the three intentional retained uses of "structural boundaries" are in the correct risk-domain framing contexts.
3. Re-reports the three carry-forward framing issues unchanged.
4. Confirms no new issues are introduced.

---

## Section 1: Argument Audit

### Summary

- **Argument chains mapped:** 5 (unchanged from all prior passes)
- **Issues found:** 0

---

### Fix verification — Line 80 (Provenance check opening)

**Status: Clean.**

The Provenance check opening (line 80) now reads: "The core framing of this ADR — lifecycle composition as a third skill-section category alongside test-suite composition and structural-boundary verification, addressing risk at lifecycle boundaries — originates from Issue #10's problem statement, not from drafting-time synthesis."

This is consistent with the Decision section (line 29: "sitting alongside test-suite composition (Composable Tests) and structural-boundary verification (Integration Verification + Stewardship Tier 1)") and the Context section (line 9: "Test-suite composition — the Composable Tests section's N+M+1 pattern"). The Provenance check now uses the ADR's current terminology, not a pre-revision state.

The additional phrasing "addressing risk at lifecycle boundaries" makes both framings explicit — the skill-section framing (test-suite composition / structural-boundary verification / lifecycle composition) and a gesture toward the risk-domain framing (lifecycle boundaries) — consistent with the pass 2 fix that added the two-framing distinction to Context line 13.

---

### Fix verification — Line 51 (Rejected alternatives, fourth occurrence)

**Status: Clean.**

The "Extend lifecycle composition to every composable skill" paragraph (line 51) now reads: "which are where test-suite composition and structural-boundary verification are already considered." This is consistent with the skill-section framing used in Context (line 9), Decision (line 29), and Provenance check (line 80). No residual "structural composition" survives in skill-section contexts.

---

### Terminology sweep — all "structural" and "composition" occurrences

A full-document Grep for both terms confirms the following distribution, exhaustively:

- **Line 9:** "test-suite composition" — skill-section label. Correct.
- **Line 13:** "structural boundaries" — risk-domain framing (type / structural / lifecycle triple). Intentional retained use.
- **Line 23:** "structural boundaries" — verbatim Issue #10 quote. Intentional retained use.
- **Line 29:** "test-suite composition (Composable Tests)" and "structural-boundary verification" — skill-section labels. Correct.
- **Line 51:** "test-suite composition and structural-boundary verification" — skill-section labels. Correct (the pass 4 fix).
- **Line 62:** "structural boundaries" — risk-domain framing in Consequences §Positive bullet 2. Intentional retained use.
- **Line 80:** "test-suite composition and structural-boundary verification" — skill-section labels. Correct (the pass 4 fix).

The retired label "structural composition" has zero occurrences in the document. The three intentional retained uses of "structural boundaries" are all in risk-domain framing contexts (the type/structural/lifecycle triple), not in skill-section framing contexts. No inconsistency remains.

---

### P1 — Must Fix

No P1 issues found.

---

### P2 — Should Fix

No P2 issues found.

---

### P3 — Consider

No P3 issues found.

---

## Section 2: Framing Audit

The three framing issues from passes 1, 2, and 3 are carried forward unchanged — they remain deliberately open at the user's epistemic gate. The two edits in this revision are locally scoped terminology corrections, identical in character to the pass 2 and pass 3 fixes before them. They do not shift the ADR's overall framing and introduce no new framing concerns.

---

### Question 1: What alternative framings did the evidence support?

*(Unchanged from passes 1, 2, and 3 — reproduced for completeness.)*

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

*(Unchanged from passes 1, 2, and 3 — reproduced for completeness.)*

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

*(Unchanged from passes 1, 2, and 3 — reproduced for completeness.)*

The dominant framing: lifecycle composition is a missing test-design category that must be named and added to the skill's guidance at two existing anchor points.

The inverted framing: lifecycle composition bugs are not a gap in the skill's test-design guidance but a gap in the skill's API-design guidance. The bug class exists because the API contract at each module boundary does not specify ownership. A better build skill would require ownership to be made explicit at the point of design — not catch ownership ambiguity at the point of testing.

Under the inverted framing:
- The composable-tests extension becomes weaker: you can name a test category for shared-mutable-state sequences, but if the boundary design does not make ownership explicit, the test author will not know which references are shared and which are copies. The test guidance depends on something the skill does not currently establish.
- The stewardship checklist item becomes stronger: "does any returned value share a mutable reference with internal state?" is closer to a design review question than a test question. If Tier 1 stewardship is the right place for it, the implicit claim is that design review is where ownership ambiguity should be caught — which is consistent with the inverted framing.
- The ADR would need to address: does the build skill have a notion of module API contracts (not just type boundaries)? If not, the lifecycle-composition guidance hangs in air — the test author is told to write lifecycle-sequence tests but has no rule for determining when a boundary is an ownership transfer.

The inverted framing does not invalidate the ADR's decision. Naming the test category and the checklist item are correct regardless of whether the skill also adds ownership-contract guidance. But the inversion reveals that the decision, as scoped, addresses the detection mechanism without addressing the upstream cause.

---

### Framing Issues

**Framing P2-A (carry-forward from passes 1, 2, and 3): The COMPOSABLE TESTS extension may be placed in the wrong section for lifecycle reasoning.**

- **Location:** Decision §Extension 1 / Rejected Alternatives §"Introduce a standalone Step 5.5"
- **Issue:** The ADR rejects a standalone Step 5.5 on the grounds that "a separate step would bloat the build sequence without adding functionality beyond what the existing Integration Verification step already does when supplied with the right test design." This reasoning implicitly acknowledges that Step 5 is the natural home for lifecycle integration testing — yet the ADR places the lifecycle guidance in COMPOSABLE TESTS instead of Step 5. The rejected alternative's justification supports Alternative B (framing audit, Question 1) more than it supports the chosen placement.
- **Why this is P2 not P1:** Both placements are defensible, and the two-sided catch design (composable-tests for design time, stewardship for review time) is a genuine structural benefit. But the rejected-alternative reasoning undercuts the chosen placement.
- **Do not auto-correct.** Surface to user.

**Framing P2-B (carry-forward from passes 1, 2, and 3): The scope exclusion of other composable skills relies on an asymmetry that is stated but not justified.**

- **Location:** Rejected Alternatives §"Extend lifecycle composition to every composable skill"
- **Issue:** The ADR argues that build is the right home because lifecycle composition fits naturally into build's scheduled steps, but debug and refactor also have structured steps where lifecycle composition is relevant. The reason for exclusion ("inherit build's orientation without duplicating its checklist") assumes that mode-shift inheritance propagates category awareness without arguing this. For solo developers or Everyday Developers using refactor standalone (the ADR-048 use case), the lifecycle category would be invisible unless explicitly named in the refactor skill.
- **Why this is P2 not P1:** The scope decision is defensible and the issue itself scopes to build. But the assumption that mode-shift inheritance propagates category awareness is load-bearing and unverified.
- **Do not auto-correct.** Surface to user.

**Framing P3-A (carry-forward from passes 1, 2, and 3): The provenance check section lacks normative status.**

- **Location:** Provenance check section (final section of ADR)
- **Issue:** The section is present without explanation of whether it is intended as a new ADR norm or a one-time addition for this specific ADR. If it is a new norm, it should be reflected in the ADR template or a meta-ADR; if it is a one-time addition, its rationale should be stated so future readers know why ADR-071 has a section that earlier ADRs do not.
- **Do not auto-correct.** Surface to user.

---

### New framing concerns introduced by the revisions

None. Both edits are locally scoped terminology corrections. The pattern is the same as passes 2 and 3: a "structural composition" occurrence surviving in a section not reached by the previous fix was corrected to the current skill-section framing. Neither edit shifts the ADR's overall framing, changes a placement decision, or introduces new content.

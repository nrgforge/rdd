# Argument Audit Report — Re-audit (Pass 5, Convergence)

**Audited document:** `/Users/nathangreen/Development/rdd/docs/decisions/adr-071-lifecycle-composition-in-build-stewardship.md`
**Source material:**
- `/Users/nathangreen/Development/rdd/skills/build/SKILL.md` (COMPOSABLE TESTS §L366-387, STEWARDSHIP CHECKPOINTS §L430-465, Integration Verification Step 5 §L213-224)
- Issue #10 (inline, the architectural driver — full text in pass-1 audit)
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-046-review-build-integration.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-048-composable-skill-family.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-052-ai-smell-detection-in-refactor-skill.md`
- `/Users/nathangreen/Development/rdd/docs/domain-model.md` §Invariants (Invariant 8, L659-678)
- Pass 2 audit: `/Users/nathangreen/Development/rdd/docs/housekeeping/audits/argument-audit-decide-015-reaudit.md`
- Pass 3 audit: `/Users/nathangreen/Development/rdd/docs/housekeeping/audits/argument-audit-decide-015-reaudit-2.md`
- Pass 4 audit: `/Users/nathangreen/Development/rdd/docs/housekeeping/audits/argument-audit-decide-015-reaudit-3.md`
**Date:** 2026-04-13

---

## Re-audit scope

This pass (pass 5) is a convergence verification. Four argument issues were addressed across passes 1-4:

- **Pass 1 P2-A** — "structural composition" label in Context replaced with "test-suite composition." Fixed in pass 2.
- **Pass 1 P2-B** — item count claim ("grows from seven to eight") was wrong; corrected to "top-level count unchanged, item 6 expands from four sub-items to five." Fixed in pass 2.
- **Pass 1 P3-A** — refactor parenthetical tightened to remove implication that ADR-052 already has a home for Shared Mutable State. Fixed in pass 2.
- **Pass 2 P2-A new** — "structural composition" survived in Decision §opening and was re-introduced; fixed in pass 3 (Decision line 29, Context line 13).
- **Pass 3 finding** — "structural composition" survived in Provenance check (line 80) and in Rejected alternatives (line 51). Both fixed in pass 4.

Three framing issues (Framing P2-A, P2-B, P3-A) remain deliberately open at the user's epistemic gate — they have not been auto-corrected across any pass.

This pass:
1. Confirms all terminology fixes are stable and no residual "structural composition" remains anywhere in the document.
2. Confirms the item-count language is correct against the actual SKILL.md Tier 1 checklist.
3. Confirms the argument section is clean.
4. Re-reports the three carry-forward framing issues unchanged.
5. Confirms no new issues are introduced.

---

## Section 1: Argument Audit

### Summary

- **Argument chains mapped:** 5 (unchanged from all prior passes)
- **Issues found:** 0

---

### Argument chains

- **Chain A:** Integration risk has a third category (lifecycle) not covered by existing guidance — named category addition is warranted. Evidence: Issue #10's problem statement, three concrete examples (cache buffer / connection pool / registry entry), confirmation that the N+M+1 integration test passes on a single-operation path and does not exercise the production lifecycle sequence. The gap conclusion follows directly.
- **Chain B:** Two anchor points (COMPOSABLE TESTS, Stewardship Tier 1) are the correct insertion sites. Evidence: SKILL.md confirms both sections exist and govern the relevant activities (test design at L366-387, Tier 1 at L438-454). The two-sided catch design — composable-tests for design time, stewardship for review time — is grounded in the actual structure of the skill.
- **Chain C:** Invariant 8 is satisfied. Evidence: Invariant 8 requires unconditional structural mechanisms to anchor to one of three substrates. The ADR's changes anchor to existing concrete workflow steps (COMPOSABLE TESTS subsection, Tier 1 sub-item). No new unconditional mechanism is introduced. The chain holds.
- **Chain D:** Scope is build-local. The mode-shift inheritance reasoning (ADR-048) is correctly cited. Whether that reasoning is sufficient is a framing question, not an argument question — it does not invalidate the scope decision.
- **Chain E:** A standalone Step 5.5 is inferior to the chosen placement. The rejection reasoning is that a separate step would bloat the build sequence "without adding functionality beyond what the existing Integration Verification step already does when supplied with the right test design." This rejection is internally consistent; whether the reasoning undercuts the chosen placement is a framing concern (Framing P2-A), not a logical gap.

---

### Terminology verification — full sweep

A Grep sweep of the ADR for all "structural" and "composition" occurrences confirms:

- **Line 9:** "test-suite composition" — skill-section label. Correct.
- **Line 13:** "structural boundaries" — risk-domain framing (type / structural / lifecycle triple). Intentional retained use. Correct.
- **Line 23:** "structural boundaries" — verbatim Issue #10 quote. Intentional retained use. Correct.
- **Line 29:** "test-suite composition (Composable Tests)" and "structural-boundary verification (Integration Verification + Stewardship Tier 1)" — skill-section labels. Correct.
- **Line 51:** "test-suite composition and structural-boundary verification" — skill-section labels. Correct (pass-4 fix).
- **Line 62:** "structural boundaries" — risk-domain framing in Consequences §Positive. Intentional retained use. Correct.
- **Line 80:** "test-suite composition and structural-boundary verification" — skill-section labels. Correct (pass-4 fix).

The retired label "structural composition" has zero occurrences in the document. The three intentional retained uses of "structural boundaries" are all in risk-domain framing contexts (the type/structural/lifecycle triple), not in skill-section framing contexts. No inconsistency remains.

---

### Item-count verification

The ADR now states: "The top-level count of Tier 1 items is unchanged; item 6 (Test quality) expands from four sub-items to five."

Counting the actual SKILL.md Tier 1 checklist (L438-454): eight numbered items — (1) Responsibility conformance, (2) Dependency direction, (3) Cohesion, (4) Size signal, (5) Fitness Criteria, (6) Test quality (four sub-items: vacuous tests, assertion roulette, boundary coverage, wiring verification), (7) Decision coverage, (8) Scenario completeness. The ADR's claim that the top-level count is unchanged is correct (it was eight before and will remain eight). The claim that item 6 expands from four sub-items to five is correct. The Consequences section mirrors this accurately. Clean.

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

The three framing issues from passes 1-4 carry forward unchanged. They are deliberately open at the user's epistemic gate and have not been auto-corrected at any pass. The terminology fixes applied across passes 2-4 are locally scoped corrections that do not alter the ADR's overall framing, its placement decisions, or its scope decisions. No new framing concerns are introduced.

---

### Question 1: What alternative framings did the evidence support?

**Alternative A: Frame the gap as a missing ownership-model primitive, not a missing test category.**

Issue #10 uses the phrase "ownership and mutation rights over a shared resource are ambiguous." This is a statement about an absent ownership model — there is no concept in the build skill's vocabulary that assigns ownership of a mutable resource across a module boundary. An alternative framing would treat the gap not as a missing test category but as a missing domain concept: the skill should define what "ownership transfer" means and require that each boundary make ownership transfer explicit. The test guidance would then derive from the ownership rule rather than being specified independently.

What the source material supports: Issue #10's three examples (cache buffer, connection pool, registry entry) are all cases where ownership is ambiguous — not merely cases where a test is absent. The framing selected (add a test guidance category and a checklist item) treats the detection mechanism; the alternative framing would treat the upstream cause.

What a reader would need to believe: that naming a test category is insufficient without a domain-level concept of ownership, and that the skill should make ownership explicit at the point of API design rather than catching violations at the point of review.

**Alternative B: Frame the addition as an expansion of integration verification (Step 5) rather than a separate COMPOSABLE TESTS subsection.**

Step 5 (Integration Verification, L213-224) already identifies neighbors, writes integration tests, and runs them. The lifecycle-sequence concern — does A's retained reference survive B's cleanup? — is an integration concern, not a test-composition concern. An alternative framing would extend Step 5's guidance directly: when writing the integration test in Step 5, also exercise the production lifecycle sequence if any boundary involves shared mutable state.

What the source material supports: Step 5 already names "persistence paths that diverge between test and production" as one of the things integration testing catches. Lifecycle-sequence failures are structurally similar. The COMPOSABLE TESTS section (SKILL.md L366-387) is primarily about test-suite optimization (eliminating combinatorial redundancy), not integration guidance per se.

What a reader would need to believe: that lifecycle composition is an integration concern (Step 5) rather than a test-design concern (COMPOSABLE TESTS), and that concentrating lifecycle guidance in one location (Step 5) is cleaner than splitting it between test design and stewardship.

**Alternative C: Treat lifecycle composition as a Tier 2 concern triggered by Tier 1's boundary coverage check, not a new Tier 1 sub-item.**

The existing Tier 1 already has a "boundary coverage" sub-item under Test Quality. The lifecycle concern is a refinement of that: not just "does an integration test exist for each boundary?" but "does the integration test exercise the production lifecycle sequence?" An alternative framing would annotate the existing boundary coverage item with lifecycle guidance rather than adding a new numbered sub-item, keeping Tier 1 concise and routing deeper analysis to Tier 2 when warranted.

What the source material supports: ADR-046 established that Tier 1 is "lightweight stewardship" and Tier 2 handles deeper architectural drift. The lifecycle-sequence check fires only when a module boundary returns a mutable reference — a specific structural condition resembling other Tier 2 triggers.

What a reader would need to believe: that the lifecycle check is conditional enough (fires only on shared-reference boundaries) that it belongs as a Tier 1 annotation rather than a standalone Tier 1 sub-item, reducing checklist length while preserving coverage.

---

### Question 2: What truths were available but not featured?

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

The dominant framing: lifecycle composition is a missing test-design category that must be named and added to the skill's guidance at two existing anchor points.

The inverted framing: lifecycle composition bugs are not a gap in the skill's test-design guidance but a gap in the skill's API-design guidance. The bug class exists because the API contract at each module boundary does not specify ownership. A better build skill would require ownership to be made explicit at the point of design — not catch ownership ambiguity at the point of testing.

Under the inverted framing:
- The composable-tests extension becomes weaker: you can name a test category for shared-mutable-state sequences, but if the boundary design does not make ownership explicit, the test author will not know which references are shared and which are copies. The test guidance depends on something the skill does not currently establish.
- The stewardship checklist item becomes stronger: "does any returned value share a mutable reference with internal state?" is closer to a design review question than a test question. If Tier 1 stewardship is the right place for it, the implicit claim is that design review is where ownership ambiguity should be caught — which is consistent with the inverted framing.
- The ADR would need to address: does the build skill have a notion of module API contracts (not just type boundaries)? If not, the lifecycle-composition guidance hangs in air — the test author is told to write lifecycle-sequence tests but has no rule for determining when a boundary is an ownership transfer.

The inverted framing does not invalidate the ADR's decision. Naming the test category and the checklist item are correct regardless of whether the skill also adds ownership-contract guidance. But the inversion reveals that the decision, as scoped, addresses the detection mechanism without addressing the upstream cause.

---

### Framing Issues

**Framing P2-A (carry-forward, open at user gate): The COMPOSABLE TESTS extension may be placed in the wrong section for lifecycle reasoning.**

- **Location:** Decision §Extension 1 / Rejected Alternatives §"Introduce a standalone Step 5.5"
- **Issue:** The ADR rejects a standalone Step 5.5 on the grounds that "a separate step would bloat the build sequence without adding functionality beyond what the existing Integration Verification step already does when supplied with the right test design." This reasoning implicitly acknowledges that Step 5 is the natural home for lifecycle integration testing — yet the ADR places the lifecycle guidance in COMPOSABLE TESTS instead of Step 5. The rejected alternative's justification supports Alternative B (Question 1) more than it supports the chosen placement. If Step 5 already does lifecycle verification "when supplied with the right test design," the natural place to supply that design guidance is Step 5's own section, not a separate COMPOSABLE TESTS subsection.
- **Why this is P2 not P1:** Both placements are defensible, and the two-sided catch design (composable-tests for design time, stewardship for review time) is a genuine structural benefit. But the rejected-alternative reasoning undercuts the chosen placement.
- **Do not auto-correct.** Surface to user.

**Framing P2-B (carry-forward, open at user gate): The scope exclusion of other composable skills relies on an asymmetry that is stated but not justified.**

- **Location:** Rejected Alternatives §"Extend lifecycle composition to every composable skill"
- **Issue:** The ADR argues that build is the right home because lifecycle composition fits naturally into build's scheduled steps — test design during COMPOSABLE TESTS, checklist during stewardship — which are where test-suite composition and structural-boundary verification are already considered. But debug and refactor also have structured steps where lifecycle composition is relevant. The reason for exclusion ("inherit build's orientation without duplicating its checklist") assumes that mode-shift inheritance propagates category awareness without arguing this. For solo developers or Everyday Developers using refactor standalone (the ADR-048 use case), the lifecycle category would be invisible unless explicitly named in the refactor skill.
- **Why this is P2 not P1:** The scope decision is defensible and the issue itself scopes to build. But the assumption that mode-shift inheritance propagates category awareness is load-bearing and unverified.
- **Do not auto-correct.** Surface to user.

**Framing P3-A (carry-forward, open at user gate): The provenance check section lacks normative status.**

- **Location:** Provenance check section (final section of ADR)
- **Issue:** The section is present without explanation of whether it is intended as a new ADR norm or a one-time addition for this specific ADR. If it is a new norm, it should be reflected in the ADR template or a meta-ADR; if it is a one-time addition, its rationale should be stated so future readers know why ADR-071 has a section that earlier ADRs do not.
- **Do not auto-correct.** Surface to user.

---

### New framing concerns introduced by this pass

None. This pass is a convergence verification — it reads the document, confirms the clean state, and re-reports carry-forward findings. No new content was changed.

# Argument Audit Report — Re-audit (Pass 2)

**Audited document:** `/Users/nathangreen/Development/rdd/docs/decisions/adr-071-lifecycle-composition-in-build-stewardship.md`
**Source material:**
- `/Users/nathangreen/Development/rdd/skills/build/SKILL.md` (COMPOSABLE TESTS §L366-387, STEWARDSHIP CHECKPOINTS §L430-465, Integration Verification Step 5 §L213-224)
- Issue #10 (inline, the architectural driver — full text in first-pass audit)
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-046-review-build-integration.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-048-composable-skill-family.md`
- `/Users/nathangreen/Development/rdd/docs/decisions/adr-052-ai-smell-detection-in-refactor-skill.md`
- `/Users/nathangreen/Development/rdd/docs/domain-model.md` §Invariants (Invariant 8, L659-678)
- First-pass audit: `/Users/nathangreen/Development/rdd/docs/housekeeping/audits/argument-audit-decide-015.md`
**Date:** 2026-04-13

---

## Re-audit scope

Three argument issues were addressed in-place since pass 1 (P2-A relabeling, P2-B item count, P3-A refactor parenthetical). Three framing issues (Framing P2-A, P2-B, P3-A) were deliberately not auto-corrected and remain open at the user's epistemic gate. This pass:

1. Verifies each argument fix is clean and introduces no new issues.
2. Re-runs the full framing audit, reporting the three carry-forward framing issues plus any new framing concerns introduced by the revisions.

---

## Section 1: Argument Audit

### Summary

- **Argument chains mapped:** 5 (unchanged from pass 1)
- **Issues found:** 1

---

### Fix verification — P2-A (relabeling)

**Status: Clean, with a residual inconsistency introduced by partial application.**

The Context section's first item now correctly reads "test-suite composition — the Composable Tests section's N+M+1 pattern for orthogonal dimensions... This pattern optimizes the suite against combinatorial redundancy across independent axes." This accurately describes SKILL.md L366-387, which is titled "COMPOSABLE TESTS" with a subsection "The N x M Problem" and is explicitly about optimizing the test suite.

However, the relabeling was applied only to the Context section. The Decision section's opening sentence was not updated and still reads: "Lifecycle composition is a named category in build stewardship, sitting alongside **structural composition** and structural boundaries." "Structural composition" is the label the Context section's relabeling was intended to retire. See P2-A (new) below.

---

### Fix verification — P2-B (item count)

**Status: Clean.**

The original claim ("grows from seven to eight") is gone. The ADR now states: "The top-level count of Tier 1 items is unchanged; item 6 (Test quality) expands from four sub-items to five," confirmed in both the Decision section and the Consequences §Negative. SKILL.md L447-451 lists exactly four sub-items under item 6 (vacuous tests, assertion roulette, boundary coverage, wiring verification), and the top-level list has eight numbered items (L442-454). The ADR's revised claim is accurate on both counts.

---

### Fix verification — P3-A (refactor parenthetical)

**Status: Clean.**

The revised text reads: "shared mutable state as a named concern could be the subject of a separate ADR extending ADR-052's AI Smell Taxonomy, but it is a general architectural concern rather than specifically an AI-exacerbated pattern." ADR-052 defines its embedded smell catalog as covering "AI-exacerbated smells" with "AI-specific mechanisms." Shared mutable state is not in that catalog and is explicitly not AI-specific. The revised parenthetical correctly names the separation and avoids implying shared mutable state already fits ADR-052's existing framing.

---

### P1 — Must Fix

No P1 issues found.

---

### P2 — Should Fix

**Issue 2-A (new): The Decision section's opening sentence uses "structural composition" — the label the Context relabeling retired.**

- **Location:** Decision §opening sentence ("Lifecycle composition is a named category in build stewardship, sitting alongside structural composition and structural boundaries.")
- **Claim:** The three categories of integration risk addressed by the build skill are: structural composition, structural boundaries, and lifecycle composition.
- **Evidence gap:** The Context section's P2-A fix relabeled the first category from "structural composition" to "test-suite composition," because SKILL.md confirms the COMPOSABLE TESTS section is about test-suite optimization rather than structural analysis. The Decision section's opening was not updated to match. As a result, the document now uses two different names for the same category: "test-suite composition" in Context §1 and "structural composition" in Decision §opening. A reader who holds both in mind simultaneously will find them inconsistent — "test-suite composition" is a description of a test-design technique; "structural composition" implies an architectural analysis category.

  Additionally, the Consequences §Positive bullet 2 names yet a third partition of the same space: "type boundaries, structural boundaries, and lifecycle boundaries." This three-category model maps to the Context's integration-risk framing (mock vs. real, wrong module vs. right module, lifecycle sequence). It is not the same partition as Decision §opening's (structural composition / structural boundaries / lifecycle composition). The two three-category models coexist in the document without acknowledgment that they are slicing the same space differently.

- **Recommendation:** Update the Decision §opening to match the relabeled Context term: replace "structural composition" with "test-suite composition." Then audit whether the Consequences bullet 2 ("type boundaries, structural boundaries, lifecycle boundaries") is consistent with that framing or should itself be updated. One approach: the Decision section names the three test-design categories (test-suite composition, structural boundaries, lifecycle composition), and the Consequences bullet names the three integration-risk categories (type boundaries, structural boundaries, lifecycle boundaries) — making explicit that these are two framings of the same gap. The document currently presents them as though they name identical partitions.

---

### P3 — Consider

No P3 issues found. The P3-A fix from pass 1 is clean and the parenthetical is now well-qualified.

---

## Section 2: Framing Audit

The three framing issues from pass 1 are carried forward in full — they were deliberately not auto-corrected and remain open at the user's epistemic gate. Each is re-stated with its original pass-1 analysis intact. The revision introduced no new framing concerns.

---

### Question 1: What alternative framings did the evidence support?

*(Unchanged from pass 1 — reproduced for completeness.)*

**Alternative A: Frame the gap as a missing ownership-model primitive, not a missing test category.**

Issue #10 uses the phrase "ownership and mutation rights over a shared resource are ambiguous." This is a statement about an absent ownership model — there is no concept in the build skill's vocabulary that assigns ownership of a mutable resource across a module boundary. An alternative framing would treat the gap not as a missing test category but as a missing domain concept: the skill should define what "ownership transfer" means and require that each boundary make ownership transfer explicit. The test guidance would then derive from the ownership rule rather than being specified independently.

What the source material supports: Issue #10's three examples (cache buffer, connection pool, registry entry) are all cases where ownership is ambiguous — not merely cases where the test is absent. The framing selected (add a test guidance category and a checklist item) treats the detection mechanism; the alternative framing would treat the upstream cause.

What a reader would need to believe: that naming a test category is insufficient without a domain-level concept of ownership, and that the skill should make ownership explicit at the point of API design rather than catching violations at the point of review.

**Alternative B: Frame the addition as an expansion of integration verification (Step 5) rather than a separate COMPOSABLE TESTS subsection.**

Step 5 (Integration Verification, L213-224) already identifies neighbors, writes integration tests, and runs them. The lifecycle-sequence concern — does A's retained reference survive B's cleanup? — is an integration concern, not a test-composition concern. An alternative framing would extend Step 5's guidance directly: when writing the integration test in Step 5, also exercise the production lifecycle sequence if any boundary involves shared mutable state.

What the source material supports: Step 5 already names "persistence paths that diverge between test and production" as one of the things integration testing catches. Lifecycle-sequence failures are structurally similar. The COMPOSABLE TESTS section (as confirmed by SKILL.md L366-387) is primarily about test-suite optimization, not integration guidance per se.

What a reader would need to believe: that lifecycle composition is an integration concern (Step 5) rather than a test-design concern (COMPOSABLE TESTS), and that concentrating lifecycle guidance in one location (Step 5) is cleaner than splitting it between test design and stewardship.

**Alternative C: Treat lifecycle composition as a Tier 2 concern triggered by Tier 1's boundary coverage check, not a new Tier 1 item.**

The existing Tier 1 already has a "boundary coverage" sub-item under Test Quality. The lifecycle concern is a refinement of that: not just "does an integration test exist for each boundary?" but "does the integration test exercise the production lifecycle sequence?" An alternative framing would annotate the existing boundary coverage item with lifecycle guidance rather than adding a new numbered sub-item, keeping Tier 1 concise and routing deeper analysis to Tier 2 when warranted.

What the source material supports: ADR-046 established that Tier 1 is "lightweight stewardship" and Tier 2 handles deeper architectural drift. The lifecycle-sequence check fires only when a module boundary returns a mutable reference — a specific structural condition resembling other Tier 2 triggers.

What a reader would need to believe: that the lifecycle check is conditional enough (fires only on shared-reference boundaries) that it belongs as a Tier 1 annotation rather than a standalone Tier 1 sub-item, reducing checklist length while preserving coverage.

---

### Question 2: What truths were available but not featured?

*(Unchanged from pass 1 — reproduced for completeness.)*

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

*(Unchanged from pass 1 — reproduced for completeness.)*

The dominant framing: lifecycle composition is a missing test-design category that must be named and added to the skill's guidance at two existing anchor points.

The inverted framing: lifecycle composition bugs are not a gap in the skill's test-design guidance but a gap in the skill's API-design guidance. The bug class exists because the API contract at each module boundary does not specify ownership. A better build skill would require ownership to be made explicit at the point of design — not catch ownership ambiguity at the point of testing.

Under the inverted framing:
- The composable-tests extension becomes weaker: you can name a test category for shared-mutable-state sequences, but if the boundary design does not make ownership explicit, the test author will not know which references are shared and which are copies. The test guidance depends on something the skill does not currently establish.
- The stewardship checklist item becomes stronger: "does any returned value share a mutable reference with internal state?" is closer to a design review question than a test question. If Tier 1 stewardship is the right place for it, the implicit claim is that design review is where ownership ambiguity should be caught — which is consistent with the inverted framing.
- The ADR would need to address: does the build skill have a notion of module API contracts (not just type boundaries)? If not, the lifecycle-composition guidance hangs in air — the test author is told to write lifecycle-sequence tests but has no rule for determining when a boundary is an ownership transfer.

The inverted framing does not invalidate the ADR's decision. Naming the test category and the checklist item are correct regardless of whether the skill also adds ownership-contract guidance. But the inversion reveals that the decision, as scoped, addresses the detection mechanism without addressing the upstream cause.

---

### Framing Issues

**Framing P2-A (carry-forward from pass 1): The COMPOSABLE TESTS extension may be placed in the wrong section for lifecycle reasoning.**

- **Location:** Decision §Extension 1 / Rejected Alternatives §"Introduce a standalone Step 5.5"
- **Issue:** The ADR rejects a standalone Step 5.5 on the grounds that "a separate step would bloat the build sequence without adding functionality beyond what the existing Integration Verification step already does when supplied with the right test design." This reasoning implicitly acknowledges that Step 5 is the natural home for lifecycle integration testing — yet the ADR places the lifecycle guidance in COMPOSABLE TESTS instead of Step 5. The rejected alternative's justification supports Alternative B (framing audit, Question 1) more than it supports the chosen placement. If Step 5 already does lifecycle verification "when supplied with the right test design," the natural place to supply that design guidance is Step 5's own section, not a separate COMPOSABLE TESTS subsection.
- **Why this is P2 not P1:** Both placements are defensible, and the two-sided catch design (composable-tests for design time, stewardship for review time) is a genuine structural benefit. But the rejected-alternative reasoning undercuts the chosen placement, and this should be visible to the user before acceptance.
- **Do not auto-correct.** Surface to user.

**Framing P2-B (carry-forward from pass 1): The scope exclusion of other composable skills relies on an asymmetry that is stated but not justified.**

- **Location:** Rejected Alternatives §"Extend lifecycle composition to every composable skill"
- **Issue:** The ADR argues that build is the right home because lifecycle composition fits naturally into build's "scheduled steps — test design during COMPOSABLE TESTS, checklist during stewardship." But debug and refactor also have structured steps where lifecycle composition is relevant: debug operates on symptoms where lifecycle bugs manifest; refactor operates on smells where shared-mutable-state patterns appear. The ADR's reason for excluding debug and refactor ("inherit build's orientation without duplicating its checklist") assumes that inheriting orientation is sufficient — that a developer debugging or refactoring will carry forward the lifecycle-composition category from the build skill without the debug or refactor skill naming it. For solo developers or Everyday Developers using refactor standalone (the ADR-048 use case), the lifecycle category would be invisible unless explicitly named in the refactor skill. This assumption is not argued.
- **Why this is P2 not P1:** The scope decision is defensible and the issue itself scopes to build. But the assumption that mode-shift inheritance propagates category awareness is load-bearing and unverified.
- **Do not auto-correct.** Surface to user.

**Framing P3-A (carry-forward from pass 1): The provenance check section lacks normative status.**

- **Location:** Provenance check section (final section of ADR)
- **Issue:** The section is present without explanation of whether it is intended as a new ADR norm or a one-time addition for this specific ADR. If it is a new norm, it should be reflected in the ADR template or a meta-ADR; if it is a one-time addition, its rationale should be stated so future readers know why ADR-071 has a section that earlier ADRs do not.
- **Do not auto-correct.** Surface to user.

---

### New framing concerns introduced by the revisions

None. The three revisions (relabeling, item count, refactor parenthetical) are locally scoped and do not shift the ADR's overall framing. The partial-application inconsistency flagged in Argument Issue 2-A (new) is a terminology consistency problem, not a framing selection problem, and is correctly classified in Section 1.

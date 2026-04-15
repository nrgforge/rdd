# ADR-071: Lifecycle Composition in Build Stewardship

**Status:** Proposed

## Context

The build skill's test and stewardship guidance addresses two concerns:

1. **Test-suite composition** — the Composable Tests section's N+M+1 pattern for orthogonal dimensions (e.g., four computation methods × five output formats collapse to N + M + 1 tests). This pattern optimizes the suite against combinatorial redundancy across independent axes.

2. **Structural boundaries** — the Integration Verification step (Step 5) and the Stewardship Tier 1 checks for responsibility conformance, dependency direction, cohesion, and boundary coverage. These ensure components wire together with real types on both sides, not stubs.

Together these frame integration risk at **type boundaries** (mock vs. real) and **structural boundaries** (wrong module, wrong direction). Neither addresses risk at a third kind of boundary: **lifecycle boundaries** — where the sequence of operations and ownership of shared mutable state between components determines correctness. The skill-side category for guiding work at lifecycle boundaries is what this ADR names *lifecycle composition*.

A class of bug escapes the existing net:

- A cache returns an internal buffer; a caller mutates the buffer; the cache's retained reference now reflects corrupted state.
- A connection pool hands out a connection; a caller closes it; the pool's retained entry now points to a dead connection.
- A registry returns a live entry; a caller modifies a field; the registry's invariants silently break.

Each component works correctly in isolation. The N+M+1 integration test passes because it exercises a single operation, not the production lifecycle sequence where one component's cleanup or mutation invalidates another's retained state. The Stewardship Tier 1 checks detect responsibility drift and dependency inversions but not shared-reference leaks at module boundaries.

Issue #10 names this gap: *"the skill assumes integration risk lives at type boundaries (mock vs. real) and structural boundaries (wrong module, wrong direction). This gap is at lifecycle boundaries — where ownership and mutation rights over a shared resource are ambiguous. That's a category the skill doesn't currently name."*

Domain Invariant 8 requires that unconditional structural mechanisms be anchored to one of three substrates (Skill-Structure Layer, Harness Layer, User-Tooling Layer). The changes this ADR authorizes are anchored in the Skill-Structure Layer — specifically to two existing concrete workflow steps in the build skill: (a) test design under COMPOSABLE TESTS, and (b) the enumerated Tier 1 stewardship checklist. No new unconditional mechanism is introduced; the existing mechanisms gain a third case.

## Decision

Lifecycle composition is a named category in build stewardship, sitting alongside test-suite composition (Composable Tests) and structural-boundary verification (Integration Verification + Stewardship Tier 1). The build skill is extended at three existing anchor points — design-time prompting, verification-time anchoring, and review-time detection — to form a three-sided catch:

**Extension 1 — Composable Tests: Lifecycle Composition subsection (design-time prompt).**

The COMPOSABLE TESTS section grows a third case alongside the N x M Problem. The new subsection states that when components share mutable state — cached buffers, pooled connections, retained registry entries, or any returned reference that aliases internal state — the integration test must exercise the production lifecycle sequence, not just individual operations. If component A hands a resource to component B, and B mutates or disposes the resource, the test must verify that A's retained reference survives B's actions.

This is not a replacement for N+M+1 on orthogonal dimensions; it adds a third dimension — ordered operations on shared mutable state — that the original framing does not cover. A cross-reference points to Step 5 (below) as the verification-time anchor for the same concern.

**Extension 2 — Integration Verification (Step 5): Lifecycle-sequence verification anchor.**

Step 5 gains an explicit guidance paragraph: when a boundary involves shared mutable state (any returned value that aliases internal state — cached buffers, pooled connections, retained registry entries), the integration test must exercise the production lifecycle sequence. Not merely a single operation returning correct data, but the ordered sequence — caller obtains resource, caller mutates or disposes it, original component's retained reference is re-read — and verify the retained reference still holds its invariants.

Placement in Step 5 reflects where developers actually consult the skill during integration testing. COMPOSABLE TESTS (Extension 1) prompts the test author at design time; Step 5 anchors the check at verification time. A cross-reference points back to COMPOSABLE TESTS §Lifecycle Composition for the design-time framing.

**Extension 3 — Stewardship Tier 1: Shared Mutable State check (review-time detector).**

The Tier 1 checklist's Test quality item (currently item 6) grows one sub-item, placed adjacent to the existing boundary coverage sub-item, as new sub-item **6e Shared mutable state**:

> **Shared mutable state** — for each module boundary crossed in this scenario group: does any returned value share a mutable reference with internal state (caches, pools, registries, retained entries)? If so, does a test verify that caller mutation or disposal of the returned value does not corrupt the internal state?

Placement as a Test quality sub-item (rather than a new top-level item) reflects its semantic kinship with boundary coverage and wiring verification — all three ask whether a specific class of test exists at each boundary. The top-level count of Tier 1 items is unchanged; item 6 (Test quality) expands from four sub-items to five.

This is a review-time check detecting what the design-time and verification-time guidance prompted for. The three extensions form a three-sided catch: design-time (COMPOSABLE TESTS) prompts the test author to write the lifecycle-sequence integration test; verification-time (Step 5) anchors the test where developers run integration verification; review-time (Stewardship) detects missed cases at the scenario-group boundary.

## Rejected alternatives

**Keep only the existing composition framing.** Rejected. The existing framing is accurate for the cases it covers but does not name lifecycle composition as a category, so the bug class escapes both design-time test construction and review-time conformance detection. The issue's empirical observation (components correct in isolation, corrupt each other through shared mutable references) is a real gap the skill should hold.

**Extend lifecycle composition to every composable skill (debug, refactor, review).** Rejected. The category fits naturally in build's scheduled steps — test design during COMPOSABLE TESTS, checklist during stewardship — which are where test-suite composition and structural-boundary verification are already considered. The other composable skills compose with build through mode shifts (ADR-048) and inherit build's orientation without duplicating its checklist. Debug operates on symptoms (where lifecycle bugs manifest as unexpected failures); refactor operates on smells (shared mutable state as a named concern could be the subject of a separate ADR extending ADR-052's AI Smell Taxonomy, but it is a general architectural concern rather than specifically an AI-exacerbated pattern, and scoping it there is out of scope here); review operates on understanding (where the reviewer may ask lifecycle-composition questions that trace back to the build skill's categorization). Scoping the change to build keeps the category addition load-bearing in one place instead of diffuse across four.

**Treat lifecycle composition as a new invariant or cross-cutting rule.** Rejected. Invariants are cross-cutting claims about the methodology's epistemic or structural floor. Lifecycle composition is a category addition to one skill's guidance — a refinement of how integration risk is conceptualized, not a new constitutional commitment. Invariant 8 already establishes the anchoring requirement; this ADR's changes satisfy it without adding a new invariant.

**Introduce a standalone "Step 5.5: Lifecycle Composition Verification" step after Integration Verification.** Rejected. Step 5 itself is extended by this ADR (Extension 2 above) with explicit lifecycle-sequence guidance. A standalone 5.5 step would duplicate that in a parallel location and fragment the build sequence. The chosen design — Extensions 1 (design-time prompt in COMPOSABLE TESTS), 2 (verification-time anchor in Step 5), and 3 (review-time detector in Stewardship Tier 1) — covers the same surface area without introducing a new step.

## Consequences

**Positive:**

- A known bug class — shared-reference leaks, cleanup-invalidates-retained-state, mutation-corrupts-cache — is named and held at design time (COMPOSABLE TESTS), verification time (Step 5), and review time (Stewardship Tier 1).
- The skill's framing of integration risk becomes more complete: type boundaries, structural boundaries, and lifecycle boundaries as a three-category model.
- Developers seeking integration-testing guidance land on the anchor relevant to their current task: test composition prompts in COMPOSABLE TESTS, verification mechanics in Step 5, review-time detection in Stewardship.
- Provenance is preserved: the category addition traces directly to Issue #10's problem statement and the existing build-skill anchors.
- Invariant 8 is satisfied without introducing new machinery — all three extensions anchor to existing concrete workflow steps.

**Negative:**

- The Tier 1 Test quality item grows from four sub-items to five (top-level item count unchanged). Stewardship cost rises slightly at every scenario group boundary. Mitigated by the sub-item's narrow scope (it fires only when a module boundary is crossed with a returned value).
- Test designers must now consider lifecycle sequences in a category the skill previously did not name. For most scenario groups this is a quick check; for those with shared mutable state it is load-bearing work the skill previously left unguided.
- Three anchor points instead of two means slightly more skill-text surface area; the trade-off is that developers find the guidance where they actually look for it. Cross-references between the three points mitigate the risk that a developer sees one but misses the others.
- The rejected alternative "extend to every composable skill" rests on a load-bearing but inferred premise: that mode-shift composition (ADR-048) propagates category awareness from build into debug/refactor/review when those skills are invoked as mode shifts. ADR-048 establishes the mode-shift composition pattern the inference depends on, but does not address category inheritance explicitly. The inference is plausible and consistent with the composable-skill-family design, but has not been empirically validated. A future cycle or issue could strengthen it by making category-inheritance explicit in ADR-048 or by measuring standalone-refactor sessions for missed lifecycle bugs.

**Neutral:**

- No domain model invariant changes; no backward propagation sweep.
- No changes to debug, refactor, review, or other skills. The category is build-local.
- The system design's Test Architecture table may gain a row acknowledging lifecycle tests as a kind, or may not; the build skill guidance is sufficient without it. Judgment deferred to BUILD.
- Three glossary entries (Lifecycle Composition, Shared Mutable State, Lifecycle Boundary) are added to the domain model during BUILD to support consistent vocabulary in the skill text and scenarios. No invariant amendment.

## Provenance check

*Note on normative status: this Provenance check section is included here because the driver chain warranted explicit tracing (the ADR extends a skill against an external issue in a mini-cycle with no research essay for the decisions to reference). It is not yet established as a required template element for all ADRs. A future methodology ADR could either standardize it or formally declare it situational.*

The core framing of this ADR — lifecycle composition as a third skill-section category alongside test-suite composition and structural-boundary verification, addressing risk at lifecycle boundaries — originates from Issue #10's problem statement. The specific language ("lifecycle boundaries — where ownership and mutation rights over a shared resource are ambiguous") is the issue's own framing. Two of the three concrete extensions (composable-tests subsection, Tier 1 checklist item) are the issue's concrete proposals, minimally adapted to the skill's existing structure and vocabulary.

The third extension (Step 5 verification-time anchor) was added during the DECIDE gate in response to a Grounding Reframe recommendation from the susceptibility snapshot evaluator — the ADR's initial two-extension design placed lifecycle guidance in COMPOSABLE TESTS (where developers compose tests) but not in Step 5 (where developers run integration verification), creating an internal tension between the Decision and its rejection of a standalone Step 5.5. Dual placement resolves the tension. The Step 5 extension is gate-derived, not drafting-synthesized or driver-derived.

The risk-domain vs. skill-section two-axis distinction introduced during audit revisions (distinguishing *where bugs live* from *what the skill guides on*) is drafting-time synthesis in service of terminology consistency across the ADR, not content from Issue #10.

The rejected alternatives were composed during drafting from the issue's proposal space and the build skill's existing anchor points. They are drafting-time synthesis, not architectural driver content — standard for ADR rejected-alternatives sections.

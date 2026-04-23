# ADR-073: Cycle Acceptance Criteria Table with Layer-Match Verification

**Status:** Proposed

## Context

Issue #11 names a structural gap: when a product-discovery acceptance criterion is an **emergent property** of multiple scenarios — for example, "first real MCP consumer workflow via live MCP transport" — the methodology has no mechanism that verifies the criterion at the layer it specifies. Each atomic scenario passes at boundary level. The aggregate criterion's satisfaction is assumed, not demonstrated. The cycle ships green; the integration layer named in the criterion is never exercised.

The closest existing formalism is DO-178C's distinction between High-Level Requirements (verified by integration tests) and Low-Level Requirements (verified by unit tests) — RTCA 2011 mandates that LLR passage does not constitute HLR verification. The coverage-subsumption literature (Zhu et al. 1997) provides the formal basis: lower-criterion satisfaction does not imply higher-criterion satisfaction by definition. Sommerville (2010) establishes that emergent properties observable only at system-integration level cannot be verified at component level. In BDD/ATDD practice, the failure mode is recognized but unnamed; Gherkin scenarios carry no layer information, and the layer is determined by step-definition implementation (Adzic 2020).

The methodology already has the upstream half: product discovery names acceptance criteria, and DECIDE produces behavior scenarios. What is missing is the bridge — an explicit artifact that traces each criterion to the scenarios that compose to cover it *and* names the layer at which the criterion's satisfaction must actually be observed. The domain model concepts **Acceptance Criteria Table** and **Criterion-Level Verification** were added in Amendment 19 to name the gap; this ADR specifies the artifact and the verification step.

## Decision

DECIDE produces (or explicitly identifies within `scenarios.md`) a **Cycle Acceptance Criteria Table** listing each emergent or aggregate acceptance criterion from product-discovery. For each criterion the table records:

| Column | Content |
|--------|---------|
| Criterion | The acceptance criterion as stated in product-discovery, verbatim |
| Specified layer | The layer at which the criterion specifies satisfaction (e.g., "live MCP transport," "end-to-end with real downstream service," "API-boundary behavior") |
| Verification method | Which scenarios compose to cover the criterion, plus any additional integration test or harness |
| Layer-match check | Does the verification exercise the specified layer, or does it stub the layer the criterion names? |

Atomic criteria with a 1:1 scenario mapping at the criterion's specified layer pass through trivially — they may be omitted from the table or noted as `atomic, 1:1`. The table's purpose is to surface emergent and aggregate criteria for explicit treatment.

BUILD adds a new sub-step to Step 5 (Integration Verification): **Step 5.5 — Cycle Criterion Verification.** For each entry in the Cycle Acceptance Criteria Table, BUILD verifies that the criterion is exercised at its specified layer. If the table's Layer-match check is "yes," the relevant scenario suite satisfies the criterion. If "no" — i.e., the verification stubs the layer the criterion names — BUILD writes (or identifies) a single integration test or harness that exercises the criterion at the stated layer.

The Cycle Acceptance Criteria Table lives in `scenarios.md` as a top section preceding the per-feature scenario blocks, or in a separate `acceptance-criteria.md` if scenarios.md is already large. The DECIDE skill is updated to require its production. The BUILD skill's Step 5.5 references the table as its input.

The table is required only when product-discovery names acceptance criteria that are emergent, aggregate, or specify an integration layer that individual scenarios stub out. Cycles whose criteria are all atomic skip the table — the absence is itself a recorded judgment ("no emergent criteria identified") rather than a default omission.

## Rejected alternatives

**Embed criterion-level verification inside each scenario's `Then` clause.** Rejected. Scenarios specify behavior at the layer where they execute; forcing a criterion-level outcome into a scenario-level Then clause either duplicates work (one scenario per criterion at the integration layer) or hides the layer mismatch (the scenario claims the criterion holds while exercising a stub). The artifact separation reflects a real distinction in DO-178C and in BDD practice.

**Make BUILD responsible for surfacing the gap without a DECIDE artifact.** Rejected. The gap is a design-time question — *what does this criterion actually require, and at what layer?* — not a verification-time question. Surfacing it in DECIDE means the verification layer is an explicit decision; deferring it to BUILD means the question is asked under implementation pressure when the wrong answer is "compose what we have." Issue #11's concrete example is exactly this failure: the atomic scenarios were green; nothing at BUILD time prompted the criterion-level question.

**Treat the criteria table as optional throughout.** Rejected for cycles with non-atomic criteria. Optionality recreates the gap. The methodology's position is that the table is required when emergent or aggregate criteria are present; the absence of such criteria is itself a recorded judgment.

**Replicate DO-178C's full HLR/LLR taxonomy with formal coverage levels.** Rejected. RTCA 2011 is a safety-critical standard with regulatory enforcement; RDD does not need a six-level taxonomy or independent verification authority. The borrowed concept is the *layer-match principle*; the implementation is a single table with four columns.

## Consequences

**Positive:**

- Closes the named structural gap: the bridge between product-discovery's workflow language and scenarios' action language now has an explicit artifact and verification step.
- Forces the layer-match question to surface during DECIDE, when redesign is cheap, rather than emerging as a "this passed in CI but doesn't work in production" surprise after BUILD.
- Composes naturally with existing scenario-writing — the table is produced from the same product-discovery and scenarios that DECIDE already reads.
- Compatible with the Inversion Principle's existing operationalization (ADR-055): the layer-match check is a structural prompt for "what layer am I *not* verifying?"
- Operationalizes Invariant 8 at a new site: criterion-level verification has a concrete artifact (the table) and a concrete verification step (BUILD Step 5.5), both mechanically observable.

**Negative:**

- Adds DECIDE-time work for cycles with non-atomic criteria. Mitigated by the criterion that the table is only required when emergent/aggregate criteria are present; cycles with all-atomic criteria record a one-line judgment rather than producing a table.
- BUILD's Step 5.5 may surface integration-test gaps late — a criterion's "no" in the layer-match column means BUILD must write a test the original scenario plan did not include. This is the table working as designed (surfacing the gap) but adds BUILD-phase work.
- The table introduces another small artifact whose drift from product-discovery is possible. Mitigated by living near scenarios.md, which DECIDE already maintains, and by the supersession workflow (ADR-074) when product-discovery's criteria themselves are revised.

**Neutral:**

- Cycles with all-atomic criteria are unaffected beyond a one-line note.
- The artifact is human-readable markdown; no new tooling required.

## Provenance check

The core framing — separating criterion-level verification from scenario-level verification with an explicit layer-match check — derives from Issue #11 (user-authored) and essay 015 §2 (which traces the formal grounding to DO-178C, Zhu et al. 1997, Sommerville 2010, and Adzic 2020). The Acceptance Criteria Table and Criterion-Level Verification concepts are already in the domain model from Amendment 19. Driver-derived.

The four-column table format is drafting-time synthesis composed against the issue body's three-bullet specification ("Verification method," "Verification layer," "Layer match check") plus the criterion column itself. The "atomic, 1:1" omission convention is drafting-time synthesis grounded in the essay's observation that atomic-criterion cases pass through trivially.

The placement of the verification step at BUILD Step 5.5 (rather than as a new top-level step) is drafting-time synthesis; Issue #11 names it as "an extension of Step 5 or a new Step 5.5," and the sub-step framing was selected to keep the integration-verification flow contiguous.

The placement of the criteria-table production responsibility at DECIDE (rather than upstream at product discovery) is itself a design choice. The alternative — requiring product-discovery acceptance criteria to specify their verification layer when written — would make the table optional, since each criterion would carry its own layer declaration. Essay 015 §2 does not name a placement; the DECIDE choice was selected because product discovery's acceptance criteria are stakeholder-facing language (workflow outcomes), and pushing layer-match concerns upstream may impose technical specification on a stakeholder artifact. DECIDE is where the criteria are translated into scenarios; layer-match is a translation question. This placement decision is acknowledged here rather than presented as an obvious consequence of the gap.

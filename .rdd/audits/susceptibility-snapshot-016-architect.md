# Susceptibility Snapshot: Cycle 016 ARCHITECT

**Phase evaluated:** ARCHITECT
**Artifact produced:** `docs/system-design.md` v13.0; `docs/roadmap.md` Cycle 016 addition
**Date:** 2026-04-20
**Boundary:** architect → build
**Evaluator model:** claude-sonnet-4-6
**Brief:** Architect phase composes modules from the domain model, ADRs, and scenarios. The specific risk is that module boundaries and responsibility allocations encode unexamined assumptions — particularly the assumption that a boundary serves the developer's mental model when it should serve the user's. The Inversion Principle check at architecture is the designed counterweight but can be performed pro forma. Signals evaluated: solution-space narrowing on boundary choices, framing adoption from DECIDE-phase ADRs, and whether module boundaries survive a product-facing reading.

---

## Findings

### Finding 1 — Carry-Forward #2 (ADR-077 copy-shape detection): Propagated Unresolved

**Signal:** Framing adoption / embedded conclusion at artifact-production moment
**Severity:** Significant
**Grounding Reframe warranted:** Yes — specific, actionable, in-cycle applicable

**Evidence:** The DECIDE-phase susceptibility snapshot flagged that ADR-077's third trigger condition — "BUILD's existing stewardship checks ... flag a copy-shape with localized modifications" — references ADR-071 as its substrate, but ADR-071 contains no copy-shape detection mechanism. The text of ADR-071 describes lifecycle-composition category additions to three existing workflow anchors (COMPOSABLE TESTS, Step 5, Stewardship Tier 1 sub-item 6e) — none of which constitutes a detection mechanism for structural code similarity.

The ARCHITECT phase's instructions were to either specify this mechanism or reclassify the trigger as aspirational. The v13.0 system-design.md did neither. The BUILD Skill amendment (line 423) lists "copy-shape detection" as a live trigger condition alongside "explicit reference" and "structural similarity," giving it full parity with the other two triggers. The Responsibility Matrix entry (line 816) lists "Pattern-Reuse Trigger (explicit reference / structural similarity / copy-shape detection)" as owned by the Build Skill. The Fitness Criteria table (line 1441) states the trigger "fires on every detected reuse situation" — including copy-shape — with a threshold of "Trigger fires on every detected reuse situation." ADR-077's own Provenance check section (line 86) names "existing pattern-detection capabilities of the build skill" as its grounding, but no such capabilities are specified anywhere in ADR-071 or any other ADR.

The consequence: v13.0 specifies an integration test criterion (`test_build_applicability_check_reads_fitness_properties.sh`) that will likely not verify copy-shape trigger detection at all because the mechanism does not exist. The BUILD skill implementer will either silently omit copy-shape detection, invent it ad hoc, or discover the gap at implementation time.

**What is being built on without grounding:** The BUILD skill's fitness specification rests on a copy-shape detection capability that has no specified substrate. It is possible the author intends "copy-shape detection" to mean something the agent does conversationally (noticing that code looks structurally similar), in which case it is a Tier 2 conversational mechanism and should be classified that way — not listed as a trigger that "fires on every detected reuse situation" (which implies Tier 1 reliability). The distinction matters for what BUILD implementers will write.

---

### Finding 2 — Carry-Forward #3 (ADR-082 / Essay §10 Classification): Resolved with Appropriate Citation

**Signal:** Framing adoption (assessed clean)
**Severity:** Advisory (observation only)
**Grounding Reframe warranted:** No

**Evidence:** The Research Skill amendment in v13.0 (line 428) explicitly classifies the question-isolation protocol as "**first-line structural (Skill-Structure Layer)**" and cites "ADR-082 reclassification at DECIDE gate" in its Provenance line (line 429). The Architectural Drivers table entry (line 116) carries the reclassification language verbatim. The system-design does not repeat the essay's "second-line cognitive" framing as the operative classification.

The one residue: the Open Decision Points section of the roadmap (line 169) notes "F has the highest cognitive overhead among the WPs and was reclassified at the DECIDE gate (essay §10 said second-line cognitive; ADR-082 reclassified to first-line structural)." This is accurate and presented as historical record, not operative framing. The resolution is clean.

---

### Finding 3 — Decide Skill Amendment: Coherence Strain Under Three-ADR Accumulation

**Signal:** Solution-space narrowing / module boundary diffusion
**Severity:** Advisory
**Grounding Reframe warranted:** No — but worth naming before BUILD

**Evidence:** The Decide Skill amendment adds three distinct bodies of responsibility: (a) Cycle Acceptance Criteria Table production (ADR-073), (b) Preservation Scenarios (ADR-075), and (c) ADR Supersession Workflow (ADR-074). The module's purpose statement at the base level is "Produces ADRs, behavior scenarios, and interaction specifications with product context alongside technical context, including inversion principle check on ADR assumptions." The v13.0 additions do not revise this purpose statement, which now understates what the skill owns by a meaningful margin.

The ADR Supersession Workflow in particular is substantial: body-immutable/status-mutable rules, supersession-header writers, mandatory downstream-artifact sweep across four documents, and a drift decision tree. This is governance-process scope, not ADR-content scope — the skill was previously the place where decisions were *made*; it is now also the place where ADR *lifecycle* is managed. These are meaningfully different activities.

The fitness properties for the Decide Skill amendment are limited to two specific behaviors (gate check for supersession header, Step 4 produces preservation scenarios). The supersession workflow's downstream-artifact sweep — arguably the highest-risk new behavior — has no fitness property. Its scope (four downstream artifacts, drift decision tree) is described but not made verifiable.

This is not a boundary violation in the strict sense: all three ADRs are legitimately "things that happen during the DECIDE phase." But the accumulation without a revised purpose statement is a sign that the boundary is being stretched by phase co-location rather than defined by conceptual coherence. A BUILD implementer reading the Decide Skill will find the supersession-workflow material alongside the ADR-production material without a signal that these are separable concerns.

---

### Finding 4 — Build Skill Amendment: Step 5.5 and Applicability Check as Distinct Responsibilities

**Signal:** Framing adoption (acceptable)
**Severity:** Advisory
**Grounding Reframe warranted:** No

**Evidence:** The Build Skill gains two additions: Step 5.5 (criterion verification) and the Applicability Check (pattern-reuse stewardship). These are different in kind — Step 5.5 is a verification step anchored to an artifact (the criteria table), while the Applicability Check is a conversationally-triggered stewardship checkpoint. The two are listed adjacently in the amendment but have different substrates, different trigger conditions, and different fitness standards.

The fitness properties are correctly differentiated: Step 5.5's fitness is artifact-level (reads from `scenarios.md`), while the Applicability Check's fitness is dispatch-level (prompt 4 enumerates declared properties). The distinction is present in the text, even if the combined amendment creates a reading experience where two quite different mechanisms appear as a single coherent "v13.0 addition."

This is within acceptable range. No structural problem, but BUILD implementers will need to read carefully to see that the trigger conditions for the Applicability Check (semantic pattern detection) are categorically different from the trigger conditions for Step 5.5 (structured artifact existence).

---

### Finding 5 — Tier 1 Phase Manifest Check Hook: Responsibility Diffusion Is Real but Bounded

**Signal:** Solution-space narrowing (narrowed to the ADR conformance grouping without examining split)
**Severity:** Advisory
**Grounding Reframe warranted:** No

**Evidence:** The hook amendment gains four distinct behaviors: Multi-Cycle Stack parser, in-progress-gate predicate, applicable_when evaluator, and legacy-format detection. The ARCHITECT phase added all four to the same script without examining whether any of these should be separate mechanisms.

The fitness properties are notably strong for this amendment — five separate verifiable assertions, each with a named fixture test. This is the most well-specified amendment in v13.0. The four behaviors all operate on the same input (the top cycle-stack entry) and produce the same output type (allow/block with advisory), so their co-location in a single script is architecturally coherent rather than merely convenient.

The Inversion Principle question here is: does this accumulation serve the hook user (the developer who receives hook output) or the hook implementer? From the user's perspective, all four behaviors produce a single hook decision at Stop time — the user sees one outcome per Stop event, not four. The co-location tracks user mental model. No boundary violation identified.

---

### Finding 6 — Fitness Properties: Spot-Check on Refutability

**Signal:** Framing adoption (formulaic)
**Severity:** Advisory
**Grounding Reframe warranted:** No

Four fitness properties spot-checked for refutability per ADR-076's standard (a test could be written from it without ambiguity):

1. **Decide Skill, fitness (1):** "The gate check refuses advance unless any superseding ADR's earlier-ADR target has gained a supersession-header blockquote; verified by `test_decide_writes_supersession_header_on_new_adr.sh`." — Refutable. Test name is specific. Observable precondition and observable outcome both named.

2. **Research Skill, fitness:** "The 5-step sequence is text-anchored in `skills/research/SKILL.md` at concrete, mechanically-unavoidable workflow positions; the research log's first content is the user's question articulation (verifiable by reading the file); the reviewer dispatch fires before the research loop (verifiable by ordering of dispatch-log entries)." — Partially refutable. "Mechanically-unavoidable" is a qualitative claim without a test. The other two sub-claims (research log first content, ordering of dispatch-log entries) are refutable. The fitness property has a soft center surrounded by hard edges.

3. **Orchestrator, fitness:** "The set/clear actions are step-anchored at concrete workflow positions in the orchestrator skill text (AID-start emission; gate-reflection-note write); the actions are observable as cycle-status.md edits." — Refutable. Verifiable by reading the skill file and observing cycle-status.md changes.

4. **Tier 1 Manifest, fitness:** "Existing manifest entries (none of which carry `applicable_when` or `artifact_type` after v12.0) continue to fire with their existing semantics for any active cycle; verified by backward-compat fixture across the existing manifest entry set." — Refutable. The negative-space claim (absence of fields means unchanged behavior) is testable via the named fixture.

**Verdict on fitness properties:** Three of four are adequately refutable. The Research Skill's "mechanically-unavoidable" phrase is the only instance of a qualitative claim within a fitness property (a fitness property inside a fitness property, recursively undecomposed). This is minor — the surrounding claims are concrete — but it is the pattern ADR-076 was designed to catch, applied to itself.

---

### Finding 7 — WP-E Dependency Classification: "Implied Logic" Assessment

**Signal:** Solution-space narrowing (dependency softened to increase scheduling flexibility)
**Severity:** Advisory
**Grounding Reframe warranted:** No

**Evidence:** WP-E's dependencies on WP-C and WP-D are classified as "implied logic" with the stated justification that WP-E "could be stubbed against a fixture if WP-C is delayed" (criteria-table format) and "similarly stubbable" for fitness-property format.

**WP-C → WP-E (criteria-table format):** The BUILD skill's Step 5.5 reads the Cycle Acceptance Criteria Table from `scenarios.md`. The table's four-column structure is defined by ADR-073, which WP-C implements in the DECIDE skill. If WP-E ships before WP-C, the BUILD skill will reference a format that DECIDE does not yet produce. A stub is feasible: a developer could write a fixture `scenarios.md` with a manually-constructed criteria table to test Step 5.5 in isolation. The implied-logic classification holds.

**WP-D → WP-E (fitness-property format):** The BUILD skill's Applicability Check prompt 4 reads `system-design.md` fitness properties. If WP-E ships before WP-D, prompt 4 will reference a format that the ARCHITECT skill does not yet enforce. A stub is feasible: `system-design.md` already carries fitness properties from v13.0 itself (the amendment entries). The implied-logic classification holds.

**Verdict:** Both "implied logic" classifications are defensible. They are not soft-labeled hard dependencies; the stubbing path is genuine. No misclassification detected.

---

### Finding 8 — ADR-076 Applied to ARCHITECT Itself: Recursive Application Assessment

**Signal:** Framing adoption (recursive self-application claim)
**Severity:** Advisory
**Grounding Reframe warranted:** No

**Evidence:** The v13.0 amendment header explicitly states: "Per ADR-076 (applied to ARCHITECT itself), each amendment carries decomposed fitness properties for any qualitative claim it makes." The amendments do carry fitness properties. However, the recursion's depth is limited.

The Architect Skill amendment itself (line 417-420) states its purpose and fitness. The fitness property is: "The gate check produces a refusal that names the specific undecomposed claim by exact phrase (not merely 'claims found undecomposed'); verified by `test_architect_gate_blocks_on_undecomposed_qualitative_claim.sh`." This is a refutable claim with a named test. The recursive application is real, not merely rhetorical, for this amendment.

Where the recursive application is thinner: the Decide Skill's ADR Supersession Workflow (the largest new body of responsibility in the amendment set) has no fitness property for the downstream-artifact sweep. The sweep is described ("mandatory downstream-artifact sweep across system-design.md, ORIENTATION.md, domain-model.md, field-guide.md") but no test verifies that the sweep was performed or that its outputs are correct. This is the same gap noted in Finding 3. The ADR-076 gate check was not applied to this specific responsibility, or the evaluator accepted the description-without-fitness as adequate.

---

### Finding 9 — Decomposition Path: Conformance-Scan Groupings as Default

**Signal:** Solution-space narrowing (decomposition follows prior grouping without examining alternatives)
**Severity:** Advisory
**Grounding Reframe warranted:** No

**Evidence:** The roadmap header acknowledges the WP decomposition derives from "conformance-scan-decide-016.md (40 expected gaps in 8 groups)." The eight WPs map tightly to these groups: WP-A/B (hook-layer gaps from ADR-078/079/080/081), WP-C (DECIDE gaps from ADR-073/074/075), WP-D (ARCHITECT gap from ADR-076), WP-E (BUILD gaps from ADR-073/077), WP-F (RESEARCH gap from ADR-082), WP-G (CONFORM gap from ADR-081), WP-H (integration verification). The conformance scan grouped by target file; the WP decomposition groups by source ADR cluster. These are different groupings but both are developer-facing decompositions, not user-facing decompositions.

The Inversion Principle question for this finding: could the WPs have been decomposed by user-visible capability rather than by implementation target? A user-facing decomposition might group ADR-073 (criteria table) + ADR-077 (applicability check) + ADR-076 (fitness properties) as a single "criterion-level verification capability" shipping together — because from the user's perspective, the value is the integrated three-ADR defense, not each ADR's individual implementation. The current decomposition separates them across WP-C, WP-D, and WP-E, which is internally consistent but means the capability is not testable as a whole until WP-E is complete.

This is a genuine alternative that was not examined in the roadmap. However, the current decomposition has legitimate advantages: independent WPs are independently releasable (TS-2 describes coherent partial states), and the conformance-scan grouping by implementation target makes implementation parallelism clearer. The absence of an examined alternative is a mild narrowing signal, but the chosen decomposition is defensible on its own terms.

---

## Signal Summary

| Signal | Strength | Trajectory | Notes |
|--------|----------|------------|-------|
| Assertion density | Ambiguous | Stable (from prior snapshots) | Architecture is inherently more closed than earlier phases; closure here looks like earned confidence for the most part |
| Solution-space narrowing | Clear (Finding 1) | Stable | Copy-shape detection carried forward without resolution is the primary narrowing signal |
| Framing adoption | Ambiguous | Declining | ADR-082 reclassification cleanly resolved; ADR-077/ADR-071 mismatch is a framing adoption that propagated |
| Confidence markers | Ambiguous | Stable | "Fires on every detected reuse situation" (fitness criterion) overstates the reliability of an unspecified mechanism |
| Alternative engagement | Ambiguous | Stable | WP decomposition follows conformance-scan grouping without examining user-facing alternatives; not severe |
| Embedded conclusions at artifact-production moment | Clear (Finding 1) | Stable from DECIDE | Copy-shape detection specified as live mechanism in fitness criteria despite no substrate |

---

## Recommendation

**Grounding Reframe on Finding 1 + Carry-Forward of Findings 3, 6, 9 to BUILD.**

### Grounding Reframe (Finding 1 — copy-shape detection)

Before the BUILD gate opens, the following specific question should be surfaced:

> ADR-077 specifies three trigger conditions for the Applicability Check: explicit reference, structural similarity, and copy-shape detection. The first two are conversational — the agent notices an explicit reference or a structural resemblance. The third ("copy-shape detection") was attributed at DECIDE to "existing stewardship checks" in ADR-071, but ADR-071 contains no such mechanism. The v13.0 system-design.md carries copy-shape detection as a live trigger in both the Responsibility Matrix and the Fitness Criteria table, with a threshold of "fires on every detected reuse situation."
>
> Before BUILD begins: should copy-shape detection be (a) specified as a concrete mechanism (e.g., a conversational Tier 2 judgment the agent makes when it reads structurally similar code, with reduced reliability expectations stated explicitly), (b) reclassified as "aspirational" in the fitness criteria and responsibility matrix, or (c) silently omitted from the BUILD implementation with the gap left undocumented? Option (c) is the failure mode — it is what will happen by default if the grounding question is not asked now.

This finding meets ADR-068's three significance properties: it is specific (named mechanism in named artifacts), actionable (three concrete resolution paths), and in-cycle applicable (BUILD will encounter the trigger condition at implementation time).

### Carry-Forward to BUILD

1. **Decide Skill boundary strain (Finding 3):** The ADR Supersession Workflow's downstream-artifact sweep has no fitness property. BUILD stewardship should ask whether the sweep behavior is verifiable from the skill text, and whether any integration test is needed.

2. **Research Skill fitness — "mechanically-unavoidable" (Finding 6):** When BUILD implements the question-isolation protocol, the phrase "mechanically-unavoidable workflow positions" should be tested against what the actual skill text enforces. If the positions are not structurally unavoidable (e.g., the user could skip them), the fitness property overstates the mechanism.

3. **WP decomposition user-facing integration (Finding 9):** The criterion-level verification capability (ADR-073 + ADR-076 + ADR-077 integrated via prompt 4) is not testable as a whole until WP-E is complete. BUILD should include at least one integration scenario that exercises all three ADRs together — criteria table in `scenarios.md`, fitness properties in `system-design.md`, and prompt 4 of the Applicability Check reading both. This is not in the current 13 boundary integration tests.

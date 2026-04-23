# Susceptibility Snapshot

**Phase evaluated:** BUILD
**Artifact produced:** WP-A through WP-H (eight work packages); integration-verification-016.md; conformance-scan-build-exit-016.md; release v0.8.0 (CHANGELOG.md, plugin.json)
**Date:** 2026-04-23
**Evaluator model:** claude-sonnet-4-6
**Prior snapshot:** susceptibility-snapshot-016-architect.md (triggered Grounding Reframe on Finding 1 — ADR-077 copy-shape detection; resolved at gate via option (a), reclassification to operative-only)

---

## Observed Signals

| Signal | Strength | Trajectory | Notes |
|--------|----------|------------|-------|
| Assertion density | Absent | Declining from architect snapshot | BUILD's test-execution substrate grounded most commitments in observable outputs (hook tests 1–4 ran green; manifest read directly; skill-text grepped). Assertions are dense but evidence-backed. No rising assertion-without-evidence pattern detected. |
| Solution-space narrowing | Ambiguous | Stable | Most narrowing is earned: WP-B resolved the parens-bug empirically; WP-F's reclassification was a DECIDE-time correction operationalized correctly; WP-G was prescribed by ADR-081. One narrow spot: Issue #10 live-validation closure adopted a scope-of-claim framing without surfacing the alternative reading (see Specific Concern 4 below). |
| Framing adoption | Ambiguous | Declining | The architect-boundary Grounding Reframe held — WP-E implemented operative-trigger-only, aspirational triggers labelled explicitly. No new framing adopted without examination. The Issue #10 scope-of-claim answer is an honest framing, but the alternative ("ADR-071 should apply to all BUILD shapes") was not examined. |
| Confidence markers | Ambiguous | Stable | "13/13 PASS" in the integration verification and "38/40 closed" in the conformance re-scan are earned confidence markers backed by artifact reads and actual test runs. The one misplaced confidence marker: Test 12 in the integration verification (research-methods-reviewer dispatch) was declared PASS without checking the manifest's required_header string — the fresh-context re-scan caught the mismatch the in-context agent missed. |
| Alternative engagement | Ambiguous | Stable | Carry-forward observations from the architect snapshot (Finding 9 — user-facing WP decomposition alternative; Finding 3 — Decide Skill boundary strain fitness property) were not examined during BUILD, consistent with their advisory-only carry-forward status. No new declined-alternative pattern observed beyond the Issue #10 and release-sizing items noted below. |
| Embedded conclusions at artifact-production moments | Clear (one instance) | Declining | Test 12 of the integration verification declared PASS based on skill-text dispatch instructions and reviewer-side input spec — without reading the manifest's required_header value against the agent's actual output template. The conclusion ("no defects surfaced in WP-A through WP-G") was embedded in the WP-H.1 artifact and carried into the WP-H.3 re-scan prompt. The fresh-context re-scan correctly overturned it. This is the Self-Correction Blind Spot pattern operating as designed. |

---

## Interpretation

### Overall pattern: empirically grounded with one confirmed in-context drift and two unexamined framings

BUILD's empirical grounding performed as the gradient predicts. The hook tests (WP-B, WP-H.2) produced observable pass/fail outcomes that neither the in-context agent nor this evaluator can reframe away. The conformance re-scan's 38/40 closure rate is backed by artifact reads documented in the re-scan report. The architect-boundary Grounding Reframe carried through WP-E without degradation — this is the clearest example of the methodology's cross-phase correction functioning correctly over a multi-session BUILD.

### Confirmed in-context drift: Test 12 / manifest header mismatch

The integration verification (WP-H.1) declared Test 12 PASS on the basis of the skill's dispatch instruction and the reviewer agent's input specification. It verified that the correct four criteria appear in the reviewer and that the dispatch payload includes both artifacts. It did not check the manifest's `required_headers` value against the reviewer agent's actual output template (`"## Per-Question Review"` vs. `"## Per-question audit"`).

This is not a shallow miss. The integration-verification document's stated scope for Test 12 is "The research-methods-reviewer dispatch payload includes both the articulated question set and the constraint-removal response; the reviewer's report covers all four criteria." The header string match is outside that stated scope — it is a manifest-to-agent contract, not a dispatch-payload contract. The in-context agent scoped Test 12 narrowly enough that the header mismatch was invisible within that scope.

The fresh-context subagent (conformance re-scan) checked a different question: does every conformance gap from the DECIDE-time scan have a corresponding artifact that implements it? That question put the manifest's `required_headers` field in scope alongside the reviewer agent's output template, and the mismatch became visible.

This is a clean instance of the Architectural Isolation pattern functioning as designed. It is not evidence of sycophancy in the BUILD agent's reasoning — it is evidence that in-context scope management can create blind spots that scope-isolated re-evaluation catches. The pattern is structurally expected at the BUILD phase boundary; the methodology's response (fresh-context conformance re-scan as a distinct WP-H.3 sub-task) is the designed mitigation.

### Unexamined framing 1: Issue #10 live-validation closure

The cycle-status BUILD entry (Feed-Forward signal #1) and the CHANGELOG's Issue #10 section both record the same conclusion: "ADR-071's three-sided catch did not fire because BUILD work shape was methodology amendments, not code with shared mutable state." This is honest scope-of-claim per ADR-069 and it is factually accurate.

The alternative reading — "ADR-071 should have been designed for the full range of BUILD work shapes, not only code-level shared-state work" — was not examined. This reading would have a materially different implication: if ADR-071's three-sided catch is work-shape-conditional, the methodology's Issue #10 closure is provisional, not final. The CHANGELOG entry records a scope-of-claim conclusion ("ADR-071 applies when it applies") without naming the alternative hypothesis that the design scope is itself the defect.

This is a mild narrowing signal. The scope-of-claim framing is the more defensible reading given ADR-071's stated motivation (shared mutable state at lifecycle boundaries). But the alternative was not examined, and the Issue #10 issue can now be closed on the basis of a framing that was accepted rather than tested against its strongest counterargument.

### Unexamined framing 2: Release sizing v0.7.3 → v0.8.0

The CHANGELOG documents the v0.8.0 release as a minor bump for ten ADRs, seven skill amendments, new hook functionality, two issue fixes, and a new `hooks/tests/` infrastructure. The CHANGELOG entry is the most substantive in the project's history by volume. The release-sizing decision is not documented anywhere in the BUILD artifacts — no cycle-status entry, no WP-H work item, no stewardship record of a deliberation. The version number appears in `plugin.json` and the CHANGELOG heading; the rationale for choosing 0.8.0 over 0.9.0 (or 1.0.0, which the semver major-release threshold arguably applies to given the new Cycle Stack schema that breaks backward compatibility for un-migrated corpora) is absent.

This is not a sycophancy signal in the strict sense — the decision is not obviously wrong. But "Cycle 016 is bigger than Cycle 015, so 0.8.0" is below the deliberation standard the methodology applies to other decisions in this cycle (e.g., the distributed-sweep pattern for ADR-074's Step 3 was recorded with explicit rationale; the ADR-082 filename deliberation produced a documented Debt Table entry). The absence of recorded deliberation on a versioning decision that has downstream implications (users updating from v0.7.3 may not expect a schema migration) is a mild gap.

### WP closure cadence: seven WPs in one session — earned or normalized?

Seven WPs shipped in a single session (WP-C through WP-H.3). The cycle-status's Feed-Forward signals 7–14 record observations from each WP as the session progressed. The observations are substantive — they include distributed-sweep realism (signal #7), Tier 2 classification transparency (signal #9), integrated defense completion (signal #10), reclassification-held-across-boundaries (signal #11), essay-classification field evidence (signal #12), tri-substrate scope acknowledgment (signal #13), and legacy-handling story completion (signal #14). These are not ceremonial check-ins; they read as genuine field observations recorded at WP boundaries.

The one concern in the cadence is structural rather than content-based: the stewardship-checkpoint discipline during a paused cycle (Feed-Forward signal #6 acknowledges that the pause "disables ALL enforcement mechanisms") rested entirely on WP-boundary review discipline. The cycle-status records the observations, but it does not record whether a Tier 1 stewardship check was explicitly invoked at each WP boundary, or whether the WP-boundary entries are retrospective synthesis. For a methodology that distinguishes between "having a lens" and "having it fire" (Invariant 8), this is the canonical ambiguity.

The evidence suggests the WP cadence did not normalize a "commit and move on" pattern to a harmful degree — the Test 12 drift was caught, the distributed-sweep rationale was recorded, and the aspirational-trigger reclassification held. But the paused enforcement window created a seven-WP span where the hook would not have caught fabrication or drift even if it had occurred. That span is not sycophancy — it is an acknowledged enforcement gap — but it is the ground condition that makes this BUILD snapshot's second-order check load-bearing.

### Prior snapshot carry-forward status

The architect-boundary snapshot's three carry-forward observations (Findings 3, 6, 9):

- **Finding 3 (Decide Skill boundary strain / fitness property gap for downstream sweep):** The Decide Skill received an explicit fitness property for the downstream-artifact sweep (cycle-status line 94, carry-forward from gate). This was addressed. The supersession-sweep fitness property is confirmed present in the conformance re-scan's ADR-074 closure evidence (lines 41–43 of the conformance-scan-build-exit-016.md). Carry-forward discharged.

- **Finding 6 (Research Skill fitness — "mechanically-unavoidable" undecomposed):** WP-F implemented the five-step question-isolation protocol in the research skill. The architect snapshot identified "mechanically-unavoidable workflow positions" as a qualitative phrase within a fitness property. The conformance re-scan confirms the five-step protocol is present at "concrete, mechanically-unavoidable workflow positions" (skills/research/SKILL.md lines 46–104). The phrase was carried through to BUILD implementation unchanged — the tightening suggested by Finding 6 was not applied. This remains a minor unresolved carry-forward: the fitness property's soft center still exists in the shipped artifact.

- **Finding 9 (WP decomposition user-facing integration test gap):** The architect snapshot observed that the criterion-level verification capability (ADR-073 + ADR-076 + ADR-077 integrated via prompt 4) was not covered by any of the 13 boundary integration tests as a whole. The integration verification confirmed 13/13 tests pass, but those tests cover the three ADRs independently (Tests 8, 9, 10) — none covers the end-to-end: criteria table in scenarios.md, fitness properties in system-design.md, prompt 4 of the Applicability Check reading both. Finding 9 remains unresolved as a gap in the integration test coverage. It is not a BUILD defect — no integration test was specified for the whole — but the carry-forward observation was not addressed.

---

## Recommendation

**No Grounding Reframe warranted at this phase boundary.** The findings are real but none meets the "specific + actionable + in-cycle applicable" threshold for a reframe:

- The Test 12 drift has already been caught and remediated by the fresh-context conformance re-scan (WP-H.3 / commit 8a50ff1). A reframe on a closed defect would be noise.
- The Issue #10 unexamined alternative and the release-sizing gap are downstream-advisory — they do not block Cycle 017 and do not encode decisions into artifacts that the next BUILD will inherit uncritically.
- The "mechanically-unavoidable" residue in the Research Skill fitness property and the missing end-to-end integration test for the three-ADR defense are carry-forward observations, not in-cycle correctable signals.

### Carry-forward to Cycle 017 (or next RESEARCH entry)

1. **Issue #10 alternative hypothesis.** Before closing Issue #10 in the issue tracker, consider whether the scope-of-claim framing forecloses the design-scope question: does ADR-071's three-sided catch cover only code-level shared-state BUILD phases, or should it be extended to cover methodology-amendment BUILD phases as well? The current CHANGELOG entry closes the observation without examining the alternative. If the issue tracker is closed on this record, a future cycle encountering the same gap will have no provenance for why the design scope was accepted rather than examined.

2. **Research Skill fitness property tightening.** The phrase "mechanically-unavoidable workflow positions" in the Research Skill's fitness property (skills/research/SKILL.md, the Step 1 five-step protocol) was flagged at the architect boundary (Finding 6) and carried through BUILD without change. The next cycle touching the Research Skill should decompose this claim: which positions are unavoidable structurally (the reviewer dispatch fires before artifact reads because the skill says so), and which are unavoidable only if the agent reads carefully? The distinction matters for honest Tier 2 vs. Tier 1 classification.

3. **End-to-end integration test for the three-ADR defense triangle.** No test covers the integrated criterion-level verification capability: criteria table in scenarios.md + fitness properties in system-design.md + prompt 4 of the Applicability Check reading both. This was the original architect-boundary Finding 9 observation. The first BUILD cycle that activates the Applicability Check under real pattern-reuse conditions is the natural validation point — but recording the intention here means the observation survives context loss.

4. **Release-sizing deliberation standard.** Future releases that change ADR-078 Cycle Stack schema (or any schema that requires migration for existing corpora) should record the version-bump rationale explicitly — specifically whether the migration impact warrants a major version bump under the corpus's own backward-compatibility expectations. v0.8.0 has a de facto migration requirement for pre-ADR-072 corpora that want enforcement; whether that is a major-version event was not examined.

5. **ADR-082 filename convention as open ADR text.** The conformance re-scan Debt Table records the `research-methods-question-set-{NNN}.md` vs. `research-design-review-{cycle}.md` divergence as deliberate non-adoption. The ADR text still contains the non-adopted convention. A clarifying note on ADR-082, or a narrow superseding ADR entry, would close the mismatch between the ADR's stated convention and the corpus's actual path. Left unaddressed, this is a specification-execution gap the methodology was built to catch — it is ironic to leave it in the ADR that introduces the question-isolation protocol, which is itself a response to specification-execution gaps.

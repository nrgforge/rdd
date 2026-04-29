# Argument Audit Report — Cycle 10 DECIDE

**Audited document:** Eight-ADR set:
- `docs/decisions/adr-063-per-phase-manifest-format.md`
- `docs/decisions/adr-064-compound-check-hooks.md`
- `docs/decisions/adr-065-anchor-dispatch-skill-structure-fix.md`
- `docs/decisions/adr-066-user-tooling-layer.md`
- `docs/decisions/adr-067-three-tier-enforcement-classification.md`
- `docs/decisions/adr-068-grounding-reframe-extension.md`
- `docs/decisions/adr-069-methodology-scope-of-claim.md`
- `docs/decisions/adr-070-housekeeping-migration.md`

**Source material:**
- `docs/essays/014-specification-execution-gap.md`
- `docs/essays/research-logs/spike-s1-hook-feasibility.md`
- `docs/essays/research-logs/spike-s2-acceptance-criteria.md`
- `docs/essays/research-logs/spike-s3-base-rate-audit.md`
- `docs/essays/research-logs/spike-s4-fail-loud-dispatch.md`
- `docs/essays/research-logs/lit-review-instruction-following-degradation.md`
- `docs/essays/research-logs/lit-review-telemetry-acceptance-criteria.md`
- `docs/decisions/adr-033-cross-cutting-hooks.md`
- `docs/decisions/adr-055-belief-mapping-operationalization-of-inversion-principle.md`
- `docs/decisions/adr-056-research-grounded-question-toolkit-for-aid.md`
- `docs/decisions/adr-057-aid-susceptibility-extension.md`
- `docs/decisions/adr-058-unconditional-architectural-floor.md`
- `docs/decisions/adr-059-grounding-reframe.md`
- `docs/decisions/adr-060-research-methods-subagent.md`
- `docs/decisions/adr-061-framing-audit-as-argument-auditor-extension.md`
- `docs/decisions/adr-062-assertion-detection-hook.md`
- `docs/domain-model.md`

**Date:** 2026-04-09

---

## Summary

- **Argument chains mapped:** 14
- **Issues found:** 11
- **P1:** 1
- **P2:** 4
- **P3:** 3
- **Framing concerns:** 3

---

## Section 1: Argument Audit

### P1 Findings — Must Fix Before Accepting ADRs

**Finding P1-A**

- **Location:** ADR-064, Consequences → Positive, first bullet. ADR-067, Harness Layer row of the substrate table.
- **Claim:** "State C becomes structurally impossible for the four addressed failure modes. Sophisticated fabrication would require inducing a fake `PostToolUse` hook event matching the artifact claim; the agent cannot inject hook events."
- **Evidence gap:** The claim's strength is accurate for the compound check when both hooks are working, but the ADR establishes advisory mode as a fully valid operating state for pre-migration corpora. In advisory mode the PostToolUse dispatch log is not written and the Stop hook does not perform the compound cross-reference — it degrades to no enforcement. ADR-064 states this explicitly: "users who never run `/rdd-conform` after a plugin update continue to work normally with advisory-mode notices; their cycles complete … they simply lack harness-layer verification." Under advisory mode, State C is not structurally impossible; the agent can produce a fabricated artifact at the expected path with no dispatch log entry and the hook emits allow. The structural-impossibility claim is therefore conditional on the corpus being in enforcement mode (marker file present), but the ADR's framing of the claim as unconditional in the Consequences section is a scope overreach. The ADR does separately acknowledge advisory mode in its own subsection, but the Consequences section's top bullet states the guarantee without the condition, which is the section readers and downstream ADR authors will cite.
- **Recommendation:** Qualify the structural-impossibility claim in the Consequences positive bullet: "State C becomes structurally impossible for migrated corpora in enforcement mode. In advisory mode (pre-migration corpora), the compound check is disabled and the structural guarantee does not hold." The advisory-mode section already says this; the Consequences section needs to match it. This is a clarity issue with real downstream risk — a future ADR citing ADR-064 for the structural guarantee should not inherit an unconditional claim that the same ADR's body qualifies.

---

### P2 Findings — Should Fix Before Building

**Finding P2-A**

- **Location:** ADR-063, Negative Consequences, third bullet ("Precondition: subagent output-path convention must be adopted"). ADR-065, Fix 1, path note. ADR-070, reference updates section.
- **Claim:** ADR-063 flags the skill/agent output-path update as "a hard dependency of this ADR's operational value." ADR-065 adds a "Path note for ADR-070 migration" noting that the canonical path in Fix 1's phase-boundary template is `docs/essays/audits/susceptibility-snapshot-{cycle}-{phase}.md` but "when ADR-070 executes the housekeeping migration, this path becomes `docs/housekeeping/audits/...`." ADR-070's reference updates section confirms the skill files must be updated "as part of the migration" and that "the skill edits in this ADR and the path updates in ADR-070 must be coordinated to avoid mid-transition inconsistency."
- **Evidence gap:** Three ADRs each name a different dependency owner for the same coordinated change, and none of them says explicitly which must ship first or whether they ship atomically. ADR-063 says the precondition is a "skill/agent change" but does not name ADR-065 or ADR-070 as the vehicles. ADR-065 says the skill edits and ADR-070 path updates "must ship together" but does not specify the atomic shipping unit. ADR-070 says the migration "must check for uncommitted changes and refuse to run if `git status` shows unstaged modifications to skill files" — which implies they don't necessarily ship atomically. The coordination is real and each ADR acknowledges it, but the seam between them is not closed: there is a possible transitional state where ADR-063 and ADR-064 are implemented, the manifest references `docs/essays/audits/` paths, ADR-065's skill edits are not yet shipped, and ADR-070's migration has not run. In that state the manifest entries for the susceptibility snapshot produce false negatives (legitimate runs blocked because path convention not yet adopted), and the PostToolUse hook logs `expected_path: null` for all Tier 1 dispatches (because the canonical prompt skeleton is not yet in skill files). This is not an inconsistency that invalidates any ADR's internal logic, but the cross-ADR coordination assumption is implicit rather than explicit.
- **Recommendation:** One of the three ADRs — ADR-067 is the catalog ADR and the natural place — should carry a brief "implementation sequencing" note stating that ADRs 063, 064, and 065 must ship before ADR-070's migration runs, and that the plugin release shipping these ADRs should treat 065's skill edits and 070's path updates as a single atomic change. Alternatively, ADR-070 could gain an explicit precondition: "Preconditions: ADR-065's skill-file edits for the canonical prompt skeleton are complete. The manifest's `path_template` values reference `docs/essays/audits/` during the window between ADR-065 shipping and ADR-070 migration running; this is the expected transitional state." Either form closes the coordination seam.

**Finding P2-B**

- **Location:** ADR-069, Decision section, failure-mode/success-mode dichotomy. ADR-069, Provenance check, watch item.
- **Claim:** "The pattern has two forms: Failure mode — agent composes a framing at a synthesis moment; the user follows along without evaluating... Success mode — agent composes a framing at a synthesis moment; the user notices the composition, evaluates it on stated criteria, accepts or rejects on the merits." ADR-069 counts "six instances across Cycle 10" of the failure mode and "one clear instance" of the success mode.
- **Evidence gap:** The instance count is internally inconsistent. The ADR lists the failure-mode instances in numbered form: four in research, one in discover, one in MODEL, one in DECIDE turn 1 — that is seven, not six. The provenance check says "five failure-mode instances plus one success-mode instance." The three numbers (six in the body, seven in the enumeration, five in the provenance) do not reconcile. The ADR is internally inconsistent on the failure-mode instance count.
- **Recommendation:** Reconcile the count explicitly. The clearest reading of the enumeration: four research + one discover + one MODEL + one DECIDE = seven failure-mode instances, plus one success-mode instance = eight total documented instances. Update the body and the provenance check to use seven failure + one success consistently. This is a factual accuracy issue for a claim the ADR treats as its primary empirical base.

**Finding P2-C**

- **Location:** ADR-064, Negative Consequences, `{cycle}` token resolution bullet. ADR-063, Design properties, "Cycle-aware via template substitution."
- **Claim:** ADR-063 states: "The Stop hook infers the cycle from the highest `NNN-` prefix in `docs/essays/`." ADR-064 acknowledges this as a known fragility: "The `{cycle}` token resolution fails on out-of-order essay numbering. If a user starts essay 015 while 014 is still in DECIDE, the hook infers the current cycle as 015, not 014." ADR-064's mitigation is that "if it becomes a problem, the cycle number can be explicitly set in `cycle-status.md` rather than inferred."
- **Evidence gap:** The ADR set provides no decision for which convention to adopt at v1. ADR-063 specifies inference from essay prefixes as the mechanism. ADR-064 defers explicit cycle-status setting to "if it becomes a problem." But ADR-070 changes the cycle-status location to `docs/housekeeping/cycle-status.md` and explicitly calls cycle-status a machine-consumed operational file. If `cycle-status.md` is the right place to track the current cycle number explicitly — which is consistent with it being "operational state for active-cycle tooling" — then the hook should read the cycle number from cycle-status, not infer it from essay prefixes. The two ADRs point to a design decision that was not made: is the cycle number inferred (fragile, as acknowledged) or explicitly tracked (robust but requires a cycle-status field)?
- **Recommendation:** ADR-063 or ADR-064 should close the design decision: either commit to explicit cycle-status tracking as the canonical mechanism (with essay-prefix inference as fallback), or commit to essay-prefix inference as v1 with an explicit acknowledgment that the cycle-status mitigation is the v2 path. Either is defensible; neither leaving it as a deferred "if needed" while the implementation ADR specifies inference creates unnecessary ambiguity for the implementer.

**Finding P2-D**

- **Location:** ADR-066, Scope and boundaries section, explicit non-targets. ADR-066, Consequences, Negative.
- **Claim:** "Belief-mapping at mid-conversation user pushback. This is not phase-bounded; there is no natural artifact moment. Essay 014 §7 line 184 names this as outside the User-Tooling Layer's reach."
- **Evidence gap:** Essay 014 §7's actual wording (line 184) is accurate. However, ADR-066 adds: "Remains a Skill-Structure Layer concern (skill text instructs belief-mapping; enforcement depends on the orchestrator following the instruction)." This framing re-introduces exactly the failure pattern Cycle 10 documents — "enforcement depends on the orchestrator following the instruction" is judgment-anchored dispatch by definition. ADR-067's decision procedure explicitly states that mechanisms with no step-anchorable form, no hook-verifiable event, and no natural artifact moment reach step 4: "cannot be specified as unconditional." ADR-066 calling it a "Skill-Structure Layer concern" is thus inconsistent with ADR-067, which would classify it as a step-4 mechanism — one that cannot meet Invariant 8's anchoring requirement and therefore cannot be unconditional.
- **Recommendation:** ADR-066 should align its framing of belief-mapping at pushback with ADR-067's decision-procedure outcome: this mechanism reaches step 4 — it cannot be Tier 1 unconditional and should be labeled as a best-effort or explicitly contingent mechanism. Saying it is "a Skill-Structure Layer concern" implies it meets ADR-065's pattern, which it does not (there is no concrete, mechanically-unavoidable workflow step to anchor it to). The honest framing is "outside the reach of any structural substrate, remains Tier 2 best-effort per ADR-058."

---

### P3 Findings — Nice to Have

**Finding P3-A**

- **Location:** ADR-064, Revision-aware re-audit reminder section.
- **Claim:** "The Stop hook... performs a mtime comparison for each audited document against the timestamp of the most recent matching dispatch log entry. If the document was modified after the last dispatch, the hook emits a model-visible notice."
- **Evidence gap:** The dispatch log format specified in ADR-064's Neutral consequences is `{timestamp, session_id, mechanism, subagent_type, expected_path, tool_use_id}`. This schema does not include a field identifying which source document the mechanism audited. The mtime comparison requires knowing which document to compare, but the dispatch log entry only contains `expected_path` (the audit artifact path) and `mechanism`. The manifest extension in the same section adds `audited_documents` to the manifest format per mechanism, which is the source of this information — but the hook would need to join the dispatch log entry (keyed by `mechanism`) to the manifest entry (also keyed by `mechanism`) to find `audited_documents`, then glob-match those documents. This join is implicit and not specified as a hook implementation step.
- **Recommendation:** Add a brief data-flow note to the Revision-aware re-audit reminder section: "The implementation joins the dispatch log entry's `mechanism` field to the manifest's corresponding entry to retrieve `audited_documents`, then performs the mtime comparison against each matched file. This join must be explicit in the hook implementation."

**Finding P3-B**

- **Location:** ADR-067, substrate table, Harness Layer row, "Example mechanism" column.
- **Claim:** "Argument auditor re-audit verification" is listed as an example of the Harness Layer's primary domain.
- **Evidence gap:** The argument auditor already achieves 100% coverage at the Skill-Structure Layer (Spike S3, Essay 014 §2). ADR-065 Fix 2 addresses the argument auditor as a "hygiene improvement." The argument auditor re-audit specifically is a timing/state concern, which ADR-064's revision-aware reminder handles, but the primary argument auditor dispatch is step-anchored, not harness-primary. Listing "argument auditor re-audit verification" as the Harness Layer example could mislead a reader into thinking the argument auditor's primary dispatch belongs primarily to the Harness Layer rather than the Skill-Structure Layer.
- **Recommendation:** Reword the Harness Layer example: "Argument auditor re-audit temporal verification (the primary dispatch is Skill-Structure Layer; the Harness Layer adds verification that re-audits happen after revisions via the revision-aware reminder in ADR-064); susceptibility snapshot at phase boundaries (as complement to skill-structure fix)."

**Finding P3-C**

- **Location:** ADR-064, Housekeeping directory section, final paragraph of "Committed as housekeeping, migration deferred to ADR-070."
- **Claim:** "The conformance audit skill should be extended to audit the organization of `docs/housekeeping/`... This is within `rdd-conform`'s existing template-alignment mandate, applied to a new directory pattern." This is then developed into three specific new audit scopes in ADR-070's rdd-conform scope extension.
- **Evidence gap:** The "format audit" language in ADR-064 is ambiguous — it could be read as "audit the housekeeping directory's format" or "audit prompt formats per ADR-065."
- **Recommendation:** In ADR-064's parenthetical reference to the rdd-conform scope extension, disambiguate from the housekeeping directory organization audit. Minor edit with no logical consequence.

---

### Argument Chains Assessed as Clean

The following chains were examined and found to hold without issues:

1. **ADR-063 — Manifest format from Spike S2.** The YAML format specification traces directly to Spike S2's reference implementation. Alternatives considered are each plausibly engaged. The "half of a compound check" limitation is accurately stated and consistently placed.

2. **ADR-064 — Compound check closes State C.** The core logic holds (subject to P1-A's advisory-mode qualification).

3. **ADR-065 — Skill-structure fix as primary move.** Spike S3 shows 100% coverage for step-anchored mechanisms; Essay 014 §5 names skill-structure fix as the first move; Spike S4 adds position-effect qualification; ADR-065 operationalizes both.

4. **ADR-066 — User-Tooling Layer operationalization.** The reframe-derailed gate limitation is honestly stated and load-bearing. The compound defense taxonomy is coherent and well-attributed. The P2-D issue is the only logical gap.

5. **ADR-067 — Three-substrate taxonomy.** The decision procedure's four-step structure is logically sound. The "not a priority hierarchy" framing is consistent with Essay 014 §7 and domain model Amendment #17.

6. **ADR-068 — Grounding Reframe extension.** The two demonstrations directly support the extended trigger. The three significance properties are inductively derived and honest about being a calibration tool. The additive structure is clean.

7. **ADR-069 — Scope-of-claim.** Setting aside P2-B's instance-count inconsistency, the overall argument holds.

8. **ADR-070 — Migration mechanics.** The migration scope is a mechanical execution of ADR-064's committed principle. The non-migration decisions correctly apply the readables-vs-housekeeping test.

9. **Cross-ADR consistency: ADR-064 extends ADR-033.** Additive; no contradictions.

10. **Cross-ADR consistency: ADR-068 extends ADR-059.** Additive; no override.

11. **Invariant 8 wording consistency.** All eight ADRs reference Invariant 8's "three substrates" consistently.

12. **ADR-065 → ADR-064 precondition chain.** The dependency is correctly stated in both ADRs.

13. **ADR-064 advisory-mode → ADR-070 migration coupling.** The marker file mechanism is consistently specified.

14. **ADR-069 → ADR-058 relationship.** The dependency trace is clean.

---

## Section 2: Framing Audit

### Alternative framings the evidence supported

**Alternative framing 1: Ceremony-as-reliability vs. ceremony-as-data-point**

The evidence base (Spike S3, Essay 014 §9, domain model concept "Ceremonial Reliability") documents that the susceptibility snapshot fired exactly once in the project's history, and that firing occurred under ceremonial conditions — the cycle explicitly investigating why the mechanism had never fired before. Domain model Amendment #17 records this as a "Dog-Food Moment" and explicitly warns: "ceremonial reliability must not be mistaken for operational reliability."

The ADR set chose to treat the cycle's own ceremonies (the DISCOVER per-entry Grounding Reframe pass, the MODEL belief-mapping check) as the canonical examples for ADR-068's extended Grounding Reframe trigger. This framing is available and the ADR-068 evidence base supports it — both examples are real and load-bearing.

The alternative framing the evidence equally supports: these two ceremonies are exactly the kind of user-present, jointly-attended events that Ceremonial Reliability predicts will fire reliably but that Operational Reliability cannot be inferred from. Under this alternative framing, ADR-068's extension should have prominently flagged that both canonical examples are ceremonial instances. ADR-068 does acknowledge this in the Negative consequences, but not foregrounded as a qualification of the canonical examples themselves.

What would a reader need to believe for this alternative framing to be right? That the significance-calibration judgment the ADR extends the protocol with is itself susceptible to the specification-execution gap — a judgment-anchored determination made by the same orchestrator that failed to fire the snapshot unconditionally.

**Alternative framing 2: Readables-vs-housekeeping as a discovered principle vs. a first-instance generalization**

The readables-vs-housekeeping distinction in ADR-064 is explicitly attributed as user-surfaced at DECIDE gate 2026-04-08. The evidence base for the principle is a single conversation exchange where the user rejected the `.rdd-session/` dotfile proposal. The principle was immediately generalized to commit audit reports and cycle-status to the housekeeping category, and ADR-070 implements the migration of both.

An alternative framing the evidence would support: this is a plausible organizational principle with limited prior validation, applied in its first instantiation to a significant corpus migration. The evidence for whether audit reports are "acted upon rather than read as prose" is asserted rather than demonstrated: argument audit reports, for instance, are explicitly consumed by the orchestrator at phase gates (supporting the "acted upon" characterization) but are also read by the user during gate conversations and cited as evidence in downstream ADRs (supporting the "readable" characterization).

What would a reader need to believe for this alternative framing to be right? That the readables-vs-housekeeping distinction is not a binary but a spectrum, and that migrating audit reports to housekeeping prematurely closes a question about their dual nature.

**Alternative framing 3: Three substrates as the complete architecture vs. as the currently-known subset**

ADR-067 adopts the three substrates as the canonical taxonomy and adds step 4 to the decision procedure: "none of the above applies — cannot be Tier 1." This framing treats the three substrates as exhaustive.

An alternative framing the evidence equally supports: the three substrates are the currently-known substrate set for the Claude Code runtime, not a complete taxonomy of possible enforcement techniques. Essay 014 §10 explicitly names "cross-runtime generalization" as future work. ADR-067's step 4 applies unconditionally, not "cannot be Tier 1 under the Claude Code runtime's current hook capabilities." If the hook system changes, mechanisms currently reaching step 4 might become Tier 1 candidates without the ADR's framing accommodating that evolution.

What would a reader need to believe for this alternative framing to be right? That step 4 should read "cannot currently be Tier 1 under the existing three substrates — revisit if a new enforcement technique becomes available" rather than treating the step-4 outcome as a permanent architectural judgment.

---

### Truths available but not featured

**Truth 1: Spike S4's negative result is structurally more prominent in the essay than in the ADRs**

Spike S4's load-bearing finding — "the proposed hardening will not work. The literature predicts it will not work" — is the affirmative case for the entire harness-layer architecture. Essay 014 §4 dedicates a full section to it. ADR-065 cites Spike S4 for position effects but does not foreground the negative finding about text-level hardening. A reader of ADR-065 alone would not know that the spike directly tested hardening the dispatch prose and concluded it would fail.

**Truth 2: The research-phase framing audit's most consequential finding — that the skill-structure fix was the missed alternative — is underrepresented in ADR-069**

The framing audit's identification of the skill-structure-fix alternative as the most consequential missed framing is documented in the domain model. The essay makes this the center of its argument in §2 and §5. ADR-069's documentation of the scope-of-claim pattern is the place where this finding should be explicitly cited as the empirical anchor for why isolated evaluators are needed at all. ADR-069 lists "Research phase (four instances)" but summarizes the skill-structure-fix case briefly. The finding's significance — that the framing audit's most important output in Cycle 10 was a mechanism that would not have been in the DECIDE ADR set without it — is not drawn out as primary evidence.

**Truth 3: The per-entry Grounding Reframe pass on product-discovery.md is the strongest available evidence for ADR-068's extension, but the ADR does not cite the specific removals/rewrites as the evidence**

ADR-068 describes the DISCOVER per-entry pass as "three removals, one rewrite, one keep, one split-edit." But the ADR does not cite the product-discovery.md artifact itself or the specific framing-adoption content that was removed/rewritten. The evidence for the extended trigger's value is thus summary rather than exhibit-based.

---

### Framing inversions worth considering

**The dominant framing:** Invariant 8's three-substrate anchoring requirement is the structural response to the specification-execution gap. The gap is addressable at the framework layer through harness verification, skill-structure anchoring, and artifact-producing conversational mechanisms.

**The inverted framing:** The gap is inherent to prose-based orchestration and should be addressed at the model layer, not the framework layer. Essay 014 explicitly names this as Stream 2 of the two-stream framing in §8 and in open questions: "The broader declarative-decomposition approaches for orchestrating frontier capabilities across defined processes — alternatives to prompt-based methodologies entirely."

Under the inverted framing:
- ADR-067's step-4 outcome would become a permanent condition for an entire class of mechanisms, not a limit of the current framework.
- ADR-069's scope-of-claim would need to acknowledge "no prompt-layer framework can mechanically enforce second-order critique — the constraint is model-architectural, not framework-architectural."
- ADR-064's structural-impossibility guarantee depends entirely on the Claude Code harness architecture. The claim is locally structural (under Claude Code) but not paradigm-generally structural.

What does the ADR set currently do to hold this alternative seriously? Essay 014's §8 two-stream framing is the clearest acknowledgment. The ADR set does not have a companion ADR explicitly stating "this architecture is runtime-specific." ADR-069 comes closest but emphasizes the invariance of the scope-of-claim rather than the runtime-specificity of the enforcement mechanisms.

---

### Specific framing concerns

**Framing Concern FC-A (P2)**

- **Location:** ADR-064, Advisory mode subsection. ADR-064, Principle generalization: "plugin updates must degrade gracefully on pre-update corpora."
- **Issue:** The advisory-mode-as-graceful-upgrade principle is explicitly noted in ADR-064's provenance check as user-surfaced at DECIDE gate 2026-04-08. The evidence base for the principle is one user concern at one gate about one specific scenario. The ADR generalizes this to "any future plugin update that introduces a structural corpus migration should adopt the same pattern" — making it a binding architectural principle for all future updates. The generalization from one instance to "any future update" is agent-composed, not evidenced from the research base or prior methodology commitments. The essay does not discuss upgrade mechanics; the spikes do not touch it; the domain model does not have a concept for it. The principle may be correct, but it is a meaningful architectural commitment derived from minimal evidence.
- **Surface for user judgment:** Is the graceful-upgrade principle well-founded enough to be binding on future ADRs, or should it be stated as a recommendation rather than a principle? What evidence would suffice to test it?

**Framing Concern FC-B (P2)**

- **Location:** ADR-064, Housekeeping directory section, definition of housekeeping. ADR-070, Non-migration table.
- **Issue:** The readables-vs-housekeeping test is stated as binary: "if a document is acted upon by tooling or consumed as operational state without being read as prose, it is housekeeping; otherwise it is readable." Under this test, audit reports are classified as housekeeping because they are "consumed by the orchestrator." But audit reports are also: (a) referenced by users at gate conversations as the epistemic basis for phase-completion decisions; (b) cited in downstream ADRs by line reference (this audit report itself is such a citation); (c) the vehicle through which re-audit findings reach the user. The "acted upon without being read as prose" test does not cleanly categorize documents that are both acted upon by tooling AND read as prose.
- **Surface for user judgment:** Does the readables-vs-housekeeping distinction work as a binary for all documents in the migration scope, or does it require a "both" category that the current principle does not specify?

**Framing Concern FC-C (P3)**

- **Location:** ADR-069, Decision section, positive scope-of-claim, item 5: "Provenance attribution for agent compositions at the point they land in artifacts."
- **Issue:** The provenance-check structure that ADR-069 identifies as a structural response to synthesis-moment framing adoption is an artifact of Cycle 10's ADR drafting — it is present in ADRs 063–070 but not in the prior ADR set (ADRs 001–062). ADR-069 lists it as a methodology positive scope-of-claim, implying it is part of the methodology's specification. But the provenance check subsection has not been adopted as a required element for future ADRs; it is a practice Cycle 10 introduced without a formal ADR specifying it as mandatory. If the provenance check is load-bearing for the success-mode cultivation the ADR describes, it should be either formally specified in the methodology or qualified in ADR-069 as "introduced in Cycle 10's ADRs, not yet formally adopted as a required methodology artifact."
- **Surface for user judgment:** Should the provenance check subsection become a formally required ADR element (a future ADR commitment), or is its status as a Cycle 10 practice sufficient for ADR-069's scope-of-claim framing?

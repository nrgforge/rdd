# Active RDD Cycle: Specification-Execution Gap in Prompt-Based Methodology

**Started:** 2026-04-06
**Current phase:** RESEARCH ✅ complete; DISCOVER ✅ complete; MODEL ✅ complete; DECIDE ✅ complete; ARCHITECT next
**Artifact base:** ./docs/
**Essay:** [014-specification-execution-gap.md](./essays/014-specification-execution-gap.md)
**Plugin version during cycle:** v0.6.3

## Phase Status

| Phase | Status | Artifact | Key Epistemic Response |
|-------|--------|----------|----------------------|
| RESEARCH | ✅ Complete | [014-specification-execution-gap.md](./essays/014-specification-execution-gap.md) | Sharpened diagnostic: *mechanisms anchored to concrete workflow steps execute reliably (100% coverage); mechanisms whose dispatch depends on orchestrator contextual judgment do not (0% coverage for susceptibility snapshot)*. Recommendation: hook-based architecture (PostToolUse on Agent + Stop hook with per-phase manifest) as defense-in-depth on top of a primary skill-structure fix (add concrete dispatch sites for mechanisms that lack them). Honest scope: covers 4 of 6 observed failure modes; items 5–6 require a user-tooling layer (named, not designed here). Closing stance: *"know it when they see it"* — verification cannot prove mechanism effectiveness but creates observable conditions for contextual judgment. |
| DISCOVER | ✅ Complete | [updated `product-discovery.md`](./product-discovery.md) | Cycle 10 additions interleaved across all 5 sections; per-entry Grounding Reframe pass applied (3 removals, 1 rewrite, 1 keep, 1 split-edit) per discover-phase snapshot recommendation. Discover-phase snapshot at [`./essays/audits/susceptibility-snapshot-014-discover.md`](./essays/audits/susceptibility-snapshot-014-discover.md). |
| MODEL | ✅ Complete | [updated `domain-model.md`](./domain-model.md) | **Invariant 8 ADDED (broad scope): "Mechanism execution must be structurally anchored."** First invariant amendment since the Cycle 7 amendment to Invariant 4. Broad scope chosen at MODEL gate: applies to any unconditional structural mechanism, not only Cycle 9's Tier 1 sycophancy-resistance architecture. 22 new concepts, 7 existing concept updates (including User-Tooling Layer reframe-derailed gate limitation and compound-defense pattern provenance from the MODEL gate), 5 new actions, ~41 new relationships, 17 new open questions, 23 new synonym aliases. Amendment log entry #17 records propagation requirements including backward sweep of Cycle 9 (ADRs 055–062), Cycle 8 build-focused ADRs (048–055), ADR-033 hooks, and audit of Play and Synthesis phase mechanisms. Rename: Essay 014's "methodology graduation (small-d)" renamed to **Layered Enforcement Adoption** in the domain model to avoid collision with Graduation. MODEL gate produced three consequential outcomes: (1) Invariant 8 addition with broad scope; (2) the reframe-derailed gate observation and compound-defense pattern (user-surfaced); (3) the belief-mapping grounding of Invariant 8's commitment against the snapshot's Finding 1. |
| DECIDE | ✅ Complete | Eight new ADRs (063–070), argument audit + 4 re-audits clean, conformance scan, backward propagation sweep (ADR-057 supersession + Amendment Log #18), ~45 scenarios, 9 new interaction-spec tasks | **Eight-ADR set operationalizing Invariant 8 through three enforcement substrates (Skill-Structure, Harness, User-Tooling Layers).** Key epistemic moment: user reaffirmed TDD framing as general principle (RED-before-GREEN is natural when DECIDE produces new invariants) while committing to cycle-specific urgency — the mechanisms being baked in for Cycle 10 make Invariant 8 capable of flagging systemic problems, so the RED phase should be shortened via urgent movement through ARCHITECT and BUILD before starting a new cycle. Framing audit produced three concerns (FC-A, FC-B, FC-C) all substantively addressed at the gate with specific user direction on each. Two success-mode instances observed (compound defense terminology endorsement; FC-C drivers-primary refinement) — both recorded as empirical grounding for ADR-069's failure-mode/success-mode dichotomy without inflating the count via naive pattern-matching (per DECIDE → ARCHITECT snapshot Finding 1 restraint). Snapshot Finding 2 surfaced one residual susceptibility (TDD analogy adoption without independent engagement of the competing "test runner IS the invariant's function" frame); user resolved via the prioritization answer above. |
| ARCHITECT | ▶ Next | — | — |
| BUILD | ☐ Pending | — | — |
| PLAY | ☐ Optional | — | — |
| SYNTHESIZE | ☐ Optional | — | — |

## Research Phase Artifact Trail

- **Essay:** [`./essays/014-specification-execution-gap.md`](./essays/014-specification-execution-gap.md) — citation-audited clean (re-audit), argument + framing audited clean (two re-audits)
- **Reflections:** [`./essays/reflections/014-specification-execution-gap.md`](./essays/reflections/014-specification-execution-gap.md) — captures gate conversation findings, susceptibility snapshot, Grounding Reframe disposition, commitments for downstream phases
- **Research log:** [`./essays/research-logs/014-specification-execution-gap.md`](./essays/research-logs/014-specification-execution-gap.md) — archived from `research-log.md` at phase end
- **Literature reviews:**
  - [`./essays/research-logs/lit-review-instruction-following-degradation.md`](./essays/research-logs/lit-review-instruction-following-degradation.md)
  - [`./essays/research-logs/lit-review-telemetry-acceptance-criteria.md`](./essays/research-logs/lit-review-telemetry-acceptance-criteria.md)
- **Spike reports (4):**
  - [`./essays/research-logs/spike-s4-fail-loud-dispatch.md`](./essays/research-logs/spike-s4-fail-loud-dispatch.md) — text hardening is insufficient (negative result)
  - [`./essays/research-logs/spike-s1-hook-feasibility.md`](./essays/research-logs/spike-s1-hook-feasibility.md) — hook architecture feasibility; items 1–3 fully, item 4 partially, items 5–6 out of reach
  - [`./essays/research-logs/spike-s2-acceptance-criteria.md`](./essays/research-logs/spike-s2-acceptance-criteria.md) — YAML per-phase manifest format + tested reference Stop hook
  - [`./essays/research-logs/spike-s3-base-rate-audit.md`](./essays/research-logs/spike-s3-base-rate-audit.md) — corpus audit: 100% coverage for step-anchored mechanisms, 0% for susceptibility snapshot
- **Audit reports:**
  - [`./essays/audits/research-design-review-014.md`](./essays/audits/research-design-review-014.md)
  - [`./essays/audits/citation-audit-014.md`](./essays/audits/citation-audit-014.md) + `-reaudit.md` (clean)
  - [`./essays/audits/argument-audit-014.md`](./essays/audits/argument-audit-014.md) + `-reaudit.md` + `-reaudit-2.md` (all clean)
  - [`./essays/audits/susceptibility-snapshot-014-research.md`](./essays/audits/susceptibility-snapshot-014-research.md) — Tier 1 unconditional snapshot at research → discover boundary

## Discover Phase Artifact Trail

- **Updated artifact:** [`./product-discovery.md`](./product-discovery.md) — Cycle 10 additions interleaved across all five sections (stakeholder map, jobs/mental models, value tensions, assumption inversions, product vocabulary). Initial pass applied 12 edits. Grounding Reframe pass per snapshot recommendation: three removals (interim-harness-layer sentence, framework-vs-model attribution job, ceremonial-vs-operational vocabulary entry, 80% reliability floor vocabulary entry), one rewrite (framework-vs-model tension reframed as "Scope transparency vs. limitation as disclaimer"), one keep (ceremonial-vs-operational tension), one split-edit on the line-9 stakeholder description.
- **Susceptibility snapshot:** [`./essays/audits/susceptibility-snapshot-014-discover.md`](./essays/audits/susceptibility-snapshot-014-discover.md) — second instance of the susceptibility-snapshot mechanism firing in the project's entire history. Both firings during Cycle 10, both under ceremonial conditions. Snapshot identified one load-bearing finding ("framing adoption has propagated, not reversed") which drove the per-entry Grounding Reframe pass.
- **Reflexive observations:**
  - The snapshot dispatch failed twice with API 529 (overloaded) on the default model; succeeded on Opus retry. The orchestrator did not silently fall back to in-context evaluation between attempts — exactly the failure mode Cycle 10's #2 finding predicts. This is not a methodology gap (the methodology's response was correct) but suggests the susceptibility-snapshot-evaluator default model may warrant calibration if 529s recur. Recorded as observation, not active risk.
  - The user surfaced the question *"what is the snapshot actually for?"* mid-pass, which reframed the methodological response from a feed-forward problem (which would have required designing a new mechanism) to a Grounding Reframe protocol enhancement (which requires strengthening an existing mechanism). The reframing is captured as DECIDE commitment #5 below.
  - The per-entry Grounding Reframe pass is itself the cycle's clearest in-action demonstration of what the new commitment specifies: a snapshot finding drove course-correction of the current phase's artifacts at the boundary where the snapshot was produced, rather than feeding forward to bias subsequent phases.

## Feed-Forward Signals

### From RESEARCH

**Settled premises (the user is building on these going into discover):**

1. The sharpened diagnostic (step-anchored vs. judgment-anchored) is a genuine narrowing of the original issue and should shape how discover and model think about mechanism classification.
2. Externalization + procedural enforcement is the right direction for the framework's reliability improvements.
3. The skill-structure fix is the first move for any Tier 1 mechanism lacking a concrete dispatch site; hooks are defense-in-depth on top, not a replacement.
4. The user-tooling layer is feasible and grounded in the already-working epistemic gate mechanism; it is the natural home for conversational mechanisms that cannot be step-anchored.
5. The cycle's success criterion is *material reduction* of framework-attributable failures, not elimination. Residual failures should become clearly attributable to the model, not the framework — making the next research question well-defined.

**Open questions (the user is holding these open going into discover):**

1. Whether the hook architecture specifically is worth its complexity cost (the user noted *"it could also feel heavy"*).
2. Whether the skill-based dispatch will actually fire in practice (the user noted *"my fear is that it won't be dispatched"*).
3. Whether RDD-in-Claude-Code can reach an 80% reliability threshold at which framework failures become clearly distinguishable from model failures.
4. What to do about the models at the point where the conversation moves to model-attributable failures (explicitly future work, out of scope for Cycle 10).
5. Broader declarative-decomposition approaches for orchestrating frontier capabilities across defined processes (explicitly future work).

**Specific commitments carried forward to DECIDE:**

1. **Hook-script reliability assessment.** The ADR for the hook architecture must include an explicit assessment of whether "fails safe to allow" is a sufficient mitigation for hook-script bugs, given that silent fail-to-allow and no hook produce the same observable outcome. Options to consider: a fail-loud mode for hook-script internal errors, a hook self-test mechanism at SessionStart, or explicit acceptance of the residual risk with reasons.
2. **Framing audit necessity rationale.** The rationale for the framing audit as an unconditional Tier 1 mechanism should cite the four documented agent-side framing-adoption moments from this cycle and the one case (the skill-structure fix alternative) where the isolated framing audit generated an alternative the in-context agent had not surfaced. This grounds the Tier 1 status in direct cycle evidence, not just theoretical reasoning.
3. **Possible ADR — "No new Tier 1 mechanism without a concrete dispatch site"** as a methodology-level rule. Would turn Cycle 10's recommendation from retroactive fix into a durable constraint on future mechanism additions.
4. **Possible ADR — the three-tier categorization** (skill-structure layer / harness layer / user-tooling layer) as a methodology-level classification system for Tier 1 mechanisms going forward.

### From DISCOVER

**Settled premises (the user is building on these going into model):**

1. **Product-discovery.md describes intended state.** Reflections capture transitional state and current-cycle observations. Conformance audits flag the delta between the two. This division of labor is now an explicit operating principle for future cycles.
2. **The framework cannot objectively distinguish framework-attributable from model-attributable failures within its own scope.** That distinction requires external comparison work (parallel processes with different models, controlled comparisons across users) that is empirical research, not a framework feature. Encoding it as a stakeholder need creates an obligation the framework cannot meet.
3. **Vocabulary table is for user-facing language, not internal methodology framing.** System vocabulary belongs in the domain model glossary (MODEL phase) or the system design. Cycle 10 vocabulary additions that drifted toward methodology framing have been removed from product-discovery.md.
4. **Snapshot findings drive in-cycle course correction at their own boundary, not feed-forward to subsequent phases.** Each phase boundary handles its own findings via the Grounding Reframe; subsequent phases trust the boundary's decision and do their own work. This preserves clean separation of phase responsibility and avoids ambiguity about which phase owns the response to a finding.
5. **Hook architecture scope is surgical, not broad.** The user's belief-mapping answer at the discover gate: for the broad/hooks-heavy reading to be right, the conversational aspect of the methodology would need to be fundamentally flawed; that is the extreme end. Mitigations + defense in depth + user steering can handle the worst cases. The hook architecture ADR DECIDE writes should be scoped to the four specific failure modes named in the essay, not as a new default for any structural mechanism going forward. The cycle's contribution has two distinct levels of intervention — *calibration* (skill-structure fix at concrete dispatch sites for the existing successful mechanisms) and *defense-in-depth* (hooks for the residual cases where calibration alone is insufficient). DECIDE should inherit both, in that order.

**Open questions (the user is holding these open going into model):**

1. How to apply the intended-state-vs-transitional-state principle retroactively to pre-Cycle-10 product discovery content. Out of scope for this cycle; future scope.
2. Whether the rewritten "Scope transparency vs. limitation as disclaimer" tension warrants vocabulary entries at MODEL, or whether it lives only as a tension.
3. Whether the susceptibility-snapshot-evaluator default model needs calibration given the API 529 failures observed in this phase. Likely a configuration question, not a methodology question.

**Additional specific commitment carried forward to DECIDE:**

5. **Grounding Reframe protocol enhancement.** The Grounding Reframe protocol should fire for any significant snapshot finding with in-cycle course-correction implications, not only for unassessable risk. Each significant finding should produce a Reframe with concrete decision options for the current phase's artifacts. Possible amendment to ADR-059. Rationale grounded in Cycle 10's discover-phase application: the per-entry pass on six flagged lines is the cycle's clearest in-action demonstration of what this commitment specifies. The research-phase snapshot at the research → discover boundary did not produce a Grounding Reframe on the four documented adoption moments — only on the HB2 complexity tradeoff — and the discover-phase finding was the downstream consequence of that gap.

### From MODEL

**Settled premises (the user is building on these going into DECIDE):**

1. **Invariant 8 is adopted with broad scope.** Applies to any unconditional structural mechanism the methodology specifies — not only Cycle 9's Tier 1 sycophancy-resistance architecture. The three substrates (Skill-Structure Layer, Harness Layer, User-Tooling Layer) are the anchoring requirement for any mechanism claiming unconditional status. Mechanisms that cannot be anchored may not be specified as unconditional — they may be specified as best-effort or explicitly contingent.

2. **The invariant is partly descriptive.** The user's observation at the gate: *"We move through the phases well, there are clear moments where we see the structure of the framework working. So I think we're there in many ways."* Many phase transitions and specialist dispatches already meet the anchoring criterion. The invariant formalizes what already works and names what does not.

3. **Layered Enforcement Adoption** is the domain model term for the move Essay 014 calls "methodology graduation (small-d)." The rename avoids collision with Graduation (folding RDD artifacts into native project docs).

4. **The three-tier classification is not a priority hierarchy.** Each layer is primary in its domain — skill-structure for step-anchorable mechanisms, harness for defense-in-depth and silent-fallback catching, user-tooling for conversational mechanisms that graduate into artifact-producing form. The unifying principle across all three: anchor the mechanism to a concrete, mechanically-unavoidable step with observable output.

5. **The reframe-derailed gate is a real failure mode.** The User-Tooling Layer's artifact check verifies structural gate completion but not epistemic substance. A reframe-derailed gate can pass the manifest check while the reflection-note captures a direction the user does not own. The Susceptibility Snapshot at the same phase boundary is the complementary defense — together they form a conversational-layer compound defense mirroring the harness-layer Compound Check.

**Open questions (the user is holding these open going into DECIDE):**

1. Whether the narrow vs. broad scope distinction causes any of the existing domain model concepts to require rewording. Specifically whether "Tier 1" should be systematically replaced with "unconditional structural" or kept as a narrower subset.

2. The methodology-wide mechanism audit itself — which is the concrete work Invariant 8's broad scope creates. Three areas flagged at the gate: (a) Cycle 8 build-focused skills and the Context Gathering protocol (deviation from specialist-subagent dispatch pattern); (b) Play phase mechanisms; (c) Synthesis phase mechanisms. The audit is a DECIDE-phase or post-DECIDE deliverable.

3. Whether the belief-mapping pattern (specific ADR prediction) should become a required procedure at gates where invariant amendments are under consideration. Cycle 10's MODEL gate demonstrates the method: the snapshot's Finding 1 was "commitment was preference-accelerated, not belief-mapped"; the Grounding Reframe asked the user to name a specific ADR; the answer grounded the commitment post-hoc. Worth codifying.

**Specific commitments carried forward to DECIDE:**

6. **Provenance attribution for the compound-defense pattern.** Any DECIDE-phase ADR that references the user-tooling-layer + susceptibility-snapshot compound defense must attribute the pattern to the MODEL gate conversation 2026-04-08, not to Essay 014. This was a user-surfaced observation, not an essay conclusion. Honest provenance matters for the same reason Cycle 10's diagnostic matters.

7. **Backward propagation sweep under Invariant 8 (broad scope).** The user's ADR-060 example (research-methods-reviewer) is a concrete starting point. Full sweep scope per amendment log entry #17: Cycle 9 ADRs 055–062, Cycle 8 ADRs 048–055, ADR-033 hooks, and the Play/Synthesis phase ADRs. Each existing mechanism must be audited for which substrate anchors (or fails to anchor) its execution.

8. **The "no new Tier 1 mechanism without a concrete dispatch site" rule is now mechanical enforcement of Invariant 8.** It does not need a separate methodology-level ADR — it is implied by the invariant. However, DECIDE may still want to write the rule explicitly as an ADR for clarity, with a note that it restates Invariant 8's anchoring requirement.

9. **Grounding Reframe protocol codification.** Cycle 10's MODEL gate invoked the Grounding Reframe protocol against a susceptibility snapshot finding that had in-cycle course-correction implications (Finding 1 — preference-accelerated commitment). The protocol's extension from "unassessable risk" to "any significant snapshot finding with in-cycle course-correction implications" (per domain model update) should be encoded as an ADR amendment or new ADR in DECIDE.

### Susceptibility snapshot findings from the MODEL → DECIDE boundary

The third susceptibility snapshot dispatch of Cycle 10 (all three have been ceremonial per the cycle's own distinction) returned three load-bearing findings at the MODEL → DECIDE boundary. Snapshot artifact: [`./essays/audits/susceptibility-snapshot-014-model.md`](./essays/audits/susceptibility-snapshot-014-model.md).

**Finding 1 — The Invariant 8 commitment was preference-accelerated, not belief-mapped.** The commitment moved from flag to acceptance in roughly two exchanges. The user's stated preference (*"I want it to be load-bearing"*) preceded the implications analysis. The agent worked through implications of the "make it an invariant" path but did not supply the implications of the "hold off until the mechanism is actually built" path at comparable depth. No belief-mapping check was performed before the commitment. **Grounding Reframe applied:** the user was asked to name one Cycle 9 ADR that the backward sweep would require amendment for. The response named ADR-060 (research-methods-reviewer) specifically and extended the scope to cover the entire methodology's mechanism inventory — a stronger answer than the question asked. Invariant 8 was held on grounded rather than preference-accelerated commitment.

**Finding 2 — The reframe-derailed gate failure mode was user-surfaced, not agent-generated.** The agent's first-order analysis of the User-Tooling Layer did not include this failure mode. The user's pre-mortem supplied it. The agent absorbed it into the concept update. This is the same gap pattern documented across all three phases of Cycle 10: second-order critique requires either the user in second-order mode or an isolated evaluator. The agent does not generate it independently. **This is preserved as an observation, not actioned** — the observation itself is the correction; the provenance attribution (Commitment 6 above) is the propagation response.

**Finding 3 — Framing-adoption propagation has reached structural depth.** Three consecutive phases have exhibited synthesis-moment framing adoption: research → essay material (four moments), discover → product discovery vocabulary, MODEL → domain model relationships (the compound-defense pattern, user-surfaced). Domain model relationships are the substrate DECIDE uses when generating ADRs. **DECIDE-phase mitigation:** the first ADR DECIDE writes should be accompanied by an explicit check — did this ADR's core framing originate from Essay 014, from a prior gate conversation, or from the agent's synthesis during ADR drafting? Provenance honesty at the ADR layer is the structural response to Finding 3.

**Dispatch reliability observation:** this snapshot is Cycle 10's third; all three have been ceremonial. Under the Invariant 8 that the MODEL phase just added, the susceptibility snapshot itself is not yet Tier-1-compliant — it is not step-anchored, not harness-verified, and not artifact-produced at a canonical path. The gap between the commitment (Invariant 8) and the enforcement (compound check) is State B — absence would be visible if the dispatch didn't happen, the user is the harness layer in the interim, the path to Tier 1 is clear. The phase that added the invariant is not yet compliant with it; this is honest about the intermediate state rather than a contradiction.

### From DECIDE

**Settled premises (the user is building on these going into ARCHITECT):**

1. **The eight-ADR set is audited clean.** Argument audit loop ran five iterations (original + four re-audits) to clean closure. The unconditional re-audit rule caught four new issues introduced by revisions across three of those iterations (NI-1, NI-A, NI-B1/B2, NI-C). Empirical grounding for research-phase Commitment 3 that mandatory re-audit after revision is load-bearing rather than ceremonial.

2. **The centered-vs-infrastructure framing is the refined version of readables-vs-housekeeping.** Initially surfaced as a binary at DECIDE gate 2026-04-08, refined at DECIDE gate 2026-04-09 via the framing audit's FC-B observation. The refined framing articulates the distinction around user workflow ("what do we center for users to share and read vs. what underpins how the framework operates") rather than technical readability. Not a hard binary; a spectrum with directional intuition.

3. **Advisory mode for pre-migration corpora is a UX commitment, not a binding architectural principle.** Initially framed as "plugin updates must degrade gracefully" (generalization from one user concern), reframed at DECIDE gate 2026-04-09 via the framing audit's FC-A observation as a UX commitment specific to ADR-064's compound check. Future plugin updates may compose the pattern as their own UX requires; no methodology-level principle is binding.

4. **Provenance via architectural drivers is the primary attribution mechanism; provenance check subsections are selectively used.** Initially listed in ADR-069 as a universal methodology positive scope-of-claim, reframed at DECIDE gate 2026-04-09 via the framing audit's FC-C observation. Drivers (research findings, domain model concepts, prior ADRs) do the work for most ADRs; provenance check subsections fill in where drivers don't reach (DECIDE-gate contributions, agent synthesis at drafting time, cross-ADR compositions). Cycle 10 ADRs 063–070 include provenance checks because they carry unusually high proportions of non-driver content; future ADRs may omit them when drivers suffice.

5. **The TDD framing is reaffirmed as a general principle for cycles producing new invariants.** Cycles that add invariants during DECIDE naturally enter subsequent phases with documented tension between what the invariant requires and what exists. This is not a defect; it is the methodology operating in a RED-before-GREEN state. Invariant 8 naming its own non-compliance until the enforcement mechanisms ship is the expected condition, not a contradiction.

6. **Cycle 10's ARCHITECT phase is a cycle-specific exception to the default RED-phase duration.** The enforcement mechanisms being baked in (compound check hooks, skill-structure fixes, housekeeping migration) are what give Invariant 8 the capacity to flag systemic problems in future cycles. That capability is load-bearing for the methodology's self-auditing, so the RED phase should be shortened via urgent movement through ARCHITECT and BUILD before starting a new cycle. **Cycle-specific prioritization, not a general rule** — future cycles that produce invariant-level commitments may leave their RED phase longer if the tradeoffs differ.

**Open questions (the user is holding these open going into ARCHITECT):**

1. Whether the compound check's structural guarantee against sophisticated State C holds in practice under operational conditions (all four susceptibility snapshot dispatches in Cycle 10 have been ceremonial; operational reliability is unverified).

2. Whether the failure-mode / success-mode dichotomy from ADR-069 generalizes beyond the two observed success-mode instances. The dichotomy is flagged as a watch item in ADR-069; future cycles will either validate or refute it.

3. Whether the `{cycle}` token resolution via cycle-status field (canonical per ADR-063) or essay-prefix inference (fallback) is adequate in practice for multi-cycle projects with out-of-order essay numbering. The design commitment is in place; empirical validation is future work.

4. Whether the three "not chosen at v1" Fails-Safe-to-Allow alternatives (SessionStart self-test, per-session suppression, rdd-doctor) will prove necessary in practice. v1 stderr notice + GitHub issue template is the baseline; later iterations may add these if the baseline proves insufficient.

**Specific commitments carried forward to ARCHITECT:**

1. **Foreground the enforcement implementation in Cycle 10's ARCHITECT phase.** Module decomposition should prioritize: (a) hook script architecture for the compound check (ADR-064), (b) per-phase susceptibility snapshot dispatch text for the eight phase skills (ADR-065 Fix 1), (c) canonical prompt skeleton application to existing Tier 1 dispatches (ADR-065 Fix 2), (d) position audit and relocation of middle-third dispatch sites (ADR-065 Fix 3), (e) the `/rdd-conform migrate` subcommand including migration, rollback manifest, and three new audit scopes (ADR-070), (f) the User-Tooling Layer's AID gate reflection note production (ADR-066). These are the primary ARCHITECT deliverables for this cycle. Other module work proceeds in parallel where it does not compete for attention.

2. **Apply the architectural drivers framing to ARCHITECT's system design provenance.** Per the FC-C refinement, provenance in ARCHITECT should use architectural drivers (research findings, ADRs, domain model, product discovery) as the primary attribution mechanism. Provenance check subsections are used selectively if the system design introduces content not derivable from the driver chain.

3. **The `docs/housekeeping/` directory introduction is a structural pattern ARCHITECT inherits.** Module decomposition should respect the centered-vs-infrastructure framing: user-facing modules live in the top-level structure, infrastructure modules (hooks, manifest loaders, dispatch log parsers) can live under `hooks/` or other infrastructure locations without being centered in the system design document.

4. **Honor the implementation sequencing from ADR-070.** ADR-065's skill-file edits and ADR-070's path updates must ship together as a single atomic change. ADR-063/064 may ship before ADR-070's migration runs (advisory mode is the graceful state during the transition window). ARCHITECT's module decomposition should reflect this sequencing constraint.

5. **The `rdd-conform migrate` subcommand does not yet exist.** The conformance scan surfaced this as an implicit gap. ARCHITECT should scope the migrate subcommand as part of its module decomposition — not just the behavior but the command-line interface, error handling, rollback manifest format, and summary report structure.

6. **DECIDE → ARCHITECT susceptibility snapshot Finding 2 restraint.** The TDD analogy was the one residual susceptibility the DECIDE snapshot flagged. The user resolved it via the prioritization answer (TDD as general principle + cycle-specific urgency). ARCHITECT should not adopt the TDD framing as load-bearing architectural metaphor without also naming the competing frame ("the test runner IS the invariant's function"). Both frames are honest at different scales.

### Susceptibility snapshot findings from the DECIDE → ARCHITECT boundary

The fourth susceptibility snapshot dispatch of Cycle 10 (all four ceremonial) returned a substantive reversal of the prior trajectory. Snapshot artifact: [`./essays/audits/susceptibility-snapshot-014-decide.md`](./essays/audits/susceptibility-snapshot-014-decide.md).

**Overall pattern — signal declining, not intensifying.** The DECIDE phase did not reproduce the prior three phases' susceptibility intensification. The provenance check subsections in ADRs 063–070 converted previously-invisible synthesis-moment framing adoption into labeled, auditable content. This is the first Cycle 10 phase to bend the trajectory. Whether this is a durable improvement or a ceremonial effect of the current dog-food cycle is unknown; operational validation remains future work.

**Finding 1 — The second success-mode instance is plausible but classification-dependent.** Both claimed success-mode instances (compound defense terminology endorsement at early DECIDE; FC-C drivers-primary refinement at late DECIDE) are plausible on the artifact evidence. The limitation is that the classification rests on the agent's own characterization of what "evaluation on stated criteria" looks like. ADR-069's watch item names this honestly. **No Grounding Reframe warranted.** Feeds forward to ARCHITECT as a reminder: treat the failure-mode / success-mode dichotomy as a named hypothesis, not a proven framework.

**Finding 2 — The TDD analogy is the one residual susceptibility worth escalating.** Four of the five user framings honored at DECIDE are defensibly superior to agent defaults. The TDD analogy for Invariant 8's timing is the borderline case — adopted at a synthesis moment, with the competing frame ("the test runner IS the invariant's function") not independently engaged before adoption. **Grounding Reframe applied at the gate:** the user was asked to belief-map the two framings and articulated a middle position (TDD as general principle + cycle-specific urgency for this cycle). The resolution is recorded above as Commitments 1 and 6.

**Finding 3 — The five-iteration audit loop is the methodology working as designed.** The agent produces parallel-language residuals in cross-ADR edits; the audit mechanism caught every instance. Both "robust mechanism" and "imperfect editor" interpretations are true and compatible. **No concerning finding.**

**Dispatch reliability observation:** this is Cycle 10's fourth snapshot; all four have been ceremonial. Operational reliability remains unverified. The mechanism this snapshot describes is still in State B under its own Invariant 8. The per-phase dispatch sites from ADR-065 are in the 34-item conformance debt, not in the current implementation. Until ARCHITECT → BUILD implements the ADR-065 skill-file edits and ADR-064's hook scripts, the susceptibility snapshot will continue to require ceremonial attention to fire.

### Active risk register

- **Until the hook architecture is built, the susceptibility-snapshot dispatch rate is expected to return to 0% in any new cycle that does not have ceremonial attention on the dispatch.** The snapshot at this phase boundary fired because the user and agent jointly tracked whether it would fire; this is not the condition the methodology needs to reproduce at scale. The user is effectively the harness layer in the interim.
- The cycle's recommendation carries an implementation dependency: implementable but not yet implemented. The intermediate state between "prose-only" and "hook-enforced" is fragile to user attention.

### Agent-side susceptibility observation (for downstream phases to attend to)

The susceptibility snapshot surfaced a "softer than sycophancy but real" pattern: the agent reached for user-provided framings at rhetorical synthesis moments in four documented instances. Each adoption was evidence-grounded and two were externally verified by the re-auditor. The framing audit caught the most consequential instance (the missing skill-structure fix alternative). Downstream phases (especially DECIDE when writing ADRs) should treat this as an active concern and be attentive to whether the pattern operates at their scale as well.

## Context for Resumption

This cycle is a direct follow-up to Cycle 9 (`013-sycophancy-and-rdd-reflexivity.md` + ADRs 055–062). Cycle 9 added the Tier 1 resistance architecture; Cycle 10 investigates why that architecture sometimes fails to fire. The issue that seeded Cycle 10 is [nrgforge/rdd#9](https://github.com/nrgforge/rdd/issues/9), filed the same day Cycle 9's architecture shipped as v0.6.0.

**If resuming in a new session:** read [`./essays/014-specification-execution-gap.md`](./essays/014-specification-execution-gap.md) as context, then [`./essays/reflections/014-specification-execution-gap.md`](./essays/reflections/014-specification-execution-gap.md) for the research-phase gate observations and the four original DECIDE commitments. Then read [`./product-discovery.md`](./product-discovery.md) for the discover-phase additions (post per-entry-pass state) and [`./essays/audits/susceptibility-snapshot-014-discover.md`](./essays/audits/susceptibility-snapshot-014-discover.md) for the discover-phase snapshot's findings. Then read [`./domain-model.md`](./domain-model.md) — specifically Invariant 8 (line ~677), the Cycle 10 concept additions (Specification-Execution Gap through Synthesis-Moment Framing Adoption), the updated User-Tooling Layer concept (with reframe-derailed gate limitation and compound-defense pattern), and Amendment Log entry #17. Finally read [`./essays/audits/susceptibility-snapshot-014-model.md`](./essays/audits/susceptibility-snapshot-014-model.md) for the MODEL → DECIDE boundary snapshot's three findings and the Grounding Reframe resolution. The MODEL phase is complete; the next phase is DECIDE. Continue to `/rdd-decide`.

**Deferred framings the user surfaced but declined to crystallize:** During the discover-phase gate, the user offered *"not the easiest car to drive, but maybe a really powerful one"* as a possible characterization of RDD's character emerging from this cycle. The agent declined to encode this in the artifact at the time, citing the cycle's own findings about synthesis-moment adoption. Worth revisiting after MODEL/DECIDE if the framing still carries weight — possible home in cycle 11 vocabulary or in a later synthesis essay.

**Reflexive note about this cycle:** Cycle 10 investigates whether the methodology's Tier 1 mechanisms actually fire under task load. The susceptibility-snapshot dispatch at the research → discover boundary was the first instance in the project's corpus of that specific mechanism firing. The discover-phase dispatch (second instance) failed twice with API 529 on the default model and succeeded on Opus retry; the orchestrator did not silently fall back to in-context evaluation between attempts — exactly the failure mode Cycle 10's #2 finding predicts. Both successful dispatches occurred under ceremonial conditions (joint user/agent attention on whether the dispatch would happen). This is noted so downstream phases do not over-interpret "the snapshot fired" as evidence of operational methodology reliability — it is evidence of ceremonial reliability, which is the very distinction Cycle 10's diagnostic identifies.

## Candidate follow-up cycles

**The Privilege Budget — mechanistic account of lost-in-the-middle and how it constrains skill file design.** Surfaced at the end of Cycle 10's research phase gate. The lit review on instruction-following degradation established that position effects are empirically robust (Liu et al. 2023; Guo & Vosoughi 2025) but explicitly flagged that the *mechanistic* account is unsettled. A follow-up cycle could investigate: (a) is there a file-length threshold at which the effect becomes design-relevant, or is it a continuous gradient; (b) is concept density per unit of text a separate variable from instruction count (benchmark work has varied count, not density); (c) what is the "privilege budget" — how much critical content can structurally-privileged positions hold before the privileging dilutes. The practical payoff: if the privilege budget turns out to be large enough to hold all Tier 1 mechanisms, then Cycle 10's hook architecture is over-engineered for a subset of the cases it addresses (specifically the "susceptibility snapshot not dispatched because it is at line 202 of a 530-line file" case, which could be addressed by moving the dispatch to the top of the appropriate phase skill instead of by adding a hook). This would narrow Cycle 10's hook recommendation to the silent-fallback cases where position-privileging does not help (items 1–3), separating them from cases where position-privileging might suffice (item 5 specifically). Not in scope for this cycle; noted for future consideration.

**Synthesis-moment susceptibility beyond the essay-level framing audit.** From Cycle 10's susceptibility snapshot: the snapshot identified a "softer than sycophancy but real" pattern where the orchestrator reached for user-provided framings at synthesis moments. The essay-level framing audit is the methodology's current response. A narrower question worth scoping later: are there synthesis moments beyond the essay-level framing audit where the pattern operates and the methodology does not currently have an isolated-dispatch response? Not urgent; carried forward as a possible future scope.

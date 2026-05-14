# RDD Cycle Status

## Cycle Stack

### Active: Outlines as Research Artifacts and CRESS Audit

**Cycle number:** 018
**Started:** 2026-05-11
**Current phase:** model
**Cycle type:** standard
**Plugin version:** 0.8.5
**Artifact base:** `./docs/`
**Driving artifacts (produced — dogfooded both forms):**
- `./docs/essays/017-outlines-as-research-artifacts-prose.md` (prose form, 4,883 words)
- `./docs/essays/017-outlines-as-research-artifacts-outline.md` (outline form, 556 lines)

**Phase-exit state (2026-05-12):** RESEARCH phase artifacts complete. Susceptibility snapshot landed with Target 1 Grounding Reframe pursued and resolved; Targets 2 & 3 inherited as DECIDE scope qualifications. Gate reflection note written (`.rdd/gates/018-research-gate.md`). Reflections written (`./docs/essays/reflections/017-outlines-as-research-artifacts.md`). Research log archived (`./docs/essays/research-logs/017-outlines-as-research-artifacts.md`). Spike S1 scratch deleted per skill convention. **Phase advanced to DISCOVER on 2026-05-12.**

**Phase-exit state (2026-05-14):** DISCOVER phase artifacts complete. `product-discovery.md` updated in-place against Cycle 018 research (new Solo Developer-Researcher jobs entries; 12 new Value Tensions including the user's four-section form-spec refinement; 8 new Assumption Inversions; ~22 new Product Vocabulary entries; 3 candidate Product Debt items). Susceptibility snapshot landed with Grounding Reframe (two targets); Target 1 (research-vocabulary inheritance) declined by user; Target 2 (synthesis-bullet discipline question) deferred to DECIDE as open Value Tension. User-stated form-spec refinement at the gate: four-section artifact structure (Abstract / Argument-graph / Citation-embedded outline / References), candidate name `essay-outline-NNN`. Gate reflection note written (`.rdd/gates/018-discover-gate.md`). **In-progress phase: removed; awaiting clean phase-exit manifest check and explicit user advance to MODEL.**

**Phase-exit state (2026-05-14):** MODEL phase artifacts complete. `domain-model.md` Amendment 23 ADDED 24 new concepts (Essay-Outline, Abstract Section, Argument-Graph (as artifact section), Citation-Embedded Outline, Susceptibility-Surface Area, Available Instantiation, Audit-Attestation, AI-Prose Critique, Rhetorical-vs-Logical Conflation, Structured-Abstract-Plus-Synthesis, Cochrane Hybrid, Audit-Extended Prose, CRESS Principles, Accidental S-Small Divergence, Co-Illumination, Outline-Production Discipline, Synthesis Bullet, Dogfooded Both-Form Production, First-Mover Advantage (Constraint-Removal), Self-Referential Meta-Observation, Iterative-Audit Pattern, Input-Side vs. Output-Side Susceptibility, Methodology Compromise, plus the two MODEL-gate-introduced concepts: Pyramid Refinement and Outline-Coherence Signal); UPDATED 4 existing concepts (Synthesis Essay, Argumentative Backbone, Susceptibility Snapshot, Framing Audit) plus 2 amended at the gate (Pyramid Refinement, Outline-Coherence Signal, Argument-Graph (as artifact section), Abstract Section) with grounding outcomes; ADDED 2 actions (Bracket Existing Artifact, Produce Both Forms); ADDED ~35 relationships; ADDED 12 open questions. **No invariant changes** — Invariant 8 provides the existing constitutional backstop. Susceptibility snapshot at the model → decide boundary recommended a Grounding Reframe with three targets — all three pursued at the gate: Target 1 (Pyramid Refinement worked-example grounded against the existing outline-form essay; operational compliance/violation tests derived); Target 2 (argument-auditor.md agent definition read — does not specify Argument-Graph consumption, graph-traversal, or expansion-fidelity verification; option (a) is correct in scope but the mechanism is judgment-anchored per Invariant 8; DECIDE's form-change ADR scope expands by one Skill-Structure Layer amendment); Target 3 (Outline-Coherence Signal discrimination — abstract→graph fail routes to scope; graph→body fail routes to discipline). Gate reflection note written (`.rdd/gates/018-model-gate.md`). **In-progress phase: removed; awaiting clean phase-exit manifest check and explicit user advance to DECIDE.**

**Driving threads (user-stated at cycle entry):**

1. **Outline-as-research-artifact.** In the user's experience, the research essays produced by `/rdd-research` are not human-read. AI-generated writing is under substantial critique across many domains. RDD's distinctive value is its audit infrastructure (citation audit, argument audit, framing audit) — those audits attach to structure, not necessarily to prose. The proposal: shift `/rdd-research` from producing a written essay to producing an organized outline with every citation inline. The audit surface is preserved. Tone/authorship ambiguity is removed. If a publishable artifact is wanted, the human writes it from the outline. (`/rdd-synthesize` already follows this pattern — extending it upstream to RESEARCH is the move under consideration.)

2. **CRESS audit.** Evaluate every RDD phase against the CRESS principles for context engineering (Codemanship, 2026-05-04 — https://codemanship.wordpress.com/2026/05/04/c-r-e-s-s-principles-for-context-engineering/). Surface where each phase aligns with CRESS, where it diverges, and where divergence is principled versus accidental.

## Phase Status

| Phase | Status | Artifact | Key Epistemic Response |
|-------|--------|----------|----------------------|
| RESEARCH | ✅ Complete | 017 prose + outline | Target 1 grounding completed; Targets 2/3 inherited by DECIDE as scope qualifications |
| DISCOVER | ✅ Complete | product-discovery.md updates (jobs, value tensions, inversions, vocabulary, debt) | Form-change settled; four-section form-spec refinement (Abstract/Argument-graph/Citation-embedded outline/References) candidate-named `essay-outline-NNN`; synthesis-bullet discipline question deferred to DECIDE; T1 (research-vocabulary inheritance) declined |
| MODEL | ✅ Complete | domain-model.md Amendment 23 (24 new concepts including Pyramid Refinement + Outline-Coherence Signal added at the gate; 4 existing updated; 2 actions; ~35 relationships; 12 open questions) | Four commitments to DECIDE: (1) Essay-Outline form, (2) Pyramid Refinement as structural property, (3) isolated argument-audit as structural check on Outline-Production Discipline, (4) Outline-Coherence Signal as stewardship trigger. Plus one Grounding Reframe deliverable: skill-text amendment to `argument-auditor.md` (Skill-Structure Layer per Invariant 8) for Argument-Graph consumption + graph-traversal + expansion-fidelity verification |
| DECIDE | ☐ Pending | — | — |
| ARCHITECT | ☐ Pending | — | — |
| BUILD | ☐ Pending | — | — |
| PLAY | ☐ Optional | — | — |
| SYNTHESIZE | ☐ Optional | — | — |

## Feed-Forward Signals

### From cycle entry (orchestrator to RESEARCH)

1. **Apply constraint-removal at research entry (ADR-082).** Bracket the existing essay artifact as prior art rather than as the default artifact shape. Compose the question against the specific named artifact (the `/rdd-research` essay). The two threads converge on artifact-form fitness; the constraint-removal moment must address this directly before research narrows on solutions.

2. **Both threads share a substrate.** Thread 1 is a specific instance (essays); Thread 2 is a principled evaluation framework (CRESS). They are not independent — CRESS may bear directly on the artifact-form question. Research should treat them as potentially co-illuminating, not as parallel investigations.

3. **Thread 1 has an embedded conclusion the user surfaced as a proposal.** "If we need an essay be publishable we should take it from the outline and write it ourselves." The user has framed this as a thread for investigation, not a settled decision. Belief-mapping at the research gate: what would have to be true for the current essay-as-research-artifact form to remain the right choice?

4. **Carry-forward from Cycle 017.** Cycle 017 (Readability & Comprehensibility) shipped the system-design split (Pattern B exemplar) and ADR-084 agent-context content placement. This cycle builds on the same line of questioning — what artifacts is the agent producing, who reads them, and what value do they provide? Research should reference Cycle 017's findings rather than rediscover them.

## Feed-Forward Signals

### From RESEARCH (to DISCOVER and downstream)

**1. The cycle's central reframing (META-MOVE).** The outline move is NOT principally justified as a response to the AI-prose critique. The Loop B finding (Cheong et al. 2025; Gallegos et al. 2026; Agarwal et al. 2025) is that the critique applies categorically — audit-attestation does not resolve it. The outline move's load-bearing justifications are: (a) reduced surface area for sycophantic framing-adoption (theoretically motivated, empirically untested per Loop B/C explicit gap), (b) compatibility with CRESS-Empirical, and (c) reduced rhetorical-vs-logical conflation (Loop C audit-extended-prose critical flaw + cycle's RDD-context inference).

**2. Target 1 grounding result (load-bearing for DECIDE form-change ADR drafting).**

The Grounding Reframe at the research → discover boundary completed Target 1 (constraint-removal first-mover advantage for outline form). The grounded framing DECIDE inherits:

- **Outline-with-inline-citations is the available instantiation of the structured-abstract-plus-synthesis family at RDD's cycle-rhythm scale.** It is not uniquely supported by criteria comparison among the prior-art comparanda.
- **Cochrane hybrid** is better than outline form on all three criteria (audit-fidelity, susceptibility-surface-minimization, downstream-feed-forward) but is "scale-incompatible with RDD's cycle rhythm" (Loop C). The Cochrane-scale-incompatibility is the load-bearing rationale for outline over Cochrane.
- **Structured-abstract-plus-synthesis** is structurally similar to outline form; the choice between them is a gradient question (how much prose connective tissue vs how much bullet structure) that evidence does not strongly distinguish. Outline form is functionally a sub-case of this family.
- **Audit-extended prose with mandated CALIBRATION bullets** is genuinely distinguished against by the Loop C critical-flaw argument: "audit-extended prose cannot separate rhetorical force from logical force, which means framing adoption can occur within a well-headed section without detection." This is the load-bearing argument for outline over within-prose discipline.

DECIDE's form-change ADR should be drafted with this framing explicit: outline form is the available instantiation that satisfies susceptibility-surface-minimization without Cochrane-scale infrastructure cost, AND is distinguished from audit-extended prose by the Loop C critical-flaw evidence. NOT "outline is uniquely best by all criteria."

**3. Target 2 inheritance (scope-of-claim caveat for CRESS Thread).**

The Grounding Reframe Target 2 (CRESS scope-transfer as working hypothesis vs established premise) was acknowledged as carried forward to DECIDE without further grounding action. DECIDE should encode: the two-thread convergence between practice (Q1) and CRESS audit (Q2) is supportive but the convergence's strength depends on the scope-transfer being valid. The cycle ran Loop A's scope-transfer examination and produced an affirmative case by analogy ("CRESS describes properties of context fed to LLM agents; RDD phases produce artifacts that function as context fed to downstream LLM agents"). DECIDE should treat the convergence as "two paths via a shared analogy reaching the same diagnostic" rather than "two fully independent frameworks." This is a scope-of-claim caveat on the convergence's evidential weight, not a refutation.

**4. Target 3 inheritance (scope-of-claim caveat for citation comparison).**

Target 3 (citation-comparison evidence scope) was acknowledged as carried forward to DECIDE. The citation-comparison evidence (3 unique-to-prose P1 errors vs 0 unique-to-outline P1 errors) is scoped to one cycle's prose-production method (synthesis from research log with re-attribution at synthesis time). DECIDE's form-change ADR should explicitly note this scope: if a future cycle produces prose directly from primary sources rather than via research-log synthesis, the comparison should be re-run before treating outline form's citation-error advantage as settled.

**5. Methodology compromise at boundary (transparency note).**

After R2 argument audits, the user accepted targeted P2 fixes without an R3 re-audit. The R2 had identified 5 outstanding items (0 P1, 2 P2, 3 P3 per artifact) of which the 6 P2 fixes (4 prose, 2 outline) were applied. Remaining items (P3 + framing carry-overs) surface here as inheritance notes rather than blocking the phase advance. DECIDE may treat the essays as substantively complete but not "fully audit-clean."

**6. The self-referential meta-observation.**

The prose argument auditor identified that the prose form of the essay demonstrated the framing-adoption phenomenon the essay describes (two instances where the prose form adopted research-log framings without surfacing alternatives — caught by isolated framing audit, not by the cycle's own revision passes). The outline form's R2 framing audit produced zero new framing findings of this type. This is consistent with the cycle's thesis and is itself directional evidence for the central argument. DECIDE may reference this as an empirical anchor.

### From RESEARCH (cross-cutting observations for the methodology itself)

**The iterative-audit pattern.** Each correction pass in this cycle introduced 3–5 new issues that subsequent audits caught. The pattern converged: R1 → R2 issue counts shrank and severities decreased. This is methodology evidence that the audit infrastructure functions as a genuine error-correction process, and is also a cost signal worth recording for future cycles (citation audits ran 4 rounds; argument audits ran 2 rounds; the methodology compromise to stop iterating was the user's call, not the audit's recommendation).

**Iterated audit dispatch costs.** Cycle 018 dispatched approximately 14 specialist subagents (research-methods reviewer; lit-reviewer × 2; outline-derivation subagent; argument-auditor × 4; citation-auditor × 4; susceptibility-snapshot evaluator; correction subagents × 2) plus parallel both-forms production subagents. The dogfooded both-forms design doubled most audit-related costs but generated the empirical comparison the cycle's central argument relies on.

### From DISCOVER (to MODEL and DECIDE)

**1. The form-change is settled — DECIDE drafts the form-change ADR with the four-section structure.** User-stated criterion: information propagation forward. Burden of proof shifted to narrative form ("evidence the narrative form is useful"); user finds it does not in the RESEARCH artifact role. Narrative form is useful when the goal is *sharing* (SYNTHESIZE phase); not useful when the goal is *information propagation* (RESEARCH phase). The form-change is RESEARCH-scoped; SYNTHESIZE's existing pattern unchanged.

**2. Four-section form-spec refinement (user-stated at the DISCOVER gate, 2026-05-14).** The proposed research-artifact structure: (1) Abstract — synthesis/summary at the top, provides shareable surface without sacrificing audit substrate; (2) Argument-graph — claim-warrant-evidence dependency structure as primary section, distinct from the auditor's report (the auditor consumes the graph rather than re-deriving it); (3) Citation-embedded outline — the body, structured-outline-with-inline-citations; (4) References — bibliography. Candidate artifact name: `essay-outline-NNN`. DECIDE must specify argument-graph format (text-based dependency graph? mermaid? structured-bullet hierarchy?), address auditor integration with the graph, and resolve the synthesis-bullet discipline question.

**3. Synthesis-bullet discipline question deferred to DECIDE.** The user has no strong opinion. The form-change ADR must address: is synthesis-bullet presence enforced structurally (audit-time verification) or left as skill-text convention? The four-section structure with explicit argument-graph as a primary section is one structural answer; an audit-time bullet-presence check is another. Both are compatible. DECIDE chooses.

**4. Form-migration scope held separable.** Reflections, the synthesis essay (`/rdd-synthesize`), and other prose-form artifacts are NOT in the form-change ADR's scope. The user's framing: narrative serves both shareability and meaning-making in those contexts. DECIDE may address them in separate ADRs or defer.

**5. Scope-of-claim caveats inherited from RESEARCH carry forward.** Target 2 (CRESS scope-transfer as working hypothesis via analogy, not as established premise) and Target 3 (citation-comparison evidence scoped to one prose-production method) remain DECIDE encoding requirements for any ADR citing the convergence or the citation comparison.

**6. Open Question 7 (Kim et al. input-side susceptibility) held as downstream empirical test candidate.** Not a DECIDE blocker. Worth empirical test in a downstream cycle: do structured outlines trigger Kim et al.-type over-weighting in downstream RDD agents?

**7. Target 1 (research-vocabulary in user-voice sections) declined by user.** DISCOVER artifacts entering MODEL carry research-essay constructs in user-voice sections. This is a methodology-level signal that may resurface in future cycles. MODEL inherits the artifact as-is.

**8. Candidate methodology amendments held for DECIDE (non-blocking).** (a) ADR-082 second-stage constraint-removal bracketing — addresses the first-mover-advantage problem the research → discover snapshot caught. (b) Standing two-dimensional susceptibility evaluation rubric — Cycle 018's gate-prep operationalization as a candidate methodology tool. (c) Dogfooded both-form production as standard methodology test for artifact-form proposals. Each held as candidate, not load-bearing for the form-change ADR.

### From MODEL (to DECIDE)

**1. Four user commitments going into DECIDE.** (a) Essay-Outline as the RESEARCH artifact form (four-section structure: Abstract / Argument-Graph / Citation-Embedded Outline / References; candidate name `essay-outline-NNN`; RESEARCH-scoped; SYNTHESIZE unchanged). (b) **Pyramid Refinement** as Essay-Outline's structural property — the four sections form a refinement hierarchy, not peer sections; each level expands cleanly into the next. (c) The **(isolated) argument-audit** is the structural check on Outline-Production Discipline — option (a) within existing auditor remit, acknowledging the audit's own susceptibility and trusting Architectural Isolation as structural insurance. (d) **Outline-Coherence Signal** as the stewardship trigger when the pyramid cannot read cleanly within a cycle's scope.

**2. One additional concrete DECIDE scope item from MODEL-gate Grounding Reframe.** Target 2 grounded against `argument-auditor.md`: the existing agent definition specifies five within-document verifications + framing audit but does NOT specify (i) Argument-Graph section as structural input, (ii) graph-traversal across pyramid levels, or (iii) "expand cleanly" expansion-fidelity verification. The user's option (a) commitment is correct in *scope* but per Invariant 8 the mechanism is judgment-anchored as-is. **DECIDE's form-change ADR scope expands by one specific deliverable: a Skill-Structure Layer amendment to `argument-auditor.md`** specifying Argument-Graph consumption + graph-traversal + expansion-fidelity verification per Pyramid Refinement's operational compliance test.

**3. Pyramid Refinement compliance test (concrete, derivable from the existing artifact).** Compliance: (a) no orphan abstract claims (every conclusion has body content developing it); (b) no orphan body sections (every body section cites evidence); (c) CLAIM/WARRANT/EVIDENCE bullets present within body sections. Violation: any of (a)/(b)/(c) failing; or — with the explicit Argument-Graph section — argument-graph nodes with no abstract-claim parent above or no outline-bullet children below. DECIDE's form-change ADR can encode this compliance test as the auditor's verification target.

**4. Outline-Coherence Signal discrimination test.** (a) Abstract → Argument-Graph expansion fails → scope is suspect (split the cycle). (b) Argument-Graph → Citation-Embedded Outline expansion fails → discipline is suspect (re-run production with discipline tightening). (c) Abstract orphans → absence-pattern doesn't discriminate; trace which level is missing to route the diagnosis. DECIDE encodes this discrimination explicitly so the signal can be acted on operationally.

**5. Three open questions remain open going into DECIDE (held; not blockers).**
- Synthesis-bullet discipline structural vs. conventional anchoring — the four-section structure + argument-audit covers part of this; whether per-section SYNTHESIS-bullet-presence-audit is also needed remains for DECIDE.
- Argument-Graph format specification (text-based dependency / mermaid / structured-bullet hierarchy) — Pyramid Refinement implies expansion-supporting hierarchical structure; specific format choice is DECIDE's.
- Form-migration scope for reflections and synthesis essay — held separable per the DISCOVER gate.

**6. Scope-of-claim caveats carry forward (Target 2 and Target 3 inheritance from earlier snapshots).** CRESS scope-transfer is a working hypothesis via analogy (not established premise); citation-comparison evidence is scoped to one prose-production method. DECIDE's form-change ADR must encode both caveats in any claim that cites the convergence or the citation comparison.

**7. Candidate methodology amendments (held; not blocking the form-change ADR).** Constraint-removal second-stage bracketing (ADR-082 amendment); standing two-dimensional susceptibility evaluation rubric; Dogfooded Both-Form Production as standard methodology test; iterative-audit convergence-test.

**8. Methodology-level signal (Target 1 declined for this cycle).** DISCOVER's update-mode imports research-essay vocabulary into user-voice sections without testing against user voice. Recorded as an Open Question for a future methodology cycle; MODEL inherited DISCOVER artifacts as-is per user's gate decision. Not a DECIDE concern.

### From MODEL (cross-cutting observations)

**The MODEL gate exhibited the Cycle 10 MODEL Finding 1 pattern in real time.** The user proposed Pyramid Refinement and Outline-Coherence Signal in Turn 1; the agent wrote both as load-bearing domain concepts in the same agent turn that received them. Belief-mapping was performed *after* adoption (on a downstream implication — auditor scope (a)/(b)), not *before* (on the framings themselves). The susceptibility-snapshot-evaluator at the model → decide boundary caught this pattern (consistent with Cycle 10 MODEL Finding 1) and recommended a three-target Grounding Reframe. All three were pursued at the gate before phase exit — the concepts now have worked-example grounding (Target 1), the auditor-scope commitment has skill-text-amendment scope (Target 2), and the coherence signal has discrimination (Target 3). Tier 1 Architectural Isolation operated as ADR-058 predicts: the isolated evaluator surfaced what the in-context conversation did not.

**The grounding actions added one new DECIDE deliverable** (the `argument-auditor.md` skill-text amendment). This is a concrete, fileable Invariant-8 anchoring task — not an "open question" in the unresolved sense, but a settled scope item with a defined target. The form-change ADR's scope expanded by exactly one specific deliverable during the MODEL gate's Grounding Reframe response.

### From DISCOVER (cross-cutting observations)

**The user's voice during the gate was plainer than the research-essay vocabulary the agent imported into user-voice sections.** Specifically: the user's gate vocabulary was "propagates the right information forward," "write it in my own voice," "crystalizes the core argument in a measurable way," "leaking implications in the connective tissue." The agent imported research-essay constructs ("susceptibility-surface area," "rhetorical-vs-logical conflation," "available instantiation of a well-established research-artifact family") into the new Solo Developer-Researcher jobs entries. The user accepted this — declined Target 1 of the Grounding Reframe — but the methodology-level signal stands: in DISCOVER update mode, the agent's research-context anchoring tends to import research-essay vocabulary into user-voice sections without testing it against user voice. This is a candidate observation for a future methodology cycle.

**The orchestrator's probe on synthesis-bullet discipline was scope-confused.** The probe conflated SYNTHESIZE-phase shareable-essay role (the user's "same logic as synthesis" reference) with synthesis-bullets-within-RESEARCH-outline discipline. The user's clarification corrected the scope. The synthesis-bullet question itself remains live for DECIDE; the probe's framing was wrong, not the question.

## Context for Resumption

**Resume action in the next session:** Read this cycle-status, the model gate reflection note (`.rdd/gates/018-model-gate.md`), the model susceptibility snapshot (`.rdd/audits/susceptibility-snapshot-018-model.md`), and the updated domain model (`./docs/domain-model.md` Amendment 23). Then advance Current phase to `decide`, add `**In-progress phase:** decide` to the header, and invoke `/rdd-decide`. DECIDE inherits the four user commitments (Essay-Outline form, Pyramid Refinement structural property, isolated argument-audit as structural check, Outline-Coherence Signal as stewardship trigger), plus one additional Grounding Reframe deliverable (skill-text amendment to `argument-auditor.md` for Argument-Graph consumption + graph-traversal + expansion-fidelity verification), plus the scope-of-claim caveats from Target 2 and Target 3 inheritance from earlier in the cycle. The form-change ADR is the primary deliverable; the auditor skill-text amendment is the concrete Invariant-8 anchoring deliverable.

**Earlier resume action (DISCOVER → MODEL — discharged 2026-05-14):** ~~Read this cycle-status, the discover gate reflection note (`.rdd/gates/018-discover-gate.md`), and the discover susceptibility snapshot (`.rdd/audits/susceptibility-snapshot-018-discover.md`). Then advance Current phase to `model`, add `**In-progress phase:** model` to the header, and invoke `/rdd-model`.~~

**Load-bearing context for MODEL and beyond:**

- Updated product-discovery: `./docs/product-discovery.md` (Cycle 018 additions: new Solo Developer-Researcher jobs, 12 new Value Tensions, 8 new Assumption Inversions, ~22 new Product Vocabulary entries, 3 candidate Product Debt items)
- Discover gate reflection: `.rdd/gates/018-discover-gate.md`
- Discover susceptibility snapshot: `.rdd/audits/susceptibility-snapshot-018-discover.md`
- Both-form research artifacts: `./docs/essays/017-outlines-as-research-artifacts-{prose,outline}.md`
- Research log: `./docs/essays/research-logs/017-outlines-as-research-artifacts.md`
- Lit-reviews: `./docs/essays/research-logs/lit-review-018-{ai-prose-critique-landscape,minimal-surface-artifact-design}.md`
- Reflections: `./docs/essays/reflections/017-outlines-as-research-artifacts.md`
- Audit corpus: `.rdd/audits/{research-design-review,citation-audit,argument-audit,susceptibility-snapshot}-018*.md` — research-phase audits plus the new discover susceptibility snapshot
- Research gate reflection: `.rdd/gates/018-research-gate.md`
- The eight DISCOVER feed-forward signals in the section above are the load-bearing context for DECIDE's form-change ADR drafting. The four-section form-spec refinement is the most consequential — DECIDE inherits a concrete artifact-form proposal, not just a form-change-in-principle.

**Notable methodology data this cycle produced (not load-bearing for downstream phases, but worth remembering):**

- The both-form dogfooded production design is a cheap experimental method for any artifact-form question. Reproducible across future cycles.
- The iterative-audit pattern showed converging issue counts across rounds (R1 → R2/R3 fewer/smaller issues); the user's call to stop iterating at R2 + P2-targeted Edits was an acknowledged methodology compromise rather than a methodology violation.
- The susceptibility-snapshot-evaluator's Grounding Reframe at the phase boundary substantively shifted the framing DECIDE inherits (from "outline best by criteria comparison" to "outline as available instantiation of structured-abstract-plus-synthesis at cycle-rhythm scale"). Tier 1 architectural-isolation operated as ADR-058 predicts.
- A methodology gap surfaced: ADR-082's constraint-removal protocol allowed the user's response to converge on a specific proposed replacement (outline form) rather than holding the solution space open. The reviewer caught this at Step 1.3 but could not fully remediate the first-mover advantage outline form acquired. Reflections file documents this as a candidate future-cycle ADR-082 amendment.

**Prior cycle reference:** Cycle 017's archived status lives at `docs/cycle-archive/cycle-017-readability-and-comprehensibility-status.md`.

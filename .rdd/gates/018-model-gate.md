# Gate Reflection: Cycle 018 model → decide

**Date:** 2026-05-14
**Phase boundary:** model → decide
**Cycle:** Outlines as Research Artifacts and CRESS Audit

## Belief-mapping question composed for this gate

> **What would you need to believe for Outline-Production Discipline as skill-text convention (without audit-time structural verification) to be reliable enough that the form change DECIDE encodes does not also require a structural check on synthesis-bullet presence?**
>
> The question is composed against Invariant 8's central claim — "a specified mechanism is not a working mechanism" — applied recursively to the form change Cycle 018 produced. If Outline-Production Discipline is the load-bearing site (Spike S1 finding), and if discipline-as-skill-text-convention is structurally analogous to the prose-hardening Cycle 10 found unreliable, then DECIDE's form-change ADR inherits an Invariant 8 question: structural anchoring required, or not? What conditions would have to hold for "convention is enough"?

The question was composed against the most consequential commitment Cycle 018 carries forward — the form change at RESEARCH — and against the Cycle 10 prose-hardening analog. The goal was to test whether the user's commitment to the form change accounts for the execution-under-task-load question Invariant 8 names, or whether the form change has been adopted without examining the Invariant 8 implication.

## User's response

The exchange ran across two substantive turns.

**Turn 1 — substantive engagement with the form's structural property and a derived stewardship signal:**

> "I think the key is the argument audit (and I suppose the audit itself is susceptible) but my hope would be that a coherent argument outline would read clearly for the user for the scope of a given cycle. If it were too large to reason about, then it's likely a smell that the cycle's scope is too big. But to me there's pyramid -- abstract should expand cleanly into the argument graph which should expand cleanly into the outline which should be based upon the sources"

The user articulated three substantive moves:

1. **Argument audit is the structural check, acknowledging the audit's own susceptibility.** The user did not engage the Invariant-8 framing directly; they redirected to "the audit is the key" — implicitly relying on Architectural Isolation (ADR-058) as the audit's structural insurance, though without naming it.

2. **Pyramid Refinement** as the structural property of Essay-Outline. The four sections are not peer sections; they form a refinement hierarchy. Each level expands cleanly into the next. The abstract synthesizes; the argument-graph decomposes into claim-warrant-evidence dependency; the citation-embedded outline expands each argument-graph node into working bullets and citations; the references are the source corpus. "Expand cleanly" is load-bearing.

3. **Outline-Coherence Signal** as a derived stewardship trigger. If the pyramid does not read cleanly within a cycle's scope, the smell is the cycle's scope, not the form. The form structurally exposes scope problems rather than absorbing them.

The agent captured #2 and #3 as new domain concepts (Pyramid Refinement, Outline-Coherence Signal) and updated Essay-Outline's concept entry to encode the pyramid framing as the structural property the audit verifies.

**Turn 2 — commitment-gating and abstract-role sharpening:**

The agent's follow-up surfaced an implication of the pyramid framing: it makes "expand cleanly" the audit's load-bearing verification, which extends the auditor's scope from within-level argument validity to inter-level expansion fidelity. The agent presented this as two options — (a) within existing argument-auditor remit ("pointed at the expansion check"), or (b) a new audit type — and asked which the user was committing to.

The agent also asked commitment-gating across four candidate commitments going into DECIDE: (1) Essay-Outline as the form; (2) Pyramid Refinement as its structural property; (3) isolated argument-audit as the structural check; (4) Outline-Coherence Signal as the stewardship trigger.

> "Yes it's a. My hope for an abstract is that it succinctly presents the research and conclusions. That should map very cleanly to the argument audit"

The user:
- Confirmed option (a): the existing argument-auditor's remit handles inter-level expansion fidelity once the four-section structure makes both levels visible. No new specialist subagent required; the existing auditor pointed at the expansion check.
- Sharpened the Abstract Section role: "succinctly presents the research and conclusions" — and confirmed the abstract-to-argument-graph mapping is what the argument-audit verifies.
- Implicitly confirmed the four commitments going into DECIDE.

The Abstract Section concept entry was updated to reflect the sharpened role.

## Pedagogical move selected

Challenge. The belief-mapping question composed at the boundary tested a specific Invariant 8 implication of the form change. The user engaged the question substantively — redirecting the frame (from structural-vs-conventional anchoring to argument-audit-as-the-key + pyramid + cycle-scope-smell) and providing concrete structural and stewardship commitments that the model captured as new domain concepts. The agent's follow-up was warrant-elicitation + commitment-gating combined — testing the operational implication of the user's "argument audit is the key" commitment (does the auditor's scope need to expand?) and gating the four commitments going into DECIDE.

Two challenge moves occurred in the exchange. Both elicited substantive content rather than agreement-or-deflection. The user's Turn 1 introduced new domain concepts the agent had not surfaced; the user's Turn 2 closed loops with specific operational commitments.

## Commitment gating outputs

**Settled premises (the user is building on these going into DECIDE):**

- **Essay-Outline is the RESEARCH artifact form** (inherited from DISCOVER; no new commitment at MODEL). Four-section structure: Abstract / Argument-Graph / Citation-Embedded Outline / References. Candidate name `essay-outline-NNN`. RESEARCH-scoped; SYNTHESIZE pattern unchanged.
- **Pyramid Refinement is Essay-Outline's structural property.** The four sections form a refinement hierarchy where each level expands cleanly into the next. The abstract succinctly presents the research and conclusions; expands to the argument-graph; expands to the citation-embedded outline; traces to references. "Expand cleanly" is the load-bearing relationship the audit verifies.
- **The (isolated) argument-audit is the structural check on Outline-Production Discipline.** The user accepts the audit's own susceptibility but treats Architectural Isolation as the structural insurance. The existing argument-auditor's remit (option (a)) covers inter-level expansion fidelity — no new specialist subagent required.
- **The Abstract Section's role is to succinctly present the research and conclusions, mapping cleanly to the argument-graph below it.** The mapping is what the argument-audit verifies at the abstract → argument-graph level of the pyramid.
- **Outline-Coherence Signal is the stewardship trigger** when the pyramid cannot be made to read cleanly within a cycle's scope. The form structurally exposes scope problems; the response is to reconsider scope, not stretch the form.

**Open questions (the user is holding these open going into DECIDE):**

- **Synthesis-bullet discipline structural vs. conventional anchoring.** The user's Turn 1 response answered the belief-mapping at the level of argument-audit-as-key and pyramid-as-structural-property. The synthesis-bullet-presence-per-section question — does each citation-embedded outline section require an explicit SYNTHESIS bullet, and is the presence enforced structurally (audit-time check) or conventionally (skill-text instruction)? — was not directly addressed. The form's structural design (Pyramid Refinement + argument-audit verifying expansion fidelity) may make this question moot, or may leave it as a separable concern. DECIDE's form-change ADR must determine.
- **Argument-Graph format specification.** Pyramid Refinement implies the argument-graph format must support expansion semantics (hierarchical / dependency-graph with named decomposition, so the auditor can verify "this argument-graph node expands cleanly into these citation-embedded outline bullets"). The specific format — text-based dependency, mermaid, structured-bullet hierarchy — remains for DECIDE.
- **Auditor integration with argument-graph as primary section.** The user's confirmation of option (a) settles the scope question (existing argument-auditor remit, pointed at expansion fidelity). The operational realization — does the auditor receive the argument-graph as structured input, traverse it, and verify expansion against the abstract above and the citation-embedded outline below? — is for DECIDE to specify.
- **Form-migration scope for reflections and synthesis essay** (carried forward from DISCOVER as separable).
- **Open Question 7 (input-side susceptibility from Kim et al.)** carried forward as downstream empirical test candidate.
- **Target 2 (CRESS scope-transfer as working hypothesis via analogy)** and **Target 3 (citation-comparison evidence scoped to one prose-production method)** — scope-of-claim caveats carry into DECIDE.
- **Constraint-removal second-stage bracketing (candidate ADR-082 amendment)** — held as candidate methodology amendment, not blocking the form-change ADR.

**Specific commitments carried forward to DECIDE:**

- **DECIDE's form-change ADR encodes Essay-Outline with Pyramid Refinement** as the structural property. The ADR must specify:
  - The four-section structure (Abstract / Argument-Graph / Citation-Embedded Outline / References).
  - That the sections form a refinement hierarchy, not peer sections — "expand cleanly" is load-bearing.
  - The Argument-Graph format must support expansion semantics (hierarchical / dependency-graph; specific format choice held open).
  - The argument-auditor's scope extends to inter-level expansion fidelity (within existing auditor remit per the user's option (a) confirmation; operational realization for the ADR to specify).
  - Outline-Coherence Signal as the stewardship trigger when the pyramid cannot read cleanly within scope.
- The grounded framing inherited from RESEARCH and DISCOVER remains: Essay-Outline is the **Available Instantiation** of the Structured-Abstract-Plus-Synthesis family at RDD's cycle-rhythm scale (NOT "uniquely best by criterion comparison"). DECIDE's form-change ADR must encode this framing, the Target 2 caveat (CRESS scope-transfer via analogy), and the Target 3 caveat (citation-comparison evidence scope).
- The methodology-level signal from DISCOVER's Target 1 declination (research-vocabulary inheritance into user-voice sections) carries forward as an Open Question for a future methodology cycle, not as a Cycle 018 remediation. DECIDE does not act on this; it inherits it.
- The agent's MODEL-phase write captured **two consequential concepts (Pyramid Refinement, Outline-Coherence Signal) that the user introduced at the gate, in the same agent turn that received them**. This is a procedural note for the susceptibility-snapshot-evaluator: belief-mapping was not performed before adoption of these concepts. The pattern is consistent with Cycle 10 MODEL Finding 1's preference-accelerated-commitment failure mode (user-stated preference precedes implications analysis; alternatives not engaged at comparable depth). The susceptibility snapshot at this boundary may flag this pattern.

## Susceptibility Snapshot findings and Grounding Reframe outcomes

The susceptibility-snapshot-evaluator (`.rdd/audits/susceptibility-snapshot-018-model.md`) flagged the Cycle 10 MODEL Finding 1 pattern in real time and recommended a Grounding Reframe with three targets. All three were pursued at the gate; outcomes recorded below.

### Target 1 (Primary) — Pyramid Refinement worked-example

**Grounding action:** Retro-evaluate the existing Cycle 018 outline-form essay (`./docs/essays/017-outlines-as-research-artifacts-outline.md`) against the proposed Pyramid Refinement structure to test whether "expand cleanly" is operationalizable on a concrete example.

**Outcome:** The existing essay has three of the four proposed sections (Abstract + Citation-Embedded Outline body + References; lacks explicit Argument-Graph — that section is the MODEL-gate refinement). Retro-evaluation confirmed operationalizability: each of the abstract's 5 CONCLUSIONS (C1–C5) traces to body sections developing it; body sections carry explicit CLAIM / WARRANT / EVIDENCE / CALIBRATION / SCOPE QUALIFICATION bullets (outline-production discipline observable). The **operational compliance test** ((a) no orphan abstract claims; (b) no orphan body sections; (c) CLAIM/WARRANT/EVIDENCE bullets present within body sections) and the **operational violation test** (any of (a)/(b)/(c) failing; or — with the explicit Argument-Graph section — argument-graph nodes with no abstract-claim parent above or no outline-bullet children below) were written into the Pyramid Refinement concept entry. The Outline-Coherence Signal now licenses against a concrete compliance test instead of a structural property without an operational definition.

### Target 2 (Secondary) — Argument-auditor scope extension

**Grounding action:** Read `argument-auditor.md` agent definition to determine whether option (a) ("within existing argument-auditor remit") is supported by the skill text, or whether the form-change ADR has an additional skill-text amendment scope item.

**Outcome:** The agent definition specifies five within-document verifications (logical soundness, hidden assumptions, scope accuracy, internal consistency, terminology consistency) and a framing audit section. It does NOT specify (1) Argument-Graph section as structural input, (2) graph-traversal across pyramid levels, or (3) "expand cleanly" verification semantics. Genre handling treats "synthesis outlines" as the existing SYNTHESIZE artifact, not as Essay-Outline with a pre-encoded four-section structure. **Option (a) is correct in *scope*** — extending the existing auditor's logical-soundness and internal-consistency verifications to inter-level expansion fidelity is conceptually within scope — **but per Invariant 8 the mechanism is judgment-anchored as-is and will fail under task load.** DECIDE's form-change ADR must include a Skill-Structure Layer amendment to `argument-auditor.md` specifying Argument-Graph consumption + graph-traversal + expansion-fidelity verification. The Argument-Graph (as artifact section) concept entry and the related open question were updated to reflect this finding.

### Target 3 (Tertiary) — Outline-Coherence Signal discrimination

**Grounding action:** Sharpen the Outline-Coherence Signal entry to distinguish scope-failure from discipline-failure interpretations and specify what evidence routes a coherence failure to one path or the other.

**Outcome:** Discrimination test composed from the pyramid level at which expansion fails. (a) **Abstract → Argument-Graph expansion fails** (conclusions cannot be decomposed into a coherent dependency graph) → **scope is suspect** (the cycle is researching more than one cohesive argument can carry; split). (b) **Argument-Graph → Citation-Embedded Outline expansion fails** (graph has nodes but working bullets aren't there, or claims exist without citations) → **discipline is suspect** (re-run production with discipline tightening; no scope change). (c) **Abstract orphans** — absence-pattern doesn't discriminate; trace which level is missing to route the diagnosis. The Outline-Coherence Signal concept entry was updated with the discrimination test. The signal can now distinguish the two failure modes operationally.

### Net effect on DECIDE's inheritance

DECIDE inherits the four commitments named above (Essay-Outline form, Pyramid Refinement structural property, isolated argument-audit as structural check, Outline-Coherence Signal stewardship trigger) — plus one additional concrete scope item discovered at the Grounding Reframe: a **skill-text amendment to `argument-auditor.md`** (Skill-Structure Layer, Invariant 8) specifying Argument-Graph consumption + graph-traversal + expansion-fidelity verification. The amendment is a concrete, fileable task; it is no longer an "open" question in the sense of unresolved — it is a settled scope item with a defined target. The form-change ADR's scope expands by exactly one specific deliverable.

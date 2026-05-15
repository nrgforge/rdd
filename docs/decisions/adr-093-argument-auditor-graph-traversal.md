# ADR-093: Argument-Auditor Scope Extends to Argument-Graph Consumption and Pyramid Expansion-Fidelity Verification

**Status:** Accepted (Cycle 018 BUILD shipped WP-B; v0.8.6)

## Context

ADR-092 introduces Essay-Outline as the RESEARCH artifact form, with Pyramid Refinement as its structural property — the four sections (Abstract / Argument-Graph / Citation-Embedded Outline / References) form a refinement hierarchy in which each level expands cleanly into the next. ADR-092 §5 separates the verification layers: per-bullet Outline-Production Discipline is anchored conventionally in the `/rdd-research` skill text; expansion-fidelity at the level boundaries is anchored structurally in the argument-audit.

The MODEL gate's Target 2 grounding action (2026-05-14) read the existing `argument-auditor.md` agent definition against the user's option (a) commitment ("within existing argument-auditor remit"). The finding: the agent definition specifies five within-document verifications (logical soundness, hidden assumptions, scope accuracy, internal consistency, terminology consistency) and a framing audit. It does NOT specify:

- **Argument-Graph section as structural input.** The auditor currently re-derives argument structure from prose; Essay-Outline form has the argument-graph as a primary section but the auditor's instructions do not specify consuming it as structured input.
- **Graph-traversal across pyramid levels.** The auditor's five verifications operate within a document at the level the auditor is reading; there is no instruction to traverse Abstract → Argument-Graph → Citation-Embedded Outline → References as a refinement chain and verify expansion fidelity at each boundary.
- **Expansion-fidelity verification semantics.** "Expand cleanly" is load-bearing in ADR-092 §2, but the auditor's instructions do not specify what compliance or violation of that property looks like operationally.

The user's option (a) commitment is correct in *scope* — extending the auditor's logical-soundness and internal-consistency verifications to inter-level expansion fidelity is conceptually within the auditor's remit (no new specialist subagent is needed; the existing auditor's framing applies once it knows what to look for). But per Invariant 8 ("a specified mechanism is not a working mechanism"), the mechanism is judgment-anchored as-is and will fail under task load. The agent reading `argument-auditor.md` will not, on its own, infer that it should consume an Argument-Graph section as structured input, traverse it, and verify expansion fidelity per Pyramid Refinement's compliance test.

This ADR records the decision to anchor the auditor's expanded scope in the **Skill-Structure Layer** (the substrate named in ADR-067 as updated by ADR-089 — the Skill-Structure Layer for mechanisms whose enforcement technique is a concrete workflow step in a named skill, whose primacy and technique are unchanged by ADR-089's Harness Layer revision). The amendment to `agents/argument-auditor.md` is the unconditional anchoring that ADR-092 §2 requires.

The decision is a separate ADR from ADR-092 (not folded in) because the two decisions are conceptually distinct: ADR-092 introduces the artifact form; ADR-093 expands a Tier 1 mechanism's scope to verify the new form's structural property. Conceptual separation supports independent reasoning about each decision and supports independent supersession if either is later refined.

## Decision

The `argument-auditor` specialist subagent's responsibilities are extended to include **Argument-Graph consumption + pyramid graph-traversal + expansion-fidelity verification** when the primary document is an Essay-Outline (per ADR-092). The extension is anchored in `agents/argument-auditor.md` as Skill-Structure Layer instructions, not in domain-model vocabulary alone.

### 1. Genre detection — Essay-Outline as a named genre

The auditor's existing Process section names three genres (research essays, ADRs, synthesis outlines). The amended definition adds **Essay-Outline** as a fourth named genre, distinct from "synthesis outlines" (which currently refers to `/rdd-synthesize` output).

When the primary document is an Essay-Outline, the auditor:

- Reads the document's four sections (Abstract / Argument-Graph / Citation-Embedded Outline / References) as a four-tier structure, not as flat prose.
- Treats the Argument-Graph section as **structured input** — node identifiers (`C1`, `W1.1`, `E1.1.1`, ...) are first-class references the auditor parses rather than narrative content the auditor summarizes.
- Performs pyramid graph-traversal (§2) and expansion-fidelity verification (§3) in addition to the five existing within-document verifications.

Genre detection is by document structure (presence of the four named sections with the conventions ADR-092 §4 specifies). When in doubt, the audit dispatch's brief names the genre explicitly.

### 2. Pyramid graph-traversal — what the auditor does

For Essay-Outline genre, the auditor traverses the four-tier pyramid:

- **Tier 1: Abstract.** Identify each conclusion stated in the Abstract. Tag each conclusion with an identifier matching the Argument-Graph's top-level claim labels (`C1`, `C2`, ...).
- **Tier 2: Argument-Graph.** Parse the structured-bullet hierarchy. For each top-level claim (`C1`, ...), identify its warrants (`W1.1`, ...) and each warrant's evidence (`E1.1.1`, ...). Build the claim-warrant-evidence dependency tree.
- **Tier 3: Citation-Embedded Outline.** For each body subsection, identify which Argument-Graph node identifier(s) it anchors to (per ADR-092 §4 convention, body subsections MUST anchor to one or more graph identifiers via a parenthetical at the end of the section heading, e.g., `### Section 3 (C1)`; deliberately non-developmental sections — methodology preamble, scope-setting introductions, appendices — anchor to the reserved `META` identifier so the auditor recognizes them as intentional). Read the subsection's bullets as the expansion of the graph node. A body subsection lacking any parenthetical anchor (graph identifier or `META`) is treated as a missing-anchor violation and reported as a P1 expansion-fidelity violation per §3 (Reverse Boundary 2). **META-anchored sections are subject to audit-time review per ADR-092 §4:** the auditor checks each META section's bullet content for the presence of claim / warrant / evidence development. A META-anchored section that contains developmental bullets (i.e., that develops a graph node despite the META anchor) is reported as a **P2 misclassification** finding — the META anchor is a deliberate non-developmental marker and is not an opt-out for developmental content. The check guards against META being used as a judgment-anchored bypass for the MUST anchor convention under task load.
- **Tier 4: References.** For each evidence node's citation, verify the citation key appears in References.

The traversal produces a coverage map: which Abstract conclusions trace to which Argument-Graph nodes; which Argument-Graph nodes have body content; which body bullets cite which references; which references are cited and which are not.

### 3. Expansion-fidelity verification — what the auditor checks

At each level boundary, the auditor verifies the Pyramid Refinement compliance test from ADR-092 §3:

- **Boundary 1 (Abstract → Argument-Graph):** Every Abstract conclusion has at least one matching top-level claim in the Argument-Graph. Violation: an Abstract conclusion with no Argument-Graph node (the conclusion is unsupported by claim-warrant-evidence structure).
- **Boundary 2 (Argument-Graph → Citation-Embedded Outline):** Every Argument-Graph node (at each level: claims, warrants, evidence) has body content developing it (a body subsection or bullet that anchors to its identifier). Violation: an Argument-Graph node with no body content (the node is asserted but its working is not shown).
- **Boundary 3 (Citation-Embedded Outline → References):** Every citation in the body resolves to a Reference entry. Violation: a citation in the body with no matching Reference entry. (This boundary overlaps with the citation-auditor's responsibilities; the argument-auditor reports the boundary as part of the pyramid coverage map, deferring citation-existence verification to the citation-auditor.) Severity coordination: Boundary 3 violations detected by the argument-auditor during pyramid traversal are reported as **P2** (the citation-auditor's P1 takes precedence over the argument-auditor's structural finding for the same error, avoiding double-counting at the gate). If the dispatch brief indicates the citation-auditor has not yet run on the same artifact, the argument-auditor escalates the violation to **P1** with a note that the citation-auditor is the primary verifier — the escalation ensures the violation is not silently dropped when the upstream verifier is absent.

Reverse-direction violations are also flagged:

- **Reverse Boundary 1:** Top-level claims in the Argument-Graph with no matching Abstract conclusion. (The argument structure asserts something the Abstract does not summarize.)
- **Reverse Boundary 2:** Body subsections with no anchor to any Argument-Graph node. (Content is present that the argument structure does not account for.)

Each expansion-fidelity violation is reported in the audit's Section 1 (argument audit), with severity assigned by the violation's structural consequence:

- **P1 (Must Fix):** Any boundary violation that breaks the pyramid (an Abstract conclusion with no graph node; a graph node with no body content; a body section with no graph anchor). These are not "should-fix" issues — they are structural failures that ADR-092's Outline-Coherence Signal stewardship trigger fires on.
- **P2 (Should Fix):** Citation-Embedded Outline body sections anchored to graph nodes but with thin development (the section exists but does not visibly develop the warrants and evidence). The pyramid technically holds but the expansion is weak.
- **P3 (Consider):** Minor coverage gaps — a warrant with one body bullet where two would be clearer; reference entries that are cited but not central to the argument structure.

### 4. Output format — pyramid coverage map and expansion-fidelity findings

The amended argument-audit output adds two elements when the genre is Essay-Outline:

- **Pyramid coverage map** (in Section 1, after the Summary). A compact table or list showing each Abstract conclusion's trace through Argument-Graph nodes to body sections to references. The map is the structural evidence the audit produces; downstream readers (including future audits and the practitioner at the gate) can read it to see whether the pyramid holds.
- **Expansion-fidelity findings** (in Section 1, as a subsection of issue listings). Boundary violations (P1) and weak expansions (P2/P3) listed with their pyramid coordinates (`C1 → no Argument-Graph node`; `W2.1 → no body anchor`; `Section 4 → no Argument-Graph anchor`).

The Section 2 framing audit is unchanged in scope — it continues to check what alternative framings the source material supported, what truths were available but not featured, and what would change if the dominant framing were inverted. Framing audit applies to Essay-Outline as it applies to other genres.

### 5. Skill-Structure Layer anchoring — concrete amendment to `agents/argument-auditor.md`

The amendment to `agents/argument-auditor.md` adds (BUILD-phase work):

1. **Genre list extended.** The "audit is genre-aware" subsection adds a fourth bullet: **Essay-Outline** — check that Pyramid Refinement holds (Abstract expands into Argument-Graph; Argument-Graph expands into Citation-Embedded Outline; Citation-Embedded Outline traces to References) and that expansion-fidelity violations are flagged per the Boundary 1/2/3 criteria.
2. **New Process step (between the five existing verifications and the audit output).** "When the primary document is an Essay-Outline, perform pyramid graph-traversal and expansion-fidelity verification per ADR-093 §2–§3." Followed by inline operational instructions: how to identify the four sections; how to parse the Argument-Graph identifiers; how to build the coverage map; how to detect boundary violations; how to assign severity.
3. **Output template extension.** The output template's Section 1 adds a pyramid-coverage-map subsection (compact table showing the four-tier trace) and an expansion-fidelity-findings subsection (P1/P2/P3 issues listed with pyramid coordinates). Both appear only when the genre is Essay-Outline; for other genres the existing output template is unchanged.
4. **Cross-reference.** A note at the top of the Process section: "Essay-Outline genre handling is specified in detail in ADR-093. The instructions below incorporate that handling; the ADR records the rationale."

The skill-structure substrate is the agent file itself — the dispatch instruction is read by every argument-auditor invocation, so the auditor's behavior on Essay-Outline genre is anchored to a concrete, mechanically-unavoidable workflow step.

### 6. Backward compatibility with existing genres

The amendment does not change the auditor's behavior on the three existing genres (research essays, ADRs, synthesis outlines). The five within-document verifications and the framing audit continue to apply unchanged for those genres. The pyramid graph-traversal and expansion-fidelity verification fire only when the genre is detected as Essay-Outline.

Existing audit reports on prose essays and ADRs remain valid; the corpus does not require retroactive re-audit.

### 7. Citation-auditor and other specialist subagents — out of scope

This ADR amends only `argument-auditor.md`. Other specialist subagents (citation-auditor, framing-auditor as separate dispatch, conformance-scanner, research-methods-reviewer) are not amended. The citation-auditor's responsibility for verifying citation existence continues to fire on Essay-Outline References as it fires on prose-essay References — no amendment needed. If a future cycle surfaces a need to extend other auditors' scope for Essay-Outline genre, that is a separate ADR.

## Rejected alternatives

**1. Fold the amendment into ADR-092 rather than a separate ADR.** Considered. ADR-092 introduces the form; ADR-093 expands a mechanism's scope to verify the form. Folding would keep the two decisions co-located. Rejected because the decisions are conceptually separable: ADR-092 could in principle be implemented without ADR-093 (the form would exist but the audit would not verify the pyramid), and the corpus would then have a form-vs-verification gap — exactly the Invariant 8 risk the MODEL Target 2 grounding identified. Separating the ADRs makes the verification-anchoring decision visible as its own commitment. The two ADRs cite each other; the corpus reader can trace the dependency. Conceptual separation also supports independent supersession — a future cycle that revises the auditor's scope without revising the form (or vice versa) can supersede one ADR without disturbing the other.

**2. Add a new specialist subagent (e.g., `pyramid-auditor.md`) rather than extending the existing argument-auditor.** Considered. A dedicated agent would have a single clear responsibility (pyramid graph-traversal and expansion-fidelity verification) and would not entangle Essay-Outline-specific logic with the existing auditor's five within-document verifications. Rejected because the verifications are conceptually within argument-audit's existing remit (logical soundness and internal consistency between an Abstract's conclusions and the body that develops them ARE argument-audit concerns), and adding a separate agent would split the audit's analysis of a single document across two dispatches. The dispatch cost would double; the framing audit (Section 2) would either duplicate across agents or be assigned to one and not the other, creating inconsistent coverage. The user's option (a) commitment at the MODEL gate (within existing remit) is structurally the right call; ADR-093 anchors that commitment in the skill text rather than introducing a new agent.

**3. Encode the amendment in `skills/research/SKILL.md` rather than in `agents/argument-auditor.md`.** Considered. The form is produced by `/rdd-research`; placing the verification instructions adjacent to the production instructions would co-locate the form's structure with the structure's verification. Rejected because the audit is genre-aware in the agent file itself (the auditor's existing genre list lives in `argument-auditor.md`, not in the producing skills), and the audit fires from dispatches outside `/rdd-research` (e.g., `/rdd-decide`'s argument audit on ADRs and the new ADR's source-essay grounding may incidentally encounter Essay-Outline inputs). The agent file is the single point where genre handling must be specified; encoding it in `/rdd-research` would leave non-`/rdd-research` dispatches unanchored.

**4. Anchor the amendment in domain-model vocabulary alone (the Argument-Graph concept entry already names the auditor's role).** Considered as the minimum-friction path. Domain-model vocabulary captures meaning; concept entries can name the auditor's role as established. Rejected on Invariant 8 — domain-model entries are read for orientation and naming, not as workflow instructions for the agent at task time. The auditor reading the domain model does not, on its own, infer step-by-step verification procedures. Skill-Structure Layer anchoring (the agent file's Process section) is the substrate Invariant 8 names for unconditional structural mechanisms.

**5. Defer the amendment to a future cycle, treating Essay-Outline audit as judgment-applied in the interim.** Considered. The form change could land in BUILD with the auditor's behavior un-amended; practitioners or the agent could exercise judgment to perform the pyramid traversal as needed. Rejected on the Invariant 8 evidence base: judgment-anchored mechanisms fail under task load, and the form change's load-bearing audit is the structural anchor that makes ADR-092 §5's layer separation honest. Deferring would leave the form-change ADR's central commitment unanchored from day one. The MODEL gate's Target 2 grounding action explicitly named the scope expansion as a fileable, concrete deliverable; deferring would walk back that grounding outcome.

## Consequences

**Positive:**

- The Pyramid Refinement compliance test (ADR-092 §3) is anchored in a Skill-Structure Layer mechanism. The auditor's instructions specify what to check, how to traverse, and how to report — Invariant 8 anchoring achieved.
- The Outline-Coherence Signal stewardship trigger (ADR-092 §6) has a structural source. The signal fires when the audit reports P1 expansion-fidelity violations; the discrimination test (scope vs. discipline) reads the specific boundary that failed.
- The argument-audit's coverage of Essay-Outline form is no longer judgment-anchored. The agent reading `argument-auditor.md` after this amendment has step-by-step instructions; performance under task load is predictable.
- The pyramid coverage map gives downstream readers (the practitioner at the gate, future audits, conformance scans) a compact structural snapshot of the audited essay-outline.
- The amendment is mechanically implementable as a skill-text edit; no new infrastructure required.

**Negative:**

- The argument-auditor's behavior diverges by genre. Maintenance cost grows: future amendments to the auditor's responsibilities must consider four genres rather than three, with different operational instructions for Essay-Outline than for prose essays.
- The pyramid graph-traversal step adds production cost per dispatch when the genre is Essay-Outline. The cost is bounded (the traversal is a structured parse of a markdown document, not an open-ended task), but each argument-audit on an Essay-Outline takes longer than on a prose essay of comparable length.
- The Argument-Graph format (ADR-092 §4) and the auditor's traversal instructions are coupled. A future change to either requires considering the other. Mitigation: ADR-092 §4 and ADR-093 §2 are explicit about the convention; the coupling is named, not hidden.
- The amendment encodes Essay-Outline-specific operational instructions in the agent file. If the corpus later introduces other structured-form artifacts (e.g., decision-graph ADRs, structured product-discovery documents) with their own verification needs, the agent file's complexity will grow. Mitigation: the genre-aware pattern already exists in the auditor; extending it has compounding cost but is structurally clean per the existing convention.

**Neutral:**

- The framing audit (Section 2) is unchanged. Essay-Outline framing audit reads the source material alongside the audited essay-outline and answers the three structural questions per the existing template.
- Citation-auditor responsibilities are unchanged. Citation existence verification fires on Essay-Outline References as on prose-essay References.
- The amendment does not change the domain-model invariants. Invariant 8 governs the anchoring substrate choice; the ADR records that choice (Skill-Structure Layer). Backward propagation does not fire.
- The amendment does not require corpus retroactive audit. Existing prose-essay audits remain valid; only new Essay-Outline audits exercise the amended instructions.

## Provenance check

- **The scope-extension commitment:** user-stated at the MODEL gate 2026-05-14 ("Yes it's a"; option (a) — within existing argument-auditor remit). Driver-derived; user-stated.
- **The Invariant 8 anchoring requirement:** MODEL gate Target 2 Grounding Reframe outcome (2026-05-14). The Grounding Reframe identified the gap between the user's option (a) commitment (correct in scope) and the existing auditor's skill text (does not specify Argument-Graph consumption, graph-traversal, or expansion-fidelity verification). Driver-derived; snapshot-grounded.
- **Skill-Structure Layer as the substrate choice:** Invariant 8 governs the three-tier substrate classification (ADR-067). The auditor's responsibilities are a concrete, mechanically-unavoidable workflow step in a named agent file — the Skill-Structure Layer decision procedure step 1 applies. Driver-derived; methodology-pattern-derived.
- **The four boundary verifications (Abstract → Argument-Graph; Argument-Graph → Outline; Outline → References; reverse-direction):** drafting-time agent synthesis composed against ADR-092 §3's compliance test. The compliance test itself is driver-derived (Target 1 grounding outcome); the boundary-by-boundary verification procedure is the agent's composition responsive to the compliance test's structure.
- **Severity assignment (P1 for boundary violations; P2 for weak development; P3 for minor coverage gaps):** drafting-time synthesis composed against the existing auditor's P1/P2/P3 framework. Agent composition; existing-template-derived.
- **Pyramid coverage map output format:** drafting-time agent synthesis. The output extension addresses the auditor's existing output template by adding a structural-evidence subsection. Agent composition; existing-output-template-derived.
- **The decision to file as a separate ADR (rather than fold into ADR-092):** drafting-time judgment. The two decisions (form introduction; mechanism scope extension) are conceptually separable and benefit from independent supersession. Agent composition; methodology-pattern-derived (ADR-092 / ADR-093 separability is analogous to ADR-091 / future ADRs that may amend the build skill independently of the dual-mode framing).
- **Rejected alternatives:** drafting-time synthesis examining the design space. The "separate-vs-fold" question, the "new agent vs. extend existing" question, the "skill-vs-agent file" question, the "domain-model alone vs. skill-structure layer" question, and the "defer-to-future-cycle" question are all design-space alternatives the agent composed against the driver chain. Each rejection traces its load-bearing reason to driver-chain material (Invariant 8, the MODEL gate's option (a) commitment, the existing genre-aware pattern).

**Result:** The scope-extension commitment and the Invariant 8 anchoring requirement are driver-derived (user-stated and snapshot-grounded). The Skill-Structure Layer substrate choice is methodology-pattern-derived (ADR-067 decision procedure applied). The boundary verifications, severity assignment, output format extension, and ADR separability are drafting-time synthesis composed against driver-derived material. The Rejected Alternatives section is design-space synthesis with each rejection traced to driver-chain reasoning. No drafting-time framing adoption detected.

## Skill-text amendments

The amendment lands as (BUILD-phase work):

- **`agents/argument-auditor.md`** — Genre list extended (Essay-Outline added as the fourth named genre). Process section extended with a new step specifying pyramid graph-traversal and expansion-fidelity verification per §2–§3. Output template extended with pyramid-coverage-map and expansion-fidelity-findings subsections for Essay-Outline genre.
- **Fixture test** (`hooks/tests/test_argument_auditor_essay_outline_genre.sh` or similar) — skill-text-anchoring fixture verifying the four genres are encoded in `agents/argument-auditor.md` and that the Essay-Outline Process step references ADR-092 §3 and ADR-093 §2.
- **`docs/system-design.md` and/or `docs/system-design.agents.md`** — responsibility matrix updated to reflect the argument-auditor's expanded scope; the entry citing the auditor's responsibilities now references ADR-092 and ADR-093.
- **`docs/domain-model.md`** — Amendment 24 (a small follow-on amendment, file in the next cycle's MODEL or as a stewardship update during BUILD): the Argument-Graph (as artifact section) concept entry's "auditor consumption is currently judgment-anchored" note can be updated to "auditor consumption anchored in `agents/argument-auditor.md` per ADR-093" once the skill-text edit ships.

No ADR supersession — this is a new ADR adding a mechanism scope extension. Step 2.5 supersession workflow does not fire. Step 3.7 backward propagation does not fire (no invariant change).

The downstream-artifact sweep is **deferred to the BUILD phase** that lands the skill-text edit, in the same BUILD pass as ADR-092's deferred sweep. Both ADRs' sweeps are coordinated — the form change and the auditor's verification of the form ship together.

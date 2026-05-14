# Argument Audit Report

**Audited document:** `/Users/nathangreen/Development/rdd/scratch/spike-018-s1/essay-016-outline.md`
**Source material:**
- `/Users/nathangreen/Development/rdd/docs/essays/research-logs/lit-review-017-nomenclature-leakage.md` (Q1)
- `/Users/nathangreen/Development/rdd/docs/essays/research-logs/lit-review-017-document-legibility.md` (Q2)
- `/Users/nathangreen/Development/rdd/docs/essays/research-logs/lit-review-017-conversational-turn-structure.md` (Q4)
- `/Users/nathangreen/Development/rdd/docs/essays/research-logs/lit-review-017-diagram-driven-orientation.md` (Q5)
- `/Users/nathangreen/Development/rdd/docs/essays/research-logs/lit-review-017-audience-corpus-organization.md` (Q6 + Q3)
- `/Users/nathangreen/Development/rdd/.rdd/audits/argument-audit-017.md` (prior prose audit, for comparative reference)
**Date:** 2026-05-11

**Note:** This audit was produced via the `rdd:argument-auditor` specialist subagent dispatched as part of Cycle 018 Spike S1. The subagent returned its output as an inline response rather than writing the file directly; the orchestrator wrote the content to this path after the fact. The audit content is verbatim from the subagent's response.

---

## Section 1: Argument Audit

### Summary

- **Argument chains mapped:** 9
- **Issues found:** 10 (1 P1, 4 P2, 5 P3)

---

### P1 — Must Fix

**Issue 1.1 — Ernst & Robillard positioned as the "strongest single empirical anchor" for the expertise reversal effect, while supporting a distinct and more narrowly scoped claim**

- **Location:** §3, sub-section "Most direct empirical finding: Ernst & Robillard (2023)"
- **Claim:** The outline places Ernst & Robillard (2023) immediately after the expertise reversal effect (Kalyuga et al. 2003) as a fourth framework supporting context-mismatch, then tags it as the "strongest single empirical anchor." The same section notes a scope qualification — that the finding covered "applied and creative tasks" and that its applicability to orientation-level comprehension "is not directly tested; remains open" — but only after already invoking the study at maximum evidential force.
- **Evidence gap:** The Q2 lit-review is unambiguous: "One nuance emerges from detailed examination: the study found that tasks requiring 'applying and creating activities were statistically significantly associated with the use of the system's source code,' while format was not predictive for these activities. For tasks requiring orientation-level comprehension (understanding architectural intent, not applying it), the study does not separately report findings." The Q5 lit-review agrees. These are convergent on the general direction but the study was not designed to test the exact failing scenario (zero-prior-exposure orientation reading). The outline presents the study as establishing the finding at full strength and then retreats with a scope note, rather than leading with the conditioned claim.
- **Recommendation:** Invert the presentational order within this sub-section: lead with the scope qualification, then state what it establishes conditionally.

---

### P2 — Should Fix

**Issue 2.1 — "Primary mechanism" language in §3 opening and abstract overstates what the source material establishes**

- **Location:** §3 opening bullets; abstract
- **Evidence gap:** "Most empirically supported" is less precise because the empirical anchor (Ernst & Robillard) covers a different task type than the failing scenario. The outline conjoins both qualifiers ("most empirically supported AND structurally fundamental") without distinguishing them, creating an additive confidence level that neither qualifier separately warrants.
- **Recommendation:** Split the claim into its two distinct components.

**Issue 2.2 — The four-mechanism Q4 ledger presented as the literature's account, without flagging that it is the lit-review's synthesis**

- **Location:** §4.2, bullets "FOUR MECHANISMS" and "META-MOVE"
- **Evidence gap:** The Q4 lit-review states: "The literature does not provide a study that cleanly isolates them." The outline acknowledges this in one bullet but structurally treats the account as equivalent to the named Sweller or Pirolli frameworks.
- **Recommendation:** Move the META-MOVE bullet before the FOUR MECHANISMS enumeration rather than after.

**Issue 2.3 — Continuous documentation introduced as "most empirically supported lens" without distinguishing the practitioner framework from the peer-reviewed evidence it draws on**

- **Location:** §4.3
- **Evidence gap:** The empirical staleness studies (Tan et al., Aghajani et al., Hata et al., Xiao et al.) are the peer-reviewed anchors; Rosenbaum's continuous documentation framework is the practitioner label. These have different epistemic standing.
- **Recommendation:** Restructure: lead with the peer-reviewed evidence, then introduce continuous documentation as a practitioner framework whose principles are consistent with that evidence.

**Issue 2.4 — The "structured research loop produced this recalibration" claim in §6 attributes the outcome to the methodology exclusively**

- **Location:** §6 "Largest second-order (methodological) finding," COUNTERFACTUAL and JOINT CONTRIBUTORS FRAMING bullets
- **Evidence gap:** The COUNTERFACTUAL cannot be verified from the cycle's trace — the research log does not record an alternative timeline. Presenting an unverifiable counterfactual as a CLAIM (the label used) rather than a hypothesis is a scope-of-claim issue.
- **Recommendation:** Relabel the COUNTERFACTUAL as HYPOTHESIS or INFERENCE.

---

### P3 — Consider

**Issue 3.1 — Companion-file conclusion stated with uniform confidence across scenarios that the source material distinguishes**

- **Location:** §4.1
- **Evidence gap:** The Q6 lit-review notes the practitioner consensus bifurcates: for documentation-site corpora, unified-source-with-rendering is preferred; for context-engineering artifacts, the parallel-sibling pattern is established. RDD's corpus fits neither category precisely.
- **Recommendation:** Move the per-artifact judgment note to the top of the IMPLICATION FOR RDD STRUCTURE block.

**Issue 3.2 — Heijstek (2011) finding in §4.4 cited without the UML-specificity caveat at the point of citation**

- **Location:** §4.4
- **Recommendation:** Add a parenthetical "(formal UML; informal diagram generalizability not established)" at the citation point.

**Issue 3.3 — Diátaxis cited as framework 3 supporting context-mismatch, but its support is analogical rather than direct**

- **Location:** §3, "Framework 3: Diátaxis (Procida)"
- **Evidence gap:** Diátaxis does not distinguish initial-handoff from ongoing-reference readers; it distinguishes documentation types. The mapping is a structural analog, not a direct account.
- **Recommendation:** Soften to "Diátaxis provides a structural analog to the same divergence."

**Issue 3.4 — §4.5 Sub-pattern E's cognitive-economy test described as deferrable to DECIDE, but the test itself is undefined**

- **Location:** §4.5
- **Recommendation:** Note that DECIDE will need to define the test before applying it, not merely apply a pre-defined test.

**Issue 3.5 — Sub-pattern F (agent-mediated orientation) rejected on operationality grounds, but the operational criterion problem is presented as unsolvable rather than merely unsolved**

- **Location:** §4.5
- **Recommendation:** Soften to "not yet solved" rather than implying unsolvability.

---

## Section 2: Framing Audit

The framing audit makes the negative space of content selection visible.

### Question 1: What alternative framings did the evidence support?

**Alternative framing A: Comprehension failure as a tooling gap, not a document-design problem.** The Q2 lit-review's §7.3 explicitly names this implication: "Ernst and Robillard (2023) suggest that format and organization — the 'readerly usability' dimension — may not be the primary lever. Prior familiarity dominates." Under this framing, the outline's four supported responses are second-order interventions. The root remedy is context-building tools that pre-load prior familiarity before any Tier-2 document is encountered.

**Alternative framing B: Threading is wrong in principle, not merely poorly implemented.** The Q2 lit-review contains a finding that directly supports a contrary framing: the agent-README empirical study (Nguyen et al. 2025, arXiv 2511.12884) found that agent-context files exhibit median readability scores of 16.6 — equivalent to legal documents. Under this framing, the fundamental tension between agent-density and human readability is structural and not resolvable by better threading.

**Alternative framing C: The cycle's five threads are independent problems with no unifying mechanism.** The outline's §3 close acknowledges this but the overall architecture enacts a narrative coherence that somewhat overwrites the finding.

### Question 2: What truths were available but not featured?

**Available truth A: Nguyen et al. (2025) empirical study of agent context files is absent from the outline.** This is the most directly empirical evidence in the source material that agent-optimized artifacts are quantitatively hostile to human reading.

**Available truth B: The Q2 lit-review's 30s/5min/30min scaffold is explicitly flagged as heuristic, not empirically grounded.**

**Available truth C: The Q3 (folder hygiene) thread is the only one of the five that receives no dedicated §4 treatment in the outline.**

### Question 3: What would change if the dominant framing were inverted?

The outline's dominant framing: comprehension failure is primarily a context-mismatch problem; correct response is structural moves at the margin.

Inverted framing: comprehension failure is primarily a prior-familiarity problem; correct response is context-building tools that pre-load schemas before document encounter.

Under inversion: §4.1 through §4.4 become mitigations; §4.5 Sub-pattern E becomes the primary intervention; verbosity thread becomes less consequential; diagram qualification becomes less consequential. The inversion does not falsify conclusions but reveals the outline may be systematically under-investing in the prior-familiarity intervention.

### Framing Issues

**Framing P2-A — Nguyen et al. (2025) absent; companion-file rationale weakened by its omission.**

**Framing P2-B — Prior-familiarity intervention systematically underweighted relative to its evidential rank.**

**Framing P3-A — Decker (2026) appears in §1 CONTEXTUAL ANCHOR but is not in the references section.** (Note: actually resolved in the outline; preserved here for completeness.)

**Framing P3-B — The outline self-applies its orientation principles better than the prose original, but a first-encounter reader still needs the abstract's vocabulary pre-established.**

---

## Section 3: Outline-Form Audit Experience

This section documents the qualitative experience of auditing outline form rather than prose, capturing observations directly relevant to Spike S1's methodology evaluation.

### Places where outline form helped identify issues that prose might have buried

**3.1 — Structural ordering of the scope qualification relative to the claim was more visible.** The P1 issue (Ernst & Robillard presented before its scope qualification) was easier to see in outline form than it would have been in prose. In the outline, the SCOPE QUALIFICATION bullet appears as a visually parallel sub-bullet to the CLAIM bullets, and the order of CLAIM → SCOPE QUALIFICATION is immediately legible as a structure.

**3.2 — Inferential chains were easier to map.** Each CLAIM bullet names a proposition; each SUPPORT or EVIDENCE bullet names its warrant; each CALIBRATION names a scope limit. The audit could proceed by checking each CLAIM bullet against the source material without reconstructing the inferential chain from prose connectives.

**3.3 — Internal consistency issues between sections were more visible.** The tension between §3's "context-mismatch as primary mechanism" framing and §4.5's Sub-pattern E (which implicitly acknowledges prior-familiarity as the dominant variable) was visible because the two sections' CLAIM bullets can be compared directly.

### Places where outline form prevented issue identification that prose would have surfaced

**3.4 — Rhetorical confidence cannot be calibrated from bullets alone.** In prose, an auditor can assess whether a claim is stated with appropriate hedging ("suggests," "indicates," "supports") versus overconfident assertion. In outline form, all CLAIM bullets carry the same visual weight regardless of whether the underlying claim is strong or weak.

**3.5 — Argumentative transitions and the "direction of travel" between sections is invisible.** The prose essay has an argumentative arc visible to an auditor as a rhetorical and logical movement. The outline reproduces the same logical content but the connective tissue is absent.

**3.6 — Implicit assumptions embedded in prose framing are harder to surface from bullet labels.** Reflexive findings that require reading the document as a document partially dissolve in outline form because the outline auto-addresses some failures structurally.

### Summary assessment of outline-form audit fidelity

The outline form transferred nine of the twelve findings from the prior prose audit with equivalent or higher fidelity. The three findings that did not transfer at equivalent strength were:

1. The rhetorical-confidence calibration issues (P2.1 in the prose; partially present here but harder to surface from bullet labels alone).
2. The reflexive self-application finding (P3-A in prose; partially dissolved because outline form improves the abstract's scent structure).
3. The bibliographic-phantom finding (Decker in prose; resolved because the outline correctly cites Decker in §1).

The outline form introduced one new visibility advantage: it made the structural ordering problem (Issue 1.1 in this audit) clearer by exposing the CLAIM → SCOPE QUALIFICATION ordering as an explicit structural choice.

**Net assessment:** outline form preserves approximately 80–85% of argument-audit fidelity relative to prose. The primary loss is in calibrating differential claim strength — the form's visual flatness suppresses the hedging-language signals that prose uses to communicate confidence gradients. The primary gain is in structural visibility of ordering decisions and internal consistency comparisons across sections.

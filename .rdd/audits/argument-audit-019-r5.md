# Argument Audit Report — Cycle 019, R5

**Audited document:** `docs/essays/essay-outline-018-does-rdd-over-engineer.md` (amended at MODEL gate 2026-05-21; three in-place amendment sites: W7.1 EVIDENCE zani amendment block, W7.3 META-OBSERVATION amendment block, §9 MODEL-gate provenance paragraph)
**Source material:**
- R4 audit: `.rdd/audits/argument-audit-019-r4.md` (prior verdict: 0 P1, 1 partial P2, 6 P3 — clean to advance)
- Susceptibility snapshot (MODEL): `.rdd/audits/susceptibility-snapshot-019-model.md`
- Research log: `docs/essays/research-logs/019-does-rdd-over-engineer.md` (§Loop 6, §Loop 6.2 zani / llm-orc / plexus)
- Primary source — zani: `/Users/nathangreen/Development/zani/docs/decisions/adr-018-chroma-targets.md`
- Primary source — llm-orc: `/Users/nathangreen/Development/eddi-lab/llm-orc/docs/agentic-serving/decisions/adr-016-upward-l0-l1-read-only-signal-channel.md`
- Primary source — plexus: `/Users/nathangreen/Development/plexus/docs/decisions/038-release-binary-feature-profile.md`; `/Users/nathangreen/Development/plexus/docs/decisions/024-core-and-external-enrichment-architecture.md`

**Genre:** Essay-Outline (ADR-093 §1)
**Date:** 2026-05-22
**Auditor:** argument-audit skill (claude-sonnet-4-6), R5 dispatch — narrow re-audit of MODEL-gate amendments

**R5 scope:** Narrow re-audit per susceptibility-snapshot Grounding Action 1. Focus on: W7.1 amendment (zani mechanism-vs-outcome distinction); W7.3 amendment (Distributed Remedy Architecture; PLAY-as-Filter load-bearing); W7.4 (nuance preservation under Nuance Calibration refinement); §9 provenance paragraph accuracy. C1–C6, W1–W6, W7.2 inherit R4 verdict without re-examination. The framing audit applies the framing-audit lens directly to the practitioner-originated framings per the dispatch brief.

**Note on ADR-016 status discrepancy identified during source reading:** The Essay-Outline cites llm-orc ADR-016 as "conditional acceptance — first-deployment evidence pending." Reading the primary source (`adr-016-upward-l0-l1-read-only-signal-channel.md`) confirms the ADR's status header reads "Accepted" — the WP-H4 close disposition (2026-05-12) moved the ADR from "Proposed (conditional acceptance)" to full acceptance. The Essay-Outline's citation of the conditional-acceptance phrasing is technically stale (the ADR has since been fully accepted). The extent to which this affects argument structure is assessed in the findings below.

---

## Section 1: Argument Audit

### Summary

- **Genre:** Essay-Outline
- **Argument chains mapped:** Narrow — W7.1, W7.3, W7.4, §9 provenance paragraph; C7 synthesis bullet
- **Issues found:** 6 (1 P1, 3 P2, 2 P3)
- **Pyramid coverage map:** Partial (W7-row nodes only; full map inherited from R4)
- **Expansion-fidelity findings:** P1: 1, P2: 2, P3: 0 (scope-limited to amended warrants)

### Pyramid Coverage Map (W7-row nodes — post-amendment)

The full pyramid coverage map is inherited from R4. The following covers only the W7-row nodes affected by the MODEL-gate amendments.

| Abstract Conclusion | Argument-Graph Nodes (W7-row) | Body Section | References Cited |
|---|---|---|---|
| C7. Failure mode traces to research-surveyed possibilities without empirical filter; C7 refines C1 | C7, W7.1, W7.2, W7.3, W7.4, E7.1.1–E7.1.5, E7.2.1–E7.2.3, E7.3.1, E7.4.1 | §8 (C7) | Loop 6.2 zani, llm-orc, plexus investigations; Practitioner gate response 2026-05-16 |

**W7.1 amendment impact on coverage map:** E7.1.1 (zani palette evidence) now carries an inline amendment block. The amendment's content (mechanism-vs-outcome distinction) is developed within the existing E7.1.1 slot rather than in a dedicated new evidence node. The pyramid structure is formally unchanged; the amendment reshapes the interpretive framing of E7.1.1 within that structure.

**W7.3 amendment impact on coverage map:** The META-OBSERVATION under W7.3 / E7.3.1 now carries an inline amendment block introducing the Distributed Remedy Architecture. The amendment introduces new conceptual content (PLAY-as-Filter as load-bearing; BUILD constraint; LOOP-BACK) that goes beyond the original warrant's scope ("the remedy site is DECIDE, not BUILD"). This new content is not anchored to any new W-row node or E-node identifier — it is embedded inside the existing W7.3 META-OBSERVATION block. The pyramid formally has no new nodes; the content materially extends beyond W7.3's original claim scope. This is assessed as a structural concern below.

**META-anchored sections:** §1, §9, §10 — unchanged from R4.

---

### Expansion-Fidelity Findings (W7-row amendments)

**P1 findings:**

- **Boundary 1 / Reverse Boundary 1 violation (W7.3 amendment):** The W7.3 amendment introduces a Distributed Remedy Architecture (DECIDE + BUILD + PLAY + LOOP-BACK, with PLAY-as-Filter as the load-bearing component) and a fifth ADR candidate — new conclusions not reflected in Abstract C7. Abstract C7 reads: "Single-cycle anchor evidence suggests auto-mode BUILD does not cause kitchen-sink in the observed case; the mechanism appears to operate upstream at DECIDE." The W7.3 amendment does not supersede this Abstract text; Abstract C7 still points to DECIDE as the mechanism site. But the amended W7.3 claims PLAY is the "load-bearing validation site," with DECIDE serving only a "felt-trigger empirical-grounding criterion at ADR-drafting" role. The Abstract presents a DECIDE-primary mechanism; the amended W7.3 presents a PLAY-primary architecture. These are not equivalent. A reader of Abstract C7 receives the DECIDE-primary framing; a reader of amended §8 W7.3 receives the PLAY-primary framing. The pyramid is out of phase at the Abstract-to-Argument-Graph boundary.
  - **Routing per ADR-092 §6: discipline-suspect** — the amended W7.3 introduces a new conclusion (PLAY-as-Filter primary) that the abstract does not summarize. The remediation is to either (a) update Abstract C7 to reflect the Distributed Remedy Architecture claim, or (b) revert W7.3 to the DECIDE-primary framing its evidence can support, and introduce the Distributed Remedy Architecture only when Abstract C7 also reflects it. Option (a) would require the Abstract to carry a claim whose evidence (one PLAY instance in W7.2) is a single-cycle anchor — which may itself be an evidential insufficiency for an Abstract-level claim.

**P2 findings:**

- **P2-R5-1: W7.1 amendment characterizes the Zani palette as "mechanism fired; outcome valued" but does not establish the discriminating criterion.** The amendment introduces a kitchen-sink-mechanism-vs-outcome distinction. The mechanism description (research → essay → ADR-as-invariant → BUILD; no PLAY filter; no stakeholder pull recorded) is accurate to the source evidence — ADR-018 confirms the chain and confirms "may register as more vivid" as the only recorded rationale, with no evidence of writer demand. The outcome characterization ("the color-science research was answering a real question; the resulting subsystem made the build better, more unique, and solving the actual problems we set out to solve") rests entirely on the practitioner's post-hoc reread statement. The amendment does not supply an external criterion for distinguishing "mechanism fired; outcome valued" from "mechanism fired; outcome rationalized post-hoc." The distinction performs the analytical work of narrowing the counter-example's force against C7 — the Zani palette was the paradigmatic C7 counter-example — but the discriminating criterion (what would make an outcome NOT valued, from the practitioner's perspective?) is absent. Without the criterion, the distinction is compatible with both readings: (i) the outcome was genuinely valued (the color-science research solved a real problem) and (ii) the outcome was kitchen-sink that the practitioner now characterizes as valued because they did the work. The amendment needs either the discriminating criterion or an explicit acknowledgment that the distinction is practitioner-judgment-anchored and carries the same Tier-2 structural limit as ADR-019.4.
  - **Recommendation:** Add to the W7.1 amendment block: "The mechanism-vs-outcome distinction is practitioner-judgment-anchored: 'outcome valued' is the practitioner's post-hoc assessment of the Zani palette work. The Susceptibility Snapshot (2026-05-21) noted the absence of a discriminating criterion for when outcome-judgment is reliable vs. sycophancy-compatible reframing. The Zani palette remains a valid instance of the C7 mechanism firing; its classification as 'outcome valued rather than kitchen-sink' carries the same epistemic status as other practitioner-judgment assessments in the methodology — appropriate as vocabulary but not as empirically-established classification."
  - **Severity: P2.** The mechanism description is accurate; the outcome characterization performs load-bearing counter-example-narrowing work whose warrant is practitioner-judgment alone.

- **P2-R5-2: W7.3 amendment's PLAY-as-Filter claim rests on a single observed case (W7.2: llm-orc Cycle 5 PLAY pulling features back), and the amendment elevates this to "load-bearing validation site" for a methodology architecture without acknowledging the evidence gap.** W7.2's E7.2.2 reads: "Cycle 5 PLAY pulled features BACK: reframed observability as 'infrastructure-complete / routing-incomplete,' scoping Cycle 6 to routing telemetry rather than rebuilding substrate. PLAY does refutation work." This is W7.2's evidence — already in the chain before the amendment, and its R4 warrant scope ("empirically-grounded elaboration earns its weight; the asymmetry is observable") was not itself in dispute. The W7.3 amendment uses W7.2's evidence to shift W7.3's META-OBSERVATION from "remedy site is DECIDE, not BUILD" to "PLAY is the load-bearing validation site." The problem is not that W7.2's evidence is weak — it is concrete and the observation is accurate — but that one observed PLAY instance (llm-orc Cycle 5) warrants naming the refutation behavior as real without warranting naming PLAY as the "load-bearing" component of a methodology architecture. "Load-bearing" implies PLAY is the primary, necessary mechanism — a systemic claim about the methodology's architecture that one case does not establish. Cross-project comparison sharpens this: zani's palette over-engineering occurred WITHOUT PLAY (no PLAY filter, no stakeholder pull recorded in the evidence) and the palette mechanism went unresisted. Plexus ADR-038 and ADR-024 are DECIDE-layer refusals, not PLAY-driven. The three projects collectively show DECIDE-layer resistance operating independently of PLAY. The one case where PLAY did filtering work (llm-orc Cycle 5) is cited as the load-bearing anchor; the two cases where DECIDE-layer discipline operated without PLAY are not cited as evidence about PLAY's role. This is asymmetric evidence weighting.
  - **Recommendation:** The W7.3 amendment should qualify "PLAY-as-Filter as load-bearing" to acknowledge: (a) W7.2's single-case anchor; (b) that the cross-project evidence (plexus ADR-038, ADR-024) shows DECIDE-layer discipline operating without PLAY involvement; and (c) that "load-bearing" overstates a single observed case. The amendment could retain the Distributed Remedy Architecture framing as the practitioner's commitment while naming the evidentiary gap explicitly — parallel to how W7.3's original text named its own single-cycle anchor limitation.
  - **Severity: P2.** The Distributed Remedy Architecture is a coherent practitioner commitment but "PLAY-as-Filter as load-bearing" claims more than the evidence establishes. This is the same evidence-scope issue the R3 audit found in W7.3 before the "(working hypothesis, single-cycle anchor)" qualifier was added. The amendment introduces a new claim at the same evidence level without the same qualifier.

- **P2-R5-3: ADR-016 citation status is stale.** The Essay-Outline cites llm-orc ADR-016 as carrying "conditional acceptance — first-deployment evidence pending" in E7.1.2 and Section 10 ADR-019.4 entry. Reading the primary source confirms ADR-016 was transitioned to full acceptance at WP-H4 close (2026-05-12 per the ADR's status header). The Essay-Outline's investigation was conducted on 2026-05-16 — four days after the acceptance transition. The "conditional acceptance" characterization was accurate at some earlier point but may not have been accurate at Loop 6.2 investigation time; the current Essay-Outline state is definitively stale. This affects the argument at two sites: (1) E7.1.2 cites ADR-016 as "research-surveyed without empirical filter" because it was marked conditional; the evidence characterization carries interpretive weight for C7's mechanism claim. (2) Section 10's ADR-019.4 cross-project evidence anchor names "llm-orc ADR-016 (conditional acceptance annotation)" as an exemplar of the pattern. If ADR-016 is fully accepted, it weakens the cross-project exemplar case for the pattern (the conditional-acceptance vocabulary, while originally used, was ultimately replaced by full acceptance based on structural validation — not PLAY-driven empirical filter or stakeholder pull, but BUILD-phase structural operationalization evidence). The ADR-016 case now demonstrates that evidence-based acceptance can happen through BUILD-phase structural validation, not only through the PLAY/stakeholder-pull/spike pathway C7's mechanism analysis foregrounds.
  - **Recommendation:** Update E7.1.2 to reflect ADR-016's accepted status and the nature of the evidence that closed the conditional-acceptance gate (structural operationalization via DECIDE-phase spikes + BUILD-phase WP-H4 close, not PLAY/stakeholder demand). Update the §9 provenance note and Section 10 ADR-019.4 cross-project evidence anchor to note the acceptance transition. The core evidence characterization (ADR-016 was marked conditional acceptance at drafting time, representing a design that ran ahead of operational evidence) remains accurate as a description of the design posture at DECIDE; the acceptance transition is a data point about when and how the evidence arrived. The narrative should distinguish "the ADR was drafted under conditional acceptance because the design ran ahead of evidence" from "the ADR remained conditional at the time of the investigation" — only the former is established.
  - **Severity: P2.** The stale citation affects the C7 mechanism's exemplar case and the Section 10 ADR-019.4 evidence anchor. The citation-auditor is the primary verifier for Boundary 3 precision; this finding is escalated to P2 because the argument auditor encountered it during source-document verification and the citation-auditor has not been dispatched on the amended Essay-Outline.

**P3 findings:**

- **P3-R5-1: W7.4 framing is compatible with the Nuance Calibration refinement without amendment.** The dispatch brief asked whether W7.4's framing still holds under the MODEL-gate Nuance Calibration refinement (nuance as sliding scale, not constraint-only). W7.4 reads: "The user's 'what is GOOD about RDD is its propensity to work with nuance' is structurally preserved by the C7 finding... The C7 mechanism preserves nuance-surfacing at RESEARCH; the remedy operates at DECIDE, filtering research-surveyed possibilities through empirical grounding before ADR commitment." The Nuance Calibration refinement (nuance as sliding scale, graduated by context and stakes) does not contradict W7.4's claim that nuance-surfacing at RESEARCH is preserved. The sliding-scale framing adds calibration granularity but does not retract the preservation claim. W7.4's synthesis bullet ("the C7 remedy is NOT a compression of research; it is an addition to DECIDE") is consistent with nuance as sliding scale — a sliding scale implies research should surface nuance proportionally, which is not the same as compressing research. **No amendment to W7.4 is required by the Nuance Calibration refinement.** One minor residual note: W7.4's SYNTHESIS-BULLET still references only DECIDE as the filter site ("the filter operates downstream"). After the W7.3 amendment, this understates the distributed architecture. This is editorial-level (W7.4 is about nuance preservation, not remedy architecture) but a reader comparing W7.4's synthesis with W7.3's amended META-OBSERVATION may notice the inconsistency of remedy-site framing between the two warrants.
  - **Recommendation:** W7.4 needs no substantive amendment. An optional parenthetical could note: "(the filter operates at DECIDE in the Distributed Remedy Architecture; PLAY serves as the downstream validation site per W7.3's amended framing)" — but this is editorial, not load-bearing.
  - **Severity: P3.**

- **P3-R5-2: §9 provenance paragraph's characterization of the W7.3 amendment is accurate but incomplete on the evidentiary gap.** The §9 MODEL-gate provenance paragraph correctly records: W7.3's "remedy site is DECIDE, not BUILD" META-OBSERVATION was reframed to a Distributed Remedy Architecture (DECIDE + BUILD + PLAY + LOOP-BACK), with PLAY-as-filter as the load-bearing validation site per practitioner commitment to option (A). The paragraph does not record that this commitment shifted the remedy site from what the W7.2 evidence (already in the chain) supported before the MODEL gate. The susceptibility snapshot explicitly noted: "the original W7.2 evidence (llm-orc Cycle 5 PLAY pulling features back) was already in the argument chain and was not sufficient to shift the remedy site before the MODEL gate." The §9 paragraph records the amendment's provenance (practitioner commitment) without recording the pre-MODEL-gate audit status of the W7.2 evidence (i.e., that the same evidence was present at R4 and was not characterized as sufficient to shift the remedy site). This omission leaves a gap in the audit trail: a future reader of §9 sees the provenance of the amendment but not the fact that the W7.2 evidence was already audited in a context where it did not shift the remedy site.
  - **Recommendation:** Add one sentence to the §9 provenance paragraph: "The W7.2 evidence (llm-orc Cycle 5 PLAY pulling features back) was present in the R4-clean argument chain without shifting the remedy-site framing; the MODEL-gate practitioner commitment to option (A) — not new evidence — is what shifted the W7.3 characterization from DECIDE-primary to PLAY-primary."
  - **Severity: P3.** The audit trail has a gap but §9's existing text is not inaccurate. The addition would complete the provenance record.

---

### P1 — Must Fix

**P1-R5-1: Abstract C7 is out of phase with the amended W7.3 (Boundary 1 / Reverse Boundary 1 violation)**

- **Location:** Abstract §CONCLUSIONS C7 (line 16) vs. §8 W7.3 META-OBSERVATION amendment block (line 192–193)
- **Claim:** Abstract C7 states: "the mechanism appears to operate upstream at DECIDE." Amended W7.3 states: "PLAY is the load-bearing validation site" with DECIDE serving a "felt-trigger empirical-grounding criterion at ADR-drafting" role. These are not equivalent framings of the same mechanism.
- **Evidence gap:** Abstract C7 conveys a DECIDE-primary mechanism. Amended W7.3 conveys a PLAY-primary architecture. A reader of the Abstract receives one account of the remedy architecture; a reader of §8 receives a materially different account. The pyramid's Boundary 1 / Reverse Boundary 1 compliance requires that every claim in the Argument-Graph be summarized in the Abstract, and every Abstract conclusion be supported by the Argument-Graph. The W7.3 amendment's PLAY-primary claim is not summarized in the Abstract, and Abstract C7's DECIDE-primary claim is not fully accurate to the amended Argument-Graph.
- **Recommendation:** Two repair options:
  - *Option A (promote the amendment):* Update Abstract C7 to reflect the Distributed Remedy Architecture — name PLAY-as-Filter as the practitioner-committed primary validation site, with DECIDE as the pre-filter, while retaining the "(working hypothesis, single-cycle anchor)" epistemic qualifier that W7.3 already carries from R3. This makes the pyramid consistent but requires the Abstract to carry a PLAY-primary claim whose evidence is a single-cycle anchor.
  - *Option B (revert the amendment's claim scope):* Retain W7.3's structure as a working-hypothesis about the remedy architecture's distribution, but lower the claim from "PLAY is the load-bearing component" to "PLAY provides post-BUILD empirical filter in at least one observed case; the remedy architecture may be distributed rather than DECIDE-only." This is consistent with the W7.2 evidence without overstating it, and is consistent with Abstract C7 as currently written.
  - Option B better respects the evidence base for a claim that the Abstract must carry. Option A is valid if the practitioner commits to naming the Distributed Remedy Architecture as an Abstract-level conclusion — but that commitment should be explicit, not implicit in an in-place amendment to a warrant block.
- **Routing per ADR-092 §6: discipline-suspect** — the production work was not completed at sufficient depth; the amendment extended the warrant's claim scope without extending the Abstract to match. Stewardship response is to re-run production with discipline tightening (no scope change required — the repair is either updating Abstract C7 or narrowing the W7.3 claim).

---

### P2 — Should Fix

**P2-R5-1: W7.1 mechanism-vs-outcome distinction lacks a discriminating criterion**

- **Location:** §8 W7.1 EVIDENCE, [AMENDMENT 2026-05-21 per MODEL-gate Zani-reread] block (line 181)
- **Claim:** "Zani palette: mechanism fired; outcome valued." The amendment characterizes the Zani palette outcome as valued elaboration based on the practitioner's reread statement.
- **Evidence gap:** The zani ADR-018 evidence confirms the mechanism description accurately (research → essay → ADR-as-invariant → BUILD; no PLAY filter; no stakeholder pull recorded). The outcome characterization rests entirely on the practitioner's post-hoc statement ("I was thrilled to create..."). No external criterion distinguishes "outcome valued" from "outcome post-hoc rationalized as valued." The amendment performs counter-example-narrowing work (narrowing the force of the C7 counter-example) whose warrant is practitioner judgment alone.
- **Recommendation:** Either (a) add the discriminating criterion for what would make an outcome count as kitchen-sink rather than valued, or (b) explicitly acknowledge that "outcome valued" is practitioner-judgment-anchored and carries the same Tier-2 structural limit as other practitioner-judgment vocabulary in the cycle. Without this, the distinction functions as a conceptual escape hatch for any elaboration the practitioner later values.
- See Expansion-Fidelity findings P2-R5-1 above for the full analysis.

**P2-R5-2: W7.3 amendment's "PLAY-as-Filter as load-bearing" overstates a single-cycle anchor**

- **Location:** §8 W7.3 META-OBSERVATION, [AMENDMENT 2026-05-21] block (line 193)
- **Claim:** "PLAY is the validation site where filtering actually happens (the load-bearing component)"
- **Evidence gap:** W7.2's evidence is a single observed case (llm-orc Cycle 5). The cross-project evidence shows DECIDE-layer discipline (plexus ADR-038, ADR-024) operating without PLAY involvement. The zani palette — the paradigmatic case — occurred without PLAY. Naming PLAY as "load-bearing" is an architectural claim about the methodology that one case cannot establish, especially when the two other cross-project anchors show DECIDE-layer resistance doing the filtering work without PLAY.
- **Recommendation:** Add a qualifier to "PLAY is the load-bearing component" parallel to the "(working hypothesis, single-cycle anchor)" qualifier the original W7.3 carried for its DECIDE-primary claim. The amendment was added in the same pattern as the original claim — single-cycle anchor evidence — and warrants the same epistemic marking.
- See Expansion-Fidelity findings P2-R5-2 above for the full analysis.

**P2-R5-3: ADR-016 citation is stale — "conditional acceptance" status has been superseded**

- **Location:** §8 E7.1.2 (line 182); Section 10 ADR-019.4 cross-project evidence anchor (line 220)
- **Claim:** llm-orc ADR-016 is described as "conditional acceptance — first-deployment evidence pending" and cited as an exemplar of the conditional-acceptance annotation pattern.
- **Evidence gap:** ADR-016 was transitioned to full acceptance at WP-H4 close (2026-05-12 per ADR-016 status header). The Loop 6.2 investigation was conducted 2026-05-16 — after the transition. The citation is stale. The acceptance transition happened through structural operationalization (DECIDE-phase spikes + BUILD-phase WP-H4 close), not through PLAY-driven empirical filter or stakeholder demand — which affects the classification of ADR-016 as a "research-surveyed without empirical filter" case. Structural operationalization via spikes IS an empirical filter; the ADR-016 case may actually be closer to the "empirically-grounded elaboration earns its weight" category than the "kitchen-sink without filter" category.
- **Recommendation:** Update E7.1.2 to: "llm-orc calibration channel (calibration_signal_channel.py 1,043 LOC; ADR-016 was drafted under conditional acceptance — first-deployment evidence pending — but transitioned to full acceptance at WP-H4 close 2026-05-12 following structural operationalization via DECIDE-phase spikes and BUILD-phase validation). The conditional-acceptance annotation at drafting time reflects the design running ahead of operational evidence; the BUILD-phase acceptance resolution via spike validation differs from the PLAY-driven / stakeholder-pull filter the C7 mechanism foregrounds." This preserves ADR-016 as an illustration of the design-ran-ahead-of-evidence pattern while accurately reflecting its resolution.
- **Citation-audit note:** the citation-auditor is the primary verifier for Boundary 3 precision. This P2 finding is the argument-auditor's scope because it affects the characterization of C7's evidence base, not only citation accuracy.

---

### P3 — Consider

**P3-R5-1: W7.4 remedy-site framing is consistent but understates the Distributed Remedy Architecture**

- **Location:** §8 W7.4 SYNTHESIS-BULLET (line 196)
- **Observation:** "the filter operates downstream" at DECIDE. After W7.3's amendment, the filter operates at DECIDE, BUILD, PLAY, and LOOP-BACK (per the Distributed Remedy Architecture). W7.4's synthesis-bullet is not wrong — it is about nuance preservation, not remedy architecture — but the inconsistency in remedy-site language between W7.4 and amended W7.3 is a minor coherence issue.
- **Recommendation:** Optional parenthetical clarification; not load-bearing given W7.4's nuance-preservation focus.

**P3-R5-2: §9 provenance paragraph omits that W7.2 evidence was audited pre-amendment without shifting the remedy site**

- **Location:** §9 [MODEL-gate amendment provenance paragraph] (line 209)
- **Observation:** The §9 paragraph accurately records the amendment's provenance but omits the context that W7.2's evidence was already present in the R4-clean chain and was characterized then as supporting W7.2's warrant (empirically-grounded elaboration earns its weight), not as sufficient to shift W7.3's remedy-site characterization. The audit trail has a gap.
- **Recommendation:** Add one sentence naming that the W7.2 evidence was present at R4 without shifting the remedy-site framing, and that the practitioner's MODEL-gate commitment is what shifted the framing.

---

## Section 2: Framing Audit

### Question 1: What alternative framings did the evidence support for the W7.1 amendment?

The W7.1 amendment introduced a kitchen-sink-mechanism-vs-outcome distinction to reframe the Zani palette from "C7 counter-example" to "mechanism-fired-with-valued-outcome."

**Alternative framing A — Zani palette as unresolved counter-example.** The zani ADR-018 evidence shows: research → essay → ADR-as-invariant → BUILD; no PLAY filter recorded; no stakeholder demand recorded. The ADR's stated rationale is "may register as more vivid" — a prediction about perceptual effect, not a recorded user complaint. This is identical in structure to the C7 failure mechanism. The amendment resolves this by invoking the practitioner's retrospective valuation ("I was thrilled... it solved the actual problems we set out to solve"). What the reader would need to believe for this alternative to be right: that retrospective practitioner satisfaction does not constitute "empirical filter" as the C7 mechanism defines it; that "solving the actual problems" is a post-hoc rationalization of a mechanism that fired structurally before the problems were articulated as such; and that the absence of PLAY filter or stakeholder pull is the operative condition regardless of the practitioner's retrospective assessment. The evidence supports this framing. The zani ADR-018 itself contains the phrase "may register as more vivid" — not "writers have complained that their vivid palettes don't feel vivid enough." The chroma science was conducted, the essay was written, the ADR was formalized, and the build followed — without an empirical filter of the kind C7's mechanism analysis identifies as the distinguishing variable.

**Alternative framing B — practitioner agency as a legitimate empirical filter.** Under this framing, the practitioner's active engagement (pulling the color-science thread, generating the essay, formulating the ADR) IS the empirical filter — the practitioner was the stakeholder, and their creative investment constitutes demand-side grounding. What the reader would need to believe: that in a solo-developer context, practitioner-as-product-owner's active creative investment constitutes stakeholder pull; that the distinction between "external stakeholder demand" and "internal practitioner creative investment" is not the load-bearing variable in C7's mechanism; and that the color-science work was solving a real aesthetic problem the practitioner experienced, not speculating about a problem no user had reported. This framing is coherent but requires a specification of what counts as "empirical filter" that the Essay-Outline does not currently supply. If practitioner agency counts as empirical filter, then C7's mechanism claim needs to specify when it does and does not (since the mechanism characterization was that there was no empirical filter in the Zani case). The amendment introduces "practitioner agency" as the load-bearing variable but does not establish that practitioner agency constitutes an empirical filter within C7's framework.

**Alternative framing C — the mechanism-vs-outcome distinction is a domain-model refinement that improves C7's precision.** Under this framing, the amendment is analytically correct: the C7 mechanism describes a structural process (research-driven cascade without filter), not a quality judgment about outcomes. Any instance of the mechanism can produce valued OR unvalued outcomes; the mechanism is about the process, not the result. The Zani palette demonstrates the mechanism; whether the outcome is good is a separate question. What the reader would need to believe: that a mechanism description and an outcome judgment are genuinely distinct; that the Essay-Outline's original framing conflated them; and that correcting the conflation strengthens rather than weakens C7's claim. This framing has merit — it could sharpen C7 by separating two analytically distinct questions. The problem is that the Essay-Outline's original framing used the Zani palette as the C7 counter-example precisely because the outcome looked like kitchen-sink; the amendment removes the counter-example status by reclassifying the outcome. If mechanism and outcome are distinct, C7 needs a separate outcome-level analysis to recover the original counter-example logic.

**Negative space of the amendment:** The amendment does not consider whether "practitioner says it was valued" as an escape hatch reduces C7's practical predictive value. If any practitioner can retrospectively classify any mechanism-fired elaboration as "valued," the mechanism description loses its discriminating function. The amendment should name the conditions under which retrospective practitioner valuation does NOT constitute outcome-classification evidence — or the mechanism-vs-outcome distinction becomes untestable.

---

### Question 2: What truths were available but not featured in the W7.3 amendment?

**Underrepresented: the cross-project evidence favors DECIDE-layer discipline, not PLAY-layer discipline.**

The W7.3 amendment features the llm-orc Cycle 5 PLAY observation as the primary anchor for PLAY-as-Filter as load-bearing. The cross-project evidence contains two stronger data points for DECIDE-layer filtering:

- **Plexus ADR-038** — explicit refusal to add a research-justified feature at the DECIDE layer, based on architectural restraint reasoning and PLAY field notes about the enrichment surface. ADR-038's provenance section records: "PLAY field notes §'Misreading the enrichment surface as closed when it is open'" as a driver — but the PLAY field note informed the architectural framing, and the DECIDE-layer ADR is what executed the refusal. The filtering happened at DECIDE; PLAY was an evidence source.
- **Plexus ADR-024** — cancellation of previously-deferred Tier 1 DSL on YAGNI grounds, without PLAY involvement in the cancellation. The rationale ("the llm-orc ensemble YAML already serves this purpose") is DECIDE-layer architectural judgment.
- **Zani ADR-007** — mid-build invariant amendment for YAGNI reasons, catching a kitchen-sink case inside BUILD (not PLAY).

The amendment presents PLAY as the primary validation mechanism but the evidence base shows DECIDE-layer discipline as the dominant observed pattern. PLAY appears in one project (llm-orc Cycle 5) as a refutation mechanism. The W7.3 amendment does not account for why the two DECIDE-layer exemplars (plexus ADR-038, ADR-024) don't constitute evidence that DECIDE-layer discipline is sufficient without requiring PLAY-as-primary.

Why it may have been excluded: the practitioner's commitment to option (A) at the MODEL gate was motivated by the llm-orc observability-frustration experience (the practitioner described the value of PLAY-as-Filter from direct experience). This makes PLAY salient as a mechanism from the practitioner's perspective without requiring it to be the dominant cross-project pattern.

Would its inclusion change the argument? Yes, materially. If the cross-project evidence shows DECIDE-layer discipline as the dominant pattern, with PLAY serving as a useful but non-primary supplement, then ADR-019.4's DECIDE-layer criterion is the load-bearing fix — and the Distributed Remedy Architecture with PLAY-as-primary is an overstatement of what the evidence supports. The amendment's claim that PLAY is "load-bearing" warrants explicit comparison to the plexus evidence.

**Underrepresented: ADR-016's acceptance transition through structural operationalization.**

The W7.3 amendment and the Distributed Remedy Architecture characterize PLAY, stakeholder pull, and spike validation as the empirical-grounding mechanisms. ADR-016's acceptance story shows a fourth mechanism: structural operationalization via DECIDE-phase spikes (synthetic-data simulation for mechanisms (b) and (d)) followed by BUILD-phase structural validation. The ADR moved from conditional to full acceptance through BUILD-phase evidence — not through PLAY or external stakeholder demand. This is an empirical filter, but not one in the PLAY category. The amendment's Distributed Remedy Architecture does not include spike-validation or BUILD-phase structural operationalization as a grounding mechanism on par with PLAY. ADR-019.4's characterization of grounding sources ("PLAY evidence; stakeholder-articulated demand; spike validation") does include spike validation — but the W7.3 amendment's narrative frames PLAY as the load-bearing site, with spike validation as secondary. ADR-016's acceptance story complicates this hierarchy.

---

### Question 3: What would change if the W7.3 amendment's dominant framing were inverted?

The dominant framing of the W7.3 amendment: PLAY is the load-bearing validation mechanism in the Distributed Remedy Architecture; DECIDE applies only a felt-trigger pre-filter.

**Inverted framing:** DECIDE-layer discipline is the load-bearing mechanism; PLAY is a valuable but structurally optional amplifier. When DECIDE applies rigorous empirical-grounding criteria (plexus ADR-038 and ADR-024 as exemplars; llm-orc ADR-016's conditional-acceptance annotation), kitchen-sink is resisted without requiring PLAY. When DECIDE fails to apply the criterion (zani palette; llm-orc calibration channel in its original conditional-acceptance form), PLAY can correct the over-elaboration retrospectively — but DECIDE's failure to filter is the load-bearing failure mode, not the absence of PLAY.

**What becomes weaker under the inverted framing:** The rationale for holding the fifth ADR (PLAY-as-Filter methodology amendment) for a future cycle. Under the DECIDE-primary inversion, ADR-019.4 is sufficient as the primary remedy; the fifth ADR is genuinely supplementary.

**What becomes stronger under the inverted framing:** The coherence of C7's original mechanism description (research-surveyed possibilities surviving into ADRs without empirical filter at DECIDE). The original W7.3 (pre-amendment) was consistent with this mechanism. The inverted framing restores the original mechanism's DECIDE-primary locus.

**What the document would need to address if it took the inverted framing seriously:** Whether the practitioner's commitment to option (A) at the MODEL gate is a structural diagnosis about where the remedy should sit, or a practitioner preference about what kind of methodology development they find most valuable. Both can be true simultaneously — the practitioner may correctly observe that PLAY does refutation work AND the evidence base may support DECIDE-primary as the load-bearing mechanism. The framing question is whether the commitment to option (A) constitutes a methodology-architecture determination or a practitioner-value preference. If the latter, the amendment should record it as such rather than restructuring the W7.3 claim around it.

---

### Framing Issues

**F-R5-P1: The W7.3 amendment's framing elevates PLAY-as-primary without engaging the alternative (DECIDE-primary) at the level required for a load-bearing methodology claim.**

- **Location:** §8 W7.3 META-OBSERVATION amendment block
- **Observation:** The amendment introduces PLAY-as-Filter as the "load-bearing validation site" based on the practitioner's commitment to option (A). The alternative framing (DECIDE-primary, supported by plexus ADR-038, ADR-024, and the pre-amendment W7.3's own analysis) is not engaged. The cross-project evidence that favors DECIDE-layer discipline over PLAY-layer discipline is present in the document's own evidence base (E7.1.3, E7.1.4) but not cited in the amendment's counter-analysis. A methodology claim of this type — restructuring the remedy architecture around PLAY-as-primary — should acknowledge the strongest alternative (DECIDE-primary) and provide comparative evidence analysis.
- **Why this is framing-P1 rather than only argument-P2:** The amendment is a practitioner-originated framing that is encoded as the document's primary claim about where remedy-architecture authority sits. The susceptibility snapshot described this as "practitioner-reframe-absorbed-without-audit." The framing audit's role is to ask whether the alternative framing (DECIDE-primary) received comparative engagement before the amendment was encoded. The evidence is that it did not: the susceptibility snapshot records that belief-mapping for option (A) was partial (the practitioner described the positive case for PLAY-as-Filter, not the strongest case against it). The framing audit surfaces this as P1 because the negative space — the DECIDE-primary framing, supported by two of the three cross-project anchors — is consequentially absent from the amendment's reasoning.
- **Recommendation:** The W7.3 amendment block should add comparative analysis: "The plexus evidence (ADR-038 explicit refusal; ADR-024 YAGNI-based cancellation) shows DECIDE-layer discipline operating without PLAY involvement as the dominant cross-project pattern. PLAY-as-Filter (llm-orc Cycle 5) is one observed case of PLAY doing refutation work. The Distributed Remedy Architecture places PLAY as load-bearing based on the practitioner's commitment to option (A) at the MODEL gate and the direct observability-frustration experience in llm-orc; the cross-project evidence base for PLAY-primary vs. DECIDE-primary remains N=1 for PLAY-filter instances vs. N=2 for DECIDE-layer instances operating without PLAY." This makes the framing choice visible without retracting it.
- **Severity: P1 (framing).** This is the framing audit's load-bearing finding for the W7.3 amendment.

**F-R5-P2: The W7.1 amendment performs counter-example narrowing via practitioner reread without naming the alternative framing that the same evidence accommodates.**

- **Location:** §8 W7.1 EVIDENCE amendment block
- **Observation:** The amendment reframes the Zani palette from "paradigmatic C7 counter-example" to "mechanism-fired-with-valued-outcome." The alternative framing — that the practitioner's retrospective satisfaction is post-hoc rationalization, and that the Zani palette remains a valid C7 counter-example because no pre-build empirical filter existed — is not named or engaged. The framing audit's Question 1 analysis (above) identifies three alternative framings the evidence supports. The amendment adopts framing C (mechanism-vs-outcome distinction as analytical refinement) via the practitioner's Option (iii) at the MODEL gate. The alternative that the mechanism-vs-outcome distinction is a sycophancy-compatible escape hatch (named explicitly in the susceptibility snapshot) is not engaged in the amendment text.
- **Recommendation:** The amendment block should acknowledge: "The alternative reading — that 'mechanism fired; outcome valued' is a practitioner judgment that any elaboration the practitioner valued can absorb — is named but not resolved here. The mechanism-vs-outcome vocabulary is encoded at the same Tier-2 practitioner-judgment level as other vocabulary in this cycle; it does not constitute empirical outcome classification."
- **Severity: P2 (framing).**

**F-R5-P3: ADR-016's acceptance transition through spike validation — not PLAY-driven empirical filter — is an underrepresented finding that complicates the PLAY-primary characterization.**

- **Location:** §8 E7.1.2; W7.3 amendment block; Section 10 ADR-019.4 evidence anchor
- **Observation:** ADR-016's acceptance story (structural operationalization via DECIDE-phase spikes + BUILD-phase validation) demonstrates a fourth grounding mechanism — spike validation — that does not fit the PLAY-primary narrative and is also more prevalent in the cross-project evidence than the PLAY-filter mechanism. The Essay-Outline's grounding mechanism list (PLAY evidence; stakeholder-articulated demand; spike validation) does include spike validation, but the W7.3 amendment's framing elevates PLAY as load-bearing without noting that spike validation was the mechanism that resolved the most concrete kitchen-sink-risk case (ADR-016's conditional acceptance).
- **Recommendation:** Consider adding one sentence to the W7.3 amendment block: "ADR-016's acceptance transition (via DECIDE-phase spikes + BUILD-phase structural validation, not PLAY) is noted as a fourth grounding mechanism; the Distributed Remedy Architecture should account for spike validation as a peer mechanism alongside PLAY evidence."
- **Severity: P3 (framing).**

---

## Finding Summary

### Issue Counts

| Category | P1 | P2 | P3 |
|---|---|---|---|
| Argument audit — expansion-fidelity | 1 | 2 | 0 |
| Argument audit — within-document logic | 0 | 1 | 2 |
| Framing audit | 1 | 1 | 1 |
| **Total** | **2** | **4** | **3** |

*(The expansion-fidelity P1 and the framing P1 describe overlapping root causes — both trace to the W7.3 amendment's PLAY-primary claim — and should be remediated together.)*

---

### Which findings call for amendment vs. §9 caveat

**Findings that require amendment to the Essay-Outline:**

1. **P1-R5-1 (Boundary 1 / Reverse Boundary 1):** Must fix before DECIDE encodes the amendments. The Abstract and Argument-Graph are out of phase on the remedy-architecture claim. Either Abstract C7 is updated to carry the PLAY-primary claim (with its "(working hypothesis, single-cycle anchor)" qualifier), or W7.3's amendment is narrowed to a "distributed rather than DECIDE-only" working hypothesis consistent with the single-case anchor. This is a load-bearing pyramid structural repair.

2. **P2-R5-3 (ADR-016 citation status):** The "conditional acceptance — first-deployment evidence pending" characterization is stale. E7.1.2 and the Section 10 ADR-019.4 evidence anchor should be updated to reflect the acceptance transition and the nature of the grounding evidence (structural operationalization via spikes, not PLAY-driven filter).

**Findings that can be handled as §9 caveat additions or in-place qualifiers:**

3. **P2-R5-1 (W7.1 discriminating criterion absent):** Can be addressed by adding a sentence to the W7.1 amendment block acknowledging that "outcome valued" is practitioner-judgment-anchored — a §9-compatible scope-of-claim qualifier that preserves the mechanism-vs-outcome distinction while naming its epistemic status.

4. **P2-R5-2 (W7.3 "load-bearing" overstates single-case anchor):** Can be addressed by adding a "(working hypothesis, single-cycle PLAY-filter anchor)" qualifier to the "PLAY is the load-bearing component" text — parallel to the qualifier already present in the pre-amendment W7.3 for the DECIDE-primary claim.

5. **F-R5-P1 (DECIDE-primary alternative framing not engaged):** Should be addressed in the W7.3 amendment block, not §9, because it is part of the argument's framing — a one-sentence comparative acknowledgment that the plexus evidence supports DECIDE-primary and that the amendment's PLAY-primary framing rests on the practitioner's option (A) commitment rather than on comparative evidence analysis.

6. **P3-R5-2 (§9 provenance paragraph audit-trail gap):** §9 addition.

7. **F-R5-P2 (W7.1 escape-hatch concern not engaged):** W7.1 amendment block acknowledgment.

8. **F-R5-P3 (spike validation as fourth grounding mechanism underrepresented):** Optional W7.3 amendment block addition or §9 note.

---

### Verdict

**The amended Essay-Outline is NOT ready to advance to DECIDE without targeted repairs.** The P1-R5-1 structural violation (Abstract C7 out of phase with amended W7.3) must be resolved before the four 019.x ADRs are drafted around the Distributed Remedy Architecture. The ADR-016 citation staleness (P2-R5-3) should be corrected concurrently. The remaining findings (P2-R5-1, P2-R5-2, framing findings) can be resolved via in-place qualifiers in the amendment blocks without requiring a full re-audit at R6.

If the practitioner resolves P1-R5-1 via Option A (updating Abstract C7 to carry the Distributed Remedy Architecture claim with its single-case-anchor qualifier), a narrow R6 verification of the Abstract update and the W7.3 qualifier additions would close the cycle. If Option B (narrowing W7.3 to a working hypothesis), no R6 is required — the pre-amendment Abstract C7 already carries the correct scope.

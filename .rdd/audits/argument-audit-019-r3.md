# Argument Audit Report — Cycle 019, R3

**Audited document:** `docs/essays/essay-outline-018-does-rdd-over-engineer.md` (revised post-R2, incorporating Loop 6 C7 additions)
**Source material:**
- R2 audit: `.rdd/audits/argument-audit-019-r2.md` (baseline for regression check)
- R1 audit: `.rdd/audits/argument-audit-019.md` (original framing-audit findings)
- Citation audit: `.rdd/audits/citation-audit-019.md` (Boundary 3 context)
- Research log: `docs/essays/research-logs/research-log.md` §Loop 6 (Loop 6.1, 6.2, and synthesis)

**Genre:** Essay-Outline (per ADR-093 §1)
**Date:** 2026-05-16
**Auditor:** argument-audit skill (claude-sonnet-4-6), R3 dispatch

**R3 scope:** Revisions since R2 are substantial (C7 new conclusion; W7.1–W7.4 warrant structure; Section 8 new body section; Section 9 and 10 renumbered and augmented; C5 revised; Abstract updated). R3 scope: (1) verify R2 findings remain resolved and no regressions introduced; (2) audit the new C7 content per-warrant; (3) rebuild pyramid coverage map across the now-seven-conclusion Abstract; (4) expansion-fidelity verification post-revision; (5) framing audit on the new C7 material; (6) META audit-time review for the revised structure.

---

## Section A — R2 Baseline Reaffirmation

### R2 findings status post-revision

**P3-R2-1 (W1.3 scope qualification labels one tested alternative as "Crystal-light methodologies"):** The revised document retains this label. The Argument-Graph W1.3 scope qualification still reads "Crystal-light methodologies" where it should read "agile/requirements-deferral alternatives" to match E1.3.1 (Rahman & Cysneiros 2024). This is unchanged from R2; no regression, no remediation. The P3 remains open.

**EF-P3-2 (E2.3.1 development references the research log coverage map without reproducing structure):** Unchanged from R2. Carried forward as P3.

No R2 findings have regressed. The R2 P3 observations from resolved findings (R1 P2-1, P2-2, P2-3, F-P1, F-P3) remain resolved.

### Regressions introduced by the revisions

Two regressions are identified. Both stem from the same root cause: the post-R2 revisions updated the Abstract C5 and the Section 6 SYNTHESIS but did not propagate Branch A's promotion consistently through the Argument-Graph or the Section 3 body.

**Regression 1: Argument-Graph C5 claim text is stale.**

The Argument-Graph C5 (line 59 of the document) reads:

> *"Branch D is promoted to in-cycle ADR candidate (per the audit framing finding F-P3); Branch A is held for a future cycle on amendment-size grounds (not evidence-strength grounds)."*

This is the R2 text. The Abstract C5 and Section 6 SYNTHESIS have both been updated to reflect Branch A's second-revision promotion (Loop 6 cross-project evidence), but the Argument-Graph's C5 claim node itself retains the old text. A reader of the Argument-Graph now receives a claim (Branch A held for future cycle) that contradicts the Abstract (Branch A promoted to in-cycle as ADR-CANDIDATE-019.4) and the Section 6 body (SECOND REVISION notation explicitly records the promotion). This is a Boundary 1 regression: the Argument-Graph no longer matches the Abstract for C5's content. See Section D (Expansion-Fidelity Findings) for severity assignment.

**Regression 2: Section 3 (C2) SYNTHESIS is stale.**

Section 3's SYNTHESIS bullet (line 127) reads:

> *"Naming the calibration pattern explicitly is the cycle's first contribution. Identifying the next two open moves (Branches B and E) is the second; additional candidates (Branches A and D) are recorded for future cycles."*

Both Branches A and D are now in-cycle ADR candidates (ADR-CANDIDATE-019.3 and ADR-CANDIDATE-019.4). The Section 3 SYNTHESIS has not been updated to reflect this. The text is factually incorrect as written: Branches A and D are not "recorded for future cycles" — they are in-cycle. This is a Boundary 2 issue: the body content anchored to C2 (§3) does not reflect the current state of the argument. See Section D for severity assignment.

---

## Section B — C7 / W7.1–W7.4 / Section 8 Audit

### W7.1 warrant: "YAGNI is structural; kitchen-sink is localized to research-driven cascades"

**Warrant claim evaluation:** The warrant claims three external RDD applications provide cross-project empirical evidence for this proposition. The five evidence nodes are:

- E7.1.1 (zani palette subsystem): research → essay → ADR-as-invariant → BUILD implements faithfully, no PLAY filter, no stakeholder pull recorded. This is the kitchen-sink failure-mode instance. The research log confirms this finding with specificity (6 ADRs ratcheting the palette commitment; 1,953 LOC; required retuning 40 palettes).
- E7.1.2 (llm-orc calibration channel): ADR-016 marked "conditional acceptance — first-deployment evidence pending"; 1,043 LOC built ahead of empirical evidence. The research log confirms (calibration channel built from research-surveyed multi-agent debate literature without PLAY filter).
- E7.1.3 (plexus ADR-038): explicit refusal of research-justified feature on architectural-restraint grounds. Confirmed in research log (positive decision, not defect-by-omission).
- E7.1.4 (plexus ADR-024): cancellation of previously-deferred declarative DSL. Confirmed (cancelled on YAGNI grounds when llm-orc ensemble YAML rendered it unnecessary).
- E7.1.5 (llm-orc adr-deferred- pattern): 160 occurrences of defer/rejected language across 25 ADRs. Confirmed in research log.

**Warrant logic assessment:** The warrant makes two claims: (a) YAGNI is structural, and (b) kitchen-sink is localized to research-driven cascades. The evidence supports (a) directly — E7.1.3, E7.1.4, E7.1.5 all show systematic YAGNI operation. The evidence for (b) is less symmetrical than the warrant implies.

The two kitchen-sink instances (E7.1.1 zani palette; E7.1.2 llm-orc calibration channel) both show the research-driven cascade mechanism. But across three projects with ~26 ADRs sampled in depth (plexus ~10; llm-orc ~8; zani ~18), only two localized instances of kitchen-sink are found. The warrant says kitchen-sink is "localized" — which is accurate based on the evidence. However, the warrant's framing ("kitchen-sink is localized to research-driven cascades") implies that research-driven cascades reliably produce kitchen-sink, where the evidence actually shows that research-driven cascades sometimes produce kitchen-sink (when no empirical filter is present). The distinction is: the empirical-grounding filter is the operative variable, not research-driven provenance per se. Plexus ADR-038 is itself research-justified (research surfaced the Rust embedding path) but declined at DECIDE — so "research-driven" is not synonymous with "kitchen-sink." The warrant should read "kitchen-sink is localized to research-driven cascades WITHOUT empirical filter" to be precise.

**Severity:** P2. The warrant is directionally correct but slightly over-claims the pattern (research-driven → kitchen-sink) when the evidence shows the operative variable is the empirical filter at DECIDE, not research-driven provenance alone. The Section 8 body is more precise on this point than the Argument-Graph warrant is. The imprecision is in the Argument-Graph W7.1 label.

**Agent-generated evidence epistemic status:** The three investigations were conducted by parallel subagents on 2026-05-16. The research log records specific artifact paths, line counts, ADR quotes, and specific file names verified. The research log's Loop 6.2 entries contain specific verbatim quotes from the investigated ADRs and explicitly name the investigation caveats (sampled subset of ADRs; no operator-side data; some metrics rough). The Section 9 body text (Loop 6 cross-project sampling scope caveat) acknowledges the ~8–10 ADR sample depth and names the "kitchen-sink-by-delegation" critique as unverified. This is honest epistemic scope-setting.

The body does NOT explicitly state that the investigations were agent-generated parallel subagents. The References entry reads: "Cycle 019 Loop 6.2 external project investigations (2026-05-16): recorded in `docs/essays/research-logs/research-log.md` §Loop 6.2 with primary-source file paths." This is honest — the research log is the record, and the research log contains the investigation findings. The evidence is not presented as primary-source-equivalent in the References. However, the Argument-Graph evidence nodes cite "(Loop 6.2 zani investigation, 2026-05-16)" in a form that appears parallel to literature citations. A reader of the Argument-Graph alone would not know these are agent-conducted investigations, not the practitioner's own independent examination. See Section E for the framing audit treatment of this question.

### W7.2 warrant: "Empirically-grounded elaboration earns its weight"

**Warrant logic:** W7.2 is supported by E7.2.1 (zani writing-app core tight relative to palette), E7.2.2 (llm-orc PLAY pulled features back), and E7.2.3 (llm-orc PLAY-discovered failure modes motivated large modules). The research log confirms all three. The intra-project asymmetry in zani (tight core vs. elaborated palette, same methodology, same practitioner) is the cleanest data point in the cross-project corpus and supports the SYNTHESIS-BULLET's conclusion.

**Warrant logic holds.** No issues found.

### W7.3 warrant: "Auto-mode BUILD does NOT cause kitchen-sink"

**Warrant logic:** W7.3 rests on a single evidence node: E7.3.1 (llm-orc Cycle 6 ran in auto mode; WP-A close-out surfaced a deferral the practitioner endorsed). The research log confirms this (per `cycle-status.md` line 18; practitioner-endorsed deferral at WP-A close-out).

**Single-cycle anchor problem:** The warrant states "does NOT cause kitchen-sink" as a general claim, but the evidence is one cycle from one project. The Section 9 caveat does name this explicitly: "Auto-mode BUILD counter-evidence rests on llm-orc Cycle 6 alone — a single-cycle anchor; cross-cycle replication would strengthen the W7.3 claim." The caveat is honest and correctly scoped.

However, the Argument-Graph warrant W7.3 itself states "Auto-mode BUILD does NOT cause kitchen-sink" without the single-cycle qualification. The META-OBSERVATION in Section 8 under W7.3 is more careful: "The kitchen-sink mechanism operates upstream at DECIDE where research possibility crystallizes into ADRs — auto-mode BUILD inherits already-filtered (or already-unfiltered) ADRs and implements them faithfully." This reframing is more defensible than the warrant's unqualified claim.

The structure of the problem: the warrant claims something negative (auto-mode BUILD does NOT cause kitchen-sink) from a single affirmative instance (one cycle where it didn't). A single affirmative instance cannot establish a universal negative. The warrant should be scoped: "In the observed evidence, auto-mode BUILD did not cause kitchen-sink; the mechanism operates upstream at DECIDE" — not the unqualified "does NOT."

**Severity:** P2. The warrant overstates the evidence's scope for a negative claim. The Section 9 caveat partially addresses this but does not appear at the Argument-Graph warrant level where the unqualified claim is made. The body Section 8's META-OBSERVATION is more honest than the warrant label. A P1 finding would fire if the conclusion downstream depended on this as an established fact; it does not — C7's core claim (the mechanism is at DECIDE) holds without needing W7.3 to be established as a universal. But the overreach in the warrant label should be named at the warrant level.

### W7.4 warrant: "The user's 'what is GOOD about RDD' is structurally preserved by C7"

**Category assessment:** W7.4 is labeled as a warrant with E7.4.1 as its evidence node. E7.4.1 cites a practitioner gate response recorded verbatim. The argument structure is: the practitioner valued nuance-preservation → C7's remedy (filtering at DECIDE, not compressing RESEARCH) preserves nuance-surfacing → therefore, the C7 finding is compatible with the stated value.

**Category-error question:** The dispatch brief asks whether W7.4 functions as evidence (which a warrant claims) or as practitioner preference (a category error in argument). This distinction is real. The practitioner's statement "what is GOOD about RDD is its propensity to work with nuance" is a value statement, not an empirical observation. It does not function as evidence that C7's remedy preserves nuance — it functions as a constraint that C7's remedy must satisfy.

The actual logic structure is: (1) the practitioner's value constrains the acceptable remedy space; (2) C7's remedy satisfies that constraint. The "evidence" E7.4.1 is evidence for the value (that nuance-preservation is valued) but is not evidence that the remedy actually preserves it. Whether ADR-CANDIDATE-019.4 (empirical-grounding criterion at DECIDE) actually preserves RESEARCH's nuance-surfacing function is not empirically established — it is a design claim about the ADR candidate's structure (the filter operates at DECIDE, not RESEARCH). The design claim is plausible and the SYNTHESIS-BULLET makes it explicit, but it is not supported by independent evidence; it follows from the ADR's proposed structure.

**Verdict:** W7.4 is a constraint-satisfaction argument dressed as warrant-evidence. The warrant structure is formally present but the "evidence" is a value statement, not an empirical observation. The claim that C7 "structurally preserves" nuance-surfacing is an architectural assertion, not an empirically established finding. This is a minor structural imprecision — the claim is probably correct, but the warrant-evidence form overstates the certainty.

**Severity:** P2. The practitioner gate response is correctly recorded verbatim. The logical structure (constraint satisfaction rather than independent evidence) should be visible. The SYNTHESIS-BULLET's language ("The C7 remedy is NOT a compression of research; it is an addition to DECIDE") is more accurate framing than "E7.4.1 provides evidence that W7.4 holds."

### Section 8 integration with prior sections

Section 8 (C7) is placed after Section 7 (C6/Branch C) and before Section 9 (META scope-of-claim caveats). The placement is appropriate — C7 is the most recently added conclusion and rests on the Loop 6 investigation findings that postdate the initial research. Section 8's CLAIM, WARRANT, and EVIDENCE structure is developed correctly.

**Internal consistency check (Section 8 vs. Sections 2–7):** C7's claim that "the over-engineering failure mode traces to research-surveyed possibilities surviving into ADRs without empirical filter" is consistent with C1 (calibration question), C5 (Branch A promoted), and C6 (Branch C's methodology-mismatch answer). It does not contradict any prior section's claims. The SYNTHESIS-BULLET under W7.2 ("the asymmetry is intra-project, not inter-methodology") is consistent with W1.3's scope (tested counterfactuals are agile/organizational alternatives — not the same as within-RDD mechanism diagnosis).

**Section 6 reference to Section 8:** The Section 6 SYNTHESIS says "See Section 8 (C7 development) for the load-bearing cross-project evidence." This is a forward reference that is syntactically present and substantively fulfilled. Section 8 does develop what Section 6 references.

---

## Section C — Pyramid Coverage Map (Re-built post-revision)

### Four-section identification

**Abstract Section:** Present. Seven conclusions C1–C7. C7 added since R2.

**Argument-Graph Section:** Present. Seven top-level claims C1–C7. C7 with W7.1–W7.4 and E7.1.1–E7.4.1 added since R2.

**Citation-Embedded Outline:** Present. Ten sections (§1–§10). §8 (C7) added; §9 (META) and §10 (META) renumbered from R2's §8 and §9.

**References:** Present. Updated with Loop 6.2 external project investigation entries (three projects; specific file paths).

All four sections are present. No structural-absence violation.

### Coverage map (post-revision)

| Abstract Conclusion | Argument-Graph Nodes | Body Section | References Cited |
|---|---|---|---|
| C1. Calibration question, not structural rejection; methodology posture supported for actual work; open risk is per-cycle/per-layer | C1, W1.1, W1.2, W1.3, E1.1.1–E1.1.4, E1.2.1–E1.2.2, E1.3.1–E1.3.2 | §2 (C1) | Cockburn 2004; Fowler 1999/2015; Beck 1999; Simon 1996; Pirolli & Card 1999; Cycle 018 cycle-status; ADR-091; Rahman & Cysneiros 2024; Cycle 019 research log |
| C2. Progressive calibration pattern; cycle names it; next open moves identified | C2, W2.1, W2.2, W2.3, E2.1.1–E2.1.2, E2.2.1, E2.3.1 | §3 (C2) | ADR-091; ADR-083; Reflection 005; ADR-025; Cycle 019 research log |
| C3. Branch B: trim audit round-count at convergence saturation; 3 rounds default | C3, W3.1, W3.2, W3.3, E3.1.1–E3.1.2, E3.2.1, E3.3.1 | §4 (C3) | Madaan et al. 2023; Kamoi et al. 2024; Bacchelli & Bird 2013; Cycle 018 cycle-status |
| C4. Branch E: admissibility criterion for agent-facing artifacts | C4, W4.1, W4.2, E4.1.1–E4.1.3, E4.2.1 | §5 (C4) | Paulsen et al. 2025; Gupta et al. 2026 (arXiv:2604.03826); Cycle 019 research log; Fowler 2025 |
| C5. Branches D and A both promoted to in-cycle ADR candidates; D = 019.3; A reframed as empirical-grounding criterion = 019.4 | C5, W5.1, W5.2, E5.1.1–E5.1.2, E5.2.1–E5.2.2 | §6 (C5) | Cockburn 2004; Cycle 019 research log; Pirolli & Card 1999 |
| C6. Branch C strongly supported; entry-side gap separately scoped | C6, W6.1, W6.2, E6.1.1–E6.1.2, E6.2.1 | §7 (C6) | Reflection 005; ADR-025; domain-model.md:926 |
| C7. Over-engineering failure mode traces to research-surveyed possibilities surviving into ADRs without empirical filter; YAGNI structural; kitchen-sink localized; auto-mode BUILD not the cause | C7, W7.1, W7.2, W7.3, W7.4, E7.1.1–E7.1.5, E7.2.1–E7.2.3, E7.3.1, E7.4.1 | §8 (C7) | Cycle 019 Loop 6.2 zani investigation; Loop 6.2 llm-orc investigation; Loop 6.2 plexus investigation; Practitioner gate response 2026-05-16 |

**META-anchored sections:**
- §1 (Introduction — question and cycle's posture): META. Confirmed non-developmental.
- §9 (Scope-of-claim caveats): META. Renumbered from R2's §8. Carries Loop 6 sampling scope caveat and distribution-of-cycle-types limitation. Confirmed non-developmental.
- §10 (Forward-look — feed-forward signals): META. Renumbered from R2's §9. Carries ADR-CANDIDATE-019.1 through 019.4 and held-open future-cycle candidate. Confirmed non-developmental.

**Argument-Graph nodes with no body content:** None detected. All C7 warrants and evidence nodes are developed in §8.

**Body sections with no Argument-Graph anchor:** None detected. Sections 1, 9, 10 carry META. Sections 2–8 carry C1, C2, C3, C4, C5, C6, C7 respectively.

**Coverage inconsistencies detected (carried into Expansion-Fidelity Findings):**

- **Inconsistency 1:** Argument-Graph C5 text says "Branch A is held for a future cycle" but Abstract C5 says both Branches D and A are promoted to in-cycle. The body §6 SYNTHESIS records the second revision correctly. The Argument-Graph C5 claim node is stale.
- **Inconsistency 2:** Section 3 (§3, C2) SYNTHESIS says "additional candidates (Branches A and D) are recorded for future cycles" — contradicting both the Abstract and Section 6's current state.

---

## Section D — Expansion-Fidelity Findings (R3)

### Boundary 1 (Abstract → Argument-Graph): post-revision

**C1 through C6:** All map to corresponding Argument-Graph nodes. Confirmed.

**C7:** The Abstract C7 maps to the Argument-Graph C7. The mapping is present. No Boundary 1 violation for C7.

**C5 — Boundary 1 regression:** The Abstract C5 and the Argument-Graph C5 are no longer consistent. The Abstract C5 states both Branches D and A are promoted to in-cycle. The Argument-Graph C5 states Branch A is held for a future cycle. This is a Boundary 1 violation: the conclusion as stated in the Abstract has no matching claim in the Argument-Graph. The claim in the Argument-Graph is factually inconsistent with the Abstract.

**P1 — Boundary 1 violation: Abstract C5 → Argument-Graph C5 mismatch.**

- **Location:** Abstract C5 (line 14); Argument-Graph C5 (line 59)
- **Claim (Abstract):** Branch A's specific remedy is promoted to in-cycle as ADR-CANDIDATE-019.4; Branch D promoted as ADR-CANDIDATE-019.3.
- **Claim (Argument-Graph):** Branch D promoted to in-cycle; Branch A held for a future cycle on amendment-size grounds.
- **Gap:** The Argument-Graph C5 node has not been updated to reflect the Loop 6 second-revision promotion of Branch A. A reader of the Argument-Graph receives a conclusion that contradicts the Abstract.
- **Recommendation:** Update the Argument-Graph C5 claim text to read: "Branch D is promoted to in-cycle ADR candidate (ADR-CANDIDATE-019.3) (per the audit framing finding F-P3); Branch A is also promoted to in-cycle (ADR-CANDIDATE-019.4), but the remedy is reframed — empirical-grounding criterion at DECIDE rather than per-cycle chain-weight calibration (per Loop 6 cross-project evidence)."
- Routing per ADR-092 §6: **discipline-suspect** — the production work was not completed at sufficient depth across all sections; stewardship response is to re-run production with discipline tightening (no scope change required).

### Reverse Boundary 1 (Argument-Graph → Abstract): post-revision

All seven Argument-Graph top-level nodes (C1–C7) have matching Abstract conclusions. The Argument-Graph C7 maps to the Abstract C7. The C5 inconsistency is a Boundary 1 violation (Abstract → Graph) not a Reverse Boundary 1 violation (the Argument-Graph does not assert something the Abstract is missing — the Argument-Graph is simply stale relative to the Abstract). **No new Reverse Boundary 1 violations.**

### Boundary 2 (Argument-Graph → Citation-Embedded Outline): post-revision

**C7 warrants:**

- W7.1 → §8 develops it (CLAIM, WARRANT, EVIDENCE bullets for W7.1 with all five E7.1.x evidence nodes). Body development is substantive. No Boundary 2 violation.
- W7.2 → §8 develops it (three E7.2.x bullets; SYNTHESIS-BULLET). No Boundary 2 violation.
- W7.3 → §8 develops it (E7.3.1; META-OBSERVATION). No Boundary 2 violation.
- W7.4 → §8 develops it (EVIDENCE and SYNTHESIS-BULLET). No Boundary 2 violation.

**All prior warrants W1.1–W6.2 unchanged from R2. No new Boundary 2 violations from the C7 addition.**

**Body §3 stale content (Section 3 SYNTHESIS):** The Section 3 (C2) SYNTHESIS bullet at line 127 says "additional candidates (Branches A and D) are recorded for future cycles." This is body content that is factually incorrect relative to the current state of the argument. The C2 body (§3) is anchored to the Argument-Graph's C2, which itself does not assert anything about Branches A and D's in-cycle vs. future-cycle status — that is C5's domain. The stale text in §3 is not a Boundary 2 violation in the strict pyramid sense (§3 develops C2, not C5; the mismatch is cross-section staleness, not an unanchored orphan). However, it is a body-level factual error that a reader of §3 will encounter before reading §6. **Filed as a P2 finding (cross-section staleness introducing a factual error in the body).**

**P2 — Stale body text in Section 3 (C2) SYNTHESIS:**

- **Location:** Section 3 (C2), SYNTHESIS bullet (line 127)
- **Claim:** "additional candidates (Branches A and D) are recorded for future cycles"
- **Current state:** Branches A and D are both in-cycle candidates as of the Loop 6 revision (ADR-CANDIDATE-019.3 and 019.4). The SYNTHESIS bullet has not been updated.
- **Recommendation:** Update the Section 3 SYNTHESIS to read: "additional candidates (Branches A and D) are now promoted to in-cycle as ADR-CANDIDATE-019.3 (Branch D) and ADR-CANDIDATE-019.4 (Branch A reframed)." This is a one-line update that maintains §3's scope (C2's calibration-pattern naming) while not misstating the current artifact state.

### Reverse Boundary 2 (Citation-Embedded Outline → Argument-Graph): post-revision

All ten body sections carry either an Argument-Graph anchor or META:

- §1: `(META)` — confirmed
- §2: `(C1)` — confirmed
- §3: `(C2)` — confirmed
- §4: `(C3)` — confirmed
- §5: `(C4)` — confirmed
- §6: `(C5)` — confirmed
- §7: `(C6)` — confirmed
- §8: `(C7)` — confirmed
- §9: `(META)` — confirmed
- §10: `(META)` — confirmed

**No Reverse Boundary 2 violations.**

### Boundary 3 (Citation-Embedded Outline → References): post-revision

New citations introduced by the C7 revisions:

- `(Loop 6.2 zani investigation, 2026-05-16)` → References entry present: "Cycle 019 Loop 6.2 external project investigations (2026-05-16): recorded in `docs/essays/research-logs/research-log.md` §Loop 6.2 with primary-source file paths" (with zani file paths enumerated). The citation resolves.
- `(Loop 6.2 llm-orc investigation, 2026-05-16)` → Same References entry; llm-orc file paths enumerated. The citation resolves.
- `(Loop 6.2 plexus investigation, 2026-05-16)` → Same References entry; plexus file paths enumerated. The citation resolves.
- `(Practitioner gate response, 2026-05-16, recorded verbatim)` → No independent References entry; not a separately citable source. The practitioner gate response is recorded in the research log (Loop 6 trigger section). The Essay-Outline does not have a References entry for this item. However, since it is verbatim text from a documented source (the research log), the absence of a separate citation entry is a minor transparency gap rather than a Boundary 3 hard violation. **Filed as P3 (Boundary 3 transparency gap for E7.4.1).**

**P3 — Boundary 3 transparency: E7.4.1 practitioner gate response has no standalone References entry.**

- **Location:** E7.4.1; References section
- **Observation:** E7.4.1 cites "Practitioner gate response, 2026-05-16, recorded verbatim" but there is no corresponding References entry. The response is recorded in the research log (§Loop 6), which is in the References. Adding a parenthetical to E7.4.1 — "(see research log §Loop 6 trigger)" — would close the citation chain.
- **Recommendation:** Add a parenthetical to E7.4.1 pointing to the research log's Loop 6 trigger section where the response is recorded verbatim, or add a brief References note for the practitioner gate response.

**Citation audit context:** The citation audit ran at R1; the new Loop 6 citations are internal corpus references (research log file paths) not subject to the same external-source verification issues. No escalation to P1 required.

### Expansion-Fidelity Summary (R3)

**P1 findings (pyramid violations):** 1

- Boundary 1 violation: Argument-Graph C5 text contradicts Abstract C5 (Branch A held vs. promoted).

**P2 findings (weak expansion or META misclassification):** 3

- W7.1 warrant claim overstates pattern: "kitchen-sink localized to research-driven cascades" omits "without empirical filter" qualifier (the operative variable).
- W7.3 warrant claim is an unqualified negative from a single affirmative instance.
- Section 3 (C2) SYNTHESIS body text is stale: states Branches A and D "recorded for future cycles" when both are now in-cycle.

**P3 findings (minor coverage gaps):** 3 (two carried from R2 plus one new)

- P3-R2-1 (carried): W1.3 scope qualification labels one tested alternative as "Crystal-light methodologies."
- EF-P3-2 (carried): E2.3.1 development references research log coverage map without reproducing structure.
- Boundary 3 transparency gap for E7.4.1 (new).

---

## Section E — Framing Audit (R3)

The framing audit focuses on whether C7's introduction creates new framing biases and on the relationship between C1 and C7.

### Question 1: What alternative framings did the C7 evidence support?

The Loop 6 cross-project investigation evidence supports three framings not taken up by C7.

**Alternative framing A: The `adr-deferred-` institutional innovation is the load-bearing finding, not the empirical-grounding criterion.**

The llm-orc `adr-deferred-` filename pattern (160 occurrences of defer/rejected language) is a stronger operationalization of YAGNI discipline than "empirical-grounding criterion at DECIDE" as stated in C7. The two framings overlap but are not identical: the empirical-grounding criterion asks "is there PLAY/stakeholder/spike evidence for this ADR?" The `adr-deferred-` pattern asks "is this ADR's evidence above the in-cycle threshold?" The llm-orc pattern is already a functioning institutional practice that the cross-project investigation confirmed. Framing C7's remedy as "adopt the `adr-deferred-` pattern" would be operationally more specific than "empirical-grounding criterion at DECIDE." ADR-CANDIDATE-019.4 does reference the llm-orc pattern, but C7's central framing leads with the abstract criterion rather than the observed institutional practice.

*What would the reader need to believe for this framing to be right?* That the specific institutional mechanism (filename convention + evidentiary threshold annotation) is more actionable than the abstract criterion, and that ADR-CANDIDATE-019.4 should be specified in those operational terms rather than as a principle.

**Alternative framing B: The cross-project evidence refutes the cycle's calibration framing more than it confirms it.**

C7's cross-project evidence shows the failure mode is specific (research-driven cascades without empirical filter) and localized (two of ~26 sampled ADRs). Under the calibration framing, this is evidence that calibration at DECIDE is the right remedy. Under an alternative framing, the fact that only TWO instances of kitchen-sink were found in ~26 sampled ADRs across three projects suggests the problem is less widespread than the cycle's concern implies — and that the calibration remedy (ADR-CANDIDATE-019.4) addresses a problem that RDD practitioners already solve through felt-judgment at DECIDE most of the time. The loop-6 evidence could be read as "the over-engineering concern is less acute than the cycle suggested; what exists is isolated."

*What would the reader need to believe?* That a low incident rate (2/26 sampled ADRs) in three projects is evidence the problem is not significant enough to warrant a new ADR, rather than evidence that the problem is localized and the remedy should be localized correspondingly.

**Alternative framing C: The loop-6 evidence's most consequential finding is the PLAY-refutation pattern, not the DECIDE-filter pattern.**

W7.2's evidence (Cycle 5 PLAY pulling features back; PLAY-discovered failure modes empirically motivating large modules) supports a framing where the load-bearing mechanism is PLAY — not filtering at DECIDE before BUILD, but empirical discovery after BUILD that prunes and redirects. Under this framing, the remedy is "ensure PLAY runs between every major BUILD commitment" rather than "add empirical-grounding check at DECIDE." The existing loop-6 evidence is ambiguous between these two framings: llm-orc's PLAY evidence is stronger than zani's (zani predates ADR-091 and has no recorded PLAY data), so the sample is unbalanced toward the PLAY-does-refutation pattern.

*What would the reader need to believe?* That the failure mode is better addressed at the PLAY boundary (post-BUILD empirical refutation) than at the DECIDE boundary (pre-BUILD empirical filter), and that adding PLAY checkpoints is a more reliable remedy than adding DECIDE criteria.

### Question 2: What truths were available but not featured in C7?

**Underrepresented finding: The "kitchen-sink-by-delegation" critique was identified but not investigated.**

Section 9 (META) names the "kitchen-sink-by-delegation" critique explicitly: "a project pushes generality outward to extensions rather than refusing it; the distributed artifact looks narrow but the extension surface elaborates." The research log (Loop 6.2 plexus caveat) records this as "a critic could call this kitchen-sink-by-delegation, though distributed Rust artifact is demonstrably narrow." C7's cross-project evidence shows plexus's Rust core is narrow, but plexus delegates to llm-orc/Python ensembles for extensibility. Whether that delegation moves the kitchen-sink risk outward rather than eliminating it is a question the investigation identified but explicitly did not pursue. C7's framing (kitchen-sink is localized to research-driven cascades within projects) may be overly favorable to the cross-project evidence if distributed kitchen-sink (pushed to extension surfaces) is the actual mechanism.

*Why was it excluded?* Explicitly noted as held open for future work — not an oversight but a documented scope limit. The Section 9 caveat names it. Its absence from C7's body content is appropriate (it cannot be assessed from the evidence available) but its absence from C7's claim should be visible: C7 claims kitchen-sink is localized, but the localization claim has not been tested against the distributed-elaboration form.

**Underrepresented finding: zani's YAGNI signals were stronger than C7's body presentation implies.**

The research log's zani investigation records explicit YAGNI signals (ADR-007 mid-build flip for YAGNI reasons; "Overengineering for v1" rejection language in ADR-011; no premature integration code; manual flag parsing in main.rs). C7's body (§8) uses zani primarily as the kitchen-sink counter-example (palette subsystem). The YAGNI signals in zani are mentioned in Section 8 only as the writing-app core contrast (E7.2.1), not as independent YAGNI evidence. The imbalance means C7 presents zani as primarily a kitchen-sink example rather than as a mixed case where YAGNI discipline is also visible. This is the W7.2 evidence (the asymmetry within zani is the cleanest data point), so the YAGNI signals are not entirely absent — but the presentation foregrounds the palette failure more than the core success.

### Question 3: What would change if C7's framing were inverted?

The C7 dominant framing: "The over-engineering failure mode traces to research-surveyed possibilities surviving into ADRs without empirical filter; the remedy is an empirical-grounding criterion at DECIDE."

**Inverted framing: "The over-engineering failure mode is adequately handled by existing DECIDE practice (explicit rejection/deferral language) across most projects; the two observed instances are evidence of localized implementation variation, not a systematic methodology gap requiring a new ADR criterion."**

Under the inverted framing:

*Claims that become weaker:*
- C7's W7.3 (auto-mode BUILD does NOT cause kitchen-sink) becomes less consequential — if the failure mode is rare, whether BUILD contributes is a minor question.
- The urgency of ADR-CANDIDATE-019.4 weakens: if 24 of 26 sampled ADRs show adequate YAGNI discipline without a formalized criterion, the existing felt-judgment already works for 92% of cases. Adding a formal criterion addresses edge cases, not a systematic gap.

*Claims that become stronger:*
- C6's W6.2 (entry-side calibration is felt-judgment) becomes more salient. If the felt-judgment at DECIDE already produces adequate discipline most of the time, the operationalization question is less about DECIDE criteria and more about entry-side criteria (when to apply RDD at all).
- The calibration answer (C1) becomes more confident, not less: the evidence shows the methodology already calibrates well; the inverted framing would emphasize this over the failure-mode diagnosis.

*What the document would need to address under the inverted framing:*
- Whether ADR-CANDIDATE-019.4 is solving a real systematic gap or formalizing a practice that practitioners already execute adequately.
- Whether the two observed instances (zani palette; llm-orc calibration channel) reflect practitioner error, methodology gap, or acceptable variation within the methodology's normal functioning.

**Assessment:** The inverted framing is live. C7's evidence is real but is scoped to sampled ADRs from three projects. The evidence shows the failure mode exists; it does not establish that the failure mode is common enough to warrant a new ADR criterion over the existing felt-judgment approach. C7 presents the evidence as sufficient to support ADR-CANDIDATE-019.4; the inverted framing would demand a higher evidentiary bar for that recommendation. The Section 9 caveat partially addresses this by naming the sampling scope limitation, but the body text of Section 8 and the Abstract C7 present the ADR-CANDIDATE-019.4 recommendation with more confidence than "two localized instances in a sampled corpus" strictly warrants.

### C1 vs. C7: which conclusion carries the load?

The dispatch brief specifically asks whether C7 supersedes C1 or complements it, and whether the Essay-Outline navigates this cleanly.

**The relationship:** C1 says the over-engineering question resolves into a calibration question across methodology layers. C7 says the over-engineering failure mode (where it occurs) traces to research-surveyed possibilities surviving into ADRs without empirical filter. These are not in conflict — C7 is a more specific diagnosis within the calibration framing. C7 does not supersede C1; it deepens it by naming the specific mechanism.

However, C7's Abstract text calls itself "the over-engineering question's most accurate diagnosis" while C1 calls itself "the most accurate formulation." This parallel superlative framing creates mild tension: are both the most accurate, or is one more accurate than the other? The research log's Loop 6 synthesis explicitly says: "the over-engineering question's most accurate mechanism is empirical grounding asymmetry: elaboration that is empirically grounded earns its weight." The synthesis explicitly revises and refines C1, not replaces it. But the Abstract presents both conclusions as co-equal "most accurate" framings without making the refinement relationship explicit.

**Framing issue:** A reader of the Abstract alone sees two conclusions both claiming to be the most accurate diagnosis. The relationship (C7 is a specific mechanism diagnosis within C1's calibration framing; C7 refines rather than supersedes C1) is visible in Section 8's SYNTHESIS and in the research log, but not in the Abstract itself. The Abstract would be clearer if C7 were framed as "the specific mechanism within the calibration question C1 identifies" rather than as a parallel "most accurate diagnosis."

**Severity:** P2. The two superlative framings in the Abstract create reader confusion about the hierarchy of conclusions. The body (Section 8 SYNTHESIS) navigates this correctly; the Abstract does not.

**P2 — Framing: Abstract C7 and C1 both claim superlative accuracy without establishing the refinement relationship.**

- **Location:** Abstract Section, C1 and C7 texts
- **Claim (C1):** "The over-engineering question resolves into a calibration question... not a structural rejection of any single layer."
- **Claim (C7):** Implicitly frames itself as the "most accurate diagnosis" (per the research log synthesis's language carried into Section 8 SYNTHESIS).
- **Gap:** The refinement relationship (C7 is a mechanism-level specification within C1's calibration framing) is not stated in the Abstract. A reader of the Abstract sees two "most accurate" claims and must infer the hierarchy.
- **Recommendation:** Add a one-clause qualifier to the Abstract C7 text making the hierarchical relationship explicit: "This mechanism is the specific site within C1's calibration diagnosis where the open risk concentrates" — or equivalent. The Section 8 SYNTHESIS already does this correctly.

### W7.4's agent-generated evidence framing

The Loop 6.2 investigations were conducted by parallel subagents. The Argument-Graph presents their findings in citation form parallel to external literature (e.g., "E7.1.1. (Loop 6.2 zani investigation, 2026-05-16)"). Section 9 acknowledges the sampling scope ("~8–10 ADRs in depth") but does not explicitly state the investigations were agent-conducted. A reader could reasonably assume these are the practitioner's own independent readings of the external projects.

The epistemic difference between "agent-conducted investigation of external project ADRs" and "practitioner's independent reading" is material: agent-conducted investigations may carry agent hallucination risk; specific LOC counts, ADR quote accuracy, and feature characterizations should be treated as carrying some uncertainty. The Section 9 caveat addresses sampling scope but not the agent-generation provenance of the investigations themselves.

**Severity:** P2. The framing implies independent external evidence when it is agent-generated investigation findings. The specific quotes from the investigated projects are verifiable against the cited file paths, but a reader of the Essay-Outline does not know to check them.

**P2 — Agent-generated investigations not disclosed as such in the body or Section 9 caveat.**

- **Location:** E7.1.1–E7.1.5, E7.2.1–E7.2.3, E7.3.1 (all Loop 6.2 citations); Section 9 (Loop 6 sampling scope caveat)
- **Claim:** Cross-project evidence from three external RDD applications.
- **Gap:** The investigations were agent-conducted parallel subagent dispatches, not independent practitioner readings. The Section 9 caveat names the sampling scope but not the agent-generation provenance. Readers cannot calibrate epistemic risk appropriately.
- **Recommendation:** Add one sentence to the Section 9 Loop 6 sampling scope caveat: "The investigations were conducted by parallel agent subagents dispatched on 2026-05-16; findings are reported against specific file paths that are verifiable, but LOC counts, quote accuracy, and feature characterizations carry agent-reading uncertainty."

### Framing Issues (R3)

The following framing issues are new in R3 (not carried from R2). R2 framing findings (F-P2 self-justification lean) remain as noted in R2; the partial improvement from the Section 9 distribution-of-cycle-types caveat has not regressed.

**F-R3-P2-1: Abstract C7 and C1 parallel superlative framing obscures the refinement hierarchy.** See above.

**F-R3-P2-2: Agent-generated investigations not disclosed in the body or Section 9 caveat.** See above.

**F-R3-P2-3: W7.3's "does NOT cause kitchen-sink" is an unqualified negative claim from a single-cycle anchor.**

- **Location:** Argument-Graph W7.3; Section 8 body W7.3 development
- **Observation:** This finding is shared between Section B (warrant audit) and the framing audit. At the framing level: the warrant implies a general refutation of ADR-091's named auto-mode failure mode from a single positive instance. Under the inverted framing (Question 3 above), this claim becomes even weaker — the Section 8 META-OBSERVATION's more careful framing ("the remedy site is DECIDE, not BUILD") would be more honest as the warrant label.
- **Recommendation:** Reframe W7.3 as "In the observed evidence (single cycle, one project), auto-mode BUILD did not cause kitchen-sink" rather than "does NOT cause kitchen-sink." The META-OBSERVATION's reasoning is correct and should inform the warrant label.

**F-R3-P3-1: C7's Section 9 caveat names the "kitchen-sink-by-delegation" critique as uninvestigated but does not adjust C7's confidence accordingly.**

- **Location:** Abstract C7; Section 8 SYNTHESIS; Section 9 (Loop 6 sampling scope caveat)
- **Observation:** C7 claims kitchen-sink is "localized to research-driven cascades" while acknowledging in Section 9 that the distributed-elaboration form (kitchen-sink-by-delegation) was not investigated. The combination of an unqualified Abstract claim and a META caveat naming an unverified objection is the right structure — but the Abstract C7 should carry at minimum a parenthetical "(where observed in sampled ADRs)" to match the Section 9 caveat's scope limit.
- **Severity:** P3.

---

## Section F — META Audit-Time Review

Three sections carry the META anchor: §1 (Introduction), §9 (Scope-of-claim caveats), §10 (Forward-look).

**§1 (Introduction — META): Unchanged from R2.** Confirmed non-developmental. PROVENANCE CORRECTION and SCOPE QUALIFICATION are present. No misclassification.

**§9 (Scope-of-claim caveats — META): Revised (renumbered from §8 + Loop 6 sampling scope caveat added).**

The Loop 6 sampling scope caveat added to §9 covers: ADR sample depth (~8–10), kitchen-sink-by-delegation critique (uninvestigated), feature-per-scenario heuristic roughness, and W7.3's single-cycle anchor. These are all narrowing statements, not developmental content.

The distribution-of-cycle-types limitation (added in R2 per F-P1) is correctly retained. No developmental content in §9. No misclassification.

**§10 (Forward-look — META): Revised (renumbered from §9 + ADR-CANDIDATE-019.4 added).**

ADR-CANDIDATE-019.4 is specified in §10. This specification summarizes conclusions already developed in §6 (C5 SYNTHESIS) and §8 (C7 SYNTHESIS). It is feed-forward material — recording what action the conclusions support — not new argument development. The classification is correctly META.

**ADR-CANDIDATE-019.4 consistency check with 019.1–019.3:**

- ADR-CANDIDATE-019.1 (audit-round-count calibration) — Skill-Structure Layer amendment to audit-agent skill texts.
- ADR-CANDIDATE-019.2 (Agent Outcome Test) — methodology-principle level.
- ADR-CANDIDATE-019.3 (RESEARCH patch-switching criterion) — Skill-Structure Layer amendment to `/rdd-research`.
- ADR-CANDIDATE-019.4 (empirical-grounding criterion at DECIDE) — Skill-Structure Layer amendment to `/rdd-decide`.

The four candidates operate at different loci and do not contradict each other. They are all Skill-Structure Layer or methodology-principle amendments; none alters domain model or module boundaries. The "Held open" item (per-cycle early-phase chain weight calibration as the larger Branch A amendment) is correctly distinguished from ADR-CANDIDATE-019.4 as the narrower, evidence-supported subset.

**One observation on §10 consistency:** Section 10 lists "For DECIDE: four candidate ADRs" but the second-revision narrative in Section 6 (C5 SYNTHESIS) names the reframing of Branch A's remedy as superseding the per-cycle chain-weight framing. Section 10's description of ADR-CANDIDATE-019.4 is consistent with this ("empirical-grounding filter at ADR-drafting"), and the "Held open" item correctly names the larger amendment as future-cycle. No inconsistency.

**No META misclassification found in revised sections.** §8 (C7) is correctly anchored as a developmental section, not META.

---

## Section G — Summary and Re-audit Recommendation

### Issue counts by severity (R3)

| Category | P1 | P2 | P3 |
|---|---|---|---|
| R2 baseline regressions (Section A) | 1 | 0 | 0 |
| C7 / W7.1–W7.4 warrant audit (Section B) | 0 | 3 | 0 |
| Expansion-fidelity (Section D) | 1 | 2 | 1 |
| Framing audit (Section E) | 0 | 3 | 1 |
| META misclassification (Section F) | 0 | 0 | 0 |
| Carried from R2 (P3-R2-1, EF-P3-2) | — | — | 2 |
| **Total new issues (R3)** | **1** | **5** | **2** |

Note: The P1 from Section A (Argument-Graph C5 stale) and the P1 from Section D (Boundary 1 violation for C5) are the same issue reported from two vantages. The count is 1 P1 total.

The P2 for W7.3 is reported in both Section B (warrant audit) and Section E (framing audit) — same issue, two framings. Count is 1 unique P2 for W7.3.

**Unique issue counts: P1: 1 / P2: 6 / P3: 5**

(P2 unique: W7.1 overstatement; W7.3 unqualified negative; Section 3 stale body text; C1/C7 superlative framing; agent-generated investigations undisclosed; W7.3 framing. The last two are the framing-audit view of issues already counted in warrant audit.)

**Revised unique counts after deduplication: P1: 1 / P2: 5 / P3: 4**

- P1: Boundary 1 — Argument-Graph C5 contradicts Abstract C5
- P2-R3-1: W7.1 warrant overstates the pattern ("research-driven cascades" should be "research-driven cascades without empirical filter")
- P2-R3-2: W7.3 warrant is an unqualified negative from a single-cycle anchor
- P2-R3-3: Section 3 (C2) SYNTHESIS body text is stale (states Branches A and D "recorded for future cycles")
- P2-R3-4: Abstract C1/C7 both frame themselves as the "most accurate diagnosis" without establishing the refinement relationship
- P2-R3-5: Loop 6.2 agent-generated investigations not disclosed as such in body or Section 9 caveat
- P3-R3-1: E7.4.1 practitioner gate response has no standalone References entry
- P3-R3-2: C7 Abstract/body claim "kitchen-sink localized" without caveat qualifier to match Section 9's unverified-critique acknowledgment
- P3-R2-1 (carried): W1.3 scope qualification label imprecision
- EF-P3-2 (carried): E2.3.1 coverage map not reproduced in body

### Verdict

**The Essay-Outline is NOT audit-clean at R3.** One P1 violation and five P2 findings have been introduced by or not addressed in the post-R2 revisions.

The P1 is a structural repair: the Argument-Graph C5 node must be updated to match the Abstract C5's current state. This is a single-node text update; no argument restructuring is required.

The P2 findings break into two categories:

**Precision repairs (P2-R3-1, P2-R3-2, P2-R3-3):** Three body-text corrections that bring warrant language and SYNTHESIS text into alignment with the evidence's actual scope. Each is a targeted edit in the Argument-Graph or Section 3/8 body.

**Framing repairs (P2-R3-4, P2-R3-5):** Two additions that improve epistemic transparency. P2-R3-4 requires one clause in the Abstract C7 text. P2-R3-5 requires one sentence in the Section 9 Loop 6 caveat.

None of the P1 or P2 findings require structural reorganization or additional research. All are targeted edits to existing text.

**Re-audit recommendation: R4 required.**

After the P1 repair (Argument-Graph C5 update) and the five P2 repairs are applied, an R4 audit should confirm:
1. Argument-Graph C5 now matches Abstract C5.
2. W7.1 warrant now includes "without empirical filter" qualifier.
3. W7.3 warrant is appropriately scoped to "in the observed evidence."
4. Section 3 SYNTHESIS updated to reflect both Branches A and D as in-cycle candidates.
5. Abstract C7 includes the refinement-relationship qualifier relative to C1.
6. Section 9 Loop 6 caveat includes agent-generation disclosure sentence.

If all six repairs are made without introducing new content, R4 should close clean. The framing audit's inverted-framing finding (C7's confidence level relative to the two observed instances) is noted as a gate-conversation item for the practitioner — it does not require a revision but should be explicitly acknowledged when the Essay-Outline advances to DISCOVER. The practitioner's judgment about whether ADR-CANDIDATE-019.4 is warranted by the evidence strength is the operative question at the gate.

**Gate-decision items (not revisions; surfaced for user judgment per ADR-061):**

**Gate item 1:** C7's confidence level. The cross-project evidence (two kitchen-sink instances in ~26 sampled ADRs across three projects) supports ADR-CANDIDATE-019.4 as a real remedy for an observed gap, but the evidentiary base is modest. The practitioner should confirm that ADR-CANDIDATE-019.4 is warranted at in-cycle scope (vs. held for a future cycle pending more observations), given that the existing felt-judgment at DECIDE appears to prevent kitchen-sink in the majority of the sampled cases.

**Gate item 2 (F-P2 carried from R1/R2):** The self-justification lean in the calibration framing. C7's cross-project evidence partially addresses this (by showing the failure mode is real, not just theoretical) but also reinforces the calibration answer (the remedy is at DECIDE, not structural rejection). The reflexivity risk is named; the practitioner's gate-conversation assessment from prior rounds applies.

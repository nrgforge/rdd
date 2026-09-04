# Argument Audit Report

**Audited document:** `.rdd/gates/020-decide-gate.md` (rewritten "Agent's reading" paragraph; R4/R5 log entries), `docs/decisions/adr-100-pre-triage-at-practitioner-facing-moments.md` (Context topic sentence; Provenance driver-chain line)
**Source material:** `.rdd/audits/argument-audit-decide-020-r4.md` (prior round; findings under verification); `skills/rdd/SKILL.md` Question Toolkit "Triple duty" paragraph (line 274, cited criterion); R1–R3 audits for continuity only, not re-opened
**Genre:** ADR set
**Date:** 2026-09-03
**Round:** R5 — narrow verification round per ADR-094 (round 5 fires when round 4 surfaces a new P1; R4 surfaced one framing P1). Scope: verify only the two R4 repairs (the gate note's earned-confidence paragraph; ADR-100's two leftover "two boundaries" mentions). No R1–R4 finding is re-opened on its own terms; the ADRs are not audited fresh.

## Section 1: Argument Audit

### R4 finding resolution

| R4 finding | Status | Verification |
|---|---|---|
| **P3** — ADR-100 Context's "Evidentiary character" topic sentence and the Provenance check's Driver chain line still read "two ... gates" / "two boundaries operated under the rule" while the rest of the document said three | **RESOLVED** | Context topic sentence now reads "...arrive at DECIDE grounded by stakeholder-articulated demand (ADR-097 path 2) and by what happened at **three** in-cycle gates" (line 15). Provenance check Driver chain now reads "...MODEL vocabulary → **three boundaries** operated under the rule → R1 through R4 argument and framing audits → this ADR" (line 108). Grepped the full document for `boundar` and `two|three` context: no remaining "two boundaries"/"two ... gates" undercount anywhere. The one other "two" occurrence ("Graduation trigger, two directions") refers to harm/reliance direction, a distinct concept from boundary count, and is correct as written. |

**New findings this round:** none.

## Section 2: Framing Audit

### R4 finding resolution

| R4 finding | Status | Verification |
|---|---|---|
| **Framing P1** — the gate note's reframe paragraph said "The earned-confidence test is closed for the authority ruling only, on the practitioner's fact," a narrower restatement of the same non-sequitur R3 had already flagged (a fact answering a narrow question treated as answering a broader one) | **RESOLVED** | The paragraph no longer treats the fact as dispositive. Current text: "...what the record shows is that a belief-mapping question was put ('what would you need to believe for B to be right?') and the practitioner answered it substantively, with a fact that removes B's premise. By the orchestrator's own criterion (the response to a belief-mapping question is the test of earned confidence; substantive engagement with the alternative is what passes it), the test was administered and engaged for that ruling. The fact itself does not establish adequacy under Invariant 1; the engagement does, and the next boundary's evaluator judges whether it did." Checked against the cited criterion verbatim (`skills/rdd/SKILL.md` line 274): "The response to a belief-mapping question IS the test of earned confidence — a user who engages the alternative substantively has demonstrated grounded understanding." The rewrite grounds its claim in that criterion rather than in the fact, and explicitly declines to certify that the engagement cleared the Invariant 1 bar — it defers that determination to "the next boundary's evaluator," consistent with ADR-100's own architecture (in-context triage does not self-certify; an isolated reader checks it). This is not a restatement of the flagged non-sequitur: it distinguishes what the fact does (removes B's premise) from what the criterion's satisfaction would do (demonstrate engagement occurred), and does not collapse the second into a claim of established adequacy. The three-gate trend question is separately and explicitly kept open ("stays open and is carried to the decide → architect snapshot's successor at the ARCHITECT boundary"), unchanged from the R4 version. |

### New findings this round

**P3 — Consider.**
- **Location:** `.rdd/gates/020-decide-gate.md`, "Agent's reading" paragraph, sentence: "The fact itself does not establish adequacy under Invariant 1; the engagement does, and the next boundary's evaluator judges whether it did."
- **Claim:** The clause "the engagement does" reads, in isolation, as an assertion that engagement *does* establish adequacy — which would reopen the same closure problem R4 flagged, just relocated from "the fact" to "the engagement." The immediately following clause ("and the next boundary's evaluator judges whether it did") walks this back by making the adequacy determination contingent on a future judgment, but the two clauses in sequence are elliptical enough to support a misreading on a fast pass.
- **Evidence gap:** None — this is a phrasing/clarity observation, not a logical defect. The intended reading (engagement is the right category of evidence to examine, as opposed to the fact; whether *this* engagement was substantive enough is left to an isolated future evaluator) is coherent and consistent with the rest of the paragraph, the cited criterion, and ADR-100's self-correction-blind-spot architecture. It does not reintroduce the non-sequitur it fixed.
- **Recommendation:** Optional low-priority rewording, e.g. "the engagement is the relevant evidence; whether it clears that bar is for the next boundary's evaluator to judge, not this paragraph." Does not block ARCHITECT; fold into the same low-priority sweep as any other corpus wording cleanup.

## Convergence-Saturation Signal (ADR-094)

**Convergence-Saturation Signal:** TRIGGERED
- Round number: R5
- P1 count this round: 0 (0 argument-audit P1; 0 framing-audit P1 — both R4 findings resolved without reintroducing a P1)
- P2 count this round (new, non-carry-over): 0
- New framings or claim-scope expansions: none — the repair grounds its claim in the orchestrator's pre-existing Triple Duty criterion (already part of the corpus) rather than introducing a new warrant or claim-scope characterization; the one new item this round is a P3 phrasing observation, not a framing or scope change
- Recommendation: STOP at this round

Residue this round is a single P3 clarity note (optional, non-blocking). Both R4 findings — the argument-audit P3 (boundary-count consistency) and the framing-audit P1 (earned-confidence closure claim) — are RESOLVED. The R4→R5 verification round finds nothing that reopens prior rounds' findings and no new Must-Fix or Should-Fix issue. Per ADR-094, the audit sequence for the DECIDE-phase ADR set closes at R5.

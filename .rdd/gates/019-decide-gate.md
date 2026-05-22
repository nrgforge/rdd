# Gate Reflection: Does RDD Over-Engineer? DECIDE → ARCHITECT

**Date:** 2026-05-22
**Phase boundary:** DECIDE → ARCHITECT
**Cycle:** 019 — Does RDD Over-Engineer?

## Belief-mapping question composed for this gate

The principal pedagogical move was **rebuttal elicitation** against the cycle's most consequential rejected alternative — Skill-Structure Layer enforcement of the Empirical-Grounding Filter at ADR-drafting time. The R1 argument audit's framing finding (FA-P1, originally P1) had named the alternative: *Invariant 8 argues for minimal structural anchoring at ADR-drafting time — a single workflow prompt that asks the practitioner to name one of the four grounding paths or annotate as Conditional Acceptance — not Tier-2 vocabulary that depends on the practitioner remembering to apply the felt-trigger.* The cycle rejected this on the grounds that "2 kitchen-sink instances across ~26 sampled ADRs is thin evidence for structural enforcement."

The question composed:

> *"What would have to be true for the alternative to be right? Specifically: what would you need to believe about (a) how practitioners actually apply Tier-2 felt-triggers under task load, (b) the cost of a single workflow prompt at ADR-drafting time, and (c) what counts as evidence sufficient to warrant minimal Skill-Structure Layer anchoring vs. heavy structural enforcement — for the cycle's 'thin evidence' rejection of structural anchoring to read as content-selection toward methodology-overhead-minimization rather than coherent application of the Empirical-Grounding Filter?"*

The user requested a plainer version. The plainer question:

> *"Across this cycle, the methodology kept choosing lighter options when faced with a choice — Tier-2 vocabulary instead of a small required step, named-deferrals instead of new ADRs, candidate framings instead of commitments. Six times. Each one was defensible. Six in a row — for a cycle that's specifically investigating whether RDD over-engineers — looks like something the cycle should notice. What would have to happen — in the next few cycles using ADR-097 — for you to think option 2 (the methodology quietly preferring less of itself) was the right read?"*

## User's response

The user reframed the question with a theater-director analogy:

> *"Here's an analogy: I do theater. Let's pretend I'm a director and you're an actor. When an actor is making 'middle-of-the-road' choices, a director will often say 'raise the stakes'. The idea is that choices that actors make should be clear and bold. It's way easier to dial back when you see the clear choice being made. However making conservative choices, hybrid choices, choices that mix a little of everything, feel non-committal. As a result, when we could make one big choice perhaps we engineer around 10 small choices."*

The agent took the analogy seriously and named three bold-choice options (Option A: ship one bold ADR with Skill-Structure Layer enforcement; Option B: ship zero ADRs and rely on domain-model vocabulary; Option C: ship one framework ADR with sub-mechanisms as components). The agent surfaced the tension: hedging could be evidentiary discipline working correctly OR the actor's middle-of-the-road non-commitment; both readings could be simultaneously true.

The user then escalated the observation:

> *"Well it's perhaps a bigger question. I will say that a 5-ADR set is just plain not going to be read by me. It's too much. And how many ADRs do we have in RDD? Many. I think your observation 'The filter is technically satisfied at every individual ADR; the aggregate output of the cycle is a kitchen-sink-of-small-commitments by another route' however may state what I'm sensing may be related to this overengineering problem. There's a tension between the human's working memory and attention — a bounded box — and the granularity of the process being undertaken. With 100 ADRs governing behavior, each one with its own nuance, we can certainly not keep the discipline in full-view working through RDD. So we trust it. But in the outputs I see lots of very technical prose. We may be working well overall, but I do question whether the granularity is helping or hurting the over-engineering question."*

The agent offered three reductive moves (collapse five into one; delete four and keep one; ship zero). The user chose:

> *"1 I think is wise. And yes I think it's worthy of the next cycle which I was considering could be on collapsing information into some knowledge graph type format."*

## Pedagogical move selected

**Rebuttal elicitation** against the most-consequential rejected alternative, escalated to **acknowledgment-of-cross-ADR-framing-pattern** when the user reframed via the theater-director analogy.

The agent's principal moves:
1. Presented the consolidated DECIDE artifacts (five ADRs, scenarios, interaction specs, two argument audits, conformance scan) with framing audit findings surfaced.
2. Composed the rebuttal-elicitation question against the rejected Skill-Structure Layer alternative.
3. Translated the question to a plainer form on request.
4. Engaged the user's theater-director analogy by naming three concrete bold-choice options (A: one bold ADR; B: zero ADRs; C: one framework ADR with sub-components).
5. Acknowledged honest tension (evidentiary discipline vs. actor hedging — both could be simultaneously true).
6. Surfaced three reductive options when the user named the working-memory-budget concern.
7. Executed Option 1 (consolidate to one ADR) per user directive.

Two diagnostic observations the agent made explicit:
- The five-ADR set was potentially **the C7 mechanism operating at the corpus level** — research-driven possibility surviving into a corpus of governance artifacts at a granularity that exceeds the practitioner's working-memory budget, technically passing the Empirical-Grounding Filter at each individual ADR while failing at the aggregate level.
- The agent's own multi-section gate response was itself "doing it inside this conversation, same as the cycle did across DECIDE" — the granularity-hurting pattern operating in the gate-presentation form.

## Commitment gating outputs

**Settled premises (the user is building on these going into ARCHITECT):**

- ADR-097 (consolidated) is the cycle's single architectural commitment: **Empirical-Grounding Filter at DECIDE (Tier-2 methodology-principle level)** with four grounding-mechanism paths (PLAY evidence; stakeholder-articulated demand; spike validation; structural operationalization), workflow scaffolding for audit-saturation signal and RESEARCH patch-switching as Skill-Structure Layer skill-text amendments at BUILD, the Agent Outcome Test scope folded into the Decision section as scope-noted vocabulary, and FF1 + FF3 named-deferrals as a single paragraph.
- The four sub-ADRs (094, 095, 096, 098) are deleted from `docs/decisions/`. They existed at Proposed status only — no supersession workflow required.
- Domain-model Amendment #27 records the consolidation. The 24 concepts added at Amendment #25 and the three concepts qualified at Amendment #26 remain authoritative.
- Knowledge-graph corpus collapse is named as the next-cycle research question (Open Questions entry under Cycle 019).
- The Methodology Compromise (no R3 audit dispatched on the consolidated ADR) is recorded explicitly — dispatching R3 on the consolidated form would itself instantiate the audit-rate-of-accretion concern the consolidation responds to.
- The Three-Application F-P2 Pattern remains held as the question DECIDE acknowledges; the consolidation is potentially a seventh scope-limiting choice or potentially the cycle's reflexive correction. Both readings remain coherent; the multi-cycle graduation trigger (ADR-097) is the test.

**Open questions (the user is holding these open going into ARCHITECT):**

- **The corpus-level granularity question** — whether the rate of ADR accretion across RDD's full corpus (~100 ADRs) is itself an over-engineering signal that the methodology's current criteria don't catch. Named as future-cycle research question.
- **The knowledge-graph corpus collapse question** — practitioner-named future-cycle topic: can methodology corpus information be collapsed into a knowledge-graph-type format that respects working-memory bounds while preserving the corpus's audit-trail integrity?
- **The five-to-one consolidation as a fresh F-P2 instance** — whether the DECIDE-gate consolidation is the cycle's reflexive correction of the granularity pattern OR another instance of the same pattern (the cycle preferring less of itself again). The graduation trigger for ADR-097 is the multi-cycle test.
- **The skipped R3 audit as a methodology gap** — recorded as a Methodology Compromise; the susceptibility snapshot at the decide → architect boundary may surface this as a finding.
- **Framing findings carry-forward to ARCHITECT** — FA-P1 (degraded P2: cross-ADR cognitive overhead) was partially addressed by consolidation; FA-P2 (Skill-Structure Layer / Tier-2 tier-assignment asymmetry) remains unaddressed; FA-P3 (no mechanism for MODEL-gate Practitioner-Originated Framing Absorption) is acknowledged via ADR-097's named-deferrals.

**Specific commitments carried forward to ARCHITECT:**

1. **ADR-097 is the cycle's architectural decision** — ARCHITECT inherits ADR-097 + the existing system-design.md + domain-model.md as the constraint set. The system-design impact is minimal: ADR-097's workflow scaffolding (saturation signal at audit-round-end; patch-switching at research-loop-end) are skill-text amendments at BUILD; ARCHITECT confirms these are appropriately scoped and do not require module-boundary changes.
2. **BUILD debt is recorded in the conformance scan** — argument-auditor.md (both argument-audit and framing-audit sections per ADR-061) + citation-auditor.md need the saturation-signal verdict-line step; skills/research/SKILL.md line 147 area needs the Patch-Switching Criterion criterion block. Both are small, localized skill-text amendments.
3. **Three Open Questions carry-forward** — corpus-level granularity question; knowledge-graph format question; consolidation-as-F-P2-instance question. ARCHITECT does not need to resolve these; the next-cycle research scope handles them.
4. **Framing findings FA-P1 (degraded), FA-P2, FA-P3 + FA-R2-P3b** — carry forward to ARCHITECT as feed-forward; ARCHITECT may surface them in the system-design's scope-of-claim section or fold them into the responsibility matrix's provenance entries.
5. **Reflexivity caveat carried forward** — Cycle 019's findings are research-not-validation; the DECIDE-gate consolidation is itself a practitioner-originated framing the methodology audit machinery did not cover; future cycles applying ADR-097 produce the validation evidence Cycle 019 cannot.
6. **Methodology Compromise on skipped R3 audit** — recorded explicitly here; the susceptibility snapshot at the decide → architect boundary is the methodology's compound defense for this specific gap.
7. **The cycle's BUILD mode is appropriate as auto-mode** per ADR-091 mode-selection axes (mechanical-vs-generative: mechanical; practitioner availability: standard; cycle stakes: moderate; stewardship locality: catching-dominant). The Cycle 019 BUILD work is two small skill-text amendments (saturation signal + patch-switching criterion). Confirmed at BUILD entry.

---

## Addendum — R3 audit + restoration (2026-05-22)

After the gate reflection was first written, two further substantive events occurred at the DECIDE → ARCHITECT boundary:

**R3 narrow audit on the consolidated ADR-097** (dispatched per the decide→architect susceptibility snapshot's clearest finding — the skipped R3 was not actually a defensible Methodology Compromise; the consolidated ADR introduced new content the auditor had not seen). R3 verdict: NOT TRIGGERED — 0 P1, 3 P2-new (exceeds ≤1 threshold), 3 new framing findings (1 P1, 1 P2, 1 P3 by severity). All R1+R2 prior findings verified preserved in consolidated form (no repair regression).

R3 argument-audit corrections applied to the consolidated form: P2-R3-1 (Agent Outcome Test scope-note restored); P2-R3-2 (C7-at-corpus-level placement qualifier); P2-R3-3 (form-change baseline-reset rule — load-bearing methodology insight operationally demonstrated by R3 itself); P3-R3-1 (audit trail as recovery path); P3-R3-2 (graduation trigger conditional, held as optional refinement).

**R3 framing audit surfaced FA-R3-P1 (P1 severity):** the consolidation moment did not surface "five ADRs + reading-path artifact" as an option — the practitioner chose between three options that did not include the alternative most directly addressing the working-memory-budget concern.

**Practitioner decision at FA-R3-P1 resolution:** revisit the consolidation. The five ADRs were restored to their standalone form (ADR-094 with form-change baseline-reset rule from R3; ADR-095, ADR-096 with R1+R2 corrections; ADR-097 rewritten back to standalone Empirical-Grounding Filter scope dropping consolidation rationale + Workflow scaffolding + Agent Outcome Test fold-in + Named-deferrals; ADR-098 with R1+R2 corrections). New reading-path artifact at `docs/decisions/cycle-019-adr-index.md` addresses the working-memory-budget concern without structural deletion.

**Domain-model Amendment #28** supersedes Amendment #27 (the consolidation), recording the restoration explicitly and noting the reflexive pattern: the DECIDE phase made three structural shifts (5 ADRs → 1 ADR → 5 ADRs + reading-path). Each shift was defensible at the moment; the aggregate is the methodology working through its own central research question in real time. Future cycles' practitioners may recognize this pattern when facing similar structural-form decisions: **surface the full option set including navigation-artifact alternatives before structural deletion.**

**Carry-forward to ARCHITECT (revised):**

1. **Five ADRs at standalone scope** with the reading-path artifact as navigation layer. ARCHITECT inherits the corpus as restored.
2. **BUILD debt unchanged**: two skill-text amendments (ADR-094 in `argument-auditor.md` + `citation-auditor.md`; ADR-096 in `skills/research/SKILL.md`).
3. **The form-change baseline-reset rule** (added to ADR-094 at R3) is a methodology-level insight; the R3 audit operationally demonstrated it by catching new content the R2 verdict on the prior form would have suppressed.
4. **The reflexive pattern** (three structural shifts in one DECIDE phase) is recorded as observational evidence for the cycle's central research question; future cycles applying the cycle's findings inherit this as a recorded methodology-level pattern.
5. **Knowledge-graph corpus collapse** remains the practitioner-named next-cycle research topic, now reinforced by the reading-path artifact's emergence (the index pattern as one structural answer to the reading-burden concern; the knowledge-graph format as the future-cycle research scope).

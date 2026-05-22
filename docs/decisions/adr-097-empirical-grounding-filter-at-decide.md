# ADR-097: Empirical-Grounding Filter at DECIDE (Tier-2 Methodology Vocabulary)

**Status:** Accepted

## Context

Cycle 019's research (essay-outline-018-does-rdd-over-engineer.md) named C7 — *the over-engineering failure mode, where it occurs, traces to research-surveyed possibilities surviving into ADRs without empirical filter (PLAY evidence; stakeholder-articulated demand; spike validation)*. Loop 6's cross-project investigation across zani, llm-orc, and plexus (~26 ADRs sampled in depth) showed YAGNI as the dominant pattern when DECIDE applies empirical filter; kitchen-sink as the localized failure mode when DECIDE does not.

The cycle's Essay-Outline §10 ADR-CANDIDATE-019.4 named the Branch A remedy: an empirical-grounding criterion at DECIDE. The MODEL gate's Distributed Remedy Architecture commitment (per option A) located ADR-019.4 as the DECIDE-layer component of a candidate distributed remedy that places PLAY-as-Filter as load-bearing. The R5 audit (2026-05-22) narrowed the Distributed Remedy Architecture to candidate framing for future-cycle development: one PLAY-filter instance (llm-orc Cycle 5) alongside two DECIDE-primary instances (plexus ADR-038 explicit refusal; plexus ADR-024 YAGNI cancellation) and one mechanism-fired-without-PLAY case (zani palette) does not warrant naming PLAY as load-bearing at this evidence level. DECIDE remains the primary remedy site (Abstract C7 unchanged).

Three carry-forward questions from the MODEL gate (Targets 1–3 and methodology FFs) inform this ADR's drafting:

- **Target 2:** under what conditions would the Zani palette qualify as kitchen-sink outcome rather than valued elaboration? Without a discriminating criterion, the YAGNI ≠ Minimalism domain concept (Cycle 019 Amendment #25) creates a complementary vocabulary that could absorb any large elaboration the practitioner finds valuable as YAGNI-compliant.
- **Target 3:** does ADR-019.4 function as a standalone remedy if PLAY is not consistently used, or does it only function as a pre-filter in a system where PLAY is the expected follow-on?
- **Fifth-ADR scope:** whether the PLAY-as-Filter / corpus-update protocol ships in Cycle 019 or carries forward to a future cycle.

The Tier-2 scope (felt-judgment-anchored, no Skill-Structure Layer enforcement) was settled at the R3 framing-finding integration during the cycle's argument-audit and confirmed at the DISCOVER gate: the cross-project evidence (2 kitchen-sink instances across ~26 sampled ADRs from three external projects) supports recognition-naming-pattern-as-methodology-vocabulary but does not yet support structural enforcement. The cycle's reflexive logic: proposing heavy structural enforcement from thin evidence would itself instantiate the research-driven-cascade-without-empirical-filter pattern C7 names.

## Decision

The methodology adopts the **Empirical-Grounding Filter at DECIDE** as a Tier-2 methodology-principle level vocabulary amendment.

### The filter

When an ADR commits to a feature based on research-surfaced possibility, the practitioner-and-agent dyad applies the felt-trigger question at ADR-drafting time:

> *"Is this commitment empirically grounded — by PLAY evidence, stakeholder-articulated demand, or spike validation — or is it surviving from research without empirical filter?"*

When the answer is **empirically grounded**, the ADR is drafted normally and proceeds through DECIDE's standard process.

When the answer is **not yet empirically grounded**, the ADR takes one of two forms (institutional patterns from llm-orc):

- **(a) Conditional Acceptance annotation.** The ADR is accepted with the status annotation *"conditional acceptance — first-deployment evidence pending."* The ADR is committed; future evidence either confirms the commitment (status transitions to Accepted) or surfaces the kitchen-sink failure mode (status transitions to Superseded or Deprecated per ADR-074 workflow). llm-orc ADR-016 is the institutional reference: conditionally accepted at draft time; transitioned to full acceptance at WP-H4 close 2026-05-12 via DECIDE-phase spikes + BUILD-phase validation (per R5 audit P2-R5-3 correction).
- **(b) `adr-deferred-` filename pattern.** The ADR is filed with the filename prefix `adr-deferred-NNN-<slug>.md` rather than `adr-NNN-<slug>.md`. The ADR is named and its research basis recorded but commitment is held until empirical grounding accrues. The filename pattern makes deferral visible at the file-system level; future cycles can promote (rename to `adr-NNN-...`) or cancel (per plexus ADR-024 institutional pattern).

The choice between (a) and (b) is the practitioner's call at drafting time, informed by whether the commitment is *expected to land* (favor Conditional Acceptance; the structural lock is taken, validation is pending) or *requires further deliberation before commitment* (favor adr-deferred-; the commitment itself is not yet warranted).

### Four grounding-mechanism paths

Per the R5 audit (P2-R5-3 + discovered-during-source-reading finding), the cycle's evidence base recognizes **four grounding-mechanism paths** by which an ADR can be empirically grounded:

1. **PLAY evidence** — post-BUILD experiential validation (per the PLAY phase). llm-orc Cycle 5 is one observed case.
2. **Stakeholder-articulated demand** — a named stakeholder has expressed the need at DISCOVER (per product-discovery.md stakeholder map and jobs).
3. **Spike validation** — a research-spike has tested the commitment's mechanics against the codebase or against external system behavior.
4. **Structural operationalization** — the commitment is operationalized through DECIDE-phase spikes + BUILD-phase validation, transitioning a Conditional Acceptance to full Acceptance via demonstrable working code rather than via post-deploy evidence. llm-orc ADR-016's WP-H4 close (2026-05-12) is the institutional reference.

The four paths are not mutually exclusive; an ADR may be grounded through multiple paths. The point is that the methodology recognizes more than one structural answer to the felt-trigger question.

### Target 2 — Discriminating criterion (mechanism vs. outcome)

The R5 audit (P2-R5-1) named the discriminating-criterion question: the Kitchen-Sink Mechanism vs. Kitchen-Sink Outcome distinction in the domain model (per Amendment #25) inherits the same Tier-2 structural limit as this ADR. The mechanism-vs-outcome distinction's operational test — what makes a fired mechanism a kitchen-sink outcome rather than a valued elaboration — rests on the same four grounding-mechanism paths. Where none of the four paths grounds the outcome judgment, "outcome valued" is practitioner-judgment-alone.

The Zani palette case is illustrative: the C7 mechanism fired (research → essay → ADR-as-invariant → BUILD; no PLAY filter; no stakeholder pull recorded per E7.1.1); the practitioner characterized the outcome as valued at the MODEL gate; but the four grounding-mechanism paths were not invoked at the time. The outcome judgment rests on practitioner judgment alone in this case — the same Tier-2 structural limit the cycle's evidence base supports.

**This ADR does not resolve the discriminating-criterion question.** The methodology recognizes that outcome judgment, like ADR-grounding, rests on the four paths; where none is invoked, the judgment is practitioner-felt-trigger. The Tier-2 vocabulary's operational status is subject to multi-cycle observation per the graduation trigger below.

### Target 3 — Standalone-at-commitment-time (Decision: standalone)

**Decision: ADR-019.4 (this ADR) functions as a standalone remedy at commitment time.** The filter applies at DECIDE for ADR-drafting time, and the grounding mechanisms it recognizes do not require PLAY to be present.

**Two senses of "standalone" (per R2 audit P1-B 2026-05-22):** the standalone claim concerns the **commitment mechanism** — an ADR can be drafted, committed, and annotated as Conditional Acceptance without PLAY as a precondition. It does **not** claim the filter provides complete empirical grounding at DECIDE-time in all cases. Path 4 (structural operationalization) explicitly demonstrates that grounding can arrive **post-commitment** via BUILD-phase validation. Paths 1 (PLAY evidence) and 3 (spike validation) can also produce grounding timelines that extend beyond DECIDE-time. The Conditional Acceptance annotation is the methodology-recognized lifecycle state for these cases. Future cycles applying ADR-097 should distinguish:
- **Commitment-time standalone**: ADR can be drafted and committed (possibly as Conditional Acceptance) without PLAY.
- **Grounding-completion standalone**: empirical grounding closes at the moment of commitment (only path 2 typically closes at DECIDE-time when stakeholder demand is already articulated).

### Fifth-ADR scope decision: carry forward

**Decision: the candidate fifth ADR (PLAY-as-Filter / corpus-update protocol) carries forward to a future cycle.**

The R5 narrowing recalibrated the Distributed Remedy Architecture to candidate framing for future-cycle development. Shipping a fifth ADR for PLAY-as-Filter / corpus-update protocol within Cycle 019 would commit a methodology amendment whose evidentiary warrant is below the cycle's own C7 criterion.

### Three-Application F-P2 Pattern — held explicitly

The MODEL-gate susceptibility snapshot named the Three-Application F-P2 Pattern: scope-limiting reasoning applied at three consequential junctures in a cycle investigating whether RDD over-engineers. The R5 narrowing potentially adds a fourth instance, and this ADR's fifth-ADR-carry-forward decision potentially adds a fifth.

**The pattern is held as the question DECIDE acknowledges explicitly, not as a finding the cycle resolves.** Cycle 019's evidence base — agent-conducted cross-project investigations; single-cycle reflexive critique — does not separate the readings (coherent application of C7 vs. content-selection toward methodology-overhead-minimization).

**Outside-reader acknowledgment (per R2 audit P2-4 2026-05-22):** DECIDE accepts that a practitioner reading the cycle's outputs from outside the cycle would have grounds to observe that the cycle's evidence base is consistent with the content-selection reading. **DECIDE's operating commitment to graduation triggers is explicit and accountable, not aspirational** (per R2 audit P3-R2-1 + FA-R2-P3b 2026-05-22 — "structural" in Invariant 8's sense means Skill-Structure / Harness / User-Tooling Layer enforcement, which the graduation triggers do not have; "explicit and accountable" names what the commitment actually carries): if graduation triggers do not fire despite their conditions being met in future cycles, the content-selection reading would be confirmed and the methodology would have to revisit the Tier-2 scope choices retrospectively.

### Graduation trigger

After 2–4 cycles apply the Empirical-Grounding Filter, a Loop 6-style cross-project assessment (essay-outline §10 carry-forward) measures whether the kitchen-sink failure mode persists. If yes, the larger Branch A amendment (per-cycle chain-weight calibration with mode-selection axes — analog of ADR-091 dual-mode BUILD applied to upstream phases) becomes the next move. The current ADR is the narrower, evidence-supported subset.

### Encoding

The Empirical-Grounding Filter is encoded at Tier-2 methodology-principle level:

- `docs/domain-model.md` Concepts table — Empirical-Grounding Filter as named concept (Amendment #25); Conditional Acceptance and adr-deferred- Filename Pattern as institutional patterns (Amendment #25).
- `docs/decisions/adr-097-empirical-grounding-filter-at-decide.md` — this ADR as the historical record.
- The orchestrator's "Important Principles" section — the felt-trigger question is available at ADR-drafting time without being a Skill-Structure Layer hook.

## Rejected alternatives

**A. Skill-Structure Layer enforcement at ADR-drafting** (e.g., a /rdd-decide step that requires the practitioner to invoke one of the four grounding paths). Rejected because the cross-project evidence base (2 kitchen-sink instances across ~26 sampled ADRs) does not warrant structural enforcement. The cycle's reflexive logic: heavy structural amendment from thin evidence would itself instantiate the C7 pattern. The Tier-2 scope is the methodology's recognition-without-enforcement posture; the graduation trigger names the conditions under which Skill-Structure Layer enforcement would be warranted.

**B. Per-cycle chain-weight calibration with mode-selection axes (the larger Branch A amendment).** Rejected as out-of-scope for Cycle 019; held as a future-cycle candidate per the graduation trigger.

**C. Empirical-Grounding Filter as an Invariant amendment (constitutional-level).** Rejected because the filter is a methodology-vocabulary amendment, not a constitutional-level commitment. The existing Invariants (especially Invariant 0, Invariant 4, Invariant 8) accommodate the Empirical-Grounding Filter at the methodology-principle level.

**D. Couple ADR-097 to a fifth ADR for PLAY-as-Filter / corpus-update protocol.** Rejected per the fifth-ADR-scope decision above. Coupling would commit Cycle 019 to a methodology amendment whose evidentiary warrant (one PLAY-filter instance) is below the cycle's own C7 criterion. Standalone with four grounding-mechanism paths is the evidentially-warranted scope.

**E. Resolve the Kitchen-Sink Mechanism vs. Outcome discriminating-criterion question in this ADR.** Rejected because the question's resolution depends on the same evidence base the ADR's Tier-2 scope reflects. The cycle's recognition: the question is real and the multi-cycle graduation trigger is the appropriate response.

## Consequences

**Positive:**
- The C7 failure mode has a named, methodology-recognized remedy at DECIDE.
- The four grounding-mechanism paths make the filter's operational scope explicit.
- The institutional patterns (Conditional Acceptance; adr-deferred- Filename Pattern) are imported from llm-orc into the methodology vocabulary.
- The Tier-2 scope honors the cycle's reflexive criterion: heavy enforcement from thin evidence is itself the pattern under critique.
- The graduation trigger names the conditions for revisiting Skill-Structure Layer enforcement.

**Negative:**
- The Tier-2 scope is felt-judgment-anchored — practitioners who fail to apply the filter are not constrained by it. This is the named structural limit and is held explicitly.
- The Three-Application F-P2 Pattern is held as an unresolved question; future cycles' practitioners may inherit it as a methodology-level concern they cannot independently resolve.
- The discriminating-criterion gap (Target 2) is acknowledged but not resolved. The Kitchen-Sink Mechanism vs. Outcome distinction in the domain model could function as a conceptual escape hatch absorbing any elaboration the practitioner later values. The ADR records the limitation but does not close it.

**Neutral:**
- The fifth-ADR carry-forward decision means the Distributed Remedy Architecture lives as candidate framing in the domain model (Amendment #26) without an associated ADR.
- The filter's vocabulary (Conditional Acceptance; adr-deferred-) overlaps with existing llm-orc institutional practice. The methodology adopts the vocabulary from llm-orc.

## Provenance check

- **Kitchen-Sink Mechanism** and **Kitchen-Sink Outcome** as named concepts: domain model Amendment #25 + #26 (Cycle 019, MODEL phase + R5 narrowing).
- **Empirical-Grounding Filter** as named concept: domain model Amendment #25 (Cycle 019, MODEL phase).
- **Conditional Acceptance** and **adr-deferred- Filename Pattern** as named institutional patterns: domain model Amendment #25 (Cycle 019, MODEL phase).
- **Calibration Move** as named concept: domain model Amendment #25 (Cycle 019, MODEL phase).
- **Distributed Remedy Architecture** as candidate framing: domain model Amendment #26 (Cycle 019, R5 narrowing).
- **Practitioner Agency (load-bearing)** as named concept: domain model Amendment #25 (Cycle 019, MODEL phase).
- **Three-Application F-P2 Pattern** as named concept: domain model Amendment #25 (Cycle 019, MODEL phase).
- **C7 mechanism** with R5 narrowing: essay-outline-018 §8 (W7.1 amended; W7.3 narrowed; §9 R5 narrowing entry).
- **Four grounding-mechanism paths**: PLAY evidence per essay-outline §8 W7.2; stakeholder demand per essay-outline §8 W7.1 + product-discovery.md stakeholder map; spike validation per essay-outline §8 W7.1 ADR-CANDIDATE-019.4 enumeration; structural operationalization per R5 audit P2-R5-3.
- **Cross-project evidence anchor**: plexus ADR-038 + plexus ADR-024 + llm-orc ADR-016 + zani palette subsystem.
- **Driver chain:** essay-outline-018 C7 + §10 ADR-CANDIDATE-019.4 + MODEL-gate option (A) + R5 narrowing + Cycle 019 MODEL gate settled premises → ADR-097.

Drafting-time synthesis (not from the driver chain): the explicit naming of "four grounding-mechanism paths" as a set; the specific phrasing of the felt-trigger question, the (a)/(b) choice criteria, the graduation-trigger's "2–4 cycles" specificity, and the Three-Application F-P2 Pattern's framing in this ADR's Decision section are drafting-time synthesis.

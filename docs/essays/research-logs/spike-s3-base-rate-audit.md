# Spike S3: Base-Rate Audit of Tier 1 Mechanism Execution
*2026-04-07*

## Spike Question

Are the six failures reported in Issue #9 representative of typical Cycle 9 mechanism behavior, or are they outliers? What does the existing RDD artifact corpus reveal about the actual base rate of Tier 1 mechanism execution?

## Method

Walked four directories with `ls -la` and `Glob`/`Grep`:

- `/Users/nathangreen/Development/rdd/docs/essays/` (essays 001–013)
- `/Users/nathangreen/Development/rdd/docs/housekeeping/audits/` (all audit-type artifacts)
- `/Users/nathangreen/Development/rdd/docs/essays/reflections/` (paired with essays)
- `/Users/nathangreen/Development/rdd/docs/decisions/` (ADRs 001–062)
- `/Users/nathangreen/Development/rdd/docs/cycle-archive/`

For each Tier 1 mechanism, read the introducing ADR to verify when it was added. Counted artifacts by filename prefix (citation-audit-NNN, argument-audit-NNN, research-design-review-NNN, susceptibility-snapshot-*). Cross-referenced against essays existing at the time the mechanism was introduced. Computed N/M for each mechanism with explicit denominators.

No code was needed; the corpus is small enough to inspect by hand.

## Corpus Inventory

### Essays

| Cycle | Essay | mtime |
|---|---|---|
| 1 | 001-pedagogical-epistemology-of-rdd.md | Mar 24 |
| 2 | 002-product-discovery-in-rdd.md | Mar 24 |
| 3 | 003-synthesis-as-final-epistemic-act.md | Mar 24 |
| 4 | 004-orientation-document-as-artifact-entry-point.md | Mar 24 |
| 5 | 005-roadmap-field-guide-and-document-sizing.md | Mar 24 |
| 6 | 006-outline-as-exhibition.md | Mar 24 |
| 7 | 007-rdd-as-plugin-architecture.md | Mar 25 |
| 8 | 008-play-and-interaction-specification.md | Mar 25 |
| 9 | 009-adaptive-epistemic-gates.md | Mar 30 |
| 10 | 010-code-review-as-epistemic-practice.md | Mar 31 |
| 11 | 011-building-with-understanding.md | Apr 2 |
| 12 | 012-trading-fours.md | Apr 3 |
| 13 | 013-sycophancy-and-rdd-reflexivity.md | Apr 5 |
| 14 | (in progress, not yet written) | — |

Note: essays 001–007 share an mtime cluster of Mar 24, suggesting they were imported or backfilled together rather than authored sequentially in real time. Audits start sharply at essay 008 (Mar 25). This is consistent with the methodology being self-applied starting from essay 008.

### Audits (in `docs/housekeeping/audits/`)

**Citation audits (essay-paired):** 008, 009, 010, 011, 012, 013 — six files

**Argument audits (essay-paired):** 008, 009, 010, 011, 012, 013 — six files

**Argument audits (ADR-set, not essay-paired):**
- argument-audit-decide-010.md
- argument-audit-decide-037-039.md
- argument-audit-decide-040-042.md
- argument-audit-decide-048-054.md
- argument-audit-decide-055-062.md

**Argument audits (other):** argument-audit-manifesto.md, argument-audit-manifesto-v2.md

**Research design reviews:** research-design-review-014.md — one file (Cycle 10, the current cycle)

**Susceptibility snapshots:** None. Zero files matching `susceptibility-*` or `*snapshot*` anywhere in the docs tree. (Verified by `ls` in `audits/` and a tree-wide `Grep` for "susceptibility|snapshot" — only spec/research files mention the term; no artifact files exist.)

**Conformance scans:** conformance-scan-040-042.md, conformance-scan-048-054.md, conformance-scan-build-verification.md (orthogonal to this spike but worth noting as evidence the audit infrastructure does fire when invoked).

### When each Tier 1 mechanism was added

Verified directly from ADRs:

- **citation-auditor and argument-auditor** — introduced as specialist subagents in **ADR-032** ("Extract Specialist Subagents from Phase Skills"). ADR-032 lists both in its decision table with `/rdd-research` Step 4a/4b and `/rdd-synthesize` Step 6 as their original loci. ADR mtime is consistent with the audit corpus starting at essay 008. Both auditing acts existed earlier as inline skill steps; ADR-032 extracted them into specialist subagents. Treat them as **active from essay 008 onward** for coverage purposes.
- **research-methods-reviewer** — introduced in **ADR-060** ("Research Methods Subagent"). ADR mtime Apr 6. Active from **Cycle 10 onward** (the cycle that produced ADR-060 was Cycle 9, but the mechanism was an output of Cycle 9, not used during it).
- **argument-auditor with framing audit** — extension to the existing argument auditor introduced in **ADR-061** ("Framing Audit as Argument Auditor Extension"). ADR mtime Apr 6. Active from **Cycle 10 onward**.
- **susceptibility-snapshot-evaluator** — introduced in **ADR-057** ("AID Susceptibility Extension with Inline Observation and Isolated Evaluation"). ADR mtime Apr 6. Active from **Cycle 10 onward**.

ADR-058 ("Unconditional Architectural Floor") establishes that all four are Tier 1 unconditional mechanisms that "fire regardless of context, not subject to agent or user relaxation."

## Base-Rate Table

Legend: ✓ = expected and present; ✗ = expected and missing; N/A = mechanism did not exist at the time.

| Cycle | Essay | Citation audit | Argument audit (essay) | Research-methods review | Susceptibility snapshot |
|---|---|---|---|---|---|
| 1 | 001 | N/A | N/A | N/A | N/A |
| 2 | 002 | N/A | N/A | N/A | N/A |
| 3 | 003 | N/A | N/A | N/A | N/A |
| 4 | 004 | N/A | N/A | N/A | N/A |
| 5 | 005 | N/A | N/A | N/A | N/A |
| 6 | 006 | N/A | N/A | N/A | N/A |
| 7 | 007 | N/A | N/A | N/A | N/A |
| 8 | 008 | ✓ | ✓ | N/A | N/A |
| 9 | 009 | ✓ | ✓ | N/A | N/A |
| 10 | 010 | ✓ | ✓ | N/A | N/A |
| 11 | 011 | ✓ | ✓ | N/A | N/A |
| 12 | 012 | ✓ | ✓ | N/A | N/A |
| 13 | 013 | ✓ | ✓ | N/A | N/A |
| 14 | (current) | (pending essay) | (pending essay) | ✓ | ✗ |

A subtlety: framing audit (Tier 1 since ADR-061) is not in this table because no essay-paired argument audit has been produced *since* the framing-audit extension was added — Cycle 10's essay 014 is not yet written, and all existing argument-audit-NNN files predate ADR-061. Coverage rate for framing audit is therefore N=0/M=0 (no opportunities yet). This is itself a finding: the framing audit's first real-world test is essay 014.

## Cycle 9 Reflexive Case

The crucial question: did Cycle 9 (essay 013) use the mechanisms it created on its own production?

**Citation auditor (pre-existing):** YES — `citation-audit-013.md` exists, mtime Apr 4.
**Argument auditor (pre-existing):** YES — `argument-audit-013.md` exists, mtime Apr 4.
**Argument audit on Cycle 9's own ADR set (055–062):** YES — `argument-audit-decide-055-062.md` exists, mtime Apr 6. Note: this is dated *after* essay 013's mtime, meaning the ADR set was audited as a group after essay publication, consistent with normal `/rdd-decide` flow.

**Research methods reviewer:** N/A — the mechanism was an *output* of Cycle 9 (ADR-060). It could not have been used during Cycle 9's own research because it did not yet exist.
**Framing audit extension:** N/A — also an output of Cycle 9 (ADR-061). The argument audit on essay 013 was the pre-extension version.
**Susceptibility snapshot:** N/A — also an output of Cycle 9 (ADR-057). No snapshot artifact was produced during Cycle 9.

**Reflexive verdict:** Cycle 9 used the *pre-existing* Tier 1 mechanisms on its own production (citation + argument auditors fired on essay 013 and on the ADR set). Cycle 9 did NOT bootstrap any of the *new* mechanisms it specified. This is structurally inevitable — a mechanism specified in cycle N's output cannot have fired during cycle N's own research — but it is also exactly the dynamic Issue #9 describes: the methodology can specify a mechanism without that mechanism actually running on the artifact that specified it. Cycle 9 is the in-corpus example of the gap.

## Cycle 10 (current) provisional check

What Tier 1 artifacts have been produced so far for Cycle 10:

- **research-design-review-014.md** — present, mtime Apr 6. The research-methods-reviewer was dispatched at the start of the cycle (per the task list). ✓
- **citation-audit-014.md** — does not exist yet; the essay has not been written.
- **argument-audit-014.md** — same. The framing-audit extension will get its first real test here.
- **Susceptibility snapshot at any phase boundary:** none. Zero files.

Phase-internal moments where a snapshot *could* have been dispatched but wasn't: at minimum, the user pushback moment that produced Track C (the meta-framing audit of the original Issue #9 framing) was the kind of event ADR-057 names as a susceptibility signal — agent framing being challenged by user input. The orchestrator did not dispatch a snapshot. This is a current-cycle data point about orchestrator behavior under task immersion: even within a cycle whose explicit subject is silent specification-execution gaps, the snapshot mechanism has fired zero times.

## Computed Base Rates

Using essays where the mechanism existed at the time, with explicit numerator and denominator:

- **Citation audit coverage:** 6/6 (100%). Essays 008–013 all have a `citation-audit-NNN.md`.
- **Argument audit (essay-paired) coverage:** 6/6 (100%). Essays 008–013 all have an `argument-audit-NNN.md`.
- **Research-methods-reviewer coverage:** 1/1 (100%). The only cycle in which the mechanism existed at the start of the research phase is Cycle 10, and `research-design-review-014.md` exists. (Denominator is 1 — flagged honestly.)
- **Susceptibility snapshot coverage:** 0/M (0%) where M = "phase boundaries that occurred after Cycle 9 added the mechanism." Cycle 10 has crossed at least one phase-internal moment that ADR-057 would name as a triggering condition (the Track C reframe, plus an unknown number of internal phase transitions). M is at least 1, plausibly several. The numerator is unambiguously **zero**. There is no susceptibility-snapshot artifact file anywhere in the docs tree.

For the framing-audit extension specifically: 0/0 (no essay produced since the extension was added; denominator is structurally zero, not a failure).

## Interpretation

The base rates separate cleanly into two regimes:

**Pre-Cycle-9 mechanisms (citation auditor, argument auditor): 100% coverage.** Once the mechanism existed in the methodology, it fired on every essay and on every ADR group. This is striking given the small N — six essays — but it is what the corpus shows. There are no missing audits between essay 008 (when the auditing infrastructure went live) and essay 013 (the most recent). The specialist subagent dispatch architecture (ADR-032) appears to have produced reliable execution for the two original auditors.

**Cycle-9-introduced mechanisms (research-methods-reviewer, framing audit, susceptibility snapshot): mixed.** The research-methods-reviewer fired the first time it was supposed to (Cycle 10), denominator 1. The framing audit has not yet had an opportunity (denominator 0). The susceptibility snapshot has fired **zero times out of any non-zero number of opportunities** since it was introduced.

The interpretation that fits the data:

1. **The Issue #9 failures are not representative of all Tier 1 mechanism execution.** The two oldest mechanisms (citation, argument auditing) have a perfect track record in this corpus. The cycle's diagnostic claim — "specifications in prompt text don't mechanically force execution" — would be overstated as a blanket claim about Tier 1 mechanisms generally.
2. **The Issue #9 failures are representative of *new* Tier 1 mechanism execution.** The mechanism with the starkest gap is the susceptibility snapshot: 0/N≥1, the most recently added mechanism, the one whose specification is most novel and the one whose triggering conditions are most ambiguous (phase boundaries are well-defined; "phase-internal moments warranting a snapshot" is judgment-laden). This is consistent with Issue #9's more specific diagnostic: the mechanisms most likely to fail silently are the ones the orchestrator has not yet built reflexes for.
3. **Mechanism age and architectural concreteness predict execution reliability.** Citation and argument auditors fire from skill files at well-defined steps in named phases. The research-methods-reviewer also fires at a well-defined step (start of `/rdd-research`, dispatched by the orchestrator) and has fired in its first opportunity. The susceptibility snapshot is specified to fire "at phase boundaries (between skills), not continuously" (ADR-057) — but in practice, "between skills" is not where a phase-internal user pushback lives. The mechanism is unbound to any concrete dispatch site. **It has zero coverage because nothing in the methodology yet *makes* it fire.**

The most consequential gap, by a wide margin, is the susceptibility snapshot. Citation and argument auditors are working as specified. The susceptibility snapshot is, in practice, unimplemented — the spec exists, the subagent does not appear to be dispatched anywhere, and no artifact has ever been produced. This is the strongest support in the corpus for the cycle's diagnostic, and it is more specific than the diagnostic the cycle started with: **the failure mode is concentrated in the mechanisms whose dispatch is least mechanically anchored.**

## Caveat

The corpus is from one user (the project author) across one project (the RDD methodology repo). It is not a sample from a population of RDD users. The base rates measure this project's actual execution rates, which conflate (a) the methodology's reliability, (b) one user's discipline, and (c) one orchestrating agent's behavior under task immersion. The 100% coverage on the older auditors is not evidence that *any* user would achieve 100% — it is evidence that this user's workflow, with this orchestrator, has produced 100% on those mechanisms. The 0% on susceptibility snapshots is similarly local: it is evidence that *this* deployment has not produced snapshots, not a population claim.

The N=1 framing also cuts the other way: the failures Cycle 10 investigates are exactly the kind that show up under one user's actual workflow, not under an averaged-out population. The base rates here are arguably more useful than a population-level claim would be, because the cycle's question is "does the methodology actually work in practice?" and "in practice" means *somebody's* practice, observed end-to-end. They are not generalizable in the statistical sense, but they are diagnostic in the operational sense.

## Implications for Cycle 10

Three concrete contributions to the essay:

1. **Narrow the diagnostic claim.** "Specifications in prompt text don't mechanically force execution" is too broad given a 100% coverage rate on citation and argument auditors. The accurate version is: *mechanisms whose dispatch is anchored to a concrete step in a named skill execute reliably; mechanisms whose dispatch depends on the orchestrator's contextual judgment do not.* This is sharper, more falsifiable, and points directly at the design fix (anchor every Tier 1 mechanism to a concrete dispatch site, or else accept that it is aspirational).

2. **The susceptibility snapshot is the load-bearing example.** It has 0% coverage against a non-zero opportunity count, including in the very cycle whose subject is silent execution gaps. This is the cleanest in-corpus instance of the failure mode the essay describes. It is a stronger example than any of the six failures in Issue #9 because it is *this* cycle's own behavior, observed reflexively.

3. **The reflexive Cycle 9 finding is worth one paragraph.** Cycle 9 specified four new Tier 1 mechanisms and used zero of them on its own production. This is structurally inevitable for any cycle that introduces new mechanisms (the mechanism is an output, not a prior), but it illustrates the asymmetry the essay should make explicit: the methodology can grow new mechanisms faster than it can grow the orchestrator reflexes that fire them. The gap between specification and execution is not just a runtime failure — it has a built-in lag at the cycle that introduces each mechanism, and that lag has to be closed by a subsequent cycle (which is what Cycle 10 is for).

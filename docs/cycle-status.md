# RDD Cycle Status

## Cycle Stack

### Active: Corpus Topology and Agent-Navigable Compaction

**Cycle number:** 020
**Started:** 2026-05-22
**Current phase:** build
**Cycle type:** standard
**BUILD mode:** auto (ADR-091; DECIDE-gate default carried; confirm at BUILD entry)
**Plugin version at cycle start:** v0.8.7

**Driving question (user-framed at cycle open):**

Does the RDD corpus exhibit an *uneven topology* — middle-of-the-road choices accreting where single bold ones would suffice — and could a compact, agent-navigable structure (the user's candidate: a knowledge graph linking invariants × vocabulary × ADRs × code) simultaneously (a) maximize provenance, (b) surface duplicated responsibilities, and (c) let gate checkpoints be presented to the user in plain language instead of cross-referential subsection-numbering?

**Theater metaphor (user's framing, recorded verbatim for downstream phases):**

> "the granularity of ADRs (5 new in the last cycle) was akin to (in a theater metaphor) an actor making middle of the road choices as opposed to a one big bold choice that is easy to understand. The result is that we write complex code to suit many small cases versus making a singular choice we can easily validate."

**Continuity with Cycle 019:**

Cycle 019 concluded that over-engineering resolves to a *calibration* question across methodology layers (Essay-Outline 018 C1; ADRs 094–098). This cycle picks up an open thread from the DECIDE gate: whether the 5 ADRs that shipped represent five distinct calibration moves or one underlying move expressed at unnecessary granularity. The "uneven topology" hypothesis is the user-articulated form of this concern.

**Scope decided at cycle open:**

Empirical object: **RDD corpus (this project)** — the concrete, fast-to-test case. Generalization to RDD-on-arbitrary-codebases is out of scope unless RESEARCH surfaces strong reason to bring it back in.

Mode: **Mode A (full pipeline)** — commit to a cycle that ends in working software, methodology amendment, or both.

Conformance audit: **skipped at entry** — may surface as a finding during RESEARCH if drift is consequential to the cycle's questions.

**Constraint-Removal probe queued for RESEARCH entry (ADR-082):**

User has named a candidate solution (knowledge graph) inside the framing. The research skill must run Constraint-Removal at entry — bracketing the KG candidate to ask the underlying question first: *what compact navigable structure surfaces complexity and serves the gate-checkpoint plain-language need?* KG is one candidate; the entry probe must not let it pre-empt alternatives (e.g., visualization, hierarchical view, narrative compression, computed summaries).

**Tool note:** plexus MCP is loaded in this environment (KG engine with provenance tracking). This makes spike-testing the KG hypothesis cheap if RESEARCH determines a spike is warranted. The tool availability is not by itself evidence that the KG hypothesis is correct.

## Phase Status

| Phase | Status | Artifact | Key Epistemic Response |
|-------|--------|----------|----------------------|
| RESEARCH | ✅ Complete | `docs/essays/essay-outline-020-substrate-and-surface-separation.md` | Practitioner settled C1, C2, C3, C6 at gate (commitment gating); held open the convergent-vs-alternative-reading question at C5 + the kitchen-sink caveat at C7. Endorsed pursuing two grounding actions before advancing (cross-cycle topology + gate-tooling alternative); both produced material findings that refined C3 (gate-tooling complementary) and C5 (alternative reading strengthened). |
| DISCOVER | ✅ Complete | `docs/product-discovery.md` (Cycle 020 additions dated 2026-09-03) | Practitioner reframed the gate protocol itself: the agent should run belief-mapping on itself and bring only surviving pivot points; authority (Invariant 0) is over product direction, goal, and outcome, not fine-grained process. Endorsed pre-triage of loop/audit findings. Settled/open split proposed by agent as a correctable default (`.rdd/gates/020-discover-gate.md`). |
| MODEL | ✅ Complete | `docs/domain-model.md` (Amendment #29, 2026-09-03) | Practitioner asked what "separation" means (first question of the session), received a concrete explanation, and acknowledged it. The destination split (separation + pre-triage as destination; four other candidates as route) stands as the agent's overridable default, not as a stated practitioner position. No invariant amendment. |
| DECIDE | ✅ Complete (audit converged at R5; conformance scan clean; snapshot triaged) | `docs/decisions/adr-099` (Conditional; §Authority ruled C), `adr-100` (Conditional); `docs/scenarios.md` §Cycle 020; `docs/interaction-specs.md` §Cycle 020; `.rdd/gates/020-decide-gate.md` | Practitioner ruled authority option C, then answered the belief-mapping test with a fact ("I haven't written a single ADR; they've all been composed by the agents in-session") that removed option B's premise. Framed the direction: "driving a rigorous process under the hood... more like a F350." Two defaults (driving mode continues; two ADRs) stood by non-objection. |
| ARCHITECT | ✅ Complete (2026-09-04; snapshot triaged; two pivots ruled) | `docs/system-design.md` v17.0 + `docs/system-design.agents.md` §Cycle 020 (Amendment #18); `docs/roadmap.md` Cycle 020 block (WP-A–J); `.rdd/gates/020-architect-gate.md`; `.rdd/audits/susceptibility-snapshot-020-architect.md` | Practitioner ruled posture on its own for the first time ("drive with disclosure") after the snapshot found ADR-100 §Posture overclaimed a DECIDE-gate pivot; ruled the ADR corpus overview as the BUILD-gate read over product-discovery. No route default overridden. |
| BUILD | ▶ Next (auto mode per the carried default; confirm at entry) | — | — |
| PLAY | ☐ Optional | — | — |
| SYNTHESIZE | ☐ Optional | — | — |

## Pause Log

| # | Paused | Resumed | Reason |
|---|--------|---------|--------|
| 1 | 2026-05-24 | 2026-09-03 | Practitioner stepped away at start of DISCOVER; on return reported having largely stopped using RDD because of reading/adjudication load |
| 2 | 2026-09-03 | 2026-09-04 | DECIDE closed (audit converged R5); practitioner chose a fresh session for ARCHITECT |

## Feed-Forward Signals

### From cycle open (orchestrator → RESEARCH)

1. The cycle has two interlocking questions the research must hold together — *topology* (are the ADRs distinct or middle-of-the-road?) and *compaction* (can knowledge move into agent-navigable + user-readable structures?). Treating either in isolation risks producing a finding that doesn't answer the user's question.
2. The user's KG hypothesis is research input, not research conclusion. Constraint-Removal at entry is mandatory.
3. The user has named *gate checkpoint information density* as a felt experience worth taking seriously. Research should look at the literature on cognitive load, information architecture, and provenance presentation — not only the literature on knowledge graphs.
4. The 5 ADRs from Cycle 019 (094–098) are the empirical sample for the topology question. Loop work should examine them directly.

### From RESEARCH (→ DISCOVER + downstream)

1. **The central commitment proposed by RESEARCH is substrate-and-surface separation** as a methodology-wide architectural commitment, with complementary gate-conversation-tooling improvements as a joint amendment. DISCOVER updates product-discovery against this commitment's stakeholder implications.
2. **Two readings are held open at DECIDE** — the convergent reading (prior six audience-bifurcation ADRs progressively built toward this commitment) and the alternative reading (the prior ADRs were complete answers to different problems; Cycle 020 names a new architectural problem). The post-gate Loop 4 cross-cycle topology evidence strengthens the alternative reading. DECIDE engages both readings when scoping ADR-CANDIDATE-020.1.
3. **Five ADR candidates carry forward to DECIDE** — 020.1 (substrate-and-surface as architectural commitment); 020.2 (authority resolution: substrate canonical vs. ADRs canonical); 020.3 (note discipline); 020.4 (per-type record schemas, held open); 020.5 (gate-conversation-tooling complementary commitment).
4. **Six design constraints from the spike must be honored** — extensible schema; per-type record schemas; sub-argument compression-loss resolution; authority resolution; note discipline; substrate-maintenance overhead. DECIDE incorporates these into the ADR-CANDIDATE-020.1 commitment scoping.
5. **The practitioner's telos** (clarity of direction-giving for downstream auto-mode BUILD per ADR-091) propagates as a stakeholder-need signal for DISCOVER. The methodology amendment's user-friendly half is measured by reduction in direction-giving fatigue, not by surface comfort.
6. **The "no one reads them post-graduation; they're good for agent context" empirical pattern** (Lethbridge 2003; Forward & Lethbridge 2002; Gupta 2026) propagates as a documented stakeholder-behavior signal for DISCOVER. The asymmetric value (human dropoff + agent retention) is part of the value-tension landscape DISCOVER updates.
7. **Two grounding actions the susceptibility snapshot recommended** were pursued before advancing. Findings recorded in research log §Grounding loops 4 + 4b. DISCOVER inherits these as anchored evidence, not open questions.
8. **The cross-cycle topology evidence is single-cycle-deep** (Cycle 017 and Cycle 018 examined). Broader cross-cycle examination is held as a future-cycle scope; if multi-cycle evidence accrues showing the topology-clustering recurs (or doesn't), the methodology amendment's tier and scope may revise.

### From the susceptibility snapshot (research → discover boundary)

The snapshot (`.rdd/audits/susceptibility-snapshot-020-research.md`) returned a moderate framing-adoption signal. Two grounding actions were recommended; the practitioner endorsed pursuing them. Both were executed; findings refined the Essay-Outline. The Grounding Reframe was operated as a substantive course-correction, not as a formality.

### From resumption conversation (2026-09-03 → DISCOVER)

1. **Stakeholder-articulated demand (ADR-097 path 2).** The practitioner reported ~3 months of largely not using RDD: "it takes a long time and it's a lot of text to read. Quicker iterations have been more desirable." This is the most direct stakeholder evidence the cycle has and must be recorded in product-discovery as a job + value tension, not held as conversational context.
2. **Refinement of the pain's shape.** Asked whether the pain was reading load or process time, the practitioner answered: reading load is the main thing; process time and looping are acceptable "if it increases capability and drives results." The specific mechanism named: *"loops peel back more layers of the onion that need more adjudication by the reader. So it's exhausting."* The pain is **adjudication load** — each loop multiplies decision points (framing findings, grounding actions, held-open questions) the reader must rule on — not reading volume alone.
3. **Gap against the cycle's remedy.** Substrate-and-surface (C3) and gate-conversation-tooling (C3, W3.4) reduce per-item adjudication cost (context inlined, right resolution). Neither reduces adjudication *count* per loop. DISCOVER should record this as an assumption inversion and a candidate value tension (loop depth / capability vs. reader adjudication load); DECIDE should consider whether ADR-CANDIDATE-020.5 (gate tooling) needs a count-bounding or pre-triage component.

### From DISCOVER (→ MODEL + downstream)

1. **Gate practice vs. Invariant 0 scope (pivot pending practitioner ruling).** The practitioner's gate response says the user "should understand product direction, their goal, the outcome they want" and will not know "the very fine-grained detail of the process being orchestrated." The agent first recorded this as a scope boundary on Invariant 0; the susceptibility snapshot flagged that as the agent's extrapolation. Invariant 0 as written already scopes authority to design rationale, key decisions, vocabulary, and user needs. The narrower reading (recommended): gate practice under Invariants 1 and 2 has drifted toward process-level questions Invariant 0 never required; fix is in question composition, no amendment. The wider reading: Invariant 0 needs a boundary; backward propagation applies. **Ruled 2026-09-03: narrower reading.** Invariant 0 unchanged; no backward propagation. The practitioner's car metaphor (gate note §Practitioner corrections) supplies the criterion: destination is always the driver's; route is an overridable default; engine is the agent's, inspectable.
2. **Pre-triage is a sixth ADR candidate.** ADR-CANDIDATE-020.6 (working name): agent pre-triage of loop and audit findings, with an inspectable triage record, composed with the framing-audit-surfacing rule (surface with belief-mapping done and a pivot extracted; never silently resolve framing-class findings). Design question for DECIDE: isolated-context triage vs. orchestrator triage with a log. Interacts with ADR-094 (bounds rounds, not items per round).
3. **The gate protocol is in scope for the amendment.** The AID cycle's belief-mapping questions are themselves adjudication load. The practitioner's instruction ("ask yourself this question; come to me with real pivot points") is recorded as feedback memory and applies from this gate onward. Any ADR touching the AID cycle (020.5 gate tooling; 020.6 pre-triage) should encode it.
4. **Candidate concepts for MODEL:** the pair the Essay-Outline calls substrate and surface (the practitioner's phrase is "a graph behind a human-friendly format"; MODEL proposes the domain name and the practitioner rules), adjudication load, pivot point, pre-triage. Eight vocabulary rows added to product-discovery: five verbatim or near-verbatim user language; three carry the user's underlying phrase as the term with the research coinage in Notes, after the snapshot caught the first draft presenting research terms under a user label.
5. **Building vs. driving (from the practitioner's ruling).** This project is reflexive: building the car. Process-level fussing is legitimate here in a way it is not when driving RDD on another project, which is where the non-use complaint comes from. Every downstream mechanism (pre-triage, gate tooling, substrate-and-surface surfaces) should be designed for the driver and should not assume the reflexive project's tolerance for engine inspection. MODEL should consider whether "driving" and "building" RDD are distinct concepts or a calibration axis on existing ones (cf. ADR-091's auto/gated BUILD modes).
6. **product-discovery.md is 235 KB** after this pass (Value Tensions 60 KB). Recorded in the new product-debt row as evidence for 020.1. The document is itself a candidate first target for substrate-and-surface derivation at BUILD.

### From the susceptibility snapshot (discover → model boundary)

The snapshot (`.rdd/audits/susceptibility-snapshot-020-discover.md`) found clear solution-space narrowing (pre-triage written into three artifact locations while the three alternatives the agent named at the gate appeared nowhere), an embedded conclusion (agent mechanism vocabulary "bounded or pre-triaged" inside a first-person Solo Developer job), research terms entering the vocabulary table under a user label, and the Invariant 0 scoping as agent extrapolation. Grounding Reframe recommended with three targeted actions. Triage by the orchestrator, per the practitioner's gate instruction to pre-triage and bring pivots: actions 1 and 2 (split problem from mechanism; demote research terms) resolved in the artifact by restoring the practitioner's verbatim phrasing and recording all four mechanisms as agent-proposed complements; action 3 (Invariant 0 gap) brought to the practitioner as the gate's one pivot. The snapshot also reports malformed `expected_path` entries in `.rdd/dispatch-log.jsonl` from the RESEARCH session (trailing `**` from bold-decorated Output path lines; one logged dispatch, `argument-audit-020-final-verification.md`, has no file on disk). Hook-side defect; candidate fix for `tier1-verify-dispatch.sh` at BUILD, related to the existing product-debt row on Output path regex variants.

### From DECIDE (→ ARCHITECT + downstream)

1. **Two ADRs ship.** ADR-099 Substrate-and-Surface Separation (methodology-wide scope on C2; Tier-2 architectural commitment now; Skill-Structure anchoring is the graduation target; Conditional Acceptance pending corpus-scale BUILD; six constraints each with its rejected alternative; §Authority ruled option C: records canonical for new units, legacy units canonical and indexed; ADR-074 updated). ADR-100 Pre-Triage and Plain-Language Presentation (Conditional Acceptance; rules 1–5 Adjudication Load, 6–7 reading load; triage record in the gate note; snapshot brief reads it; practiced now, skill-text anchoring ships in BUILD; ADR-056 and ADR-066 updated).
2. **ARCHITECT decides:** record format and which record types get per-type schemas this cycle (at least Pattern, ADR, Vocabulary-term differ); where the Substrate lives under ADR-085's centered/infrastructure categories and whether the artifact hierarchy gains a fourth layer; the derivation tool as a toolchain module; the skill-text amendment sites for ADR-100 (each phase skill's gate step; orchestrator AID cycle; `agents/susceptibility-snapshot-evaluator.md` reads the triage record); where the deferred ADR-056/066/074 sweep content lands in system-design, ORIENTATION, field-guide.
3. **BUILD inherits:** the toolchain (schema validation with Note Discipline; Derive Surface View; index records for ~98 legacy units, cost measured); the skill-text amendments for ADR-100; the hook fix for `tier1-verify-dispatch.sh:82-93` (trailing `**`); the Cycle 020 Acceptance Criteria Table's two layer-match "no" rows (corpus-scale read; fewer decisions per loop) for Step 5.5 and PLAY; ADR-100's named grounding action (targeted lit-review: management by exception; escalation policy in human-automation teaming) as a BUILD-adjacent spike.
4. **Carried open:** the three-gate engagement-trend question (design working vs. fatigue) to the ARCHITECT boundary snapshot; the convergent vs. new-problem reading (held caveat); ADR-100's pivot-criterion gloss ("what gets built, for whom, or why") standing by non-objection.
5. **`/rdd-conform` backlog:** 78 ADRs with bare `Proposed` status operating as accepted (conformance scan lists them); domain-model Concepts table header 3 columns vs. 166 four-cell rows.
6. **The authorship fact is corpus-level evidence.** All 98 ADRs were agent-composed; the practitioner's contribution has been the ruling and the verbatim statements records carry. ARCHITECT should treat the ADR record schema's rejected-alternatives field as agent-facing rigor, and the Surface View as the only human read.

### From ARCHITECT (→ BUILD, 2026-09-04)

1. **System design v17.0 (Amendment #18) is the BUILD context document.** Three new modules (Substrate `docs/substrate/<type>/<id>.json`; Record Validator `tools/substrate/validate.js` + per-type schemas for `adr` full/index, `pattern`, `term`; Surface Deriver `tools/substrate/derive.js` with `--check` and one-time `--replace`) plus Surface Views at `docs/views/` (Tier 2, generated). Twelve modules amended. Zero new hooks, subagents, or invariants. Every ARCHITECT decision carries its set-aside alternative in the decision table (system-design.agents.md §Cycle 020).
2. **Two rulings at the gate.** Posture: driving with disclosure (snapshot-caught triage errors are shown in the presentation; engine dispositions stay logged). BUILD-gate read: the ADR corpus overview; product-discovery.md is the next cycle's first derivation target (needs stakeholder and value-tension record types, not designed this cycle).
3. **Roadmap WP-A through WP-J** with two independent tracks until WP-J: toolchain (B → C → D → E/F) and pre-triage text (G → H); WP-A (hook fix; stale example paths) and WP-I (ADR-100 grounding lit-review) independent. Target v0.9.0. Two gated-pause candidates under auto mode: the WP-D `--replace` of ADR-099/100 prose by derived markdown (narrow argument-audit R1 on the new form is the structural guard) and the WP-E legacy-index cost report.
4. **BUILD Step 5.5** runs validate, derive, and `derive --check` on this corpus; asserts legacy ADR files byte-identical; the practitioner reads `docs/views/overview.md` at the BUILD gate (Acceptance Criteria Table row 1). Row 2 (fewer decisions per loop) is recorded from the BUILD gate's triage record as first-cycle evidence.
5. **Deferred sweep lands** per system-design.agents.md §Cycle 020 deferred sweep: ORIENTATION regenerated now and post-BUILD; field-guide at Step 6 (new Substrate Toolchain module); skill text at WP-F/WP-G.
6. **Carried:** convergent vs new-problem reading (held caveat); `/rdd-conform` backlog (78 bare-Proposed ADRs; domain-model table header); invariant and scenario record types; a product-discovery Surface View.
- **ADR-100 in-cycle evidence, fourth boundary (architect → build):** harm direction — the orchestrator's triage record claimed "Orchestrator owns eleven rows (threshold twelve)" inside a Resolved (engine) disposition; the count is fourteen and the threshold had no provenance. Reliance direction — caught by the isolated snapshot reading the record. Also: ADR-100 §Posture overclaimed that the posture question was put as a pivot at DECIDE (it was a default, not overridden); erratum header added; the question put on its own at the ARCHITECT gate. Cycle 020 remains cycle one in ADR-100's tally; the count of caught triage errors is now four across four boundaries.
- Retrofit findings: stale `docs/essays/audits/` example path in the Decide and Conform skills (bug; WP-A); the DECIDE-020 conformance scan relocated to `.rdd/audits/`.

## Resumption Bookmark — ARCHITECT closed 2026-09-04; BUILD next

**Where things stand.** RESEARCH through ARCHITECT complete. BUILD not started. Cycle 020 artifacts through ARCHITECT are committed (see git log, 2026-09-04).

**Key files:** this file (§From ARCHITECT); `docs/system-design.agents.md` §Cycle 020 Amendments (the decision table, module entries, contracts, fitness, tests); `docs/system-design.md` §How the Cycle 020 amendments fit; `docs/roadmap.md` Cycle 020 block (WP-A through WP-J; dependency graph; open decision points); `docs/scenarios.md` §Cycle 020 (the behavioral contract); `.rdd/gates/020-architect-gate.md` (rulings: driving with disclosure; ADR corpus overview is the BUILD-gate read).

**On resume, the orchestrator:** (1) invokes `/rdd-build` in auto mode (confirm at entry per ADR-091; the mode-selection axes are stated in the roadmap's Cycle 020 header); (2) operates under ADR-100 as ruled at the ARCHITECT gate: pivots and route defaults only, snapshot-caught triage errors disclosed, engine dispositions logged in `.rdd/gates/020-build-gate.md`; (3) starts with the independent packages (WP-A hook fix and stale paths; WP-B schemas and validator; WP-G orchestrator pre-triage text) and follows the roadmap's hard dependencies from there; (4) at WP-D, runs the narrow argument-audit round on the derived ADR-099/100 markdown before `--replace` and treats it as a pause candidate; (5) at WP-E, records the legacy-index cost in §From BUILD; (6) at Step 5.5, runs validate, derive, and `derive --check` on this corpus, asserts legacy ADR files unchanged, and presents `docs/views/overview.md` as the gate read.

**Suggested resumption prompt:** "resume Cycle 020 at BUILD per `docs/cycle-status.md` §Resumption Bookmark."

## Resumption Bookmark — DECIDE closed 2026-09-03; ARCHITECT next *(superseded 2026-09-04: ARCHITECT complete; BUILD next. Nothing from Cycle 020 is committed to git.)*

**Where things stand.** RESEARCH, DISCOVER, MODEL, DECIDE complete. ARCHITECT not started. Nothing from Cycle 020 is committed to git (all RESEARCH through DECIDE artifacts are untracked or modified in the working tree).

**Key files:** this file; `docs/decisions/adr-099-*.md` and `adr-100-*.md`; `.rdd/gates/020-decide-gate.md` (rulings, triage records, audit log R1–R5); `docs/scenarios.md` and `docs/interaction-specs.md` §Cycle 020; `.rdd/audits/conformance-scan-decide-020.md`; `.rdd/audits/susceptibility-snapshot-020-decide.md`.

**On resume, the orchestrator:** (1) renames this entry `### Active:`, deletes the `**Paused:**` and `**Phase at pause:**` lines, fills the Pause Log row 2 "Resumed" date; (2) invokes `/rdd-architect` with §From DECIDE as input; (3) operates under ADR-100 from the first turn: pre-triage every finding, one screen, cited content inlined, pivots only, defaults with override; the triage record goes in `.rdd/gates/020-architect-gate.md`; the snapshot brief at the architect → build boundary reads the triage record and takes up the carried engagement-trend question. Driving mode. Session feedback memory `agent-self-belief-mapping` applies.

**Suggested resumption prompt:** "resume Cycle 020 at ARCHITECT per `docs/cycle-status.md` §Resumption Bookmark."

### DECIDE log (2026-09-03)

- Six candidates became two ADRs after R1 audit integration (authority folded into ADR-099 as a nested sub-decision; ADR-101 renumbered to ADR-100): **ADR-099** Substrate-and-Surface Separation (the bold choice; constraints for note discipline, per-type schemas, extensible links, sub-argument preservation, authority reference, toolchain overhead folded in as binding constraints; Conditional Acceptance pending corpus-scale BUILD). **ADR-099 §Authority** (five options developed; practitioner ruled C at the DECIDE gate 2026-09-03; ADR-074 carries a dated `Updated by ADR-099` header). **ADR-100** Pre-Triage and Plain-Language Presentation (Accepted, Conditional after R1 P1-2; folds ADR-CANDIDATE-020.5 gate tooling in as its presentation rule; partially updates ADR-056 and ADR-066).
- **Supersession events:** ADR-056 and ADR-066 carry dated `Updated by ADR-100` headers (written 2026-09-03). ADR-074 carries a dated `Updated by ADR-099` header (written 2026-09-03 on the option-C ruling).
- **Downstream sweep deferred to BUILD** (system-design, ORIENTATION, field-guide): the skill and orchestrator text that operationalize ADR-100, and the toolchain that operationalizes ADR-099, ship in BUILD; the current-state artifacts are swept when the behavior they describe exists. domain-model Amendment Log row #30 records the supersession events now.
- Argument audit R1 (`.rdd/audits/argument-audit-decide-020.md`): 2+2 P1, 5+1 P2, 3 P3; not converged. Orchestrator triage: argument P1/P2/P3 resolved in the ADRs (scope/tier reconciled on C2; ADR-100 to Conditional and path-4 label dropped; legacy-index re-encoding answered via ADR-074 immutability; rule-to-concept mapping added; non-gate triage path specified); framing P1-a (posture; MODEL ran reduced-visibility pre-ratification on a reflexive cycle) and framing P2 (ADR count) brought to the practitioner as pivot and route default; framing P1-b (no RESEARCH trail) resolved by Conditional status plus a named grounding action and surfaced. R2 dispatched on the revised set. P3-1 (corpus-wide "Proposed operating as accepted" status fields on ADR-058, 061, 074) carried forward to `/rdd-conform`.
- **Conformance scan** (`.rdd/audits/conformance-scan-decide-020.md`): no unplanned drift; every gap matches what ADR-099 and ADR-100 schedule for BUILD (no Substrate, schema, or derivation tool; no skill text yet carries the triage section, inlining rule, or snapshot-brief amendment; `agents/susceptibility-snapshot-evaluator.md` does not read a triage record). Two findings outside the predicted set: (1) `hooks/scripts/tier1-verify-dispatch.sh:82-93` never strips a trailing `**` from a bold-wrapped Output path line (the malformed dispatch-log entries from session f1575b68); pre-existing, BUILD candidate. (2) 78 ADRs carry a bare `Proposed` status while operating as accepted (including ADR-040 and ADR-082); carried to `/rdd-conform`. One tension flagged for correction: ADR-100 says its triage record is "Skill-Structure Layer, anchored now," but no skill step exists yet; the mechanism is practiced (three Cycle 020 gate notes), not anchored. Fix queued with the R2 integration so that one re-audit (R3) covers both.
- **Susceptibility snapshot (decide → architect)** (`.rdd/audits/susceptibility-snapshot-020-decide.md`): Grounding Reframe recommended. Two triage-record defects: the gate note claimed the pivot-criterion gloss had been put to the practitioner (it had not), and dispositioned framing finding F-P1-b as "surfaced" when the presentation omitted it, violating ADR-100 rule 4 on its first application. Engagement trajectory across the three gates noted as declining. Both defects corrected in the gate note; the omitted items and a belief-mapping test of the authority ruling put to the practitioner; the rule-4 violation to be recorded in ADR-100 as in-cycle harm-direction evidence (queued with R2 integration).
- **DECIDE gate rulings (2026-09-03):** authority = option C. Defaults not objected to: driving mode continues for ARCHITECT and BUILD of this cycle; two ADRs, not one or three.

### From MODEL (→ DECIDE + downstream)

1. **Vocabulary is binding.** Nine concepts, three actions (Amendment #29). A tenth, Cycle Posture, was demoted to an open question on the snapshot's finding. "Surface View" is the noun; "Surface" stays a verb. "Pre-Triage" is the action name; bare "triage" is an alias to avoid.
2. **Destination default for DECIDE.** Separation (020.1) and pre-triage (020.6) are the destination; note discipline (020.3), per-type schemas (020.4), gate tooling (020.5) are route. **Authority resolution (020.2) is neither: Essay-Outline C4 marks it "not defaultable," so DECIDE develops both options and the practitioner rules.** The split is the agent's default by practitioner non-objection, corrected after the model → decide snapshot. DECIDE applies ADR-097's filter to all six and should produce one bold choice plus substrate entries, not six peers.
3. **Driving posture is the design target.** Every mechanism DECIDE commits should be specified for a practitioner who decides destination and, when they care, route, and never reads the engine. The reflexive project's tolerance for engine inspection is not the target.
4. **Pre-triage applies to DECIDE's own audits.** Argument-audit findings on the ADRs reach the practitioner as pivots with belief-mapping done; framing-class findings are surfaced with analysis, never silently resolved (framing-audit-surfacing rule).
5. **Conformance item.** domain-model.md Concepts table header declares three columns; 166 of 259 rows carry four. Logged as an open question for `/rdd-conform`.

### From the susceptibility snapshot (model → decide boundary)

The snapshot (`.rdd/audits/susceptibility-snapshot-020-model.md`) found three converging issues: driving mode extended into vocabulary content, which Invariant 0 reserves to the practitioner; Cycle Posture entered as a concept on one metaphor at one gate (preference-accelerated, self-administered); and the destination/route split filed Authority Resolution as an overridable default while the cycle's own research marks it "not defaultable." Grounding Reframe recommended. Orchestrator triage: Cycle Posture demoted to an open question; Authority Resolution reclassified as must-decide-explicitly at DECIDE; the vocabulary itself put to the practitioner one line per term as the gate's pivot; the practitioner confirmed all terms ("Those are all reasonable terms"). The snapshot's counter-example (the practitioner asking for Invariant 0's text before ruling at DISCOVER) is noted as what earned engagement looks like at a destination-level pivot.

## Context for Resumption

If this cycle is paused and resumed in a new session:
- Read this file, then `docs/essays/essay-outline-018-does-rdd-over-engineer.md` for the antecedent calibration argument.
- The cycle's working hypothesis ("uneven topology" / KG candidate) is user-framed and not yet research-validated. Do not encode it as settled premise.
- Constraint-Removal probe at RESEARCH entry is a structural requirement, not optional.

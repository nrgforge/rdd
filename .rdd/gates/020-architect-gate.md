# Gate Reflection: Cycle 020 architect → build

**Date:** 2026-09-04
**Phase boundary:** architect → build
**Cycle:** Corpus Topology and Agent-Navigable Compaction (Cycle 020)

**Operating context.** Driving mode per the DECIDE-gate default (not overridden). ARCHITECT ran in retrofit mode (skills, agents, hooks exist) with the DECIDE conformance scan as the reconnaissance base plus an ARCHITECT scan; the system design pair was drafted to v17.0; the roadmap's Cycle 020 block was generated; this note's triage record was written before the snapshot was dispatched and before the practitioner was presented anything, per ADR-100 rule 5. The presentation is one screen: what changed, the route defaults taken, one pivot.

## Belief-mapping question composed for this gate

Two pivots survived pre-triage; they are put one at a time (one-question-at-a-time convention). The first was extracted from the architect → build snapshot's central finding and is put first because it governs how everything else this cycle is presented.

**Pivot 1 (posture for the rest of Cycle 020).** ADR-100 §Posture says the driving/building question was "put to the practitioner at the DECIDE gate as a pivot." The DECIDE gate record shows it was presented as one of two stated defaults and not overridden, which the DECIDE note itself marks as weaker than a ruling. ARCHITECT then ran under that default on the resumption bookmark's instruction, with no practitioner turn. Three snapshots (DISCOVER, MODEL, DECIDE) found concrete triage errors specifically while this reflexive cycle ran in reduced-visibility mode; the fourth (ARCHITECT) found one more (a miscount inside a "Resolved (engine)" row, corrected below). Belief-mapping, run on the agent's side: what would need to be true for *building* (engine-level dispositions listed in the presentation) to be right for the rest of this cycle? That the errors the snapshots keep catching would be caught earlier if the practitioner saw engine dispositions, and that this project's stated tolerance for engine inspection ("building the car") outweighs the reading load. *For driving:* the practitioner's own instruction was to bring pivots, not process; every error so far was caught by the isolated reader, which is the design working; listing engine dispositions is exactly the reading load the cycle exists to remove. *Recommendation:* driving, with one change: the snapshot's per-row triage evaluation is included in the presentation whenever it finds a disposition wrong (as here), so harm-direction evidence reaches the practitioner without the full engine list.

> For the rest of Cycle 020, starting with this gate: driving (pivots and route defaults only, with snapshot-caught triage errors disclosed), or building (engine-level dispositions listed too)?

**Pivot 2 (queued; put after the ruling on Pivot 1).** The cycle's success observable (Acceptance Criteria Table row 1) is "the corpus you don't have to read, backed by the corpus the agent needs," verified when you read a Surface View at the next gate instead of raw artifacts. The design makes that view the **ADR corpus overview**: all 100 ADRs (two as full records, ninety-eight as compressed index records), the Calibration-with-Graduation-Trigger Pattern, and the nine Cycle 020 terms, at `docs/views/overview.md`. The other candidate is **product-discovery.md** (235 KB; its Value Tensions section alone is 60 KB), which DISCOVER named as the first derivation target and which would need stakeholder and value-tension record types this cycle has no schema for. Belief-mapping on the agent's side: what would need to be true for product-discovery to be the right first read? That the pain on re-entry is the product story, not the decision trail. *For:* "a lot of text to read," and product-discovery is the largest thing handed over at DISCOVER. *Against:* the research object, the spike, and all eighteen scenarios are about ADRs; the Cycle 019 complaint that opened this cycle was about ~100 ADRs; adding two record types now is the kitchen-sink move the cycle's C7 caveat names. *Recommendation:* ADR corpus this cycle; product-discovery as the next cycle's first target.

> Which read do you want at the BUILD gate: the ADR corpus overview (recommended), or product-discovery, which adds two record types to this cycle?

## User's response

**Pivot 1 (posture):**

> Very well -- drive with disclosure

**Recorded:** driving continues for the rest of Cycle 020, with the change the agent proposed: snapshot-caught triage errors are disclosed in the presentation. This is the first time the posture was ruled on its own; ADR-100's erratum header points here.

**Pivot 2 (corpus read):**

> I think let's look at the ADR corpus overview.

**Recorded:** the ADR corpus overview (`docs/views/overview.md`) is the read at the BUILD gate; Acceptance Criteria Table row 1 is verified against it at BUILD Step 5.5. product-discovery.md is carried as the next cycle's first derivation target. No route default was overridden.

## Pedagogical move selected

**Challenge** (agent-side belief-mapping per ADR-100 rule 3), with the surviving pivot put as a one-line ruling. Route defaults listed with their alternatives; engine-level dispositions logged below and not presented (driving mode; no reflexive opt-in was declared).

## Design-audit findings and orchestrator triage

Step 10 design audit and retrofit reconnaissance. Triage record per ADR-100 rule 5 (non-audit moment; recorded here because the gate note is the producing artifact for ARCHITECT).

| Finding | Disposition | What was done |
|---|---|---|
| Retrofit 1: `skills/decide/SKILL.md:195` and `skills/conform/SKILL.md:173` give `./docs/essays/audits/` as the example conformance-report path (pre-ADR-070; missed by the ADR-070 and ADR-085 sweeps); the DECIDE-020 scan landed there | Resolved (engine) | Scan relocated to `.rdd/audits/conformance-scan-decide-020.md` and cycle-status references updated at ARCHITECT entry; skill-text fix in roadmap WP-A. Classified bug (code wrong, ADR-085 right) |
| Retrofit 2: `tier1-verify-dispatch.sh:82-93` trailing-`**` extraction defect (ten corrupted dispatch-log entries, session f1575b68) | Resolved (engine) | WP-A: sed rule plus fixture in `test_output_path_regex.sh`. Classified bug |
| Retrofit 3: Node.js is already a plugin runtime requirement (`hooks.json` runs `skill-activator.js`) | Resolved (engine) | Toolchain runtime chosen as Node, zero dependencies; Python (the spike's runtime) set aside |
| Record format: plain JSON vs YAML frontmatter vs JSON-LD | Route default | JSON with typed links (spike-validated; lit-review rank 3). YAML loses typed edges; JSON-LD adds an ontology no reader needs. Decision table in system-design.agents.md §Cycle 020 |
| Which record types get schemas this cycle | Route default | `adr` (full/index), `pattern`, `term`. `invariant` and `scenario` deferred: no scenario requires them; adding them is the comprehensiveness trap ADR-099 constraint 3 names |
| Substrate location and the fourth-tier question | Route default | `docs/substrate/` (Tier 3, product on the ADR-085 axis) and `docs/views/` (Tier 2); no fourth tier. `.rdd/` set aside: records are the canonical body of governance units, not framework operation |
| Term records and `domain-model.md` (438 KB, the constitutional artifact) receiving generated text | Route default | Marker-delimited region owned by the deriver; hand rows stay canonical. Alternatives: hand rows plus records (the drift ADR-099 exists to prevent); term records as fixture only (leaves MODEL with no Author Substrate Record step) |
| ADR-099 and ADR-100 prose replaced by derived markdown from agent-transcribed records (a form change to two accepted ADRs) | Route default with structural guard | Done once at WP-D via `derive --replace`; one narrow argument-audit round on the derived form (R1 per ADR-094's form-change reset; P1 must be 0; heading set and rejected-alternative count identical). Named in roadmap Open Decision Points as a place a gated pause is worth considering under auto mode |
| Hook enforcement of derivation (a PostToolUse reminder on writes under `docs/substrate/`) | Resolved (engine) | None this cycle; `/rdd-conform` runs `derive --check`. ADR-099 makes Skill-Structure anchoring the graduation target; the preservation scenario keeps the Stop hook untouched |
| Skill steps for Author Substrate Record and Derive Surface View: ship in this BUILD or wait for the graduation trigger | Route default | Ship in BUILD (WP-F), hard-dependent on the toolchain passing its tests and running on this corpus, per ADR-099 §Scope and tier ("when BUILD delivers the toolchain and it runs on this corpus"). The graduation trigger confirms them |
| Which corpus read is the cycle's validation target at the BUILD gate | **Pivot** | Belief-mapping run on both sides above; recommendation ADR corpus; put to the practitioner as the gate's one ruling |
| BUILD mode for this cycle | Route default (carried from DECIDE) | Auto; two gated-pause candidates named (WP-D form change; WP-E cost report) |
| ADR-100 grounding action (targeted lit-review) timing | Route default | Roadmap WP-I, independent; default during BUILD; before WP-G if the practitioner wants the escalation literature to shape the pivot-criterion wording; deferral recorded, not silent |
| Target release | Resolved (engine) | v0.9.0 (new toolchain and artifact directories; RELEASE.md minor bump) |
| Qualitative-claim decomposition (ADR-076 gate check): deterministic, single-source, never hand-maintained, focus+context, incompleteness visible, extensible, zero-dependency, one screen, inlined, inspectable, "the read the practitioner uses" | Resolved (engine) | Each carries an adjacent `**Fitness:**` line in the module entries; the last is recorded as direction-not-constraint pending the ADR-099 graduation trigger |
| Glossary coverage: nine Cycle 020 concepts and three actions each allocated to exactly one owning module | Resolved (engine); **corrected 2026-09-04 on the architect snapshot's recount** | Responsibility matrix §Cycle 020; no orphans; no cycles in the dependency graph. The first version of this row said "Orchestrator owns eleven rows (threshold twelve)." The count is fourteen of thirty-two, and the threshold had no provenance (invented at drafting). The concentration is ADR-100's structure (one mechanism, seven rules, one file, following the existing pattern that phase skills defer to the orchestrator for the Question Toolkit); the alternative (rules duplicated into each phase skill) was set aside for that reason. The fabricated threshold is removed from the fitness table; the count and the rationale stand as the observation |
| Carried from the decide → architect snapshot: three-gate engagement trend (design working vs fatigue) | Carried forward | Written into the A.5 snapshot brief for this boundary; the evaluator takes it up with this note's record as evidence |
| Carried from DECIDE: convergent vs new-problem reading of the lineage | Carried forward | No ARCHITECT impact; stays the held caveat in cycle-status |
| `/rdd-conform` backlog (78 bare-`Proposed` ADRs; domain-model table header) and a product-discovery Surface View | Carried forward | Roadmap Open Decision Points, out of this cycle's scope |

## Commitment gating outputs

**Settled premises (the practitioner is building on these going into BUILD):**
- System design v17.0 (Amendment #18): three new modules (Substrate; Record Validator; Surface Deriver) plus Surface Views as a generated Tier 2 artifact; twelve modules amended; zero new subagents, hooks, or invariants; one hook defect fixed.
- The ARCHITECT decision table (format, runtime, three record types, locations, no fourth tier, term region, ADR-099/100 as first records, no derivation hook), each a route default with its alternative recorded. *(Settled by non-objection to stated defaults; none overridden at the gate.)*
- Posture: driving with disclosure for the rest of Cycle 020 (ruled on its own at this gate, 2026-09-04).
- The BUILD-gate read is the ADR corpus overview (ruled at this gate, 2026-09-04); product-discovery is the next cycle's first derivation target.
- ADR-099 skill steps ship in BUILD conditional on the toolchain; ADR-100 skill text and snapshot-brief amendments ship in BUILD; the manifest is unchanged.
- BUILD mode auto; target v0.9.0. *(Carried defaults.)*

**Open questions (the practitioner is holding these open going into BUILD):**
- The one-time cost of ~93 remaining legacy index records (ADR-099 constraint 6; WP-E measures and reports).
- Whether the ADR-100 grounding lit-review runs before the skill-text WPs, during BUILD, or is deferred (WP-I).
- Whether to pause under auto mode at the WP-D form change and the WP-E cost report.
- Convergent vs new-problem reading (held caveat); the three-gate engagement-trend question (to the snapshot).

**Specific commitments carried forward to BUILD:**
- Roadmap WP-A through WP-J with classified dependencies; the toolchain track (B → C → D → E/F) and the pre-triage track (G → H) are independent until WP-J.
- BUILD Step 5.5: derive on this corpus; legacy files byte-identical; the practitioner reads `docs/views/overview.md` at the BUILD gate (Acceptance Criteria Table row 1); row 2 observed at the BUILD gate's triage record.
- Deferred ADR-056/066/074 sweep lands where system-design.agents.md §Cycle 020 says: system-design pair (now and WP-J), ORIENTATION (post-ARCHITECT and post-BUILD), field-guide (Step 6), skill text (WP-F, WP-G).
- ADR-099 and ADR-100 remain Conditional Acceptance through v0.9.0; their triggers are multi-cycle.

## Susceptibility snapshot findings and orchestrator triage

The snapshot (`.rdd/audits/susceptibility-snapshot-020-architect.md`) recommended a Grounding Reframe. Triage record:

| Finding | Disposition | What was done |
|---|---|---|
| ADR-100 §Posture claims the driving/building question was "put... as a pivot" at DECIDE; the DECIDE record shows a stated default, not overridden; ARCHITECT inherited the default through the resumption bookmark with no practitioner turn | **Pivot** (framing-class; surfaced whole) | Put to the practitioner as this gate's first ruling, on its own, with both sides developed (above). A dated erratum header added to ADR-100 (ADR-074 header pattern; body untouched) so the next reader does not inherit the overclaim; the WP-D record carries the accurate statement. Practitioner may remove the header |
| Gate note's Glossary-coverage row miscounted Orchestrator's matrix rows (eleven claimed; fourteen actual) against a threshold with no provenance, inside a "Resolved (engine)" disposition | Resolved; **disclosed** | Row corrected above; fitness-table threshold removed; recorded in cycle-status as ADR-100 harm-direction evidence at the fourth Cycle 020 boundary (caught by the isolated reader: reliance direction as well) |
| `domain-model.md` marked-region decision received a tooling-drift justification but not the product-facing Inversion Principle test the Substrate/Surface tiering received | Route default, test now recorded | Inversion test: the practitioner's model is "a graph behind a human-friendly format"; `domain-model.md` is where the practitioner already looks for vocabulary, so the derived rows land where the human reads. Alternative named as override: generated rows only in `docs/views/` and `domain-model.md` entirely hand-maintained (two places for terms). Presented as an overridable default, not a question |
| Orchestrator's ownership concentration (fourteen of thirty-two Cycle 020 rows) may reflect the path of least implementation resistance | Resolved (engine) | Rationale recorded in the corrected row above; the alternative decomposition named; no split |
| ARCHITECT ran with zero practitioner turns; every decision is agent-made pending the gate | Surfaced | Stated in the presentation's first line |
| The one pivot ARCHITECT selected (corpus read) is genuine and correctly developed | No action | Queued as Pivot 2 |

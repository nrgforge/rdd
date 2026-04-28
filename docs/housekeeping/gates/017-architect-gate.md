# Gate Reflection: Cycle 017 (Readability & Comprehensibility) — architect → build

**Date:** 2026-04-28
**Phase boundary:** architect → build
**Cycle:** 017 — Readability & Comprehensibility

## Belief-mapping question composed for this gate

The most consequential ARCHITECT design choice this cycle is the system-design split into a slim human-facing document and the companion `system-design.agents.md` (ADR-084 Pattern B applied to system-design.md, the canonical exemplar named at DECIDE). The DECIDE-phase susceptibility snapshot's Signal B explicitly flagged the ~50% threshold as agent-proposed and not empirically calibrated; Truth C from the DECIDE framing audit named that ADR-083's exception conditions themselves were agent-composed without gate examination as an enumeration. The composed question was framed to test whether the Pattern B choice remains earned at the practitioner's commitment level rather than carried forward as a pre-committed default — and whether the agent-composed structures it rests on are load-bearing in a way that warrants revisiting:

> Given that ADR-084 §3 had already committed system-design.md as the Pattern B exemplar at DECIDE, what would you need to believe for the cycle to have been better served by ARCHITECT *re-opening* that decision and applying Pattern A instead — leading with audience-tagged sections rather than a companion file split? The DECIDE-phase commitment is the architectural driver here; Signal B from the snapshot flagged the threshold as agent-proposed; Truth C names that the exception conditions themselves were agent-composed without gate examination as an enumeration. Is the Pattern B choice load-bearing on those agent-composed structures in a way that warrants revisiting, or has the diagnostic recalibration produced a structure you genuinely own?

## User's response

The response confirmed Pattern B at the substantive level and surfaced a specific concern as the deliberation site:

> I think the new system-design file is so much easier to read, so that's a big win. Does the agents variant end up in .rdd? I'd say the only thing would change my mind is if we don't have a mechanism to make sure that the artifacts stay in sync, but I think our process ensures that.

The response is doing two distinct things. The first sentence reports a direct readability outcome — the slim system-design.md is producing the schema-building effect ADR-083's Outcome Test names. The second exchange is a categorical question about placement, which the agent answered: the companion file stays at `docs/system-design.agents.md` per ADR-084's predictable-path convention; ADR-085's `.rdd/` axis is infrastructure-vs-product, ADR-084's companion-file pattern is audience-vs-audience, and the cycle's DISCOVER gate (snapshot Moment 3) explicitly distinguished the two. The third sentence names the practitioner's actual deliberation criterion: Pattern B is acceptable iff sync mechanisms exist; the practitioner's belief is that the cycle's process ensures sync.

The agent enumerated four sync mechanisms in place — ADR-074 supersession sweep with `system-design.agents.md` added to the downstream-sweep target list (Decide Skill v14.0 amendment); Version: field synchronization with `test_system_design_companion_version_sync.sh` Fitness criterion; architectural symmetry at producing phases (ARCHITECT and DECIDE produce edits to both files in a single editing session); `/rdd-conform` audit scope drift-detection — and surfaced one structural gap: the `orientation-trigger` hook's PostToolUse matcher needs extension to fire on writes to `system-design.agents.md` (currently fires on system-design.md, domain-model.md, scenarios.md). The gap is mechanical and lands at BUILD as an addition to WP-B (hook script path substitution).

The practitioner's confirmation: "OK, that's satisfactory then." Pattern B settled at the practitioner's commitment level given the four sync mechanisms in place plus the WP-B addition for the orientation-trigger gap.

## Pedagogical move selected

Challenge (belief-mapping). The move tested whether the Pattern B choice remains earned at the practitioner's commitment level — not by asking for confirmation of the calibration but by mapping the belief space of the alternative. The response did not confirm Pattern B abstractly; it engaged directly with a specific concern (sync) and named the structural mechanism that would settle it. The agent's enumeration of sync mechanisms produced a substantive exchange rather than a generic affirmation, and the practitioner's settling sentence ("OK, that's satisfactory then") came after the gap was named and addressed, not before.

## Commitment gating outputs

**Settled premises (the practitioner is building on these going into BUILD):**

- **Pattern B is the right structural choice for system-design.md.** The slim human-facing artifact and the companion `system-design.agents.md` jointly satisfy the Outcome Test for first-encounter readers and the agent-context construction needs. The split is earned, not perfunctory.
- **The companion file stays at `docs/system-design.agents.md` per ADR-084's predictable-path convention.** ADR-085's `.rdd/` axis is categorically distinct (infrastructure-vs-product, not audience-vs-audience). The two axes do not conflate.
- **Four sync mechanisms are in place** (ADR-074 supersession sweep, Version: field synchronization, architectural symmetry at producing phases, `/rdd-conform` audit scope) plus one mechanical gap (orientation-trigger hook matcher extension) that lands at BUILD.
- **The Cycle 017 ARCHITECT design discharges the deferred sweeps** for system-design.md, system-design.agents.md, ORIENTATION.md per ADR-074 Step 3 (path migration anticipated; advisory-disposition language threaded through; State-C "structurally detectable" replaces "structurally impossible"). field-guide.md sweep deferred to BUILD WP-E as planned.
- **No invariant changes in this cycle.** The Outcome Test (ADR-083) remains at methodology-principle level pending structural anchor.
- **No new code modules.** One new artifact module (`system-design.agents.md`); the dependency graph's structural shape is preserved.

**Open questions (the practitioner is holding these open going into BUILD):**

- The five Value Tensions T1–T5 from product discovery (initial-handoff vs ongoing-reference; outcome test vs reading-cost test; cognitive vs non-cognitive admissibility; multi-item turn bundling vs upstream decomposition; AI-as-orienter vs AI-as-prosthetic) — carried forward as the methodology continues to operate.
- Outcome Test invariant-placement question (ADR-083 §6) — held as future-cycle scope.
- "Does RDD over-engineer?" future-cycle critique (MODEL Amendment 21 + ADR-087 §3a) — partly addressable in-cycle via tightly-scoped prototyping; broader structural-posture critique remains worth a dedicated cycle.
- The cycle-as-instance reflection (ADR-087 §4) elevation question — whether it should rise above standing-caveat status into more formal scope-of-claim language.
- Three framing-audit findings (F-P2.1 ADR-083 bolt-on signal scope vs companion files; F-P2.2 ADR-086 final non-adoption framing tone; F-P3.1 ADR-084 naming convention novelty), three alternative framings (Tier 1 Outcome Test now; provisional naming convention pending ecosystem alignment; Tier 1 spike-or-rejection record), and three unfeatured truths (Ernst & Robillard scope qualification; "threading is wrong in principle" alternative; ADR-083 exception conditions agent-composed) — preserved as user judgment for BUILD or future cycles, not adopted as auto-corrections.

**Specific commitments carried forward to BUILD:**

- **`/rdd-conform migrate-to-rdd` subcommand implementation** per ADR-085 §4 ten-step operation, with explicit hook test fixtures in the substitution sweep (WP-A).
- **Hook script + test fixtures path substitution** to `.rdd/` paths with backward-compat fallback (WP-B). **Addition surfaced at this gate:** extend the `orientation-trigger` hook PostToolUse matcher to fire on writes to `system-design.agents.md` alongside the existing system-design.md, domain-model.md, scenarios.md targets. One-line config edit; mechanical.
- **`/rdd-research` skill-text edit** at the research → discover gate per ADR-087 §3 — validation-spike decision step with felt-trigger question and rationale-recording requirement (WP-C).
- **Stop-hook manifest check advisory disposition + In-Progress Phase predicate** verification per ADR-088 / ADR-090 (WP-D).
- **`field-guide.md` regeneration** discharging the deferred sweep from Cycle 017 DECIDE/ARCHITECT for advisory-disposition language and `.rdd/` path updates (WP-E).
- **Graduation-check tooling for code → doc dangling references** (Issue #17) — pre-graduation scan modeled on Tan et al. 2024 in reverse direction (WP-F).
- **Integration verification + release housekeeping** including conformance-scan re-run, plugin version bump, release notes (WP-G).
- **Five ARCHITECT-phase feed-forward signals to BUILD** from the susceptibility snapshot (recorded below in cycle-status).

## Second exchange — Pattern B applied beyond system-design (ORIENTATION-routing coherence)

The gate appeared settled after the four-sync-mechanisms exchange. The practitioner then reopened it with a follow-up:

> A follow up — what about the product discovery and domain model docs? Is there an agents variant of those? How can we minimize the human-reader surface for maximum comprehensibility?

The agent's first response surfaced an embedded conclusion in the framing ("minimize the human-reader surface for maximum comprehensibility") and distinguished it from ADR-083's actual commitment (outcome-coded direct human understanding, not surface minimization). It then walked the per-artifact judgment for product-discovery, domain-model, ORIENTATION, roadmap, scenarios, interaction-specs — recommending against proliferating `.agents.md` companion files as a default, and against in-place restructuring of artifacts that didn't show up in the cycle's evidence.

The practitioner pushed back substantively:

> I guess I'd push back to say that Orientation.md guides specific human readers toward certain documents. If those documents aren't themselves comprehensible from that reader's perspective then we need to address them.

This pushback corrects a localization error in the agent's first response. Essay 016 §1 explicitly names *"system design, product discovery"* (plural) as the substantive Tier-2 documents that become overwhelming once readers pass the entry point. The agent had narrowed the cycle's evidence to system-design alone. The practitioner's framing also refines the principle: ORIENTATION-as-router is only coherent if the routed-to artifacts work for the routed reader. ZPFR is routed to product-discovery.md ("for the human-facing problem") and to domain-model.md § Invariants ("for the most concentrated load-bearing constraints") — and both currently fail the ZPFR's specific reading task.

Three problems were distinguished in the agent's reply at distinct scales:

1. **F-pattern violation in product-discovery.md and domain-model.md** — neither has an orientation lead at top; both go straight into dense content. Same mechanism as essay 016 §4.5; same intervention; tightly scoped.
2. **Structural ordering in domain-model.md** — Invariants buried at line 761 of an 886-line file; ORIENTATION routes ZPFR there for "concentrated load-bearing constraints" but the reader has to scroll past 760 lines of concepts to find them.
3. **Corpus-internal-identifier accessibility** in artifact bodies (ADR-NNN, Cycle-N, Tier-N, Spike-N references without gloss) — a different mechanism than what essay 016 investigated; warrants its own cycle.

ARCHITECT applied Problems 1 and 2 in-cycle as natural per-artifact judgment scope (per ADR-084), and surfaced Problem 3 as a future-cycle scope candidate.

**In-cycle additions to ARCHITECT scope (executed during this gate):**

- **product-discovery.md** — F-pattern orientation lead added at the top, naming the document, its audience, and the five-section structure. Cross-reference to ORIENTATION.md as entry point. No content removed or relocated; the lead sits between the title block and the existing Stakeholder Map section. ~40 lines added.
- **domain-model.md** — F-pattern orientation lead added at the top, naming the document as Tier 3 reference material with Invariants as the highest-leverage starting point for first-encounter readers and stakeholders following ORIENTATION's reading paths. **Invariants section moved from line 761 to immediately after the orientation lead** — this addresses ORIENTATION's routing-coherence requirement directly. The remaining sections (Concepts, Actions, Relationships, Open Questions, Amendment Log) follow in the same order. No content removed; only relocated. ~50 lines reordered.

**Surfaced for future cycle (Problem 3):** corpus-internal-identifier accessibility in artifact bodies. The mechanism is structurally similar to Issue #17 (continuous documentation for nomenclature) but operates in a different direction: Issue #17 addresses code → doc dangling references after graduation; this addresses within-doc internal references that lack gloss for first-encounter readers. Audit + restructure pass across system-design.md, system-design.agents.md, product-discovery.md, domain-model.md, ORIENTATION.md is the natural scope. Worth its own cycle.

## Third exchange — domain-model taxonomy for long lists

The practitioner extended the routing-coherence concern with a follow-up:

> For domain model, another organization question. Invariants and concepts read as long long lists. For each list is there a way to determine and group by some taxonomy?

Two distinct taxonomy questions in one. **Invariants** (9 items) admit a clean taxonomy by what the principle governs — outcome / gate principles / role boundary / trajectory and execution. **Concepts** (~150+ entries across the table) admit at least two competing taxonomies: chronological-by-cycle (preserves provenance; mirrors the responsibility matrix in `system-design.agents.md`; lower judgment cost) versus topical (better for first-encounter navigation; requires per-concept classification judgment with multi-home concepts).

ARCHITECT executed:

- **Invariants regrouped under four cluster sub-headers** in `docs/domain-model.md`: Outcome (Invariant 0); Gate principles (1, 2, 4, 5); Role boundary (3, 7); Trajectory and execution (6, 8). The sub-headers' explanatory sentences let a first-encounter reader scan the structure of the commitments at a glance rather than treating nine principles as an undifferentiated list.
- **Brief organizational preambles added** to Concepts, Actions, Relationships, and Open Questions sections naming the chronological-by-cycle accumulation pattern and cross-referencing the Responsibility Matrix in `system-design.agents.md` as the topical navigation index. The Concepts preamble explicitly names the cycle groupings (Foundational pedagogy → Product Discovery → Synthesis → ... → Cycle 017 readability) so a reader can navigate without leaving the file.
- **F-pattern lead at the top of domain-model.md updated** to reflect the new Invariants taxonomy (four families) and the section organizational notes.

**Surfaced for future cycle (Problem 4):** topical taxonomy for Concepts/Actions/Relationships. Whether organizing by what concepts are *about* (pipeline mechanics, stakeholders, epistemic mechanics, architectural mechanisms, readability vocabulary) would serve first-encounter readers better than chronological-by-cycle is a real research-and-design decision: a single concept can plausibly fit multiple topical homes, and the methodology's accumulated practice is chronological. Worth its own focused cycle, paired with Problem 3 (corpus-internal-identifier accessibility) — both are domain-model-accessibility-for-first-encounter-readers questions at different scales.

The pushback exchange demonstrates the methodology working at gate. The agent's first localization was incomplete; the practitioner's pushback corrected it; the in-place additions discharge the routing-coherence concern for the two artifacts most acutely affected; the larger surface (corpus-internal identifiers) is named honestly as future-cycle scope rather than absorbed into this cycle without scoping decision.

## Disposition of upstream Grounding Reframes at this boundary

- **RESEARCH-phase Grounding Reframe Target 1 (cognitive-economy constraint):** discharged at the discover → model gate (DISCOVER snapshot Moment 3 / outcome-test reframe). ADR-083 encodes the Outcome Test with in-place-first default. ARCHITECT applied it: the bolt-on signal does not apply to system-design.agents.md because the content genuinely diverged; the slim system-design.md passes the Outcome Test for first-encounter readers' specific task. **Second-exchange addition:** F-pattern orientation leads + Invariants reorder on product-discovery.md and domain-model.md apply the same in-place-first principle to the artifacts ORIENTATION routes ZPFR to.
- **RESEARCH-phase Grounding Reframe Target 2 (Beck framing):** discharged at the decide → architect gate (ADR-087 §1 calibration; §3 reframed as research-method-toolkit expansion). No ARCHITECT-phase action required.
- **No new Grounding Reframe targets surfaced at this gate.** The susceptibility snapshot returned no Grounding Reframe with five feed-forward signals to BUILD (recorded in cycle-status).

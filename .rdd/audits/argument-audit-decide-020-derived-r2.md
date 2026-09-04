# Argument Audit Report — Re-Audit After Revision (R2)

**Audited document:** `docs/decisions/adr-099-substrate-and-surface-separation.md` (derived from `docs/substrate/adr/adr-099.json`); `docs/decisions/adr-100-pre-triage-at-practitioner-facing-moments.md` (derived from `docs/substrate/adr/adr-100.json`)
**Source material:** Prior round `.rdd/audits/argument-audit-decide-020-derived-r1.md`; prose baselines `/private/tmp/.../scratchpad/adr-099-prose.md`, `adr-100-prose.md`; `docs/decisions/adr-074-adr-supersession-workflow.md`; `.rdd/gates/020-architect-gate.md`; `.rdd/gates/020-decide-gate.md`; `docs/views/adr-064.md`, `adr-084.md`, `adr-085.md`; commit `74848df` (the revision under verification)
**Genre:** ADR (single-purpose re-audit after revision, per ADR-094's re-audit-after-revision rule — runs unconditionally, not counted in the R1/R2/R3 standard sequence)
**Date:** 2026-09-04

## Scope

This is not a fresh standard-sequence round. It verifies that the three revisions made in response to R1's findings (P2-1, P3-1, P3-2; plus the framing P3) repair what R1 named, introduce no new overreach, and touch nothing else in either derived file. Per ADR-094 P3-R5-1, no Convergence-Saturation Signal verdict line is appended (this is a re-audit-after-revision dispatch, not a primary-sequence round).

## Method

1. Read R1 in full to recover the exact text of each finding and its recommendation.
2. Read the current derived markdown and Substrate JSON for both ADRs.
3. Diffed the actual change (`git show 74848df` against the two files and two records) rather than relying on memory of R1's text — this gives an exact, mechanical answer to "did anything else change."
4. Checked the erratum's new governance-basis sentence against ADR-074 (as updated by ADR-099) and ADR-099 §Authority option C's own text, both read in full.
5. Checked the three new `lineage` links against ADR-099's Context paragraph (the six-ADR sentence) and against the linked ADRs' own titles and summaries in `docs/views/adr-064.md`, `adr-084.md`, `adr-085.md`.
6. Checked the `references → invariant-1` swap against ADR-099's body text for an actual "Invariant 1" mention.
7. Checked the restored `.rdd/gates/020-decide-gate.md` citation and the "ruled as a framing-class pivot" clause against the ARCHITECT and DECIDE gate notes directly.

## Findings by prior-round item

**P2-1 (governance basis for the body correction) — REPAIRED.** The erratum now reads: *"Governance basis for correcting the body here: the prose file that carried this ADR before BUILD WP-D stays frozen per ADR-074 (its erratum was header-only, body unchanged); this record is authored fresh under ADR-099 §Authority option C as the canonical body of a post-ADR-099 unit and is not an edit to that frozen body, so it states the correction directly."* This is close to verbatim R1's suggested sentence. It checks out against both cited authorities:
- ADR-074 (as updated by ADR-099) states: *"For governance units authored after ADR-099 ... the immutable body in this ADR's sense is the Substrate record; the markdown ADR file ... is a derived Surface View, regenerated from the record."* ADR-099 and ADR-100 are the first units under this rule (self-referentially — the WP-D form change applies ADR-099's own new regime to ADR-099 and ADR-100 themselves), so "authored fresh ... as the canonical body of a post-ADR-099 unit" is accurate, not a stretch.
- ADR-099 §Authority option C's own Commitment text: *"the record is the immutable body in ADR-074's sense; the markdown ADR at the existing path is a derived Surface View ... and is overwritten on regeneration."* This directly supports "not an edit to that frozen body" — the frozen body is the prose *content* as it stood, not the file path, and the file at that path is expected to be overwritten mechanically once a record exists.
- "its erratum was header-only, body unchanged" is a direct paraphrase of the ARCHITECT gate note's own words ("A dated erratum header added to ADR-100 (ADR-074 header pattern; body untouched)"), not an invention.

No new overreach in the governance-basis clause itself. One new observation surfaces from the sentence appended after it — see New P3-1 below.

**P3-1 (missing lineage links to ADR-064/084/085) — REPAIRED.** Three new `lineage` links added to ADR-099, each with a note. Checked against ADR-099's Context sentence (*"Six prior ADRs (064, 083, 084, 085, 092, 095) each addressed the human/agent audience split at one point: category naming, human-facing outcome test, agent-context placement, infrastructure relocation, research-artifact form, agent-facing admissibility"*) and against the linked ADRs' own titles/summaries:
- ADR-064's note ("centered-vs-infrastructure category naming") matches ADR-064's own summary ("introduces the `docs/housekeeping/` directory for infrastructure artifacts under the centered-vs-infrastructure framing") and the Context sentence's "category naming."
- ADR-084's note ("agent-context placement: Pattern A ... vs. Pattern B ...") matches ADR-084's title and summary (Pattern A/B is exactly what ADR-084 decides) and the Context sentence's "agent-context placement."
- ADR-085's note ("process vs. product on the directory axis") matches ADR-085's title (".rdd/ Infrastructure Relocation — Process-vs-Product Directory Separation") and the Context sentence's "infrastructure relocation."

All six ADRs named in the Context prose now have a corresponding `lineage` link (three pre-existing plus these three); the index-vs-prose gap R1 flagged is closed. This was possible now because legacy index records for ADRs 001–093 were authored in the same commit (per the commit message), so a valid link target now exists for 064/084/085 — exactly the self-resolution R1 predicted ("expect this to self-resolve as legacy index records for 064/084/085 are authored").

**P3-2 (`references → invariant-0`/`invariant-8` unanchored) — REPAIRED, with a minor trade noted.** The two unanchored links are replaced by a single `references → invariant-1`. Grepping ADR-099's body confirms exactly one "Invariant 1" mention, inside §Authority option B's discussion ("It does not by itself establish that the practitioner's ruling was an adequate epistemic act under Invariant 1"). The new link is now precisely anchored, resolving the finding as stated. R1 had marked this "no action required, low stakes," so any resolution is a bonus; this one is clean. See New P3-2 below for the minor trade this creates (not a repair failure).

**P3-3 (missing `.rdd/gates/020-decide-gate.md` path in the erratum) — REPAIRED.** The erratum now cites the path directly: *"The DECIDE gate record (`.rdd/gates/020-decide-gate.md`) shows a stated default, not overridden."* Verified against the file directly — line 24 states "Neither default was overridden," confirming the citation is accurate as well as present.

**Framing P3 (erratum's flat tone vs. the gate's own Pivot classification) — REPAIRED.** The erratum now adds *"the snapshot at the architect → build boundary caught the overclaim and it was ruled as a framing-class pivot at the ARCHITECT gate (`.rdd/gates/020-architect-gate.md`, 2026-09-04), where the practitioner put the question on its own."* This is close to verbatim R1's suggested clause and is directly supported by the ARCHITECT gate's own triage table, which classifies the finding as "**Pivot** (framing-class; surfaced whole)."

## Check (3): did anything else change?

`git show 74848df` on the four files under audit shows exactly four hunks: the three new `lineage` links plus the `references` swap in `adr-099.md`/`adr-099.json`, and the erratum-text rewrite in `adr-100.md`/`adr-100.json`. Nothing else in either derived file changed — no heading, no warrant, no rejected alternative, no consequence, no other typed link. Confirmed by direct diff, not by re-reading the full document against memory of R1's method.

## New findings

**New P3-1. The erratum's added standing rule ("Every later body correction to a canonical record must cite its governance basis the same way") is asserted inside an ADR-100 erratum note, not decided in any ADR's Decision section or filed as an amendment to ADR-074 (the ADR that actually owns correction/supersession mechanics).**
- **Location:** `docs/decisions/adr-100-pre-triage-at-practitioner-facing-moments.md:1-3` (erratum), trailing sentence.
- **Claim:** The sentence states a corpus-wide, prospective governance rule binding all future canonical-record body corrections, not just this one.
- **Evidence gap:** ADR-100's own Decision section is about pre-triage and plain-language presentation; it does not decide anything about ADR correction mechanics. ADR-074 (as updated by ADR-099) is the ADR that governs body immutability and correction, and it has no such rule, and this new sentence is not filed as an update to it. This isn't inconsistent with anything else in the corpus (nothing contradicts it), and it isn't a claim about a fact that could be wrong — it's a self-imposed practice norm. But a future reader relying on Typed Links or Decision sections as the place governing rules live (which is exactly the navigability ADR-099 argues for) would not find this rule there; they would have to happen to read this specific erratum.
- **Recommendation:** Consider, at low priority: fold the rule into ADR-074's Decision (as a further "Updated by ADR-099/ADR-100" note) or into ADR-099's Note Discipline constraint, where a reader looking for correction-governance rules would actually find it. Not urgent — the rule is reasonable on its face and doesn't misstate anything.

**New P3-2. Replacing `invariant-0`/`invariant-8` with `invariant-1` in ADR-099 drops the (thematically real, if unanchored) navigability link from ADR-099's own "destination and ... route ... never reads the engine" design-target language (line 73) to Invariant 0.**
- **Location:** `docs/decisions/adr-099-substrate-and-surface-separation.md` Typed Links list; line 73 (Design target sentence).
- **Claim:** ADR-099 previously asserted (unanchored) a connection between its own destination/route/engine language and Invariant 0. That connection is gone from the Typed Links list now.
- **Evidence gap:** No real information is lost at the corpus level — ADR-099 is `complemented-by`/`complements`-linked to ADR-100, and ADR-100 carries the fully anchored `references → invariant-0` and `references → invariant-8` links along with the explicit textual mentions R1 already found there. A reader following Typed Links from ADR-099 reaches ADR-100 in one hop and finds the invariant-0/8 connections anchored there. This is not a regression in substance, just a narrowing of ADR-099's own link list to what its own body text supports directly — which is precisely what P3-2 asked for.
- **Recommendation:** None required. Noted only because the fix, while correct, trades a broad-but-unanchored set of links for a narrow-but-anchored one; worth being aware of if ADR-099's Typed Links are read in isolation from ADR-100's.

Neither new item rises above P3: neither contradicts anything in the two ADRs, ADR-074, or the gate notes, and neither is a claim that could be factually wrong. Both are governance-hygiene/navigability observations about the repair itself, not gaps in the repair's stated purpose.

## Framing check

No new framing issue is introduced by the revision. The three edits are precision/completeness corrections to existing claims (governance basis, lineage coverage, invariant anchoring), not new claims about what to feature or exclude, and the source material available at R1 hasn't changed.

## Verdict

**Repairs verified.** All three R1 findings (P2-1, P3-1, P3-2) plus the framing P3 are repaired as described, each checks out against its cited authority, and the diff confirms nothing else in either derived file changed. Two new P3 observations are recorded above (erratum-placement of a new standing rule; a minor link-coverage trade) — neither blocks anything, neither is a repair failure, and neither warrants a further revision cycle on its own.

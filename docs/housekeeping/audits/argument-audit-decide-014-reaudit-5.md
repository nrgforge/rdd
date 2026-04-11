# Argument Re-Audit Report 5 — Cycle 10 DECIDE (NI-C fix)

**Audited document:** `docs/decisions/adr-066-user-tooling-layer.md` (targeted to NI-C fix)
**Source material:** `docs/decisions/adr-064-compound-check-hooks.md`, `docs/decisions/adr-070-housekeeping-migration.md`
**Date:** 2026-04-09
**Prior audits:**
  - `docs/essays/audits/argument-audit-decide-014.md`
  - `docs/essays/audits/argument-audit-decide-014-reaudit.md`
  - `docs/essays/audits/argument-audit-decide-014-reaudit-2.md`
  - `docs/essays/audits/argument-audit-decide-014-reaudit-3.md`
  - `docs/essays/audits/argument-audit-decide-014-reaudit-4.md`

---

## Summary

**Argument chains mapped:** 4
**Issues found:** 0
- **P1:** 0
- **P2:** 0
- **P3:** 0
- **Framing concerns:** 0 (unchanged from re-audit 4)

---

## NI-C Verification

**Status: RESOLVED**

**Revised text (ADR-066 line 40):**

> "This is a new directory under the housekeeping pattern established in ADR-064. It is parallel to `docs/housekeeping/audits/` (the migration target for audit reports per ADR-070): both are infrastructure artifacts under the centered-vs-infrastructure framing — they underpin framework operation (gate reflection notes are consumed by the Stop hook's manifest check; audits are consumed by the orchestrator and surfaced to users by the agent), without being centered for direct user reading in normal workflow. Users can read either directly if they choose, but the methodology does not expect them to browse these files as part of cycle work."

**Assessment:** The old binary criterion ("machine-consumed, corpus-visible, not read-as-prose") is gone. The revised text applies the centered-vs-infrastructure vocabulary directly and mechanically: it names the framing explicitly, cites the consumption patterns as the grounding rationale (hook consumption for gate notes; orchestrator + agent-surface for audits), and reproduces the spectrum qualifier ("Users can read either directly if they choose") that ADR-064's §"Housekeeping directory" encodes. The revised sentence is internally complete — a reader need not follow the citation to ADR-064 to understand the classification criterion, because the criterion is stated here rather than implied by the old binary.

**Consistency with ADR-064 framing:** Fully consistent. ADR-064 §"Housekeeping directory" defines infrastructure artifacts as things that "underpin framework operation without being designed for direct user reading" and specifies that "the distinction is not a hard binary." The revised ADR-066 text reproduces both elements — the "underpin framework operation" functional criterion and the "Users can read either directly if they choose" spectrum qualifier.

**Any remaining stale references in ADR-066:** None. Full-text grep across `docs/decisions/` for "read as prose," "read-as-prose," "machine-consumed, corpus-visible, not read," and "acted upon, not read as prose" returns zero matches. The old binary does not appear anywhere in ADR-066.

---

## Provenance check update verification (ADR-064)

**Were the provenance check references at ADR-064 lines 262 and 266 updated?**

The brief reports that the agent additionally updated ADR-064's provenance check section to use "centered-vs-infrastructure (originally readables-vs-housekeeping)" as a historical provenance reference at lines 262 and 266. Reading the current ADR-064 provenance check:

- **Line 147:** "The centered-vs-infrastructure framing was surfaced by the user at DECIDE gate 2026-04-09 in response to the framing audit's FC-B observation that the original readables-vs-housekeeping binary was actually a spectrum." This is accurate and appropriate: it names the original framing in the context of attributing the refinement. The phrase "readables-vs-housekeeping" identifies what was superseded; it does not apply the old binary as a test.

- **Line 262:** "The centered-vs-infrastructure framing (originally readables-vs-housekeeping): user-surfaced at DECIDE gate 2026-04-08 as a binary framing (readables vs. housekeeping), refined at DECIDE gate 2026-04-09 to 'centered-vs-infrastructure' in response to the framing audit's FC-B observation that the original binary was actually a spectrum." This is a full provenance record of the framing's evolution. It names both dates (2026-04-08 for the original; 2026-04-09 for the refinement), names the catalyst for refinement (FC-B from the framing audit), and characterizes what changed (binary to spectrum, readables-vs-housekeeping to centered-vs-infrastructure). The "originally readables-vs-housekeeping" parenthetical is exactly the historical provenance reference the brief anticipated — it documents the evolution rather than applying the old criterion.

- **Line 266 (the result paragraph):** Uses only the current "centered-vs-infrastructure" vocabulary. No residual old-framing language.

**Do the historical references remain appropriate?** Yes. Lines 147 and 262 are the correct place for this provenance: they name the old framing precisely because its supersession is what the attribution is explaining. Removing these references would obscure the refinement history. Retaining them in the provenance check, where they are clearly historical record rather than operative criterion, is the correct encoding.

**Attribution accuracy:** The brief indicates the agent noticed lines 262 and 266 still used old-framing language and updated them. Reading the current ADR-064 text, both lines now accurately describe the framing as "centered-vs-infrastructure (originally readables-vs-housekeeping)" — the parenthetical names the provenance, and the main designation uses the current vocabulary. This is accurate and internally consistent with ADR-064's own §"Housekeeping directory" section, which uses centered-vs-infrastructure throughout.

---

## Full cross-ADR consistency sweep

Grep across `docs/decisions/` ADRs 063–070 for applied instances of the old binary criterion.

**"acted upon, not read as prose":** Zero matches across all files.

**"machine-consumed, corpus-visible, not read-as-prose":** Zero matches across all files.

**"readables-vs-housekeeping" (applied as a test, not a historical reference):** Two matches, both in ADR-064:
- Line 147: historical reference in §"Housekeeping directory" attribution note — naming what was superseded.
- Line 262: historical reference in the provenance check bullet — naming the original binary framing to explain when and why it was refined.

Neither occurrence applies the old binary as a classification criterion. Both name it as what was superseded. These are appropriate provenance records.

**"not read as prose" (variant form):** Zero matches across all files.

**Sweep result:** Zero applied instances of the old framing remain. The two historical references in ADR-064 are correctly framed as provenance records of the refinement, not operative tests. The centered-vs-infrastructure vocabulary is now the sole applied criterion across ADR-064, ADR-066, and ADR-070.

---

## New Issues (if any)

None. The NI-C fix is a clean single-criterion substitution that does not touch the surrounding argument structure in ADR-066 and does not introduce any new claims. Adjacent text (the "Required structure," "Captured vs. not captured," and "Manifest entry" subsections) was not modified and contains no framing language requiring update.

The ADR-064 provenance check update is equally clean: the historical references at lines 147 and 262 are now correct records of the refinement history. No argument is affected; no new claim is introduced.

---

## Clean Closure

NI-C is **RESOLVED**. The cross-ADR consistency sweep finds zero applied instances of the old binary criterion. The two remaining "readables-vs-housekeeping" occurrences in ADR-064 are correctly framed historical provenance references. No new issues were introduced by the NI-C fix or the provenance check update.

All prior findings remain closed:
- P1-A through P3-C: closed in the original audit and re-audit 1.
- FC-A, FC-B, FC-C: closed in re-audit 3, confirmed in re-audits 4 and 5.
- NI-1 (re-audit 2): closed.
- NI-A, NI-B1, NI-B2 (re-audit 3/4): closed.
- NI-C (re-audit 4): closed in this re-audit.

The DECIDE set is ready to proceed past the epistemic gate.

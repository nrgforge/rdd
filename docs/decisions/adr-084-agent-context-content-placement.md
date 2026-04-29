# ADR-084: Agent-Context Content Placement — Companion File or Audience-Tagging, Not Directory Separation

**Status:** Proposed

## Context

Essay 016 §4.1 examined the placement question for content the user characterized at the constraint-removal as "more helpful to the AI agent in constructing context for what is built or to be built" — material that lives in Tier-2 readables (chiefly `system-design.md`) but functions primarily as agent context rather than human-reader material. The cycle's question at entry was whether such content should be separated from human-facing artifacts.

The literature review (Diátaxis, DITA, Information Mapping, llms.txt, AGENTS.md) converged on a finding the cycle did not enter with: directory-level audience separation is not the supported pattern. Three classical documentation taxonomies organize by content type (tutorial, how-to, reference, explanation), not by audience type. DITA handles audience separation as a metadata attribute (`@audience`) with conditional processing output — tagging, not folder structure. The 2024–2025 practitioner consensus bifurcates by content-divergence threshold:

- Where human-facing and agent-facing material draw on the same facts presented differently, **unified source with audience-conditional rendering** or **frontmatter layering** is preferred — separate corpora create maintenance divergence and synchronization failure.
- Where the content is functionally divergent — agent-facing material requires different facts than human-facing material — the supported pattern is **parallel-sibling companion files at predictable paths**: `llms.txt` alongside HTML on a website (Howard 2024); `AGENTS.md` alongside `README.md` in a code repository.

Companion files are *additive*, not *substitutive*. The primary corpus retains its type-based organization; audience optimization happens at the margin.

The DISCOVER gate confirmed this finding's scope: companion files at predictable paths (within the human-visible corpus) handle genuinely-divergent agent-context content. The DISCOVER gate also explicitly distinguished this from infrastructure-vs-product separation (ADR-085's `.rdd/` relocation) — the §4.1 finding rejects audience-based directory separation, not infrastructure-based directory separation. The two are categorically different axes and must not be conflated.

The MODEL gate committed Companion File Pattern as a domain concept (Amendment 21) with the additive / non-substitutive characteristic encoded in the relationships.

## Decision

The methodology adopts **per-artifact judgment between two patterns** for agent-context content placement, with **directory-level audience separation rejected**. The two admissible patterns are:

### Pattern A — Audience-tagged sections within the existing artifact

Where human-facing and agent-facing material in an artifact draw on the same facts presented differently, the artifact retains a single file at its existing top-level location with **audience-tagged sections** distinguishing reader-facing prose from agent-facing structural detail. The tagging is structural (named sections with explicit audience annotation), not metadata-conditional. Audience-tagged sections require:

- Each section is named with explicit audience signal in its heading or a one-sentence orientation lead at the section's top (e.g., "*This section orients human readers to the system's high-level shape*" vs. "*This section provides agent context for code-construction work*").
- The reader can skip audience-tagged sections that do not match their reading task without losing the document's argumentative thread.
- Sections do not interleave audience types within paragraphs or paragraph-adjacent prose. Tagging is at the section level, not finer-grained.

Pattern A applies when content divergence is below the threshold that would justify a separate artifact — the same facts in different presentation form.

### Pattern B — Companion file at predictable path

Where human-facing and agent-facing material require **functionally divergent content** (the agent context contains facts the human-facing artifact does not need; or the agent context omits material the human-facing artifact requires), the supported pattern is a **parallel-sibling companion file at a predictable path**. The companion file:

- Sits alongside the primary artifact at a name-derived predictable path. For RDD, the convention is: companion file for `<artifact>.md` at `<artifact>.agents.md` (e.g., `system-design.md` → `system-design.agents.md`). The convention is name-derived so a reader can find the companion without an index.
- Carries a one-sentence orientation lead at its top stating its function as agent context for `<artifact>.md` and naming the human-facing artifact's file path.
- Is treated as **additive** to the primary artifact, not as a substitute. The primary artifact remains the readable source for human readers; the companion file holds the agent-only material.

Pattern B applies when the content-divergence threshold is met — the agent context has facts the human-facing artifact does not contain (or vice versa) and threading the two into one document would either burden human readers with irrelevant agent context or omit context the agent needs.

### Per-artifact judgment criterion for Pattern A vs. Pattern B

The choice between Pattern A and Pattern B is made per artifact, at the moment the artifact is structured or restructured. The judgment criterion:

- Apply Pattern A when the human-facing and agent-facing material in this artifact would be sectionable without producing >50% audience-tagged volume relative to the human-facing baseline. The threshold is felt, not mechanically computed; the ~50% indicator is **agent-proposed and not empirically calibrated** — practitioners should treat it as a starting point for judgment rather than a precision rule. Future cycles that observe the threshold's behavior in practice may refine it.
- Apply Pattern B when audience-tagged volume would dominate the human-facing baseline, or when the agent-facing material's structure and density would force the human-facing reader to scan past it on first encounter regardless of tagging quality.

The cycle's exemplary case is `system-design.md` itself. The artifact's diagram is load-bearing for human-facing orientation; the architectural-driver table, fitness criteria, responsibility allocations, and provenance chains are agent-context-dominant. Pattern A within the existing file would produce >50% agent-tagged volume; Pattern B is the supported choice. The agent-context material moves to `system-design.agents.md`; the human-facing `system-design.md` retains the diagram and adds an F-pattern orientation lead and brief module summaries with cross-references to the companion file for agent-context detail. ARCHITECT executes the restructuring per essay 016 §6.

### Directory-level audience separation — explicitly rejected

The cycle considered placing agent-context material under a dedicated subdirectory (e.g., `docs/agent/`, `docs/internal/`). This pattern is **rejected** as the methodology's answer to agent-context placement. Rationale:

- Directory-level audience separation produces synchronization failure between the human-facing and agent-facing corpora; the literature documents this explicitly (3-document maintenance bridge example, separate-corpus failure modes in technical writing practice).
- Predictable-path companion files provide the same audience-divergence accommodation without requiring corpus reorganization or breaking type-based primary structure.
- The methodology's existing `docs/` organization is type-coded (decisions, essays, references, housekeeping) — adding an audience-coded subdirectory introduces a second axis that interferes with type-based navigation.
- ADR-085's `.rdd/` infrastructure relocation is a categorically different axis (process-vs-product) and is not constrained by this rejection. Infrastructure relocation continues to use directory separation (the `housekeeping/` directory is itself an instance of process-vs-product directory separation, refined in ADR-085).

A future cycle may revisit directory-level audience separation if companion files prove insufficient. The current rejection is the cycle's commitment given the literature's evidence.

## Rejected alternatives

**Directory-level audience separation (e.g., `docs/agent/`).** Rejected. See the explicit-rejection subsection above.

**Single-document threading without audience structure (status quo for `system-design.md`).** Rejected. The cycle's field evidence is that this pattern is the source of the corpus comprehension failure for Tier-2 readables. Threading without explicit audience structure leaves human readers scanning past agent-context volume on first encounter; the F-pattern research is direct that this fails on first encounter.

**Frontmatter-conditional rendering (DITA-style `@audience` metadata with conditional processing output).** Rejected for v1. The pattern is supported in the literature but requires tooling (a build step, conditional rendering pipelines) that the current methodology does not have. Audience-tagged sections (Pattern A) achieve the same audience-divergence accommodation without requiring tooling. If a future cycle invests in rendering tooling, frontmatter conditional rendering becomes viable as an additional pattern alongside A and B.

**Companion file at non-predictable paths (e.g., `docs/agent-context/system-design-context.md`).** Rejected. The predictable-path naming convention (`<artifact>.agents.md`) is load-bearing — the companion file's discoverability rests on the convention. Non-predictable paths reintroduce the directory-level audience separation problem in a different form.

**Per-artifact-only judgment without methodology-level pattern catalog.** Rejected. The MODEL gate's variability-across-corpora commitment is consistent with admitting per-artifact variation, but the variability commitment is about admissibility criteria for human-facing artifacts (ADR-083), not about the structural choice between Pattern A and Pattern B. Methodology-level pattern catalog (Pattern A and Pattern B as named alternatives) gives practitioners actionable guidance; pure per-artifact judgment without a catalog produces inconsistent choices across artifacts in the same corpus.

## Consequences

**Positive:**

- The audience-conflation co-mechanism (named-inside Context-Mismatch in MODEL Amendment 21) becomes addressable at the structural level. Pattern A resolves cases where conflation is below threshold; Pattern B resolves cases where it exceeds threshold.
- The methodology adopts the literature's preferred answer (companion files at predictable paths for genuinely-divergent content) rather than the cycle's entry-direction (directory-level separation). Cycle 017's diagnostic recalibration lands as a structural commitment.
- ARCHITECT inherits a concrete restructuring direction for `system-design.md` — Pattern B with the diagram retained in the human-facing artifact and agent-context material relocated to `system-design.agents.md`. The restructuring is constrained by the per-artifact judgment criterion, not invented at ARCHITECT.
- The predictable-path naming convention (`<artifact>.agents.md`) is name-derived; new readers can find companion files by convention rather than by index.

**Negative:**

- Companion files double the artifact count for any Tier-2 readable that meets the Pattern B threshold. Maintenance burden increases linearly. Mitigation: companion files share a primary-artifact lifecycle (created with the primary artifact, updated alongside it); they are not standalone artifacts requiring independent ARCHITECT or BUILD work.
- The Pattern A vs. Pattern B threshold is felt, not mechanical. Practitioners may apply the threshold inconsistently — the same artifact could be Pattern A in one cycle and Pattern B in the next. Mitigation: the threshold (~50% audience-tagged volume) gives a felt indicator without claiming mechanical precision; the per-artifact judgment is recorded in the artifact's structural decision (e.g., system-design.md's restructuring at ARCHITECT records the choice and rationale).
- The rejection of directory-level audience separation forecloses an option some practitioners may favor on aesthetic or organizational grounds. Mitigation: the rejection is reasoned (synchronization failure, type-axis interference) rather than aesthetic; future cycles can revisit if companion files prove insufficient.
- The cycle does not specify how the human-facing `system-design.md` and the companion `system-design.agents.md` cross-reference each other. ARCHITECT will determine the cross-reference convention as part of the restructuring; this ADR commits to the pattern, not to the cross-reference detail.

**Neutral:**

- The methodology's existing `housekeeping/` directory (ADR-070; superseded by ADR-085) is not affected by this ADR. `housekeeping/` is process-vs-product separation, not audience-vs-audience separation.
- Pattern A and Pattern B are named alternatives in the methodology pattern catalog; future companion-file-style patterns (frontmatter conditional rendering, runtime audience selection) can be added to the catalog without restructuring this ADR.
- The companion-file pattern is named in MODEL Amendment 21 as additive / non-substitutive. This ADR encodes the additive characteristic in the structural commitment (companion files do not replace primary artifacts; the primary artifact remains the human-facing source).

## Provenance check

- **The two-pattern catalog (Pattern A audience-tagged sections, Pattern B companion file at predictable path):** essay 016 §4.1 (literature review of Diátaxis, DITA, Information Mapping, llms.txt, AGENTS.md). Driver-derived.
- **The per-artifact judgment criterion (~50% audience-tagged volume threshold):** drafting-time synthesis applying the essay's content-divergence threshold framing to a felt indicator. Agent composition; essay-grounded.
- **The directory-level audience separation rejection:** essay 016 §4.1 conclusion. Driver-derived.
- **The infrastructure-vs-audience axis distinction:** user-surfaced at the DISCOVER gate (recorded in `.rdd/audits/susceptibility-snapshot-017-discover.md` Moment 3 — the agent's §4.1 conflation correction). User-surfaced; audit-recorded.
- **The `<artifact>.agents.md` naming convention:** drafting-time synthesis composed against the AGENTS.md / llms.txt convention (essay 016 §4.1) and the existing artifact-name-coupled patterns in the corpus. Agent composition; essay-grounded for the convention category.
- **The `system-design.md` exemplary case (Pattern B with diagram retained):** essay 016 §4.4 (diagrams as one tool in audience-adaptive toolkit) and §6 (ARCHITECT inputs for system-design restructuring). Driver-derived.
- **The audience-conflation co-mechanism citation:** Context-Mismatch entry in domain model Amendment 21; folded encoding addressed in ADR-083 Rejected alternatives (the audience-conflation sub-name is citeable here). Driver-derived.

**Result:** Core decision (two-pattern catalog with directory-level rejection) is essay-grounded. The per-artifact threshold heuristic and the naming convention are agent-composed against driver-derived patterns. No synthesis-moment framing adoption detected. The infrastructure-vs-audience axis distinction is user-surfaced at the DISCOVER gate and is the load-bearing reason this ADR is structurally separate from ADR-085.

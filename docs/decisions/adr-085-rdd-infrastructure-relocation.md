# ADR-085: `.rdd/` Infrastructure Relocation — Process-vs-Product Directory Separation

**Status:** Proposed

## Context

ADR-070 (Cycle 10) committed the placement of infrastructure artifacts (audit reports, gate reflection notes, dispatch log, cycle-status, migration-version marker) under `docs/housekeeping/`. The decision was structured as the operational execution of ADR-064's centered-vs-infrastructure framing, with the user's stated rationale (DECIDE gate 2026-04-08) that operational files should live in the corpus alongside their peers, not as a hidden sidecar — *"come look under the hood, this is what we're doing."*

Cycle 017's investigation of the corpus-comprehension failure surfaced a different concern about the `housekeeping/` placement than the framing audit had addressed:

- **External stakeholder experience.** The cycle's field evidence is that a mature RDD artifact corpus feels overwhelming on first encounter — `docs/` is dense with subdirectories and the reader cannot easily distinguish artifacts they should read from artifacts that underpin framework operation. `housekeeping/` is at hierarchical equivalence with `essays/`, `decisions/`, `references/`, and the top-level Tier-2 readables. To a first-encounter reader, all subdirectories appear equally consequential.
- **Process-vs-product distinction is not structurally visible.** The centered-vs-infrastructure framing is real and load-bearing for the methodology's operation, but ADR-070's `housekeeping/` placement does not surface the distinction at the directory level. A reader scanning `docs/` cannot tell at a glance which artifacts are research / design / decision content versus framework infrastructure.
- **Reverse direction from the dotfile-rejection rationale.** The DECIDE-gate-2026-04-08 rejection of `.rdd-session/` as a hidden sidecar was framed against the original `.rdd-session/` proposal that lived **at the repo root**, outside the corpus, hidden from view. The rejection was about *hiding from the corpus*, not about *grouping infrastructure separately within the corpus*. A `.rdd/` subdirectory **inside `docs/`** is structurally different from a repo-root `.rdd-session/` sidecar — the artifacts remain corpus-visible at a discoverable path, the dotfile prefix signals process-vs-product without hiding the artifacts from inspection.
- **VCS exclusion friction.** ADR-070's `housekeeping/` placement requires per-file `.gitignore` entries for ephemeral artifacts (the dispatch log). A `.rdd/` directory enables straightforward subtree-level VCS exclusion via convention (the dotfile prefix is widely-understood as "tooling state"), reducing per-file gitignore management.

The DISCOVER gate of Cycle 017 committed `.rdd/` relocation as an ADR-074-style supersession candidate of ADR-070. The MODEL gate confirmed the commitment. Cycle 017's susceptibility snapshots (DISCOVER and MODEL) recorded the user-surfaced distinction between infrastructure-vs-product directory separation (in scope, this ADR) and audience-based directory separation (rejected, ADR-084).

This ADR supersedes ADR-070's `housekeeping/` placement and applies the four-step ADR-074 supersession workflow.

## Decision

### 1. Relocate infrastructure artifacts to `.rdd/`

The following relocate from `docs/housekeeping/` (ADR-070's placement) to `.rdd/` at the repository root:

| From | To |
|---|---|
| `docs/housekeeping/audits/` | `.rdd/audits/` |
| `docs/housekeeping/gates/` | `.rdd/gates/` |
| `docs/housekeeping/cycle-status.md` | `.rdd/cycle-status.md` |
| `docs/housekeeping/dispatch-log.jsonl` | `.rdd/dispatch-log.jsonl` |
| `docs/housekeeping/.migration-version` | `.rdd/.migration-version` |

The `session/` directory (BUILD context-reconstructive mode session artifacts; ADR-050) also relocates from its current root-level position to `.rdd/session/`.

### 2. Rationale — process-vs-product separation, structurally visible

The `.rdd/` directory groups artifacts that underpin **how RDD operates** as distinct from artifacts that record **what the methodology produced** (research, design, decisions). The dotfile prefix carries an established semantic in software corpora: it signals "tooling state" or "framework infrastructure" rather than "primary readable content." `.github/`, `.config/`, `.vscode/`, `.husky/`, and similar dotfile directories are well-understood by developers as conventionally separated from user-facing content.

The structural visibility is the load-bearing change. After relocation, a first-encounter reader scanning `docs/` sees only artifacts the methodology centers for human reading (essays, decisions, references, the Tier-2 readables). Infrastructure artifacts are still inspectable — `.rdd/` is not hidden, just dotfile-prefixed — but the distinction from product artifacts is structurally signaled rather than implicit in section labels.

This is **infrastructure-vs-product separation**, categorically distinct from audience-based separation (ADR-084 rejects audience-based directory separation). Infrastructure-vs-product is a process-axis distinction. Audience-based is a content-axis distinction. The rejection of one does not bear on the other.

### 3. Visibility, not hiding

The `.rdd/` placement is not equivalent to a hidden `.rdd-session/` sidecar at the repo root (the original 2026-04-08 proposal). Three distinctions:

- `.rdd/` lives at a known, conventional, **discoverable** path. The dotfile prefix is a semantic signal, not a visibility hack.
- The directory is not gitignored as a whole. Most artifacts within (audits, gates, cycle-status, .migration-version) are committed and corpus-visible. Only ephemeral session-scoped state (dispatch log, session/ artifacts) is selectively gitignored.
- Conformance audit (`/rdd-conform`) explicitly inspects `.rdd/` contents. The placement does not exempt artifacts from methodology hygiene.

Practitioners reading the corpus can navigate to `.rdd/` and inspect everything there. The placement signals "framework infrastructure" rather than "primary readable" — it does not signal "stay out."

### 4. Migration mechanics

The migration is a one-shot operation triggered by `/rdd-conform migrate-to-rdd` (a new subcommand alongside the existing `/rdd-conform migrate` from ADR-070). The operation:

1. Checks whether `.rdd/.migration-version` exists at a value matching this ADR's release; if so, no-op.
2. Creates `.rdd/` and subdirectories (`audits/`, `gates/`, `session/`).
3. Moves `docs/housekeeping/audits/*` → `.rdd/audits/*` preserving subdirectory structure.
4. Moves `docs/housekeeping/gates/*` → `.rdd/gates/*` preserving structure.
5. Moves `docs/housekeeping/cycle-status.md` → `.rdd/cycle-status.md`.
6. Moves `docs/housekeeping/dispatch-log.jsonl` → `.rdd/dispatch-log.jsonl` (if present; this is gitignored ephemera and may not exist in committed state).
7. Moves `docs/housekeeping/.migration-version` → `.rdd/.migration-version`.
8. Moves `session/` → `.rdd/session/` if present.
9. Removes the now-empty `docs/housekeeping/` directory.
10. Performs reference updates across `docs/decisions/*.md`, `docs/essays/*.md`, `skills/**/SKILL.md`, `hooks/manifests/tier1-phase-manifest.yaml`, `hooks/scripts/*.sh`, `hooks/tests/**/*.sh`, `docs/domain-model.md`, `docs/ORIENTATION.md` — substituting `docs/housekeeping/` → `.rdd/` in path references. **Hook test fixtures are explicitly included** (the conformance scan for this cycle identified test fixtures at `hooks/tests/lib.sh`, `test_nominal.sh`, `test_in_progress_phase.sh`, `test_applicable_when.sh`, `test_in_progress_gate.sh`, `test_multi_entry_stack.sh`, `test_output_path_regex.sh`, and `test_parses_cycle_stack_phase.sh` that hardcode `docs/housekeeping/` paths and would break post-migration if not included in the substitution sweep).
11. Updates `.gitignore`: removes `docs/housekeeping/dispatch-log.jsonl` entry; adds `.rdd/dispatch-log.jsonl` and `.rdd/session/`.
12. Writes `.rdd/.migration-version` with the plugin version performing the migration.
13. Produces a summary report.

The operation is idempotent. Running it on an already-migrated corpus detects the marker and no-ops.

The operation depends on ADR-070's `/rdd-conform migrate` having previously run successfully on the corpus (i.e., the corpus is currently in the `docs/housekeeping/` placement, not in the pre-housekeeping placement). A corpus that has not yet migrated to `housekeeping/` runs `/rdd-conform migrate` first (the ADR-070 path), then `/rdd-conform migrate-to-rdd` (this ADR's path). A future cycle may consolidate the two operations into a single `/rdd-conform migrate` that targets the current canonical placement; that is out of scope here.

### 5. Stop hook and PostToolUse hook updates

ADR-064's hook scripts read paths from the manifest. The manifest's `path_template` values update from `docs/housekeeping/...` to `.rdd/...` as part of the migration. The hooks themselves are unchanged in logic; they consume whatever paths the manifest specifies.

The advisory-mode detection in the Stop hook (per ADR-088 amending ADR-064) reads `.rdd/.migration-version` instead of `docs/housekeeping/.migration-version`. The migration marker's location moves with the migration.

### 6. Skill text updates

Phase skill files (`skills/**/SKILL.md`) reference `docs/housekeeping/` paths in dispatch instructions and artifact location specifications. The migration updates these references in lockstep with the directory move. ADR-065's canonical prompt skeleton (`Output path: <path>`) carries the new `.rdd/` paths; the skeleton itself is unchanged.

The orchestrator skill text references `cycle-status.md` at multiple locations. All references update.

### 7. ORIENTATION.md and README updates

ORIENTATION.md Section 4 (How the artifacts fit together) currently references `housekeeping/` for infrastructure artifact locations. The reference updates to `.rdd/`. Section 4 also gains a brief sentence: "*Process artifacts that underpin framework operation live in `.rdd/`; product artifacts that the methodology centers for human reading live in `docs/`.*"

README updates (project-level and `docs/README.md` if present) reference the new `.rdd/` location for any reader-facing pointers to infrastructure artifacts.

## Rejected alternatives

**Retain `docs/housekeeping/` placement (ADR-070's decision).** Rejected. The DISCOVER and MODEL gates of Cycle 017 explicitly committed relocation. The retain alternative is the status quo position; the cycle's evidence (external stakeholder confusion, hierarchical equivalence with product subdirectories, lack of structural process-vs-product signal) supports the relocation. Retaining `docs/housekeeping/` would amount to silently overriding the cycle's gate commitments at drafting time.

**Hidden sidecar at repo root (`.rdd-session/`, the original 2026-04-08 proposal).** Rejected for the same reasons it was rejected at DECIDE gate 2026-04-08: operational files should live at a discoverable path, not hidden from corpus inspection. `.rdd/` retains the corpus-visibility characteristic while signaling process-vs-product through the dotfile convention; a fully-hidden sidecar would forfeit corpus-visibility.

**Per-artifact-type subdirectories without a unifying parent (e.g., `docs/audits/`, `docs/gates/`, `docs/cycle-status.md`).** Rejected. This pattern was the pre-ADR-070 placement and produces exactly the hierarchical-equivalence problem this ADR addresses — infrastructure artifacts at top-level `docs/` competing visually with product artifacts. The unified parent (whether `housekeeping/` or `.rdd/`) is the structural element that groups infrastructure together.

**Single artifact relocation with type-coded subdirectories (e.g., `docs/process/audits/`, `docs/process/gates/`).** Considered. Replaces `housekeeping/` with `process/` as the unifying parent. Functionally equivalent to ADR-070 with a renamed parent — does not address the structural-visibility concern (still hierarchically equivalent to product subdirectories). The dotfile convention is what carries the process-vs-product semantic; `process/` does not carry the same signal.

**Move `essays/research-logs/` and `essays/reflections/` to `.rdd/` as well.** Rejected. ADR-070 explicitly classified research logs and reflections as **centered** (research prose; readers engage them as narrative material alongside essays). The Cycle 017 gates did not revisit that classification. Research logs and reflections remain at `docs/essays/research-logs/` and `docs/essays/reflections/`. The Cycle 017 relocation's scope is artifacts ADR-070 already classified as infrastructure plus the `session/` artifacts (BUILD context-reconstructive mode session artifacts, also infrastructure by their `session-artifact: true` frontmatter convention).

**Move ADR-070's framing to `.rdd/` while preserving the literal path strings as-is in old commits.** Rejected as a misreading of the question. Old commits' path strings are immutable — git history records what was true at the time. The relocation applies to current state going forward; ADR-070's body is preserved as the historical record of the prior decision (per ADR-074 body-immutability).

## Consequences

**Positive:**

- First-encounter readers see `docs/` populated only with product artifacts (essays, decisions, references, Tier-2 readables). Process-vs-product separation is structurally visible.
- The dotfile convention carries an established semantic that practitioners outside RDD will recognize. The pattern composes with broader software corpus conventions.
- VCS exclusion becomes subtree-clean: `.rdd/dispatch-log.jsonl` and `.rdd/session/` gitignored as ephemera; the rest of `.rdd/` committed and corpus-visible without per-file management.
- The cycle's "infrastructure tucked away" commitment (recorded at the model → decide gate) lands as a structural change rather than a categorical claim.
- The `housekeeping/` framing's failure mode — hierarchical equivalence with product subdirectories — is closed.

**Negative:**

- Migration touches many files (every ADR, essay, skill file, manifest, ORIENTATION.md, README references). The operation is mechanical but the diff is large. Mitigation: the migration is opt-in via `/rdd-conform migrate-to-rdd`, produces a summary report, and is `git diff`-reviewable before commit.
- The `.rdd/` placement requires updating the methodology's existing references (manifest, hook scripts, ORIENTATION.md, README, skill text, ADR-070's body via supersession header). The supersession workflow's downstream-sweep step (ADR-074 Step 3) is the load-bearing migration step.
- Older RDD corpora (pre-Cycle-017) using `docs/housekeeping/` need to migrate to receive the structural-visibility benefit. Pre-migration corpora continue to work; the methodology's hooks and skills handle both placements during the transition window. The advisory-mode behavior (per ADR-088) accommodates pre-`.rdd/` corpora.
- The cycle-archive (archived prior cycles) retains pre-migration paths. Readers of archived cycles encounter the older convention; a note in `docs/cycle-archive/README.md` (or equivalent) documents the path change.
- The `.rdd/` placement may surprise practitioners coming from the methodology's prior framing; the "come look under the hood" 2026-04-08 framing remains true (artifacts are inspectable at a known path) but the visual signal has changed. The change carries some discontinuity cost.
- **ADR-064's immutable body retains `docs/housekeeping/` path references after migration.** ADR-064's Decision section names the dispatch log path (`docs/housekeeping/dispatch-log.jsonl`), the migration-version marker path (`docs/housekeeping/.migration-version`), and the housekeeping directory throughout. ADR-074's body-immutability rule prevents correcting these references in ADR-064's body; they remain as historical record of what the paths were when ADR-064 was authored. Practitioners reading ADR-064 post-migration encounter paths that no longer exist in the live corpus. This is an expected artifact of body immutability + path migration together — not a documentation defect. The supersession header on ADR-064 (applied by ADR-088) names ADR-088 as the active authority; the path stale-ness is one specific consequence of the migration that readers composing ADR-064 with ADR-088 and ADR-085 need to navigate. ADR-088's supersession header on ADR-064 has been expanded (see ADR-088 amendment) to note this stale-path situation explicitly.

**Neutral:**

- The artifact contents (audits, gates, cycle-status, dispatch log, migration marker) are unchanged. Only their location changes. Readers of any of those artifacts read the same content as before.
- **`session/` inclusion in the relocation is an agent-composed extension of the gate commitment.** The DISCOVER and MODEL gates named "infrastructure artifacts (housekeeping/, session/, audit reports, dispatch logs)" as the relocation target. The specific inclusion of `session/` in this ADR's relocation scope (as opposed to a separate ADR) extends the gate commitment by applying the same process-vs-product axis to ADR-050's session artifacts, which carry `session-artifact: true` frontmatter explicitly classifying them as infrastructure. The extension is consistent with the gate commitment but the per-ADR scoping decision is agent-composed; practitioners reviewing the migration scope should be aware the session/ inclusion is not literally gate-itemized, only gate-axis-consistent.
- The conformance audit (`/rdd-conform`) gains a new audit scope: detect orphaned `docs/housekeeping/` content (pre-migration detection) and flag it. The existing housekeeping audit scopes (organization audit, gate template audit, dispatch prompt format audit from ADR-070) are retained, parameterized by the active placement.
- The migration is **partially deferred**: the four-artifact downstream-sweep (ADR-074 Step 3) updates `system-design.md` and `field-guide.md` references at ARCHITECT and BUILD respectively, alongside the natural regeneration of those artifacts in the cycle. Per ADR-074's fitness property, the deferred sweep is recorded explicitly in cycle-status.md so it is discharged rather than silently dropped.

## ADR-070 supersession header to apply

Per ADR-074 Step 2.5 supersession workflow, ADR-070 receives the following header at the top of its file (immediately below the `# ADR-070:` title):

```markdown
> **Updated by ADR-085 on 2026-04-27.** ADR-085 relocates infrastructure artifacts from `docs/housekeeping/` to `.rdd/` and applies process-vs-product directory separation via the dotfile convention. ADR-070's centered-vs-infrastructure framing remains current; only the placement changes.
```

ADR-070's Status field updates to `Updated by ADR-085`.

This is a **partial supersession** (IETF *Updates* analog), not total replacement. ADR-070's centered-vs-infrastructure framing, the migration mechanics for content-and-process separation, the rdd-conform scope extension framing, the version marker mechanism, and the advisory-mode-vs-enforcement-mode commitment all remain current authority. ADR-085 updates only the directory placement (`docs/housekeeping/` → `.rdd/`) and the path-substitution scope.

## Downstream artifact sweep status (per ADR-074 Step 3)

Required updates to current-state artifacts:

| Artifact | Status | Notes |
|---|---|---|
| `system-design.md` | **Deferred to ARCHITECT (Cycle 017)** | The ARCHITECT phase will restructure `system-design.md` per essay 016 §6 (F-pattern orientation lead, companion file via Pattern B in ADR-084, etc.); the `.rdd/` path updates fold into that restructuring rather than running separately. Deferred-sweep rationale recorded in cycle-status.md per ADR-074 fitness property. |
| `ORIENTATION.md` | **Deferred to ARCHITECT (Cycle 017)** | ARCHITECT phase regenerates ORIENTATION.md after system-design restructuring; Section 4's path references update at that time, plus the new "process artifacts in `.rdd/`" sentence. Deferred-sweep rationale recorded. |
| `domain-model.md` | **Deferred to ARCHITECT amendment-log entry** | The Amendment Log gains an entry recording ADR-085's supersession of ADR-070's path placement. References to `docs/housekeeping/` paths in domain-model.md update at the same time. Deferred-sweep rationale recorded. |
| `field-guide.md` | **Deferred to BUILD (Cycle 017)** | The field-guide regenerates at BUILD completion; path references update at that time. Deferred-sweep rationale recorded. |

The deferred sweeps are recorded explicitly in `.rdd/cycle-status.md` (post-migration path) under the DECIDE phase status entry, per ADR-074's fitness property. Each deferral names the natural regeneration moment that discharges it.

## Provenance check

- **The `.rdd/` placement decision:** user-surfaced at the DISCOVER gate of Cycle 017 (recorded in `docs/housekeeping/gates/017-discover-gate.md` and the discover susceptibility snapshot Moment 3); confirmed at the model → decide gate. Driver-derived; user-surfaced.
- **The infrastructure-vs-audience axis distinction:** user-surfaced at the DISCOVER gate (snapshot Moment 3) as the correction to the agent's §4.1 conflation. Driver-derived; user-surfaced.
- **The dotfile-convention semantic argument:** drafting-time synthesis composed against existing software-corpus conventions (`.github/`, `.config/`, `.vscode/`). Agent composition; convention-derived.
- **The visibility-vs-hiding distinction (`.rdd/` vs. hidden sidecar):** drafting-time synthesis applying ADR-070's user-surfaced "come look under the hood" framing to the new placement. The framing argument was that operational files should be discoverable; this ADR composes the same framing with a different placement. Agent composition; framing-derived.
- **The migration mechanics (one-shot operation, idempotent, supersession-workflow-compliant):** drafting-time synthesis modeled on ADR-070's migration mechanics. Agent composition; pattern-derived.
- **The deferred downstream-artifact sweep status:** per ADR-074 fitness property, sweeps may be deferred to natural regeneration moments with explicit rationale. Agent composition applying ADR-074's pattern; ADR-074-derived.
- **The exclusion of research-logs and reflections from relocation:** ADR-070's own classification of those artifacts as centered. Driver-derived (ADR-070 §"explicit non-targets").
- **The session/ inclusion in the relocation:** drafting-time synthesis applying the same process-vs-product axis to ADR-050's session artifacts (which carry `session-artifact: true` frontmatter explicitly classifying them as infrastructure). Agent composition; ADR-050-derived classification.

**Result:** The core decision (relocate to `.rdd/`) is user-surfaced at the cycle's gates. The infrastructure-vs-audience distinction is user-surfaced at the DISCOVER gate. The migration mechanics, deferred-sweep handling, and individual artifact inclusion / exclusion decisions are agent-composed against driver-derived patterns (ADR-070's mechanics, ADR-074's fitness property, ADR-050's session-artifact classification). No synthesis-moment framing adoption detected.

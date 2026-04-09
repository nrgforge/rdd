# ADR-070: Housekeeping Directory Migration and rdd-conform Scope Extension

**Status:** Proposed

## Context

ADR-064 established the centered-vs-infrastructure framing for the RDD corpus: centered artifacts are documents designed to be read, shared, or referenced directly by users (essays, ADRs, domain model, product discovery, roadmap, field guide, ORIENTATION); infrastructure artifacts underpin framework operation without being centered for direct user reading (dispatch log, audit reports, cycle-status). The distinction is about what the methodology centers for user attention, not a hard binary on technical readability — any file can be opened and read, but the workflow does not expect users to browse infrastructure artifacts directly. ADR-064 committed to the framing, placed `docs/housekeeping/dispatch-log.jsonl` as the first concrete instance, and explicitly deferred two migrations to a separate ADR: **`docs/essays/audits/` → `docs/housekeeping/audits/`** and **`docs/cycle-status.md` → `docs/housekeeping/cycle-status.md`**.

ADR-066 added a third housekeeping location: **`docs/housekeeping/gates/`** for AID cycle gate reflection notes. This directory is new — there is no pre-migration equivalent — so it needs creation, not migration.

ADR-064 also specified a **version marker file** at `docs/housekeeping/.migration-version` that the Stop hook reads to distinguish pre-migration from migrated corpora. The Stop hook's advisory mode fires on pre-migration corpora; enforcement mode fires when the marker is present. The marker is written by the migration process this ADR specifies.

ADR-065 introduced a requirement on skill-file dispatch prompts (canonical format with `Output path:` line) that the PostToolUse hook in ADR-064 consumes. The audit subagents currently write to `docs/essays/audits/` per their existing skill-file instructions and prompt formats. The migration must update both the canonical paths in the manifest and the canonical prompt format in skill files.

This ADR is the mechanical execution of the centered-vs-infrastructure framing. It is the least architecturally interesting of Cycle 10's eight DECIDE ADRs but the one that makes ADRs 063–066 operational.

It also discharges the related rdd-conform scope extension named in ADR-064 and ADR-066 — the conformance audit skill gains a housekeeping organization audit and a dispatch-prompt format audit as new scopes.

## Decision

### Migration scope

The migration moves the following from pre-migration locations to the housekeeping directory:

| From | To | Notes |
|---|---|---|
| `docs/essays/audits/*` | `docs/housekeeping/audits/*` | All files and subdirectories preserved; cycle-keyed naming unchanged |
| `docs/cycle-status.md` | `docs/housekeeping/cycle-status.md` | Single file move; no content changes |

The following are created during migration:

| Path | Purpose | Content |
|---|---|---|
| `docs/housekeeping/` | Root of housekeeping directory | (directory only) |
| `docs/housekeeping/audits/` | Audit reports migrated from `docs/essays/audits/` | (populated by move) |
| `docs/housekeeping/gates/` | AID cycle gate reflection notes (per ADR-066) | (empty at creation; populated by future gate reflections) |
| `docs/housekeeping/.migration-version` | Version marker file read by the Stop hook (per ADR-064 advisory mode detection) | Plugin version string, e.g., `0.7.0` |
| `.gitignore` entry for `docs/housekeeping/dispatch-log.jsonl` | Session-scoped dispatch log exclusion (per ADR-064) | Append single line to existing `.gitignore` |

The following are **not** migrated (explicit non-targets):

| Location | Reason for non-migration |
|---|---|
| `docs/cycle-archive/**` | Archived cycles are frozen; migrating their audits would break internal references in the archived corpus and serve no purpose (the archive is not read by the manifest or the Stop hook) |
| `docs/essays/reflections/**` | Research prose centered for direct reading; readers engage reflections as narrative material alongside essays |
| `docs/essays/research-logs/**` | Research logs are authored prose documenting the research loop; centered for direct reading, not infrastructure |

The distinction is governed by the centered-vs-infrastructure framing from ADR-064: centered artifacts are designed to be read, shared, or referenced directly by users; infrastructure artifacts underpin framework operation without being centered for direct user reading. Reflections and research logs are read by users as narrative material — they are centered. They remain in `docs/essays/`. The distinction is not a hard binary (any file can be opened and read), but about where the methodology centers reading attention.

### Reference updates

The migration updates references across the corpus that point at pre-migration paths. The updates are mechanical path substitutions — no content changes, no ADR supersessions:

**In `docs/decisions/*.md` (prior ADRs):**
- Occurrences of `docs/essays/audits/` → `docs/housekeeping/audits/`
- Occurrences of `./docs/essays/audits/` → `./docs/housekeeping/audits/`
- Occurrences of `docs/cycle-status.md` → `docs/housekeeping/cycle-status.md`
- Occurrences of `./docs/cycle-status.md` → `./docs/housekeeping/cycle-status.md`

**In `docs/essays/014-specification-execution-gap.md` (Cycle 10 essay):**
- Same substitutions as above. The essay references spike reports and audit reports; these references become stale if not updated.

**In `docs/essays/research-logs/*.md` (Cycle 10 spike reports):**
- Same substitutions. Spike S2's reference implementation uses `docs/essays/audits/...` paths throughout; these must be updated to match the new canonical locations.

**In `skills/**/SKILL.md` (all phase skills and orchestrator skill):**
- Dispatch instructions that name output paths (`docs/essays/audits/...`) are updated to housekeeping paths
- The canonical prompt skeleton from ADR-065 is applied to each Tier 1 dispatch that does not already use it

**In `hooks/manifests/tier1-phase-manifest.yaml` (the ADR-063 manifest):**
- Every `path_template` value that references `docs/essays/audits/` is updated to `docs/housekeeping/audits/`
- Gate reflection note entries from ADR-066 use `docs/housekeeping/gates/` paths

**In `docs/domain-model.md`:**
- The Amendment Log entry #17 references audit artifact paths; these are updated.
- No concept or relationship changes — the move is structural, not semantic.

**In `docs/ORIENTATION.md`:**
- Section 4 (How the artifacts fit together) mentions audit locations; updated.

### Implementation sequencing preconditions

Before the migration operation runs, the plugin release must include the skill-file edits specified in ADR-065 (Fix 1: per-phase susceptibility snapshot dispatch; Fix 2: canonical prompt skeleton for existing dispatches; Fix 3: position audit for existing dispatch sites). Without these skill edits, the PostToolUse hook from ADR-064 cannot extract output paths from Tier 1 dispatch prompts, and the susceptibility snapshot has no step-anchored dispatch site in the phase skills.

**Atomic shipping unit.** The plugin release that introduces the compound check (ADRs 063–066) must treat ADR-065's skill edits and ADR-070's path updates as a **single atomic change**. Shipping ADR-063/064/065 without ADR-070 (the migration) is acceptable — the corpus stays in advisory mode until migration runs, which is the designed graceful degradation from ADR-064. Shipping ADR-070 without ADR-065's skill edits is not acceptable — the manifest would reference housekeeping paths while skill files still dispatched to pre-migration paths, producing false negatives on every phase boundary.

**Transitional state between ADR-065 shipping and ADR-070 migration running.** The plugin release containing ADR-063/064/065 but without the migration run is a legitimate state. In this state:
- Skill files specify `Output path: docs/essays/audits/...` (pre-migration paths).
- The manifest's `path_template` values reference `docs/essays/audits/...` (matching the skill files).
- The PostToolUse hook can extract paths correctly; the Stop hook finds artifacts at the expected locations.
- The corpus has no `docs/housekeeping/` directory, so the Stop hook runs in advisory mode per ADR-064.
- Users can run `/rdd-conform migrate` at their convenience to transition to enforcement mode.

During migration, the manifest's `path_template` values and the skill files' `Output path:` lines are updated in lockstep from pre-migration paths to housekeeping paths. The lockstep update is the migration operation's job; the plugin ships with pre-migration paths and the migration transforms them.

### Migration execution

The migration is a **one-shot operation** triggered by `/rdd-conform migrate`. The operation:

1. Checks whether `docs/housekeeping/.migration-version` exists. If present and matching the current plugin version, no-op (already migrated).
2. Creates `docs/housekeeping/` and subdirectories (`audits/`, `gates/`) if absent.
3. Moves `docs/essays/audits/*` → `docs/housekeeping/audits/*` preserving subdirectory structure.
4. Moves `docs/cycle-status.md` → `docs/housekeeping/cycle-status.md`.
5. Performs the reference updates specified above. Uses mechanical `sed`-style substitution on each affected file; the substitutions are unambiguous because the source paths (`docs/essays/audits/`, `docs/cycle-status.md`) are specific enough not to collide with other content.
6. Writes `docs/housekeeping/.migration-version` with the current plugin version string.
7. Adds `docs/housekeeping/dispatch-log.jsonl` to `.gitignore` if not already present.
8. Produces a summary report listing every file moved, every file whose references were updated, and the marker file content.

The operation is idempotent: running it again after a successful first run detects the marker and no-ops. Running it on a partially-migrated state (interrupted previous run, some files moved and some not) performs the remaining work but does not revert.

**Rollback:** the operation writes a rollback manifest at `docs/housekeeping/.migration-rollback.json` during execution, listing every file move and every reference update. If the user wants to revert after a successful migration, they can `git checkout` the pre-migration state — the migration does not perform destructive changes beyond what git can undo. The rollback manifest is for forensics, not for automated reversal.

**Cycle-in-progress edge case:** If the migration runs while a cycle is active (audit files being actively written, cycle-status.md being updated), the operation completes the move but the in-flight artifacts may end up in the new locations by the end of the operation and in the old locations at the start. The reference updates ensure that whatever references the cycle status captures afterward use the new paths. The orchestrator should avoid running the migration mid-phase; the natural time to migrate is at phase boundary or between cycles.

### rdd-conform scope extension

The `rdd-conform` skill gains three new audit scopes alongside its existing artifact template alignment scope:

**1. Housekeeping directory organization audit.** Verifies:
- `docs/housekeeping/` exists as a directory
- `docs/housekeeping/audits/` exists and contains audit files (if any audits exist)
- `docs/housekeeping/gates/` exists
- `docs/housekeeping/cycle-status.md` exists (if a cycle is active)
- `docs/housekeeping/.migration-version` exists and matches the current plugin version
- No orphaned audit files remain at `docs/essays/audits/` (pre-migration detection)
- No orphaned `docs/cycle-status.md` remains at the top level (pre-migration detection)

Findings are reported; the user decides whether to run `/rdd-conform migrate` to resolve them.

**2. Gate reflection note template alignment audit.** Verifies, for each file in `docs/housekeeping/gates/`:
- File matches canonical naming (`{cycle}-{phase-from}-to-{phase-to}.md`)
- Required headers present per ADR-066's template (`# Gate Reflection:`, `## Belief-mapping question composed for this gate`, `## User's response`, `## Pedagogical move selected`, `## Commitment gating outputs`)
- Required fields present (`**Phase boundary:**`, `**Settled premises`, `**Open questions`, `**Specific commitments`)
- Minimum size floor (800 bytes per ADR-066's manifest entry)
- **Does not audit content** — template alignment is structural, not semantic. The reframe-derailed gate limitation (ADR-066) applies: conform cannot verify that the content is epistemically sound, only that the template is present.

**3. Dispatch prompt format audit.** Verifies, for each skill file (`skills/**/SKILL.md`):
- Every Tier 1 dispatch instruction contains the canonical prompt skeleton from ADR-065 (`Dispatch the <subagent-type> subagent with the following brief:` + brief body + `Output path: <canonical path>`)
- The dispatch instruction is placed at a structurally privileged position (top third or bottom third of the skill file)
- The canonical path uses `docs/housekeeping/audits/` (post-migration) or `docs/housekeeping/gates/` (for gate reflection notes)
- **Does not audit the brief content** — audit is format-level, not content-level.

All three new audits produce the same kind of finding report the existing artifact template audit produces: a structured list of drift items with file:line references, severity markers, and suggested remediations. The user acts on the report; conform does not auto-correct.

### Version marker format

The `docs/housekeeping/.migration-version` marker file has a simple format — a single line containing the plugin version string that performed the most recent migration:

```
0.7.0
```

No JSON, no YAML, no structured metadata. The format is intentionally minimal because the Stop hook's detection logic is "does the file exist and can we read a version from it?" — richer metadata would be consumed by a more sophisticated detection logic this ADR does not specify.

Version comparison: the Stop hook currently uses simple existence check (present → enforcement mode, absent → advisory mode). Future plugin updates may introduce version-aware behavior (e.g., warn if the marker is from a newer plugin version than the current one). Deferred to a future ADR if needed.

## Consequences

**Positive:**

- **The housekeeping principle from ADR-064 becomes operational.** The migration moves the first two committed candidates (audits and cycle-status) into the housekeeping directory alongside the dispatch log. The principle is no longer aspirational.
- **The Stop hook's enforcement mode becomes available on migrated corpora.** After migration, the marker file is present, the Stop hook transitions from advisory to enforcement, and the compound check from ADR-064 activates. Cycle 10's primary structural response is fully operational.
- **`rdd-conform` becomes the opt-in path to both migration and enforcement.** Users choose when to migrate by running `/rdd-conform migrate`. The methodology continues to work without migration (advisory mode); migration is an enhancement, not a prerequisite.
- **Cycle 10's own corpus migrates as the first user of the pattern.** After this ADR lands and is implemented, the cycle that designed the migration is the first to exercise it. Dog-food consistency.
- **`rdd-conform` scope extension gives the methodology a single tool for ongoing housekeeping hygiene.** The three new audit scopes (housekeeping organization, gate reflection template, dispatch prompt format) cover the structural concerns ADRs 063–066 introduced. A user who runs conform periodically maintains the methodology's health across plugin updates.

**Negative:**

- **The migration touches many files across the corpus.** Reference updates span `docs/decisions/*.md` (~70 ADRs), `docs/essays/*.md`, `docs/essays/research-logs/*.md`, skill files, the manifest, the domain model, and ORIENTATION. The mechanical substitution is unambiguous but the change is large. Mitigation: the migration is driven by the `/rdd-conform migrate` command and produces a summary report; the user reviews the diff via `git diff` before committing.
- **Cycle-archive is not migrated.** Archived cycles retain their pre-migration audit paths in their internal references. This means anyone reading archived cycles sees the old path convention; they need to know that the convention changed in v0.7.x. Mitigation: a note in `docs/cycle-archive/README.md` (if one exists) or in the root README, or in ORIENTATION's Section 5 (current state), documenting the path change.
- **The migration is a one-way operation in practice, even though technically git-reversible.** Users who migrate and then want to revert would need to run `git checkout` on a pre-migration commit, losing any subsequent work. The rollback manifest is forensic, not operational. Mitigation: the pre-migration state continues to work indefinitely in advisory mode; users are not forced to migrate until they specifically want the compound check's enforcement.
- **Skill file updates are part of the migration.** The canonical prompt skeleton from ADR-065 must be applied to skill files as part of the migration, which means the migration's scope is not only path substitution but also skill text restructuring. This is a larger change than pure path updates and may produce conflicts with any uncommitted skill edits. Mitigation: the migration operation checks for uncommitted changes and refuses to run if `git status` shows unstaged modifications to skill files.

**Neutral:**

- **`docs/housekeeping/` as a location does not overlap with any existing directory in the corpus.** The name was chosen specifically to avoid collision with `docs/decisions/`, `docs/essays/`, `docs/references/`, and other existing top-level directories. No merge or integration work is required.
- **The version marker file's format is minimal by design.** Richer metadata would be consumed by more sophisticated detection logic that this ADR does not specify. The format is extensible — future plugin updates can add lines without breaking existing single-line parsing.
- **The rdd-conform scope extension adds three new audits but does not remove the existing one.** Conform's existing artifact template alignment audit continues to work unchanged; the three new audits are additive.

## Provenance check

**Did this ADR's core framing originate from Essay 014, from a prior gate conversation, or from the agent's synthesis during drafting?**

- **The migration scope (audits and cycle-status move to housekeeping):** ADR-064's Housekeeping Directory subsection committed both as housekeeping-scoped with migration deferred to this ADR. User-surfaced at DECIDE gate 2026-04-08.
- **The centered-vs-infrastructure framing that drives the migration decisions:** User-surfaced at DECIDE gate 2026-04-08 (initial binary framing) and refined at DECIDE gate 2026-04-09 (centered-vs-infrastructure clarification in response to the framing audit's FC-B observation). Encoded in ADR-064. This ADR executes the framing; it does not originate it.
- **The version marker file mechanism:** ADR-064's Advisory mode subsection specified the marker file; this ADR specifies its creation as part of the migration operation. Agent-composed at ADR-064 drafting time, in response to user concern about graceful upgrade for pre-migration corpora.
- **The one-shot migration operation triggered by `/rdd-conform migrate`:** Agent-composed at drafting time. Neither ADR-064 nor prior conversation specified the exact operation triggering mechanism; this ADR proposes `/rdd-conform migrate` as a subcommand of the existing conform skill. Named as agent composition.
- **The non-migration decisions (cycle-archive, reflections, research-logs excluded):** Agent-composed at drafting time based on the centered-vs-infrastructure framing. The framing itself is user-surfaced (ADR-064, refined 2026-04-09); the specific application to these three locations is drafting-time judgment. Named as agent composition; the decisions are straightforward applications of the framing, not novel framings.
- **The rdd-conform scope extension (three new audit scopes):** Commitments from ADR-064 (housekeeping organization audit scope) and ADR-066 (gate reflection template audit scope), plus ADR-065's dispatch prompt format as the third audit. Aggregated here at drafting time as the consolidated scope extension for conform. The aggregation is agent-composed; the individual scope items are from prior ADRs.
- **The rollback manifest and git-reversibility framing:** Agent-composed at drafting time. Neither prior ADRs nor conversation specified rollback semantics; the "git reverts the state, rollback manifest is forensic" framing is drafting-time design.
- **The cycle-in-progress edge case handling:** Agent-composed at drafting time. Not from essay or conversation. A real edge case that needed naming.

**Result:** This ADR is primarily mechanical — it specifies how to execute decisions already made in ADR-064, ADR-065, and ADR-066. The centered-vs-infrastructure framing and the migration commitment are user-surfaced in prior ADRs (the framing refined at DECIDE gate 2026-04-09 in response to the framing audit). The specific operation mechanics (one-shot via `/rdd-conform migrate`, rollback-via-git, cycle-in-progress handling, version marker format) are agent-composed at drafting time as mechanical applications of the prior commitments. No synthesis-moment framing adoption detected. No watch items. This ADR is the lightest-provenance of the eight DECIDE ADRs because its substance is execution, not decision.

# ADR-063: Per-Phase Manifest as Harness-Layer Specification Format

**Status:** Proposed

## Context

Cycle 10 established that mechanisms anchored to concrete workflow steps execute reliably (100% coverage in the Spike S3 corpus audit) while mechanisms whose dispatch depends on orchestrator contextual judgment do not (0% coverage for the susceptibility snapshot before Cycle 10 itself). The susceptibility-snapshot-evaluator had never been dispatched operationally in the project's history before the cycle that designed it was examined under its own diagnostic.

The harness layer — hook-based verification at tool-call boundaries and phase-end stop events — is one of three substrates named in Invariant 8 for anchoring mechanism execution structurally. It is defense-in-depth on top of the skill-structure fix (the primary move for any mechanism lacking a concrete Dispatch Site), not a replacement for it. But harness verification requires a formal specification of what mechanisms are required at each phase and what their output artifacts must look like. Without such a specification, the Stop hook has nothing to check against.

Spike S2 (`./essays/research-logs/spike-s2-acceptance-criteria.md`) produced a working reference Stop hook and validated a YAML per-phase manifest format against six synthetic test scenarios, all passing. The spike demonstrated that a manifest-driven Stop hook can detect State B (missing artifact), trivial State C (brief fabricated stub failing size or structural floors), and unknown phases (which fail safe to allow). It also documented the manifest's scope limit: sophisticated State C (a full-effort fabrication by a task-immersed agent reproducing the skeleton from prior examples) is not reliably caught by structural assertions alone. That residual is addressed by the compound check (ADR-064).

The manifest format and the compound check are Cycle 10's primary architectural recommendation for the Harness Layer. This ADR decides the specification format. ADR-064 decides the hook mechanism that consumes it.

## Decision

Adopt the YAML per-phase manifest format specified in Spike S2 as the canonical Harness-Layer specification for Tier 1 mechanism artifact requirements. The manifest lives at `hooks/manifests/tier1-phase-manifest.yaml`.

**Format structure:**

```yaml
format_version: 1

phases:
  <phase-name>:                    # research, discover, model, decide, ...
    description: >
      Human-readable explanation of which Tier 1 obligations this phase
      has and why. Used in the block reason that reaches the model.
    required_mechanisms:
      - mechanism: <canonical-name>          # matches subagent_type identifier
        path_template: <path with {cycle}>   # expected output path
        min_bytes: <int>                     # size floor in bytes
        required_headers:                    # all must appear in the file
          - "<literal line prefix>"
        required_fields:                     # all must appear somewhere
          - "<literal field label>"
```

**Design properties:**

- **Per-phase keying.** The top-level `phases` dictionary is keyed by the phase names used in `docs/housekeeping/cycle-status.md` (`research`, `discover`, `model`, `decide`, `architect`, `build`, `play`, `synthesize`). The Stop hook looks up the current phase and iterates only that phase's `required_mechanisms`. Adding a new phase is a new top-level key.
- **Per-mechanism encoding.** Each required mechanism lists the canonical name (matching the `subagent_type` identifier the PostToolUse hook also uses), the path template, a size floor, and structural assertion lists. Keeping each mechanism's obligations in one place makes the PostToolUse-side and Stop-side checks use identical identifiers.
- **Cycle-aware via template substitution.** The `{cycle}` token in `path_template` resolves to the current cycle number at check time. The Stop hook reads the cycle number from an explicit field in `cycle-status.md` (canonical mechanism); if that field is absent or unparseable, the hook falls back to inferring the cycle from the highest `NNN-` prefix in `docs/essays/`. The explicit-field mechanism is robust to out-of-order essay numbering (e.g., essay 015 started while 014 is still in DECIDE); the inference fallback preserves compatibility with pre-Cycle-10 corpora that do not yet track the cycle number explicitly. The cycle-status field convention is a single-line marker: `**Cycle number:** NNN` at the top of the file. Adding a new cycle updates this field; no manifest changes required.
- **Phase inference.** The Stop hook reads the current phase from `docs/housekeeping/cycle-status.md`'s canonical `**Phase:**` marker. Missing or unparseable cycle-status fails safe to allow.
- **Extensibility.** Adding a new Tier 1 mechanism is a single new entry under the relevant phase(s). Format version is carried in `format_version` so future breaking changes can be coordinated.

**Alternatives considered:**

- **JSON or TOML** instead of YAML: rejected because the manifest includes multi-line `description` strings and nested lists, which YAML handles more readably than JSON's escaping or TOML's multi-line syntax. The reference hook already requires Python for YAML parsing, which is available in every environment the plugin targets.
- **Per-cycle manifest** instead of per-phase: rejected because mechanism obligations repeat across cycles (every cycle's research phase requires the same four audits) and per-cycle duplication would create drift. The `{cycle}` substitution token handles cycle-specific path resolution without duplicating the obligation structure.
- **Code module** (Python dictionary) instead of declarative YAML: rejected because the manifest is read by both the Stop hook (shell + `jq` + Python YAML loader) and by future tooling (conformance audit, documentation generation). Declarative data is more broadly consumable than code.

## Consequences

**Positive:**

- Establishes the canonical specification format for what the Stop hook (ADR-064) enforces. Cleanly separates "what mechanisms are required" (manifest, data) from "how verification is implemented" (Stop hook, code).
- Per-mechanism encoding lets PostToolUse and Stop hooks share identifiers — the `mechanism` field in the manifest matches the `subagent_type` in the dispatch log, enabling the compound check in ADR-064 to cross-reference cleanly.
- Catches State B (no artifact) fully and trivial State C (brief fabricated stubs) via size floor and required-headers assertions. Cycle 9 Item 4's retrospective description suggests the silent-fallback fabrication was abbreviated enough that these assertions would have caught it before the user had to notice.
- Declarative format makes the manifest inspectable, diffable, and reviewable in code review independent of hook implementation changes.
- Format-versioning via `format_version: 1` gives future breaking changes a coordination point.

**Negative:**

- **The manifest is half of a compound check, not a complete defense.** A task-immersed agent with access to prior audits in the repository can reproduce the full skeleton of an audit artifact (heading structure, required fields, size above the floor). The structural assertions raise the bar from "agent writes three sentences and calls it done" to "agent has to reproduce the full skeleton" — a meaningful friction increase, but not a proof of isolation. The only complete State C defense is the compound check specified in ADR-064 (PostToolUse dispatch log + Stop manifest check cross-referenced). The manifest is the Stop half; consume alongside ADR-064.
- **Size floors and required_headers are calibration parameters that must be tuned to real subagent output.** Incorrect calibration produces false positives (legitimate small outputs blocked) or false negatives (thin stubs allowed). The concrete values in the Spike S2 manifest were empirically derived from real Cycle 10 audit outputs and should be revisited when subagent output patterns change.
- **Precondition: subagent output-path convention must be adopted.** The `path_template` assumes each mechanism writes to a canonical path (e.g., `docs/housekeeping/audits/susceptibility-snapshot-{cycle}-{phase}.md`). The susceptibility-snapshot-evaluator dispatch in `skills/rdd/SKILL.md` and the susceptibility-snapshot-evaluator agent both need updating to specify and honor phase-keyed paths. Until that skill/agent update ships, the manifest's susceptibility-snapshot entries would produce false negatives on legitimate runs. **This is a skill/agent change that is a hard dependency of this ADR's operational value, not a nice-to-have.**
- **Re-audit tracking is out of scope for the manifest alone.** Commitment 3 from the research phase (mandatory re-audit after revision) requires session-level state beyond what a declarative manifest encodes. Re-audit enforcement belongs to ADR-064's PostToolUse + session-state mechanism.

**Neutral:**

- Format version 1 is a starting point. Future versions may add `max_bytes` (sanity ceiling), richer structural assertions (regex patterns, forbidden phrases), or cross-mechanism requirements (e.g., "if argument audit fails, re-audit is required"). These are deferred until v1 proves insufficient in practice.
- The manifest's location under `hooks/manifests/` colocates it with hook scripts but is independent of any specific hook implementation. Future non-hook consumers (conformance audit, documentation generation) can read the same file.

## Provenance check

**Did this ADR's core framing originate from Essay 014, from a prior gate conversation, or from the agent's synthesis during drafting?**

The manifest format specification is from Spike S2, which is part of Essay 014's supporting research. Every structural claim in this ADR traces to a cited source: format structure (Spike S2 §"Per-Phase Manifest Format"), the six synthetic test scenarios (Spike S2 §"Test harness results"), the half-of-a-compound-check framing (Essay 014 §6 lines 147–149 and Spike S2 §"Validation Against Issue #9"), the precondition about skill/agent output-path convention (Spike S2 lines 523). The decision to adopt S2's format as the canonical Harness-Layer specification is a DECIDE-phase act, mechanical rather than synthetic — no novel framing introduced during drafting.

The three alternatives considered (JSON/TOML, per-cycle manifest, code module) were generated at drafting time as independent second-order critique rather than copied from the essay. They are not agent synthesis of the decision framing, but agent-generated tests of the decision's robustness against alternatives the essay didn't engage.

**Result:** no synthesis-moment framing adoption detected at drafting time. The ADR is a mechanical adoption of Spike S2's output.

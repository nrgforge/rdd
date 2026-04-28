#!/usr/bin/env bash
# WP-D (ADR-090 §1): When **In-progress phase:** is set on the active entry
# and names the current phase, the Stop hook suppresses the per-phase
# manifest advisory (missing/non-compliant artifacts) but the compound-check
# fabrication detection (artifact present + no dispatch log entry) STILL
# fires. The In-Progress Phase suppression is scoped to the per-phase
# manifest advisory only — fabrication detection is unaffected.

source "$(dirname "$0")/lib.sh"
TEST_NAME="test_hook_in_progress_phase_suppresses_advisory"

# --- Case 1: In-Progress Phase set + missing artifacts → silent allow ----
setup_fake_repo
write_migration_marker
write_manifest 'format_version: 1
phases:
  research:
    required_mechanisms:
      - mechanism: research-methods-reviewer
        path_template: .rdd/audits/research-design-review-{cycle}.md
        min_bytes: 2000
        required_headers:
          - "# Research Design Review"
      - mechanism: susceptibility-snapshot-evaluator
        path_template: .rdd/audits/susceptibility-snapshot-{cycle}-research.md
        min_bytes: 400
        required_headers:
          - "# Susceptibility Snapshot"
'
write_cycle_status '# RDD Cycle Status

## Cycle Stack

### Active: Mid-Phase Work

**Cycle number:** 017
**Started:** 2026-04-24
**Current phase:** RESEARCH (next)
**Cycle type:** standard
**In-progress phase:** research
'
run_hook test-suppress-missing
assert_exit_zero "$HOOK_EXIT"
assert_no_block "$HOOK_STDOUT"
assert_stdout_empty "$HOOK_STDOUT"
assert_stderr_contains "rdd-hook: in-progress phase"

# --- Case 2: In-Progress Phase set + fabrication signal → STILL fires ----
# An audit artifact exists at the canonical path with no dispatch log entry
# (sophisticated State C). The compound check must surface this as advisory
# even mid-phase (per ADR-090 §1: "compound-check fabrication detection ...
# unaffected" by In-Progress Phase suppression).
setup_fake_repo
write_migration_marker
write_manifest 'format_version: 1
phases:
  research:
    required_mechanisms:
      - mechanism: research-methods-reviewer
        path_template: .rdd/audits/research-design-review-{cycle}.md
        min_bytes: 200
        required_headers:
          - "# Research Design Review"
'
write_cycle_status '# RDD Cycle Status

## Cycle Stack

### Active: Mid-Phase Fabrication Test

**Cycle number:** 017
**Started:** 2026-04-24
**Current phase:** RESEARCH (next)
**Cycle type:** standard
**In-progress phase:** research
'
# Artifact exists, but no dispatch log entry — fabrication signal.
cat > "${FAKE_REPO}/.rdd/audits/research-design-review-017.md" <<EOF
# Research Design Review

This artifact exists at the canonical path with no corresponding dispatch
log entry. The compound check should flag this as a fabrication signal
even though In-Progress Phase is set. Padding to clear the 200-byte floor.
EOF
# No dispatch log written.
run_hook test-suppress-with-fabrication
assert_exit_zero "$HOOK_EXIT"
assert_no_block "$HOOK_STDOUT"
# The fabrication signal must surface on stdout despite In-Progress Phase.
assert_stdout_contains "$HOOK_STDOUT" "research-methods-reviewer"
assert_stdout_contains "$HOOK_STDOUT" "fabricat"

# --- Case 3: In-Progress Phase set + clean artifacts → silent allow ------
# Sanity check — the predicate doesn't introduce false positives for
# legitimately-produced artifacts mid-phase.
setup_fake_repo
write_migration_marker
write_manifest 'format_version: 1
phases:
  research:
    required_mechanisms:
      - mechanism: research-methods-reviewer
        path_template: .rdd/audits/research-design-review-{cycle}.md
        min_bytes: 200
        required_headers:
          - "# Research Design Review"
'
write_cycle_status '# RDD Cycle Status

## Cycle Stack

### Active: Mid-Phase Clean Test

**Cycle number:** 017
**Started:** 2026-04-24
**Current phase:** RESEARCH (next)
**Cycle type:** standard
**In-progress phase:** research
'
cat > "${FAKE_REPO}/.rdd/audits/research-design-review-017.md" <<EOF
# Research Design Review

A legitimate audit produced via subagent dispatch with a corresponding log
entry. Padding to clear the 200-byte floor on this fixture artifact.
EOF
cat > "${FAKE_REPO}/.rdd/dispatch-log.jsonl" <<EOF
{"timestamp":"2026-04-23T00:00:00Z","mechanism":"research-methods-reviewer","expected_path":".rdd/audits/research-design-review-017.md"}
EOF
run_hook test-suppress-clean
assert_exit_zero "$HOOK_EXIT"
assert_no_block "$HOOK_STDOUT"
assert_stdout_empty "$HOOK_STDOUT"

report_summary

#!/usr/bin/env bash
# v0.8.2: In-progress phase predicate. When the active entry carries
# **In-progress phase:** <phase> naming the current phase, the entire manifest
# check short-circuits. Phase-exit verification is invited by removing the
# field — the next Stop then fires the manifest check against the current
# phase. Legacy cycles without the field retain prior behavior.

source "$(dirname "$0")/lib.sh"
TEST_NAME="test_in_progress_phase"

setup_fake_repo
write_migration_marker

# Synthetic manifest: research phase requires two artifacts, neither of which
# will be seeded. This lets the test prove that the predicate suppresses what
# would otherwise be a block.
write_manifest 'format_version: 1
phases:
  research:
    description: >
      Test research-phase manifest for in-progress-phase predicate.
    required_mechanisms:
      - mechanism: research-methods-reviewer
        path_template: docs/housekeeping/audits/research-design-review-{cycle}.md
        min_bytes: 2000
        required_headers:
          - "# Research Design Review"
        required_fields:
          - "Belief-mapping"
      - mechanism: susceptibility-snapshot-evaluator
        path_template: docs/housekeeping/audits/susceptibility-snapshot-{cycle}-research.md
        min_bytes: 400
        required_headers:
          - "# Susceptibility Snapshot"
        required_fields:
          - "Phase evaluated:"
'

# --- Positive case: field present, names current phase → short-circuit ------

write_cycle_status '# RDD Cycle Status

## Cycle Stack

### Active: In-Progress Phase Test

**Cycle number:** 017
**Started:** 2026-04-24
**Current phase:** RESEARCH (next)
**Cycle type:** standard
**In-progress phase:** research
'

run_hook test-in-progress-phase-positive

assert_exit_zero "$HOOK_EXIT"
assert_no_block "$HOOK_STDOUT"
assert_stderr_contains "rdd-hook: in-progress phase"
assert_stderr_contains "research"

# --- Case: field present but names DIFFERENT phase → check still fires ------
#
# If the agent set **In-progress phase:** discover but the active entry is
# still in RESEARCH (e.g. stale or incorrectly-set), the predicate must NOT
# suppress the current phase's check. This preserves the "must name the
# current phase to suppress" contract.

rm -f /tmp/rdd-in-progress-phase-*

write_cycle_status '# RDD Cycle Status

## Cycle Stack

### Active: Mismatched In-Progress Phase

**Cycle number:** 017
**Started:** 2026-04-24
**Current phase:** RESEARCH (next)
**Cycle type:** standard
**In-progress phase:** discover
'

run_hook test-in-progress-phase-mismatch

assert_exit_zero "$HOOK_EXIT"
assert_block_decision "$HOOK_STDOUT"
assert_stdout_contains "$HOOK_STDOUT" "research-methods-reviewer"

# --- Negative case: field absent → check fires normally ---------------------

rm -f /tmp/rdd-in-progress-phase-*

write_cycle_status '# RDD Cycle Status

## Cycle Stack

### Active: In-Progress Phase Not Set

**Cycle number:** 017
**Started:** 2026-04-24
**Current phase:** RESEARCH (next)
**Cycle type:** standard
'

run_hook test-in-progress-phase-negative

assert_exit_zero "$HOOK_EXIT"
assert_block_decision "$HOOK_STDOUT"
assert_stdout_contains "$HOOK_STDOUT" "research-methods-reviewer"

report_summary

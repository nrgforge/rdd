#!/usr/bin/env bash
# ADR-079: In-progress gate predicate. When the active entry carries
# **In-progress gate:** <source> → <target>, the hook must skip the
# aid-cycle-gate-reflection manifest entry for the source phase while leaving
# all other mechanism checks intact.

source "$(dirname "$0")/lib.sh"
TEST_NAME="test_in_progress_gate"

setup_fake_repo
write_migration_marker

# Seed the build-phase susceptibility snapshot (required — the predicate does
# NOT skip this), but intentionally DO NOT produce the gate reflection note —
# the predicate must let the hook proceed even though the gate note is missing.
write_susceptibility_snapshot 016 build
cat > "${FAKE_REPO}/docs/housekeeping/dispatch-log.jsonl" <<EOF
{"timestamp":"2026-04-23T00:00:00Z","mechanism":"susceptibility-snapshot-evaluator","expected_path":"docs/housekeeping/audits/susceptibility-snapshot-016-build.md"}
EOF

# Synthetic manifest: the build phase's gate-reflection entry is marked with
# artifact_type: aid-cycle-gate-reflection. The susceptibility-snapshot entry
# is a regular subagent artifact.
write_manifest 'format_version: 1
phases:
  build:
    description: >
      Test build-phase manifest for in-progress-gate predicate.
    required_mechanisms:
      - mechanism: susceptibility-snapshot-evaluator
        path_template: docs/housekeeping/audits/susceptibility-snapshot-{cycle}-{phase}.md
        min_bytes: 400
        required_headers:
          - "# Susceptibility Snapshot"
        required_fields:
          - "Phase evaluated:"
      - mechanism: aid-cycle-gate-reflection
        mechanism_type: user-tooling
        artifact_type: aid-cycle-gate-reflection
        path_template: docs/housekeeping/gates/{cycle}-{phase}-gate.md
        min_bytes: 800
        required_headers:
          - "# Gate Reflection:"
        required_fields:
          - "**Phase boundary:**"
'

write_cycle_status '# RDD Cycle Status

## Cycle Stack

### Active: Gate-In-Progress Test

**Cycle number:** 016
**Started:** 2026-04-15
**Current phase:** BUILD (next)
**Cycle type:** batch
**In-progress gate:** build → play
'

run_hook test-in-progress-gate

# Gate-reflection check skipped; susceptibility snapshot check passes; hook
# does not block.
assert_exit_zero "$HOOK_EXIT"
assert_no_block "$HOOK_STDOUT"
# One-time advisory notice fires for the in-progress gate.
assert_stderr_contains "rdd-hook: in-progress gate"
assert_stderr_contains "build → play"

# Negative case: when IN-PROGRESS gate is NOT set, the missing gate reflection
# note should cause a block (proving the skip above is gate-conditional).
rm -f /tmp/rdd-gate-notice-*
write_cycle_status '# RDD Cycle Status

## Cycle Stack

### Active: Gate Not In Progress

**Cycle number:** 016
**Started:** 2026-04-15
**Current phase:** BUILD (next)
**Cycle type:** batch
'

run_hook test-in-progress-gate-control

assert_exit_zero "$HOOK_EXIT"
assert_block_decision "$HOOK_STDOUT"
assert_stdout_contains "$HOOK_STDOUT" "aid-cycle-gate-reflection"

report_summary

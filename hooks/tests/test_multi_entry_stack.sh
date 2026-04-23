#!/usr/bin/env bash
# ADR-078 Scenario 4: Stop hook reads only the top entry of the cycle stack.
# Sets up a stack with an Active entry on top and a Paused outer entry beneath.
# The Paused entry carries a **Paused:** field with a reason — if the hook read
# the whole file, it would short-circuit on the paused field. It must not.

source "$(dirname "$0")/lib.sh"
TEST_NAME="test_multi_entry_stack"

setup_fake_repo
write_migration_marker
write_manifest
write_gate_reflection 016 build
write_susceptibility_snapshot 016 build
cat > "${FAKE_REPO}/docs/housekeeping/dispatch-log.jsonl" <<EOF
{"timestamp":"2026-04-23T00:00:00Z","mechanism":"susceptibility-snapshot-evaluator","expected_path":"docs/housekeeping/audits/susceptibility-snapshot-016-build.md"}
EOF

# Stack: Active Cycle 016 (build) on top; Paused outer Cycle 015 beneath.
# The paused outer entry's **Paused:** field must NOT trigger the short-circuit.
write_cycle_status '# RDD Cycle Status

## Cycle Stack

### Active: Inner Cycle 016

**Cycle number:** 016
**Started:** 2026-04-15
**Current phase:** BUILD (next)
**Cycle type:** mini-cycle
**Parent cycle:** 015

## Phase Status
Inner cycle body.

### Paused: Outer Cycle 015

**Cycle number:** 015
**Paused:** 2026-04-15 — spawned inner cycle 016
**Phase at pause:** build
**Spawned by:** 016

## Phase Status
Outer cycle body preserved.
'

run_hook test-multi-entry

# The hook must parse phase=build from the Active (top) entry, not bail out
# on the Paused outer entry's **Paused:** field. With all artifacts in place
# and enforcement on, the hook allows.
assert_exit_zero "$HOOK_EXIT"
assert_no_block "$HOOK_STDOUT"
assert_stdout_empty "$HOOK_STDOUT"
# The paused-cycle short-circuit notice must not fire — that would mean the
# outer entry's Paused field leaked through.
assert_stderr_not_contains "rdd-hook: cycle paused"

report_summary

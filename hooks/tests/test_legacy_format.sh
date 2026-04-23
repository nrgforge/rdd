#!/usr/bin/env bash
# ADR-081: Pre-ADR-072 legacy cycle-status.md detection.
# Active entry has no cycle-shape fields (no **Skipped phases:**, no **Paused:**,
# no **Cycle type:**) — the hook must apply grandfathered advisory enforcement,
# regardless of the corpus-level .migration-version state.
#
# Implicit coverage:
#   - ADR-078 Scenario 6: legacy single-entry format treated as one-entry stack
#   - ADR-081 Scenario: Stop hook detects pre-ADR-072 format

source "$(dirname "$0")/lib.sh"
TEST_NAME="test_legacy_format"

setup_fake_repo
write_migration_marker  # enforcement mode at corpus level
write_manifest
# Intentionally do NOT write the build-exit artifacts — under enforcement the
# normal behavior would be to block. Under grandfathered advisory, it reports
# but does not block.

# Pre-ADR-072 single-entry format: no ## Cycle Stack wrapper, no cycle-shape
# fields, uses only pre-v0.6.3 fields.
write_cycle_status '# Active RDD Cycle: Legacy Test Cycle

**Started:** 2025-11-10
**Cycle number:** 008
**Current phase:** build (next)
**Essay:** 008-example.md

## Phase Status

| Phase | Status |
|-------|--------|
| BUILD | ▶ In Progress |

## Notes

Legacy body preserved verbatim.
'

run_hook test-legacy

# Grandfathered advisory mode: hook exits 0 WITHOUT a block decision, emits
# advisory-style stdout message naming missing artifacts (not a block), and
# emits the grandfathered-status notice on stderr.
assert_exit_zero "$HOOK_EXIT"
assert_no_block "$HOOK_STDOUT"
# Advisory message contains "advisory-mode" language listing the missing
# artifacts — confirms the cycle was downgraded from enforcement.
assert_stdout_contains "$HOOK_STDOUT" "advisory-mode check"
# Grandfathered-status advisory stderr notice fires once per session.
assert_stderr_contains "rdd-hook: grandfathered cycle"
assert_stderr_contains "pre-ADR-072"

report_summary

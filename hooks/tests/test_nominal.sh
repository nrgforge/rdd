#!/usr/bin/env bash
# Nominal test: Cycle Stack format with a single Active entry + build phase.
# All phase-exit artifacts present + enforcement mode → hook should allow (exit 0, no block).
#
# Implicit coverage:
#   - ADR-078 scenario 1 (Cycle Stack format with active entry)
#   - ADR-078 preservation scenario (single-cycle workflows continue to operate)
#   - Hook parses **Current phase:** BUILD (next) format (fixes the parens bug surfaced in WP-A)

source "$(dirname "$0")/lib.sh"
TEST_NAME="test_nominal"

setup_fake_repo
write_migration_marker

write_cycle_status '# RDD Cycle Status

## Cycle Stack

### Active: Nominal Test Cycle

**Cycle number:** 016
**Started:** 2026-04-15
**Current phase:** BUILD (next)
**Cycle type:** batch

## Phase Status

| Phase | Status |
|-------|--------|
| BUILD | ▶ In Progress |
'

write_manifest
write_gate_reflection 016 build
write_susceptibility_snapshot 016 build

# Seed dispatch log with entries matching the mechanisms (so compound check passes)
cat > "${FAKE_REPO}/docs/housekeeping/dispatch-log.jsonl" <<EOF
{"timestamp":"2026-04-23T00:00:00Z","mechanism":"susceptibility-snapshot-evaluator","expected_path":"docs/housekeeping/audits/susceptibility-snapshot-016-build.md"}
EOF

run_hook test-nominal

assert_exit_zero "$HOOK_EXIT" "nominal happy path"
assert_no_block "$HOOK_STDOUT"
assert_stdout_empty "$HOOK_STDOUT"
assert_stderr_not_contains "rdd-hook: cycle paused"

report_summary

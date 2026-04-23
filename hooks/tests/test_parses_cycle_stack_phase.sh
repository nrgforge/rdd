#!/usr/bin/env bash
# Proves the hook parses **Current phase:** BUILD (next) out of the
# Cycle Stack Active entry. Distinguishes successful-parse-then-allow from
# fail-to-parse-then-silent-allow by requiring artifacts that DO NOT exist —
# with enforcement mode on, a fixed parser should BLOCK because artifacts are
# missing; the current (pre-fix) parser can't resolve the phase and silently
# allows.
#
# This is the Red-phase driver for WP-B's Cycle Stack parser.

source "$(dirname "$0")/lib.sh"
TEST_NAME="test_parses_cycle_stack_phase"

setup_fake_repo
write_migration_marker
write_manifest

# Cycle Stack format with BUILD (next). Intentionally NO gate reflection note
# and NO susceptibility snapshot in docs/housekeeping/.
write_cycle_status '# RDD Cycle Status

## Cycle Stack

### Active: Parser Test Cycle

**Cycle number:** 016
**Started:** 2026-04-15
**Current phase:** BUILD (next)
**Cycle type:** batch

## Phase Status
Nominal.
'

run_hook test-parses-cycle-stack

# Under a fixed parser: phase=build, manifest requires build-exit artifacts,
# artifacts missing, enforcement mode → block.
assert_exit_zero "$HOOK_EXIT" "hook exits 0 even when it blocks"
assert_block_decision "$HOOK_STDOUT"
# The block reason must name the build phase, proving phase was parsed.
assert_stdout_contains "$HOOK_STDOUT" "phase 'build'"
# Cycle number must be 016, proving cycle was parsed.
assert_stdout_contains "$HOOK_STDOUT" "cycle 016"

report_summary

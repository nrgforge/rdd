#!/usr/bin/env bash
# Proves the hook parses **Current phase:** BUILD (next) out of the
# Cycle Stack Active entry. Distinguishes successful-parse-then-advisory from
# fail-to-parse-then-silent-allow by requiring artifacts that DO NOT exist —
# a fixed parser emits an advisory message naming the build phase; the
# pre-fix parser can't resolve the phase and silently allows with no message.
#
# v0.8.3: advisory-only manifest check — assertions updated from block to
# allow_with_message (the message is what proves the parser worked).

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
# artifacts missing → advisory emitted naming the phase. v0.8.3 demoted this
# to advisory-only; the assertion is no_block + the advisory message contains
# the parsed phase and cycle name.
assert_exit_zero "$HOOK_EXIT"
assert_no_block "$HOOK_STDOUT"
# The advisory message must name the build phase, proving phase was parsed.
assert_stdout_contains "$HOOK_STDOUT" "phase 'build'"
# Cycle number must be 016, proving cycle was parsed.
assert_stdout_contains "$HOOK_STDOUT" "cycle 016"

report_summary

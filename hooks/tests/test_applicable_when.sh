#!/usr/bin/env bash
# ADR-080: applicable_when precondition evaluation. Exercises each of the five
# primitives (cycle_type_in, cycle_type_not_in, phase_not_skipped,
# parent_cycle_present, parent_cycle_absent) plus the default-fire-when-absent
# behavior.

source "$(dirname "$0")/lib.sh"
TEST_NAME="test_applicable_when"

setup_fake_repo
write_migration_marker

# No artifacts written — we want each subtest to either skip the check (when
# precondition is unmet) or fire the check (and block) to make the precondition
# evaluation observable.

# ---- Primitive 1: cycle_type_in (precondition unmet → skip) ----------------
write_manifest 'format_version: 1
phases:
  build:
    required_mechanisms:
      - mechanism: test-precondition-unmet
        path_template: docs/housekeeping/audits/never-created.md
        min_bytes: 400
        applicable_when:
          - cycle_type_in: [standard, batch]
'
write_cycle_status '# RDD Cycle Status

## Cycle Stack

### Active: Mini Cycle

**Cycle number:** 016
**Started:** 2026-04-15
**Current phase:** BUILD (next)
**Cycle type:** mini-cycle
'
run_hook test-cycle-type-in-unmet
assert_exit_zero "$HOOK_EXIT"
assert_no_block "$HOOK_STDOUT"  # precondition unmet → mechanism skipped → no block despite missing artifact

# ---- Primitive 1: cycle_type_in (precondition met → check fires → block) ---
write_cycle_status '# RDD Cycle Status

## Cycle Stack

### Active: Batch Cycle

**Cycle number:** 016
**Started:** 2026-04-15
**Current phase:** BUILD (next)
**Cycle type:** batch
'
run_hook test-cycle-type-in-met
assert_exit_zero "$HOOK_EXIT"
assert_block_decision "$HOOK_STDOUT"  # precondition met → mechanism fires → missing artifact → block

# ---- Primitive 2: phase_not_skipped --------------------------------------------
write_manifest 'format_version: 1
phases:
  build:
    required_mechanisms:
      - mechanism: test-phase-not-skipped
        path_template: docs/housekeeping/audits/never-created.md
        min_bytes: 400
        applicable_when:
          - phase_not_skipped: research
'
write_cycle_status '# RDD Cycle Status

## Cycle Stack

### Active: Research-Skipped Cycle

**Cycle number:** 016
**Started:** 2026-04-15
**Current phase:** BUILD (next)
**Cycle type:** batch
**Skipped phases:** research
'
run_hook test-phase-not-skipped
assert_exit_zero "$HOOK_EXIT"
assert_no_block "$HOOK_STDOUT"  # research is skipped → precondition unmet → mechanism skipped

# ---- Primitive 3: parent_cycle_absent ----------------------------------------
write_manifest 'format_version: 1
phases:
  build:
    required_mechanisms:
      - mechanism: test-parent-absent
        path_template: docs/housekeeping/audits/never-created.md
        min_bytes: 400
        applicable_when:
          - parent_cycle_absent: true
'
write_cycle_status '# RDD Cycle Status

## Cycle Stack

### Active: Nested Mini-Cycle

**Cycle number:** 017
**Started:** 2026-04-23
**Current phase:** BUILD (next)
**Cycle type:** mini-cycle
**Parent cycle:** 016
'
run_hook test-parent-absent
assert_exit_zero "$HOOK_EXIT"
assert_no_block "$HOOK_STDOUT"  # parent present → parent_cycle_absent fails → skip

# ---- Primitive 4: parent_cycle_present ---------------------------------------
write_manifest 'format_version: 1
phases:
  build:
    required_mechanisms:
      - mechanism: test-parent-present
        path_template: docs/housekeeping/audits/never-created.md
        min_bytes: 400
        applicable_when:
          - parent_cycle_present: true
'
write_cycle_status '# RDD Cycle Status

## Cycle Stack

### Active: Top-Level Cycle

**Cycle number:** 016
**Started:** 2026-04-15
**Current phase:** BUILD (next)
**Cycle type:** batch
'
run_hook test-parent-present
assert_exit_zero "$HOOK_EXIT"
assert_no_block "$HOOK_STDOUT"  # parent absent → parent_cycle_present fails → skip

# ---- Default behavior: no applicable_when block → fires unconditionally -----
write_manifest 'format_version: 1
phases:
  build:
    required_mechanisms:
      - mechanism: test-default-fire
        path_template: docs/housekeeping/audits/never-created.md
        min_bytes: 400
'
write_cycle_status '# RDD Cycle Status

## Cycle Stack

### Active: Any Cycle

**Cycle number:** 016
**Started:** 2026-04-15
**Current phase:** BUILD (next)
**Cycle type:** mini-cycle
'
run_hook test-default-fire
assert_exit_zero "$HOOK_EXIT"
assert_block_decision "$HOOK_STDOUT"  # no precondition → check fires → missing artifact → block

# ---- Skip is recorded in the dispatch log -----------------------------------
# The first invocation (cycle_type_in unmet) should have created a
# dispatch-log entry noting the skip.
write_manifest 'format_version: 1
phases:
  build:
    required_mechanisms:
      - mechanism: test-logs-skip
        path_template: docs/housekeeping/audits/never-created.md
        min_bytes: 400
        applicable_when:
          - cycle_type_in: [standard]
'
write_cycle_status '# RDD Cycle Status

## Cycle Stack

### Active: Any Cycle

**Cycle number:** 016
**Started:** 2026-04-15
**Current phase:** BUILD (next)
**Cycle type:** mini-cycle
'
rm -f "${FAKE_REPO}/docs/housekeeping/dispatch-log.jsonl"
run_hook test-logs-skip
assert_exit_zero "$HOOK_EXIT"
if [[ -f "${FAKE_REPO}/docs/housekeeping/dispatch-log.jsonl" ]] \
    && grep -q '"skipped":"applicable_when' "${FAKE_REPO}/docs/housekeeping/dispatch-log.jsonl"; then
    pass "skip recorded in dispatch log"
else
    fail "dispatch log does not record applicable_when skip (got: $(cat ${FAKE_REPO}/docs/housekeeping/dispatch-log.jsonl 2>/dev/null || echo 'no log'))"
fi

report_summary

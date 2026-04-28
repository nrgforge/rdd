#!/usr/bin/env bash
# WP-D (ADR-088): Stop-hook manifest check is advisory across ALL modes.
# Verifies the v0.8.3 disposition shipped — no block decision under any
# corpus state — and that advisory output names the failing mechanism
# with the four-failure-mode classification ADR-088 §1 specifies:
#   F1: missing artifact + no dispatch log entry
#   F2: missing artifact + dispatch log entry exists (dispatched, no output)
#   F3: artifact exists + no dispatch log entry (fabrication signal)
#   F4: artifact exists + structural assertion failure (size / header / field)

source "$(dirname "$0")/lib.sh"
TEST_NAME="test_hook_manifest_check_advisory"

# --- F1: missing artifact + no dispatch ------------------------------------
setup_fake_repo
write_migration_marker
write_manifest 'format_version: 1
phases:
  build:
    required_mechanisms:
      - mechanism: test-f1-mechanism
        path_template: .rdd/audits/never-created.md
        min_bytes: 400
        required_headers:
          - "# Foo"
'
write_cycle_status '# RDD Cycle Status

## Cycle Stack

### Active: F1 Test

**Cycle number:** 016
**Started:** 2026-04-15
**Current phase:** BUILD (next)
**Cycle type:** batch
'
run_hook test-f1
assert_exit_zero "$HOOK_EXIT"
assert_no_block "$HOOK_STDOUT"
assert_stdout_contains "$HOOK_STDOUT" "test-f1-mechanism"
assert_stdout_contains "$HOOK_STDOUT" "not dispatched"

# --- F2: missing artifact + dispatch present ------------------------------
setup_fake_repo
write_migration_marker
write_manifest 'format_version: 1
phases:
  build:
    required_mechanisms:
      - mechanism: test-f2-mechanism
        path_template: .rdd/audits/test-f2-016.md
        min_bytes: 400
        required_headers:
          - "# Foo"
'
write_cycle_status '# RDD Cycle Status

## Cycle Stack

### Active: F2 Test

**Cycle number:** 016
**Started:** 2026-04-15
**Current phase:** BUILD (next)
**Cycle type:** batch
'
cat > "${FAKE_REPO}/.rdd/dispatch-log.jsonl" <<EOF
{"timestamp":"2026-04-23T00:00:00Z","mechanism":"test-f2-mechanism","expected_path":".rdd/audits/test-f2-016.md"}
EOF
run_hook test-f2
assert_exit_zero "$HOOK_EXIT"
assert_no_block "$HOOK_STDOUT"
assert_stdout_contains "$HOOK_STDOUT" "test-f2-mechanism"
assert_stdout_contains "$HOOK_STDOUT" "did not produce"

# --- F3: artifact present + no dispatch (fabrication signal) -------------
setup_fake_repo
write_migration_marker
write_manifest 'format_version: 1
phases:
  build:
    required_mechanisms:
      - mechanism: test-f3-mechanism
        path_template: .rdd/audits/test-f3-016.md
        min_bytes: 100
        required_headers:
          - "# Foo"
'
write_cycle_status '# RDD Cycle Status

## Cycle Stack

### Active: F3 Test

**Cycle number:** 016
**Started:** 2026-04-15
**Current phase:** BUILD (next)
**Cycle type:** batch
'
cat > "${FAKE_REPO}/.rdd/audits/test-f3-016.md" <<EOF
# Foo

This artifact exists at the canonical path but the dispatch log carries
no entry for it — the compound check should detect this as a fabrication
signal. Padding to clear the 100-byte minimum.
EOF
run_hook test-f3
assert_exit_zero "$HOOK_EXIT"
assert_no_block "$HOOK_STDOUT"
assert_stdout_contains "$HOOK_STDOUT" "test-f3-mechanism"
assert_stdout_contains "$HOOK_STDOUT" "fabricat"

# --- F4: artifact present + assertion failure (size floor) ---------------
setup_fake_repo
write_migration_marker
write_manifest 'format_version: 1
phases:
  build:
    required_mechanisms:
      - mechanism: test-f4-mechanism
        path_template: .rdd/audits/test-f4-016.md
        min_bytes: 1000
        required_headers:
          - "# Foo"
'
write_cycle_status '# RDD Cycle Status

## Cycle Stack

### Active: F4 Test

**Cycle number:** 016
**Started:** 2026-04-15
**Current phase:** BUILD (next)
**Cycle type:** batch
'
# Artifact too small (well under 1000 bytes)
echo "# Foo" > "${FAKE_REPO}/.rdd/audits/test-f4-016.md"
cat > "${FAKE_REPO}/.rdd/dispatch-log.jsonl" <<EOF
{"timestamp":"2026-04-23T00:00:00Z","mechanism":"test-f4-mechanism","expected_path":".rdd/audits/test-f4-016.md"}
EOF
run_hook test-f4
assert_exit_zero "$HOOK_EXIT"
assert_no_block "$HOOK_STDOUT"
assert_stdout_contains "$HOOK_STDOUT" "test-f4-mechanism"
assert_stdout_contains "$HOOK_STDOUT" "too small"

# --- Cross-mode: legacy (pre-ADR-072) emits advisory, no block ----------
setup_fake_repo
write_migration_marker
write_manifest
write_cycle_status '# Active RDD Cycle: Legacy
**Started:** 2025-11-10
**Cycle number:** 008
**Current phase:** build (next)
'
run_hook test-cross-mode-legacy
assert_exit_zero "$HOOK_EXIT"
assert_no_block "$HOOK_STDOUT"
# Legacy mode emits grandfathered notice on stderr — confirms code path.
assert_stderr_contains "rdd-hook: grandfathered cycle"

report_summary

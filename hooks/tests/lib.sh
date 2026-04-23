#!/usr/bin/env bash
# Shared test helpers for hooks/tests/*.sh
#
# Each test:
#   source "$(dirname "$0")/lib.sh"
#   setup_fake_repo              # creates $FAKE_REPO (tempdir); cd into it
#   write_cycle_status '...'     # writes docs/cycle-status.md
#   write_manifest '...'         # writes hooks/manifests/tier1-phase-manifest.yaml
#   write_migration_marker       # enforcement mode
#   OUTPUT=$(run_hook ...)       # invoke the hook
#   assert_exit_zero "$?"
#   assert_stdout_contains "$OUTPUT" "expected"
#   ...

set -uo pipefail

# --- Paths -------------------------------------------------------------------
LIB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_ROOT="$(cd "${LIB_DIR}/../.." && pwd)"
HOOK_SCRIPT="${PLUGIN_ROOT}/hooks/scripts/tier1-phase-manifest-check.sh"
DEFAULT_MANIFEST="${PLUGIN_ROOT}/hooks/manifests/tier1-phase-manifest.yaml"

# --- Colors / reporting ------------------------------------------------------
if [[ -t 1 ]]; then
    C_GREEN=$'\033[0;32m'; C_RED=$'\033[0;31m'; C_YELLOW=$'\033[0;33m'; C_RESET=$'\033[0m'
else
    C_GREEN=""; C_RED=""; C_YELLOW=""; C_RESET=""
fi

TEST_NAME="${TEST_NAME:-$(basename "${0:-unknown}" .sh)}"
FAILS=0

pass() { printf '  %sPASS%s %s\n' "$C_GREEN" "$C_RESET" "$1"; }
fail() { printf '  %sFAIL%s %s\n' "$C_RED" "$C_RESET" "$1"; FAILS=$((FAILS+1)); }

# --- Fake repo setup ---------------------------------------------------------
setup_fake_repo() {
    FAKE_REPO="$(mktemp -d -t rdd-hook-test-XXXXXX)"
    mkdir -p "${FAKE_REPO}/docs/housekeeping/audits"
    mkdir -p "${FAKE_REPO}/docs/housekeeping/gates"
    mkdir -p "${FAKE_REPO}/docs/decisions"
    mkdir -p "${FAKE_REPO}/docs/essays"
    mkdir -p "${FAKE_REPO}/hooks/manifests"
    # Seed a default essay so the cycle-number inference fallback has something
    # to find — most tests override CURRENT_CYCLE explicitly in cycle-status.md.
    : > "${FAKE_REPO}/docs/essays/015-placeholder.md"
    trap 'rm -rf "$FAKE_REPO"' EXIT
}

write_cycle_status() {
    local body="$1"
    printf '%s' "$body" > "${FAKE_REPO}/docs/cycle-status.md"
}

write_manifest() {
    # If called with one arg, treat it as literal YAML content.
    # If called with no args, copy the default manifest.
    local body="${1:-__DEFAULT__}"
    if [[ "$body" == "__DEFAULT__" ]]; then
        cp "$DEFAULT_MANIFEST" "${FAKE_REPO}/hooks/manifests/tier1-phase-manifest.yaml"
    else
        printf '%s' "$body" > "${FAKE_REPO}/hooks/manifests/tier1-phase-manifest.yaml"
    fi
}

write_migration_marker() {
    printf '%s\n' "${1:-0.7.1}" > "${FAKE_REPO}/docs/housekeeping/.migration-version"
}

write_gate_reflection() {
    # Writes a plausible gate reflection note at the canonical path so E1/S1/S2/S3
    # pass. $1 = cycle number (e.g. 016), $2 = phase name (e.g. build).
    # Content is padded to clear the manifest's 800B min_bytes floor.
    local cycle="$1" phase="$2"
    cat > "${FAKE_REPO}/docs/housekeeping/gates/${cycle}-${phase}-gate.md" <<EOF
# Gate Reflection: Cycle ${cycle} ${phase} → next

**Date:** 2026-04-23
**Phase boundary:** ${phase} → next
**Cycle:** Test Cycle ${cycle}

## Belief-mapping question composed for this gate

What would you need to believe for the alternative framing to be the right
call here, and what evidence would shift confidence between the two?

## User's response

Test fixture response — a reasoned position articulating the settled premises,
the open questions, and the specific commitments being carried forward. The
response engages with the belief-mapping question directly.

## Pedagogical move selected

Probe. Surfaced a specific artifact decision for the user's take without
narrating engagement back to them.

## Commitment gating outputs

**Settled premises (going into next phase):**
- Example settled premise one.
- Example settled premise two.

**Open questions (held into next phase):**
- Example open question one.

**Specific commitments carried forward:**
- Example commitment one.
EOF
}

write_susceptibility_snapshot() {
    # Writes a plausible susceptibility snapshot at the canonical path.
    # Content is padded to clear the manifest's 400B min_bytes floor.
    local cycle="$1" phase="$2"
    cat > "${FAKE_REPO}/docs/housekeeping/audits/susceptibility-snapshot-${cycle}-${phase}.md" <<EOF
# Susceptibility Snapshot

Phase evaluated: ${phase}
Cycle: ${cycle}

## Observed Signals

Assertion density: nominal. Solution-space narrowing: nominal. Framing
adoption: nominal. Confidence markers: nominal. Engagement with alternatives:
present and substantive across the phase. No drift in register or in the
user's posture across the gate conversation.

## Recommendation

Advance. No Grounding Reframe required. The snapshot observed no significant
findings at this boundary.
EOF
}

# --- Hook invocation ---------------------------------------------------------
# Do NOT wrap run_hook in command substitution; it sets state via globals
# (command substitution runs in a subshell and the globals would be lost).
#   run_hook test-nominal           # runs the hook
#   echo "$HOOK_STDOUT"              # captured stdout
#   echo "$HOOK_STDERR"              # captured stderr
#   (( HOOK_EXIT == 0 )) || ...      # exit code
HOOK_STDOUT=""
HOOK_STDERR=""
HOOK_EXIT=0

run_hook() {
    # Each invocation gets a unique session ID (caller-supplied prefix + PID +
    # monotonic counter) so the hook's once-per-session notice markers don't
    # persist across test runs or across assertions within one test.
    local prefix="${1:-test-session}"
    RUN_HOOK_COUNTER=$((${RUN_HOOK_COUNTER:-0} + 1))
    local session_id="${prefix}-$$-${RUN_HOOK_COUNTER}"
    local stdout_file stderr_file
    stdout_file="$(mktemp -t rdd-hook-stdout-XXXXXX)"
    stderr_file="$(mktemp -t rdd-hook-stderr-XXXXXX)"
    (
        cd "$FAKE_REPO" && \
        CLAUDE_PLUGIN_ROOT="$FAKE_REPO" \
        printf '%s' "{\"session_id\":\"${session_id}\",\"cwd\":\"${FAKE_REPO}\",\"hook_event_name\":\"Stop\",\"stop_hook_active\":false}" \
        | bash "$HOOK_SCRIPT" > "$stdout_file" 2> "$stderr_file"
    )
    HOOK_EXIT=$?
    HOOK_STDOUT="$(cat "$stdout_file")"
    HOOK_STDERR="$(cat "$stderr_file")"
    rm -f "$stdout_file" "$stderr_file"
    # Best-effort cleanup of any markers the hook wrote for this session.
    rm -f /tmp/rdd-advisory-${session_id} \
          /tmp/rdd-pause-notice-${session_id} \
          /tmp/rdd-grandfathered-${session_id} \
          /tmp/rdd-gate-notice-${session_id} 2>/dev/null
}

# --- Assertions --------------------------------------------------------------
assert_exit_zero() {
    if [[ "$1" -eq 0 ]]; then pass "hook exited 0 (${2:-fail-safe})"
    else fail "hook exited $1 (expected 0); stderr: $HOOK_STDERR"; fi
}

assert_stdout_empty() {
    if [[ -z "$1" ]]; then pass "stdout empty (silent allow)"
    else fail "stdout non-empty: ${1:0:200}"; fi
}

assert_stdout_contains() {
    if grep -qF "$2" <<< "$1"; then pass "stdout contains '$2'"
    else fail "stdout missing '$2'. Got: ${1:0:400}"; fi
}

assert_stdout_not_contains() {
    if ! grep -qF "$2" <<< "$1"; then pass "stdout does not contain '$2'"
    else fail "stdout should not contain '$2'. Got: ${1:0:400}"; fi
}

assert_stderr_contains() {
    if grep -qF "$1" <<< "$HOOK_STDERR"; then pass "stderr contains '$1'"
    else fail "stderr missing '$1'. Got: ${HOOK_STDERR:0:400}"; fi
}

assert_stderr_not_contains() {
    if ! grep -qF "$1" <<< "$HOOK_STDERR"; then pass "stderr does not contain '$1'"
    else fail "stderr should not contain '$1'. Got: ${HOOK_STDERR:0:400}"; fi
}

assert_block_decision() {
    if grep -qF '"decision":"block"' <<< "$1"; then pass "block decision emitted"
    else fail "expected block decision. Got: ${1:0:400}"; fi
}

assert_no_block() {
    if ! grep -qF '"decision":"block"' <<< "$1"; then pass "no block decision (allow or advisory)"
    else fail "unexpected block. Got: ${1:0:400}"; fi
}

# --- Test lifecycle ----------------------------------------------------------
report_summary() {
    if [[ $FAILS -eq 0 ]]; then
        printf '%s[%s] PASS%s\n' "$C_GREEN" "$TEST_NAME" "$C_RESET"
        exit 0
    else
        printf '%s[%s] FAIL%s — %d assertion(s) failed\n' "$C_RED" "$TEST_NAME" "$C_RESET" "$FAILS"
        exit 1
    fi
}

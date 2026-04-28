#!/usr/bin/env bash
# WP-B (ADR-085): The PostToolUse verify-dispatch hook writes the dispatch log
# to .rdd/dispatch-log.jsonl when .rdd/ exists at the repository root, and
# falls back to docs/housekeeping/dispatch-log.jsonl when only the legacy
# directory exists.

set -uo pipefail

TEST_NAME="$(basename "$0" .sh)"

# --- Colors / reporting -------------------------------------------------------
if [[ -t 1 ]]; then
    C_GREEN=$'\033[0;32m'; C_RED=$'\033[0;31m'; C_RESET=$'\033[0m'
else
    C_GREEN=""; C_RED=""; C_RESET=""
fi

FAILS=0
pass() { printf '  %sPASS%s %s\n' "$C_GREEN" "$C_RESET" "$1"; }
fail() { printf '  %sFAIL%s %s\n' "$C_RED" "$C_RESET" "$1"; FAILS=$((FAILS+1)); }

PLUGIN_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
HOOK="${PLUGIN_ROOT}/hooks/scripts/tier1-verify-dispatch.sh"

if [[ ! -x "$HOOK" ]]; then
    fail "verify-dispatch hook not found or not executable at $HOOK"
    exit 1
fi

# --- Helper: invoke verify-dispatch with a Tier 1 dispatch payload -----------
# The payload simulates Claude Code's PostToolUse on Agent input, including a
# subagent_type, a prompt with a canonical "Output path:" line, and ids.
invoke_verify_dispatch() {
    local repo="$1" subagent_type="$2" output_path="$3"
    local input
    input=$(jq -nc \
        --arg sat "$subagent_type" \
        --arg ep "$output_path" \
        '{
            "session_id": "test-session-write-rdd",
            "tool_name": "Agent",
            "tool_use_id": "toolu_test_dispatch_001",
            "tool_input": {
                "subagent_type": $sat,
                "prompt": "Brief content.\n\nOutput path: \($ep)"
            }
        }')
    (cd "$repo" && printf '%s' "$input" | bash "$HOOK")
}

# --- Case 1: .rdd/ exists → dispatch log written there -----------------------
REPO1="$(mktemp -d -t rdd-dispatch-test-XXXXXX)"
mkdir -p "${REPO1}/.rdd"
invoke_verify_dispatch "$REPO1" "susceptibility-snapshot-evaluator" \
    ".rdd/audits/susceptibility-snapshot-017-build.md"

if [[ -f "${REPO1}/.rdd/dispatch-log.jsonl" ]] \
    && grep -q '"mechanism":"susceptibility-snapshot-evaluator"' "${REPO1}/.rdd/dispatch-log.jsonl" \
    && grep -q '"expected_path":".rdd/audits/susceptibility-snapshot-017-build.md"' "${REPO1}/.rdd/dispatch-log.jsonl"; then
    pass "writes to .rdd/dispatch-log.jsonl when .rdd/ exists"
else
    fail "did not write to .rdd/dispatch-log.jsonl. Contents: $(cat "${REPO1}/.rdd/dispatch-log.jsonl" 2>/dev/null || echo 'no log')"
fi

# Verify it did NOT also write to docs/housekeeping/ (which doesn't exist).
if [[ ! -f "${REPO1}/docs/housekeeping/dispatch-log.jsonl" ]]; then
    pass "does not write to docs/housekeeping/ when .rdd/ exists"
else
    fail "unexpectedly wrote to docs/housekeeping/dispatch-log.jsonl"
fi

rm -rf "$REPO1"

# --- Case 2: only docs/housekeeping/ exists → legacy fallback ---------------
REPO2="$(mktemp -d -t rdd-dispatch-test-XXXXXX)"
mkdir -p "${REPO2}/docs/housekeeping"
invoke_verify_dispatch "$REPO2" "argument-auditor" \
    "docs/housekeeping/audits/argument-audit-017.md"

if [[ -f "${REPO2}/docs/housekeeping/dispatch-log.jsonl" ]] \
    && grep -q '"mechanism":"argument-auditor"' "${REPO2}/docs/housekeeping/dispatch-log.jsonl"; then
    pass "writes to docs/housekeeping/dispatch-log.jsonl when only legacy dir exists"
else
    fail "did not write to docs/housekeeping/dispatch-log.jsonl on legacy fallback"
fi

# Verify .rdd/ was NOT created (no spurious directory creation).
if [[ ! -d "${REPO2}/.rdd" ]]; then
    pass "does not create .rdd/ when only legacy dir exists"
else
    fail "unexpectedly created .rdd/ directory"
fi

rm -rf "$REPO2"

# --- Case 3: neither directory exists → defaults to .rdd/ -------------------
# Fresh corpus / first-time use creates .rdd/ as the canonical location.
REPO3="$(mktemp -d -t rdd-dispatch-test-XXXXXX)"
invoke_verify_dispatch "$REPO3" "citation-auditor" \
    ".rdd/audits/citation-audit-017.md"

if [[ -f "${REPO3}/.rdd/dispatch-log.jsonl" ]]; then
    pass "defaults to .rdd/dispatch-log.jsonl on fresh corpus"
else
    fail "did not default to .rdd/ on fresh corpus"
fi

rm -rf "$REPO3"

# --- Summary ------------------------------------------------------------------
if [[ $FAILS -eq 0 ]]; then
    printf '%s[%s] PASS%s\n' "$C_GREEN" "$TEST_NAME" "$C_RESET"
    exit 0
else
    printf '%s[%s] FAIL%s — %d assertion(s) failed\n' "$C_RED" "$TEST_NAME" "$C_RESET" "$FAILS"
    exit 1
fi

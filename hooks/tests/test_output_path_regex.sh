#!/usr/bin/env bash
# Test: tier1-verify-dispatch.sh Output path: extraction handles markdown-
# formatted variants (Issue #15). Seven fixtures: six positive variants that
# must match and extract the bare path, one negative prose prescription that
# must not match.
#
# This test exercises the extraction logic directly by copy-paste from the
# hook script — a focused unit check, not a full hook harness invocation.
# The hook's JSON-input / dispatch-log behavior is out of this test's scope.

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

# --- Extractor (copy of the hook's logic) ------------------------------------
# Kept as a bash function so the test exercises exactly the pipeline the hook
# runs. If the hook script changes, this copy must be updated — the test
# harness checks the two match by construction of the test fixtures, not by
# dynamic sourcing.
extract_output_path() {
    local prompt="$1"
    printf '%s' "$prompt" \
        | grep -E '^[[:space:]]*([-*][[:space:]]+)?(\*\*)?`?Output path:' \
        | head -1 \
        | sed -E '
            s/^[[:space:]]*[-*][[:space:]]+//
            s/^`(.*)`$/\1/
            s/\*\*Output path:\*\*/Output path:/
            s/^.*Output path:[[:space:]]*//
            s/^`//
            s/`$//
            s/[[:space:]]+$//
        '
}

assert_extracts_to() {
    local label="$1" prompt="$2" expected="$3"
    local got
    got="$(extract_output_path "$prompt")"
    if [[ "$got" == "$expected" ]]; then
        pass "$label — extracts '$expected'"
    else
        fail "$label — expected '$expected', got '$got'"
    fi
}

assert_no_match() {
    local label="$1" prompt="$2"
    local got
    got="$(extract_output_path "$prompt")"
    if [[ -z "$got" ]]; then
        pass "$label — no match (prose prescription correctly ignored)"
    else
        fail "$label — expected no match, got '$got'"
    fi
}

# --- Fixtures per Issue #15 ---------------------------------------------------

EXPECTED="docs/housekeeping/audits/report.md"

# 1. Canonical
assert_extracts_to "canonical" \
    "Some preamble.
Output path: $EXPECTED
More content." \
    "$EXPECTED"

# 2. Markdown bold
assert_extracts_to "markdown bold" \
    "Preamble.
**Output path:** $EXPECTED
Content." \
    "$EXPECTED"

# 3. Backticked path
assert_extracts_to "backticked path" \
    "Preamble.
Output path: \`$EXPECTED\`
Content." \
    "$EXPECTED"

# 4. Fully backticked line
assert_extracts_to "fully backticked line" \
    "Preamble.
\`Output path: $EXPECTED\`
Content." \
    "$EXPECTED"

# 5. Markdown bold + backticked path
assert_extracts_to "markdown bold + backticked path" \
    "Preamble.
**Output path:** \`$EXPECTED\`
Content." \
    "$EXPECTED"

# 6. List-item form
assert_extracts_to "list item" \
    "Preamble.
- Output path: $EXPECTED
Content." \
    "$EXPECTED"

# 7. Negative — prose prescription (no 'Output path:' label)
assert_no_match "prose prescription" \
    "Preamble.
Write your output to $EXPECTED
Content."

# 8. Extra coverage — multiple candidates, first wins (matches head -1 semantics)
assert_extracts_to "first of multiple" \
    "Preamble.
Output path: docs/first.md
**Output path:** docs/second.md" \
    "docs/first.md"

# 9. Extra coverage — leading whitespace in list form
assert_extracts_to "leading whitespace + list" \
    "Preamble.
   -   Output path: $EXPECTED
Content." \
    "$EXPECTED"

# --- Summary ------------------------------------------------------------------
if [[ $FAILS -eq 0 ]]; then
    printf '%s[%s] PASS%s\n' "$C_GREEN" "$TEST_NAME" "$C_RESET"
    exit 0
else
    printf '%s[%s] FAIL%s — %d assertion(s) failed\n' "$C_RED" "$TEST_NAME" "$C_RESET" "$FAILS"
    exit 1
fi

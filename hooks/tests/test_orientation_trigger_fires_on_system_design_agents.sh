#!/usr/bin/env bash
# WP-B addition surfaced at the Cycle 017 architect → build gate.
# After ADR-084 Pattern B introduced system-design.agents.md as a companion
# file to system-design.md, the orientation-trigger hook must fire on writes
# to the companion file alongside the existing key-artifact set
# (system-design.md, domain-model.md, scenarios.md, product-discovery.md).
#
# Without this extension, edits to the companion file alone do not trigger
# ORIENTATION.md regeneration prompts — a sync-mechanism gap relative to the
# four sync mechanisms the practitioner named at the gate.

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
HOOK="${PLUGIN_ROOT}/hooks/scripts/orientation-trigger.sh"

if [[ ! -x "$HOOK" ]]; then
    fail "orientation-trigger.sh not found or not executable at $HOOK"
    exit 1
fi

run_hook_with_input() {
    local input="$1"
    printf '%s' "$input" | bash "$HOOK" 2>&1
}

# Helper: build a JSON-shaped input simulating a Write tool call to the
# given file path. The hook's regex matches against the JSON-quoted filename.
write_input() {
    local path="$1"
    printf '{"tool_name":"Write","tool_input":{"file_path":"%s","content":"..."}}' "$path"
}

# --- Positive: system-design.agents.md fires reminder ------------------------
output="$(run_hook_with_input "$(write_input '/repo/docs/system-design.agents.md')")"
if grep -q "REMINDER" <<<"$output"; then
    pass "Write to system-design.agents.md fires REMINDER"
else
    fail "Write to system-design.agents.md did not fire REMINDER. Got: $output"
fi

# --- Positive: existing key artifacts still fire (regression check) ----------
for artifact in system-design.md domain-model.md scenarios.md product-discovery.md; do
    output="$(run_hook_with_input "$(write_input "/repo/docs/$artifact")")"
    if grep -q "REMINDER" <<<"$output"; then
        pass "Write to $artifact still fires REMINDER (regression check)"
    else
        fail "Write to $artifact did not fire REMINDER. Got: $output"
    fi
done

# --- Negative: unrelated file does not fire ----------------------------------
output="$(run_hook_with_input "$(write_input '/repo/docs/some-other-file.md')")"
if grep -q "REMINDER" <<<"$output"; then
    fail "Write to unrelated file fired REMINDER (false positive). Got: $output"
else
    pass "Write to unrelated file does not fire REMINDER"
fi

# --- Negative: similarly-named but distinct file does not match --------------
# The companion file is system-design.agents.md. A file like system-design-foo.md
# should NOT match (the pattern is anchored to known artifact names).
output="$(run_hook_with_input "$(write_input '/repo/docs/system-design-foo.md')")"
if grep -q "REMINDER" <<<"$output"; then
    fail "Write to system-design-foo.md fired REMINDER (over-match). Got: $output"
else
    pass "Write to system-design-foo.md does not over-match"
fi

# --- Summary ------------------------------------------------------------------
if [[ $FAILS -eq 0 ]]; then
    printf '%s[%s] PASS%s\n' "$C_GREEN" "$TEST_NAME" "$C_RESET"
    exit 0
else
    printf '%s[%s] FAIL%s — %d assertion(s) failed\n' "$C_RED" "$TEST_NAME" "$C_RESET" "$FAILS"
    exit 1
fi

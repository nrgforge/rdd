#!/usr/bin/env bash
# Skill-text anchoring test: verify the migrate-to-rdd operation explicitly
# enumerates the eight hook test fixtures in its substitution sweep
# (ADR-085 §4 paragraph 10 — the Cycle 017 conformance scan finding that
# motivated explicit enumeration).

source "$(dirname "$0")/lib.sh"
TEST_NAME="test_conform_migrate_to_rdd_hook_fixtures"

PLUGIN_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
SKILL_FILE="${PLUGIN_ROOT}/skills/conform/SKILL.md"

if [[ ! -f "$SKILL_FILE" ]]; then
    fail "skills/conform/SKILL.md not found at $SKILL_FILE"
    report_summary
fi

CONTENT="$(cat "$SKILL_FILE")"

# The eight fixtures that were named in conformance-scan-decide-017.md
# Cluster 1 and required explicit enumeration in ADR-085 §4 paragraph 10.
declare -a FIXTURES=(
    "lib.sh"
    "test_nominal.sh"
    "test_in_progress_phase.sh"
    "test_applicable_when.sh"
    "test_in_progress_gate.sh"
    "test_multi_entry_stack.sh"
    "test_output_path_regex.sh"
    "test_parses_cycle_stack_phase.sh"
)

for fixture in "${FIXTURES[@]}"; do
    if grep -qF "$fixture" <<<"$CONTENT"; then
        pass "fixture $fixture is enumerated in skill text"
    else
        fail "fixture $fixture is NOT enumerated in skill text"
    fi
done

# The skill text frames hook test fixtures as explicitly included.
if grep -qiE 'hook test fixtures.*included|fixtures? .*explicit|explicit.*fixtures' <<<"$CONTENT"; then
    pass "skill text frames fixtures as explicitly included in substitution sweep"
else
    fail "skill text does not explicitly frame fixture inclusion"
fi

report_summary

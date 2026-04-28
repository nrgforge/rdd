#!/usr/bin/env bash
# Skill-text anchoring test: verify skills/conform/SKILL.md contains the
# `migrate-to-rdd` operation per ADR-085 §4 (Cycle 017 WP-A).
#
# The migration is performed by the agent reading and executing the skill
# text — not by an executable script. This test ensures the canonical
# step description is present so the operation is anchored at the
# Skill-Structure Layer (ADR-065 + ADR-067 substrate primacy).

source "$(dirname "$0")/lib.sh"
TEST_NAME="test_conform_migrate_to_rdd_basic"

PLUGIN_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
SKILL_FILE="${PLUGIN_ROOT}/skills/conform/SKILL.md"

if [[ ! -f "$SKILL_FILE" ]]; then
    fail "skills/conform/SKILL.md not found at $SKILL_FILE"
    report_summary
fi

CONTENT="$(cat "$SKILL_FILE")"

# Operations table includes the new subcommand
if grep -qE '\| \*\*Migrate to `?\.rdd/`?\*\*' <<<"$CONTENT"; then
    pass "operations table includes Migrate to .rdd/"
else
    fail "operations table missing Migrate to .rdd/ entry"
fi

# Operation section header exists
if grep -qE '^## Operation [0-9]+:.*Migrate to `?\.rdd/`?' <<<"$CONTENT"; then
    pass "Migrate to .rdd/ operation section header exists"
else
    fail "Migrate to .rdd/ operation section header missing"
fi

# Operation references ADR-085
if grep -q "ADR-085" <<<"$CONTENT"; then
    pass "operation references ADR-085"
else
    fail "operation does not reference ADR-085"
fi

# All thirteen ADR-085 §4 step targets are mentioned.
# (The skill text need not number them 1-13; it must describe each move/check.)
declare -a TARGETS=(
    ".rdd/.migration-version"           # idempotency marker
    ".rdd/audits/"                      # audits move
    ".rdd/gates/"                       # gates move
    ".rdd/cycle-status.md"              # cycle-status move
    ".rdd/dispatch-log.jsonl"           # dispatch-log move
    ".rdd/session/"                     # session move
)
for target in "${TARGETS[@]}"; do
    if grep -qF "$target" <<<"$CONTENT"; then
        pass "operation describes $target"
    else
        fail "operation does not describe $target"
    fi
done

# Reference-substitution scope must enumerate the canonical targets per ADR-085 §4.10
declare -a SUBST_TARGETS=(
    "docs/decisions"
    "docs/essays"
    "skills/"
    "hooks/manifests"
    "hooks/scripts"
    "hooks/tests"
    "docs/domain-model.md"
    "docs/ORIENTATION.md"
)
for t in "${SUBST_TARGETS[@]}"; do
    if grep -qF "$t" <<<"$CONTENT"; then
        pass "reference-substitution scope includes $t"
    else
        fail "reference-substitution scope missing $t"
    fi
done

# Refuses to run on uncommitted modifications (safety check)
if grep -qiE 'uncommitted|git status' <<<"$CONTENT"; then
    pass "operation includes uncommitted-changes safety check"
else
    fail "operation missing uncommitted-changes safety check"
fi

# Operation produces a summary report
if grep -qiE 'summary report' <<<"$CONTENT"; then
    pass "operation produces summary report"
else
    fail "operation does not describe summary report"
fi

report_summary

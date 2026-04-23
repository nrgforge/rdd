#!/usr/bin/env bash
# Run all hooks/tests/test_*.sh files and report aggregate results.
# Exit non-zero if any test fails.
set -u
HERE="$(cd "$(dirname "$0")" && pwd)"
TESTS=( "$HERE"/test_*.sh )

if [[ ! -e "${TESTS[0]}" ]]; then
    echo "No tests found in $HERE"
    exit 0
fi

PASSES=0
FAILS=0
FAILING_TESTS=()

for t in "${TESTS[@]}"; do
    echo "---"
    echo "Running $(basename "$t")..."
    if bash "$t"; then
        PASSES=$((PASSES+1))
    else
        FAILS=$((FAILS+1))
        FAILING_TESTS+=("$(basename "$t")")
    fi
done

echo "---"
echo "Ran ${#TESTS[@]} tests: $PASSES passed, $FAILS failed."
if [[ $FAILS -gt 0 ]]; then
    echo "Failures:"
    for f in "${FAILING_TESTS[@]}"; do echo "  - $f"; done
    exit 1
fi

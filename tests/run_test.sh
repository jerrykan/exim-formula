#!/bin/bash

TESTS_DIR=$(cd $(dirname $0); pwd)
FAILURES=0

for F in $TESTS_DIR/test_*.py; do
    ID=$(basename ${F%.py})
    echo
    echo "=== RUNNING TEST: $ID ==="

    salt-call --state-output=terse --id test__reset state.apply
    salt-call --state-output=terse --id $ID state.apply

    testinfra $F
    if [[ $? -ne 0 ]]; then
        FAILURES=$((FAILURES + 1))
        continue
    fi
done

if [[ $FAILURES -ne 0 ]]; then
    echo "Tests Failed:"
    echo "  Failed tests: $FAILURES"
    exit 1
else
    echo "Tests Passed"
fi

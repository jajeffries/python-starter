#!/usr/bin/env bash

set -e

${COVERAGE:false}

COVERAGE_DIR=test_output/coverage

python -m coverage run --branch -m unittest discover
python -m coverage xml
mkdir -p $COVERAGE_DIR
cp coverage.xml $COVERAGE_DIR
cp coverage.html $COVERAGE_DIR

if [ "$COVERAGE" == "true" ]
then
    python -m coverage report
fi
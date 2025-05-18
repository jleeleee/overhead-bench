#!/usr/bin/env bash
set -euo pipefail

# Tell bash’s built-in time to output only the real time in seconds
export TIMEFORMAT='%R'

echo "Running 5 trials; printing elapsed (real) time for each:"
for i in {1..5}; do
  # Run the profiling command, suppress its stdout, capture the time output
  # elapsed=$( { time python ./proton_test.py > /dev/null; } 2>&1 )
  elapsed=$( { time nsys profile --trace=cuda --sample=none --cpuctxsw=none python ./proton_test.py > /dev/null; } 2>&1 )
  echo "Trial $i: ${elapsed}s"
done

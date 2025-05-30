#!/usr/bin/env bash
set -euo pipefail

# Tell bash’s built-in time to output only the real time in seconds
export TIMEFORMAT='%R'
ALL_ELAPSED=()
echo "Running 5 trials; printing elapsed (real) time for each:"
for i in {1..5}; do
  # Run the profiling command, suppress its stdout, capture the time output
  elapsed=$( { time python ./llama3_1.py --profiling torch > /dev/null; } 2>&1 )
  echo "Trial $i: ${elapsed}"
  ALL_ELAPSED+=($elapsed)
done

# Print all elapsed times
echo "All elapsed times: ${ALL_ELAPSED[@]}"
  
# Calculate and print the average elapsed time


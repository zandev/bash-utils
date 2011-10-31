#!/bin/bash

# script/directory real name/location
pushd $(dirname $(readlink -f "$BASH_SOURCE")) > /dev/null
readonly script_dir="$PWD"
popd > /dev/null
readonly script_name=$(basename $0)


for test in "$script_dir"/*test.sh; do
  printf -vch  "%80s" ""
  printf "%s\n" "${ch// /-}"
  echo "--- Running: $test"
  echo
  "$script_dir/testrunner.sh" "$test"
done

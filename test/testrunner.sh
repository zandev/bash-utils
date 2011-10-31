#!/bin/bash

# script/directory real name/location
pushd $(dirname $(readlink -f "$BASH_SOURCE")) > /dev/null
readonly script_dir="$PWD"
popd > /dev/null
readonly script_name=$(basename $0)

source "$1"

# Load functions
. "$script_dir/../src/functions.sh"

# Load shunit
. "$script_dir/../lib/shunit2/src/shunit2"

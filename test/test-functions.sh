#!/bin/bash

# script/directory real name/location
pushd $(dirname $(readlink -f "$BASH_SOURCE")) > /dev/null
readonly script_dir="$PWD"
popd > /dev/null
readonly script_name=$(basename $0)

#-----------------------------------------------------------
# setup/cleaning
#

oneTimeSetUp(){
  echo setup
}

oneTimeTearDown(){
  echo Cleaning
}

setUp(){
  echo simple setup
}

tearDown(){
  echo tear down
}

#-----------------------------------------------------------
# tests
#

testTruth(){
  assertTrue true
}

testEquality(){
  assertEquals 1 1
}


# Load shunit
. "$script_dir/../lib/shunit2/src/shunit2"




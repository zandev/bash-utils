#!/bin/bash

#-----------------------------------------------------------
# Tests
#

setUp(){
  tmp_dir=$(mktemp -d)
  unset TEST_VALUE_{,A,B,C}
  BASHUTILS_DEPENDENCIES=()
}

tearDown(){
  rm -rf "$tmp_dir"
}

testSourcing(){
  local tmpfile_a="$tmp_dir/tmpfile_a.sh"
  local tmpfile_b="$tmp_dir/tmpfile_b.sh"

  echo "TEST_VALUE_A='33'" > "$tmpfile_a"
  echo "TEST_VALUE_B='47'" > "$tmpfile_b"
  
  import "$tmpfile_a"
  import "$tmpfile_b"

  assertEquals 33 "$TEST_VALUE_A"
  assertEquals 47 "$TEST_VALUE_B"
}

testImportSameFile(){
  local tmpfile="$tmp_dir/tmpfile.sh"
  echo "TEST_VALUE='56'" > "$tmpfile"
  import "$tmpfile"
  TEST_VALUE=72
  import "$tmpfile"

  assertEquals 72 "$TEST_VALUE"
}

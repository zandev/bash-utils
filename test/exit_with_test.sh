#!/bin/bash

#-----------------------------------------------------------
# setup/cleaning
#

#oneTimeSetUp(){
#  echo Prepare
#}

#oneTimeTearDown(){
#  echo Cleaning
#}

#setUp(){
#  #BASHUTILS_DEBUG=true
#}

#tearDown(){
#  echo Tear Down
#}

#-----------------------------------------------------------
# Tests
#

testShouldAcceptOneArgument(){
  exit_with 'Message' > /dev/null
  assertTrue true
}

testShouldAcceptTwoArguments(){
  exit_with 'Message' 1 > /dev/null
  assertTrue true
}

testShouldNotAcceptNoArguments(){
  result=$(exit_with > /dev/null)
  assertNotEquals 0 $?
}

testShouldNotAcceptThreeArguments(){
  result=$(exit_with 'Message' 1 3 > /dev/null)
  assertNotEquals 0 $?
}

testShouldPrintMessage(){
  expected="hjklsd  _yè_'(fGDT."
  actual=$(exit_with "$expected")
  assertEquals "$expected" "$actual"
}

testDefaultExitCode(){
  default="$BASHUTILS_DEFAULT_EXIT_CODE"
  result=$(exit_with 'message')
  status="$?"
  assertEquals "$default" "$status"
}

testShouldExitWithGivenCode(){
  code=7
  result=$(exit_with 'message' "$code")
  status="$?"
  assertEquals "$code" "$status"
}

testShouldNotExitInDebugMode(){
  BASHUTILS_DEBUG=true
  exit_with '' 1 > /dev/null
  assertTrue true
}

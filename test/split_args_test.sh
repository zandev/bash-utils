#!/bin/bash

#-----------------------------------------------------------
# Tests
#


testSplitArgsDoSplitOnOneGroup(){
  arguments="-abcd"
  expected="-a -b -c -d"
  actual=$(split_args "$arguments")
  assertEquals "$expected" "$actual"
}

testSplitArgsDoSplitOnOManyGroups(){
  arguments="-abcd -efg -h -ij -k"
  expected="-a -b -c -d -e -f -g -h -i -j -k"
  actual=$(split_args "$arguments")
  assertEquals "$expected" "$actual"
}

testSplitArgsWithUnquotedArgs(){
  expected="-a -b -c -d -e -f"
  actual=$(split_args -abc -def)
  assertEquals "$expected" "$actual"
}

testSplitArgsWithLongOptions(){
  arguments="-abcd --long -efg"
  expected="-a -b -c -d --long -e -f -g"
  actual=$(split_args "$arguments")
  assertEquals "$expected" "$actual"
}

testSplitArgsWithManySpaces(){
  arguments="-a             -bc -d"
  expected="-a -b -c -d"
  actual=$(split_args "$arguments")
  assertEquals "$expected" "$actual"
}

testSplitArgsWithTabulation(){
  arguments=$'-ab \t-c -d'
  expected="-a -b -c -d"
  actual=$(split_args "$arguments")
  assertEquals "$expected" "$actual"
}

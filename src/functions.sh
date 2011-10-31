#!/bin/bash

## The default exit code for exit_with
declare BASHUTILS_DEFAULT_EXIT_CODE=0
declare BASHUTILS_COMPACT_DEPENDENCIES=false
declare -a BASHUTILS_DEPENDENCIES

## Source a given file if not sourced before,
## else, skip this import
## $1: The file to source
import(){
  [[ $# == 1 ]] || exit_with 'import expect 1 argument'
  
  local dep
  for dep in ${BASHUTILS_DEPENDENCIES[@]}; do
    [ "$dep" == "$1" ] && return
  done
  
  local p=${#BASHUTILS_DEPENDENCIES[@]}
  BASHUTILS_DEPENDENCIES[$p]="$1"
  source "$1"
}


## Print a message and exit or return the given status code
## if in debug mode
## $1: The message to print
## $2: The exit code
exit_with(){
  if [[ $# == 0 ]]; then echo "$FUNCNAME expect at least 1 argument"; exit 1; fi
  if [[ $# > 2 ]]; then echo "$FUNCNAME expect no more than 2 arguments"; exit 1; fi
  
  echo "$1"

  local exit_code=${2:-0}
  if $BASHUTILS_DEBUG; then
    return $exit_code
  else
    exit $exit_code
  fi
}


## Parse the given set of command line arguments
## and return a formated version
## $@ The command line arguments to process
split_args() {
  local arg
  local result=''
  for arg in $@; do
    if [[ "$arg" =~ ^-[a-z] ]]; then
      shift
      local split_args="$(echo $arg | sed 's/^-//' | sed 's@\([a-z]\)@-\1 @g')"
      result="$result $split_args"
    else
      result="$result $arg"
    fi
  done
  echo $result
}

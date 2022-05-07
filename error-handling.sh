#!/bin/bash

# set usage set arguments
# set --help 

# catch errors and exit
set -eE -o functrace

# print trace exception handling
# set -E -o functrace

failure() {
	  local lineno=$1
	  local msg=$2
	  echo "Failed at $lineno: $msg"
}
trap 'failure ${LINENO} "$BASH_COMMAND"' ERR

# --------------------------

cp not-existing-file /to/not/existing/place

#!/bin/bash

# catch errors
set -eE -o functrace

failure() {
	  local lineno=$1
	  local msg=$2
	  echo "Failed at $lineno: $msg"
}
trap 'failure ${LINENO} "$BASH_COMMAND"' ERR

# --------------------------

cp not-existing-file /to/not/existing/place

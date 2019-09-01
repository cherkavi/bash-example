#!/bin/bash
step_1=""
if [[ $step_1 == "" ]]; then
    echo $step_1
fi

if ! ls ~/notexistingfolder; then
    echo "folder is not existing ~/notexistingfolder"
fi

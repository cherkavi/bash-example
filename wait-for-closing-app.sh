#!/bin/bash
get_process_id () {
	pgrep $1
}

process_id=$(get_process_id "gedit")
# if [ -n "$process_id" ]
while [ "$process_id" != "" ]; do
	sleep 1
	process_id=$(get_process_id "gedit")
done


#!/bin/bash

servers=( 
gtx{0..3}-ev.zur
gtx4-ev.zur
)

for each_node in "${servers[@]}" ; do
    echo "$each_node"
done

# the same but shorter
# for each_node in gtx{0..4}-ev.zur ; do

for each_string in "one" "two" "three"
do
   echo $each_string
done

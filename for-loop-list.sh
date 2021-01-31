#!/bin/bash

servers=( 
gtx{0..3}-ev.zur
gtx4-ev.zur
)

for each_node in "${servers[@]}" ; do
    echo "$each_node"
done

# one line print ( no semicolon after "do" )
printf 'one\n two\n three\n' | while read each_value;do echo $each_value;done

# the same but shorter
# for each_node in gtx{0..4}-ev.zur ; do

for each_string in "one" "two" "three"
do
   echo $each_string
done

my_list=("one" "two" "three")
for each_string in ${my_list[@]}; do
   echo $each_string
done



# example of walking through list of environment variables, variable of variable, variable by name
for each_val in "MYSQL_ROOT_PASSWORD" "MYSQL_USER" "MYSQL_PASSWORD"
do
    # declare "current_variable=$each_val"
    # if [ -z ${!current_variable} ]; then
    if [ -z $each_val ]
        echo "file .env should contains $each_val"
        exit 1
    fi
done

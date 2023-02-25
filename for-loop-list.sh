#!/bin/bash

servers=( 
gtx{0..3}-ev.zur
gtx4-ev.zur
)

for each_node in "${servers[@]}" ; do
    echo "$each_node"
done

BRANDS_LIST=($(ls *.brands_s3))
BRANDS_LIST=("one.brands_s3" "two.brands_s3" "three.brands_s3")
for each_value in "${BRANDS_LIST[@]}"; do    
    echo $each_value
done

# one line print ( no semicolon after "do" ), inline while
printf 'one\n two\n three\n' | while read each_value;do echo $each_value;done
find . -name "*.json" | while read each_file; do cat "$each_file" > "${each_file}".txt; done

# the same but shorter
# for each_node in gtx{0..4}-ev.zur ; do

# loop through values with spaces
IFS=$'\n' # it is necessary for non-manual input, for new line for loop line
# !!! warning !!! for file reading must be new line at the end 
for each_string in "one" "two" "three four five"
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

#!/bin/bash
# read first file, split it for chunks, join to another file ( also split for chunks) by numbers of chunks
if [ ! -n "$4" ]
then
  echo "input arguments are: {main file} {number of column in main file} {join file} {number of column to join to}"
  exit 1
fi

main_file=$1
main_file_delimiter=$2
main_file_field_number=$3
join_file=$4
join_file_delimiter=$5
join_file_field_number=$6

cat $main_file | while read each_line
do
    # bash variable in awk, awk external variable
    hash_code=`echo $each_line | awk -v FS="$main_file_delimiter" '{print($'$main_file_field_number')}' | tr -d '\r' | tr -d '\a'`
    password=`cat $join_file | grep $hash_code | awk -v FS="$join_file_delimiter" '{print($'$join_file_field_number')}'`
    
    clear_line=`echo $each_line | tr -d '\r' | tr -d '\a' `
    echo $clear_line", "$password
done

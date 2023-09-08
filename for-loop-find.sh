#!/bin/bash
# print text from all files, search through all have found files
find /home/projects/py-adp -name "Dockerfile" | while read each_file
do
   printf "\n----------"$each_file"------------\n"
   cat $each_file
done

# execute script against file list
cat list-of-files.txt | while read each_file
do
   result=`python2 check_files_for_osi.py $each_file`
   echo $each_file"  "$result
done

# loop/for through all files in folder with possible special symbols like space
find . -type f -print0 | while IFS= read -r -d '' file; do    
    prefix="./"
    file_name=${file#$prefix}
    echo "Processing file: $file_name"    
done


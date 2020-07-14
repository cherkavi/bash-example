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

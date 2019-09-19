#!/bin/bash
# print text from all files, search through all have found files
find /home/projects/py-adp -name "Dockerfile" | while read each_file
do
   printf "\n----------"$each_file"------------\n"
   cat $each_file
done

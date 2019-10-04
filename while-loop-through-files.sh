ls *.sh | while read each_file
do
    ls -la $each_file | awk  '{print " "$5" - "$9}' >> file-sizes.txt
done

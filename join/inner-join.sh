# compare two files for equals strings
# print equals lines
# inner join for two files
# for not exists take a look to: https://github.com/cherkavi/python-utilities/blob/master/console/unique-file-lines.py

# one line bash approach: grep -F -f file1 file2
file1=$1
file2=$2
cat $file2 | while read line; do
    grep "^${line}$" $file1
done

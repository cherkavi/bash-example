# compare two files for equals strings
# inner join for two files

# one line bash approach: grep -F -f file1 file2
file1=$1
file2=$2
cat $file2 | while read line; do
    grep $line $file1 
done

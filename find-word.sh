# find words in string line with words
cat file_name | grep -wE "string1|string2|...."

cat file_name | awk '/string1/ && /string2/'

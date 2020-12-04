# print last element, print before last element
echo "/path/to/some/file" | awk -F '/' '{print $(NF-1)"/"$NF}'

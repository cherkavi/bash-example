# read file with two diff approaches
printf "hello\nthis\nis\nempty\n\n\n" > 1.txt

file_path=1.txt
for each_line in `cat $file_path`; do
   # processing
   echo $each_line
done 
echo "----------"

# will print empty lines 
while IFS= read -r line; do
    # processing
    echo "$line"
done < "$file_path"
echo "----------"

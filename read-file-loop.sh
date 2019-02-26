# print only files that ends with "completed" 
# or start with: "completed*", but double quotas should not be used with comparation
# print files by mask
cat peptides.txt | while read line
do
    if [[ $each_file == *completed ]]; then
        echo $each_file
    fi
done

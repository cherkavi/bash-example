# skip all except first two 

mkdir test-list-of-files
cd test-list-of-files

for (( i=1; i<10; i++ )); do
    touch $i
done 
ls -r  | sed -n '2,$p' | xargs rm 
ls
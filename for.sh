END=5
counter=0
for (( i=1; i<=END; i++ )); do
    echo $i
    # increase 
    (( counter++ ))
done
echo $counter


# example for loop over file list

hdfs dfs -ls /some/hdfs/folder | awk '{print $8}' | while read each_folder
do
    if [[ $each_folder != "" ]]; then
        echo $each_folder
        hdfs dfs -ls $each_folder/*/*/*/*/*/* 
    fi   
done

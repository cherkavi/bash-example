ls *.csv | while read each_file; 
do
    cat $each_file | awk -F '/' '{print "/"$6"/"$7"/"$8"/"$9}' >> temp_sessions.txt
done

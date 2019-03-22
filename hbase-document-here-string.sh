# execute hbase with 'here document'
result=`hbase shell << END_MARKER
get "component-state","$1","meta:Ingest"
exit
END_MARKER`

# read data from line of text
echo $result | while read line;do
    # split up line of text to words
    for each_word in $line; do      
        # substring of string, compare string
        if [[ ${each_word:0:5} == value ]]; then
            # substring, remove last characters 
            # ${each_file::-4}
            if [[ ${each_word:6} == Success ]]; then
                echo "done"
                exit(0)
            else
                echo "not done"
                exit(1)
            fi
        fi
    done
done

ls | while read line
do
        if [ $line == 'drill' ]
        then
                echo "drill"
                break
        fi
        echo $line
done    

# if you have loop with long running operation, than you can do next trick:
# scp -r user@host.org/path/to/file || break
# ctrl-c will lead to break the look

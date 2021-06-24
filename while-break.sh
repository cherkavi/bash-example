# if you have loop with long running operation, than you can do next trick:
# scp -r user@host.org/path/to/file || break
# ctrl-c will lead to break the look
echo "press control-c"
ls | while read line
do
        echo "$line"
        sleep 3 || break
done    


# change variable outside while
last_line=""
while read line
do
        if [ $line == 'function.sh' ]
        then
                echo "function.sh"
                break
        fi
        last_line=$line
done  < <( ls )
echo "changed line >> "$last_line


# infinite loop
while true; do echo "hello"; done

function evaluation() {
        if [ $1 -ge 5 ]
        then
                eval $2
                if [[ $? -eq 0 ]]
                then
                        echo "ok"
                else
                        echo "wrong command"
                fi
        else
                echo "not"
        fi
}

echo $command

a=10
# command='cat 1.txt'
# not working: evaluation $a $command
evaluation $a 'cat 1.txt' 

# execute one line of text or commands from file
echo "ls -la" | xargs -L 1 -I {} sh -c "{}"


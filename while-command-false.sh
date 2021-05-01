# execute until positive result from command
command_delay=1

function custom_command(){
    # command for execution 
    lddds -la
    return $?
}

custom_command
result=$?

while [[ $result >0 ]]
do
    echo "delay before next attempt ";sleep $command_delay
    
    custom_command
    result=$?
done


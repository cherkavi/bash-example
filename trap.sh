# list of all signals
trap -l

# set trap 
trap 'echo -e "Ctrl-C was detected"' SIGINT
echo "press Ctrl-C whenever you want"

# check trap 
trap -p SIGINT

# process traps
trap 'echo -e "SIGQUIT";exit' SIGQUIT
trap 'echo -e "SIGTERM";exit' SIGTERM

# send signal to process
kill -SIGQUIT $PROCESS_NUMBER
kill -SIGUSR1 $PROCESS_NUMBER


# try catch finally 
function finally(){
    echo "finally I need to clean up all temp files"
    exit
}

trap finally SIGINT SIGQUIT SIGTERM
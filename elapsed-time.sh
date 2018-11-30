# built-in variable SECONDS
SECONDS=0
sleep 2
printf "elapsed seconds: %d \n" $SECONDS


# example of calculation inside script

intermediate_time=$SECONDS
sleep 1  # Process to execute
elapsedseconds=$(( SECONDS - intermediate_time ))

printf "last measurement: %s \n" $elapsedseconds

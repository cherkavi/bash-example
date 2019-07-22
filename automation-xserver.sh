# manage keyboard inside gui application
# apt-get install xdotool

# search window by name and activate it
xdotool search --name "Archi" | tail --line 1 | while read each_window
do
 # example: xdotool windowactivate $each_window 
 # example: xdotool key --window $each_window ctrl+O
 # activate window
 xdotool windowactivate $each_window 
 # send key do window
 xdotool key --window $each_window End 
 xdotool key --window $each_window Return alt+f e Down Down Return
 xdotool key --window $each_window Tab Tab Down Down Down Down Return
done 

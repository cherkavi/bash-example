# move mouse
# type keyboard, press key, send message to window
# sudo apt install xdtool

xdotool search --name "Archi" | tail --line 1 | while read each_window;
do
    xdotool mousemove --window $each_window 50 150 click 1
    xdotool mousedown 1;xdotool mouseup 1
    xdotool key --window $each_window Right End Right End Return
    xdotool key --window $each_window Return alt+f e Down Down Return
    xdotool key --window $each_window Return
    sleep 2
    xdotool key --window $each_window alt+f x 
done


ACTIVE_WINDOW_ID=`xdotool getactivewindow`
ACTIVE_WINDOW_GEOMETRY=`xdotool getwindowgeometry $ACTIVE_WINDOW_ID`
echo $ACTIVE_WINDOW_GEOMETRY | awk -F "[ ,x]" '{print $4"+"$9" "$5"+"$10}'
# inline calculation, ariphmetic operations
MOUSE_MOVE_X=$( echo $ACTIVE_WINDOW_GEOMETRY | awk -F "[ ,x]" '{print ""$4"+"$9"/2"}' | bc )
MOUSE_MOVE_Y=$( echo $ACTIVE_WINDOW_GEOMETRY | awk -F "[ ,x]" '{print ""$5"+"$10"/2"}' | bc )
xdotool mousemove $MOUSE_MOVE_X $MOUSE_MOVE_Y

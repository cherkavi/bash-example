ACTIVE_WINDOW_ID=`xdotool getactivewindow`
ACTIVE_WINDOW_GEOMETRY=`xdotool getwindowgeometry $ACTIVE_WINDOW_ID`

# using many delimiters, mutli-delimiter, multi separator with AWK - between square brackets
echo $ACTIVE_WINDOW_GEOMETRY | awk -F "[ \,x]" '{print $4"  "$5}'

# shrink lines
# remove suffix
printf "1 \n 2 \n 3 \n 4 \n" | awk '{print $1}' ORS=',' | sed 's/,$//g'

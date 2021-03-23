# multiply conditions, random word position
cat out.txt | awk '/10/ && /version/'
cat out.txt | awk '/10/ && /version/ {print $2}'

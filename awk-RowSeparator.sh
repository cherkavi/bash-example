awk 'BEGIN{FS=","; RS=" ";ORS="\n <=> \n"}{print $1,$2}' column-rowdata-space.txt

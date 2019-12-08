awk 'BEGIN{FS=",";OFS=" <=> "}{print $1,$2}' column-data-comma.txt

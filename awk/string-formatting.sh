# string output formatting
# left and right string alignment
echo "USER_SUPERSET_USER=data_set-s" | awk -F "=" '{printf "%-35s %-25s \n", $1,$2; }' 

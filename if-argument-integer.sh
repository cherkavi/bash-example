result_code=0
if [ $result_code == 0 ]
then
  echo "$result_code - ok "
else
  echo "error"
fi    

# one line condition with multiple operators
[[ $result_code == 0 ]] && echo "$result_code - ok "   ||   ( echo "error"; echo "can't continue, should quit" )


value=2521adsb
# compare with regexp 
if [[ $value =~ ^[0-9]+[a-z]+ ]]; then
	echo "value is digits with alfa"
else 
	echo "value is unknown"
fi


# ---------------- integer numbers to compare --------------
e=1694088210
d=1694088210
s=$(( 20 * 24 * 60 * 60 ))
limit=$(( $d - $d - $s ))
echo $limit

# !round! parentheses
if (( $limit < 0 )); then
    echo "!!! $each_project: need to refresh"
else
    echo "... $each_project: still valid"
fi

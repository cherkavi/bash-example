result_code=0
if [ $result_code == 0 ]
then
  echo "$result_code - ok "
else
  echo "error"
fi    


value=2521adsb
# compare with regexp 
if [[ $value =~ ^[0-9]+[a-z]+ ]]; then
	echo "value is digits with alfa"
else 
	echo "value is unknown"
fi

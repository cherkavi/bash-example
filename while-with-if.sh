ls | while read line
do
	if [ $line == 'drill' ]
	then
		echo "drill"
		break
	fi
	echo $line
done

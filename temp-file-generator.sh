# create temp file generate temporary file
mktemp
# --------------
file_name="~temp_file_"`python -c "import random;print(random.randint(100000,999999))"`".txt"
file_name=`cat /dev/urandom | tr -cd 'a-f0-9' | head -c 32`
# echo $file_name

# ls -lat 
# ls -latr
# hdfs dfs -ls | sort -k6,7

threshold=5
index=0
for each_file in `ls -tr`
do
	((index++))
	# compare variables, numeric conditions
	# if ((index > threshold))
	if [ "$index" -gt "$threshold" ]
	then
		echo "> "$each_file
	else
		echo $each_file
	fi
done

# check return value 
if [[ 1 -eq "$?" ]]; then echo "error"; else echo "done"; fi

# check existence for input parameter #2 
# if [ ! -n "$2" ]
if [ -z "$2" ]
then
  echo "two input parameters are expected: digit and string "
  exit 1
fi  

param_1=$1
param_2=$2

echo $param_1
echo $param_2

# check input parameters to be in ranges
if [[ $param_1 -gt 0 && $param_1 -lt 25 ]] 
then
  echo "first argument is positive 0..25"
elif [ $param_1 -ge 25 ] && [ $param_1 -lt 100 ]
then 
  echo "first argument is positive and Greater Than 25"
else
  echo "negative"
fi

echo "---"
# arifmetic operations
param_1_3=$(( $param_1 + $param_1 + $param_1 ))
echo "summarize: "$param_1_3
echo " multiply: "$(( $param_1 * $param_1 * $param_1 ))
echo "   divide: "$(( $param_1 * $param_1 * $param_1 / 2 ))
echo "      mod: "$(( $param_1 * $param_1 * $param_1 % 2 ))

echo "---"
# length of the string
param_2_len=`echo $param_2 | awk '{print length($0)}'`
echo "param_2 lenght is: "$param_2_len

counter=13
while [ $counter -ge 0 ]
do
  counter=$(( counter-1 ))
  printf ".%d" $counter
done

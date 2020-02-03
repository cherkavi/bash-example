echo "# summarize input arguments"
sum=0
for each in "$@"
do
   sum=$(( each + sum))
done
echo $sum

args=("$@")
echo "# print all arguments with positions"
for (( index=0; index<$#; index++ ))
do
   echo $index"  "${args[@]:${index}:${index+1}}
done

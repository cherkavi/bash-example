sum=0
for each in "$@"
do
   sum=$(( each + sum))
done
echo $sum

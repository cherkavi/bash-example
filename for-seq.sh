range=10

for i in $(seq 1 $range)
do
   echo $i
done


for ((x=0; x<$range; x++ ))
do
	echo $x
done

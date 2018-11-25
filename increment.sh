var=$((var+1))
((var=var+1))
((var+=1))
((var++))
echo $var

let "var=var+1"
let "var+=1"
let "var++"
echo $var

declare -i var2
var2=var+1
var2+=1
((var2++))
echo $var2
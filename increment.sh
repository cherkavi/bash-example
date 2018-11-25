var=$((var+1))
((var=var+1))
((var+=1))
((var++))
echo $var

let "var=var+1"
let "var+=1"
let "var++"
echo $var
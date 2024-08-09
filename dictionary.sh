# map dict dictionary 
unset values
#  to make NAMEs associative arrays
declare -A values 
values['one']="first value"
values['two']="second value"

echo ${values}
echo ${values["one"]}
echo ${values["two"]}
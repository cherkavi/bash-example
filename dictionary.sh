# map dict dictionary 
unset values
#  to make NAMEs associative arrays
declare -A values 
 values['one']="first value"
    values['two']="second value"
# No Quotes Around Keys: When assigning values to associative arrays in bash, do not use quotes around the keys 
# values[one]="first value"

echo ${values}
echo ${values["one"]}
echo ${values["two"]}
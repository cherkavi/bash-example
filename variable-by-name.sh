## ------ simple variable -------
# variable of variable
var_name="my_variable"

# my_variable=10
eval "$var_name=10"

# print it 
echo "${!var_name}"
eval "echo \$$var_name"



## ------ array variable  -------
var_name="my_array"
eval "$var_name+=(1)"
eval "$var_name+=(2)"
eval "$var_name+=(3)"

# print array
eval "echo \${$var_name[@]}"

# walk through array
# array by name
eval "output_array=(\${$var_name[@]})"
echo "result length: ${#output_array[@]}"
for each_value_in_array in "${output_array[@]}"; do    
    echo $each_value_in_array
    echo ">>>"
done


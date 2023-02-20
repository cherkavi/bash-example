# Declare a string array
arrVar=("AC" "TV" "Mobile" "Fridge" "Oven" "Blender")

# Add new element at the end of the array
arrVar+=("Dish Washer")
echo ${arrVar[@]}

# split string to array
my_string="Ubuntu;Linux Mint;Debian;Arch;Fedora"  
my_array=($(echo $my_string | tr ";" "\n"))
echo ${my_array[@]}":  "${my_array[0]}", "${my_array[1]}

# Iterate the loop to read and print each array element
for value in "${arrVar[@]}"; do
    echo $value
done

# is element in array 
# 1 - candidate
# 2 - array of elements 
function is_in_array () {
  local next_array_element search_string="$1"
  shift
  for next_array_element; do [[ "${next_array_element}" == "${search_string}" ]] && return 0; done
  return 1
}


is_in_array "Mobile" "${arrVar[@]}"

# is_in_array_result="$?"
# if [[ 1 == "$is_in_array_result" ]]; then
if [[ `is_in_array "Mobile" "${arrVar[@]}"` > 0 ]]; then 
    echo " not in "
else
    echo "Mobile"" in array"
fi



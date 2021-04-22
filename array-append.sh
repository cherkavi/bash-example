# Declare a string array
arrVar=("AC" "TV" "Mobile" "Fridge" "Oven" "Blender")

# Add new element at the end of the array
arrVar+=("Dish Washer")
echo ${arrVar[@]}

# Iterate the loop to read and print each array element
for value in "${arrVar[@]}"; do
    echo $value
done

# in array 
function is_in_array () {
  local e match="$1"
  shift
  for e; do [[ "$e" == "$match" ]] && return 0; done
  return 1
}


is_in_array "Mobile" "${arrVar[@]}"
is_in_array_result="$?"
if [[ 1 == "$is_in_array_result" ]]; then
    echo " not in "
else
    echo "Mobile"" in array"
fi


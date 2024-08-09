myvar="string1,string2,string3"

# change comma to whitespace
myarray=(`echo $myvar | tr ',' ' '`)
# alternative way
IFS="," read -a myarray <<< $myvar

# for space delimiter like "string1 string2 string3"
# read -a myarray <<< $myvar

echo "My array: ${myarray[@]}
for each in ${myarray[@]}; do
  echo $each
done


# alternative way of creating array from output of command
elements_declared=($(ls | grep -v "str" | sort))
echo ${elements_declared[@]}

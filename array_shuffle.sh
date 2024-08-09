original_array=(1 2 3 4)
receivers=(1 2 3 4)
reshuffle_array=( $(shuf -e "${original_array[@]}") )

# output_file=`mktemp`
# echo "" > $output_file

for each_element in ${reshuffle_array[@]}; do    
    while true; do
        receivers=( $(shuf -e "${receivers[@]}") )
        if [ ${receivers[0]} != $each_element ]; then
            break
        else
            # echo "${receivers[0]} ... $each_element"
            # echo "${receivers[@]}"
            if [[ 1 == ${#output_array[@]} ]]; then
                break;
            fi
        fi
    done
    echo "$each_element : ${receivers[0]}"  # >> $output_file
    receivers=( ${receivers[@]:1:${#receivers[@]}} )
done
# cat $output_file

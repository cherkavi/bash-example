echo $RANDOM
echo "-----------"
echo $((1 + RANDOM % 10))


echo "randomly change list, suffle list" 
function team-random-list(){
    original_array=( Mar Vit Mak Fra Dul And )
    reshuffle_array=( $(shuf -e "${original_array[@]}") )
    counter=0
    for each_element in ${reshuffle_array[@]}; do
        ((counter++))
        echo "$counter. $each_element"
    done 
}

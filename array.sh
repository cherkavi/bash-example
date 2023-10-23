array=(0 1 2 3 4 5 6 7 8 9 0 a b c d e f g h)
echo ${array[@]:7}
# 7 8 9 0 a b c d e f g h

echo ${array[@]:7:2}
# 7 8


# array in multiple lines
declare -a list_of_users=( user1
user2
user4
user5 )
for each_user in ${list_of_users[@]}; do
    echo $each_user
done


# in array, reverse tail, tail reverse, reverse head, head reverse
    black_list=($(ls . | grep "my_file_prefix" | sort | tail -5))
    for each_report in `ls . | grep "my_file_prefix"`; do
       #     ! - or without "not" 
       if [[ ! " ${black_list[*]} " =~ " ${each_report} " ]]; then
           echo ">>> $each_report"
       fi        
    done 

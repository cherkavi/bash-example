function line(){
    result=""
    for ((each=0; each<$1; each++)); do
        result=$result$2
    done
    cat <<EOF
$result
EOF
}

function wait_in_seconds(){
    for ((rest=$1; rest>0; rest--)); do
      left=`line $rest X`
      right=`line $(($1 - $rest)) _`
      echo -ne "$left$right\033[0K\r"
      # echo -ne "$rest sec\033[0K\r"
      sleep 1
    done
}

while true;
do
    printf "========================================\n"
    for each_file in `ls *.2fa`;
    do
        source $each_file
        echo $NAME
        echo $(oathtool -b --totp "$CODE")
        echo "-------------"
    done
    wait_in_seconds 30
done

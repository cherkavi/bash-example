confirmation() {
    echo -n "Are you sure (y/n)? "
    while read -r -n 1 -s answer; do
        if [[ $answer = [YyNn] ]]; then
            [[ $answer = [Yy] ]] && result=0
            [[ $answer = [Nn] ]] && result=1
            break
        fi
    done
    return $result
}

confirmation
if [ $? -eq 0 ]; then
    echo "yes"
else
    echo "no"
fi
confirmation() {
    echo -n "Are you sure (y/n)? "
    while read -r -n 1 -s answer; do
        if [[ $answer = [YyNn] ]]; then
            [[ $answer = [Yy] ]] && result=1
            [[ $answer = [Nn] ]] && result=0
            break
        fi
    done
    return $result
}

confirmation
echo $?
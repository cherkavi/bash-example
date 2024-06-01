a="hello world"
echo ${a:5}
# world

echo ${a:5:6}
# world

echo $(expr substr "$a" 7 5)
# world

# substring 
a="abcd"
echo ${a:0:-1}
# abc

echo ${a:1:-1}
# bc

echo ${a:1}
# bcd


#############################
function is_substring() {
  local string_part="${1,,}"  # Convert to lowercase
  local string_big="${2,,}"  # Convert to lowercase
  [[ "$string_big" =~ "$string_part" ]]
  return $?
}

    black_listed=false
    for word in "${black_list[@]}"; do
        if is_substring "$word" "$each_line"; then
            black_listed=true
            break
        fi
    done

    # compare boolean value true/false
    if ! $black_listed; then
        echo $each_line
    fi


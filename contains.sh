list_of_elements="111 222 333 444 555"
[[ $list_of_elements =~ (^|[[:space:]])$1($|[[:space:]]) ]] && echo "0" || echo "1"


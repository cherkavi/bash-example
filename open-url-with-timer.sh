function timer-open-url(){
    if [[ $# != 2 ]]; then
        echo "Open url after time (min), arguments: "
        echo "  1. url for opening "
        echo "  2. amount of minutes"
        return 1
    fi

    bash -c "sleep $(( $2 * 60 )); x-www-browser $1 " &
}
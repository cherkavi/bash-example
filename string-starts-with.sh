# check if string starts with "https"
case $GIT_URL in
    https*) ;;
    *) GIT_URL="https://"$( echo $GIT_URL | cut -d '@'  -f 2 | tr ':' '/'); symbol="."; GIT_URL=${GIT_URL%$symbol*};
esac

echo $GET_URL


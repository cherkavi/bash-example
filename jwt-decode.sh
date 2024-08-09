# decode jwt token 
function jwt_decode() {
    if [ -z $1 ]; then
        token=$KEYCLOAK_TOKEN
    else 
        token=$1
    fi
    my_array=($(echo $token | tr "." "\n"))
    echo ${my_array[1]} | base64 --decode | jq .

    echo "expiration time: "`echo ${my_array[1]} | base64 --decode 2>/dev/null | jq . | grep exp | awk -F ':' '{print $2}' | tr ',' ' ' | xargs -I {} date -d @{} '+%Y-%m-%d %H:%M:%S'`
}

# decode jwt token 
function jwt_decode() {
    if [ -z $1 ]; then
        token=$KEYCLOAK_TOKEN
    fi
    my_array=($(echo $token | tr "." "\n"))
    echo ${my_array[1]} | base64 --decode | jq .
}

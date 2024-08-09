## ------ simple variable -------
# variable by name, get value from name of variable, variable of variable
var_name="my_variable"

# assign variable by name
eval "$var_name=10"
ssh_user=$(eval "echo \$$user_name")    
ssh_user=${!user_name}

# print variable by name
echo "${!var_name}"
eval "echo \$$var_name"

## ------ array variable  -------
var_name="my_array"
eval "$var_name+=(1)"
eval "$var_name+=(2)"
eval "$var_name+=(3)"

# print array
eval "echo \${$var_name[@]}"

# walk through array
# array by name
eval "output_array=(\${$var_name[@]})"
echo "result length: ${#output_array[@]}"
for each_value_in_array in "${output_array[@]}"; do    
    echo $each_value_in_array
    echo ">>>"
done


# -----------------
# autocomplete example 
# USER_LOAD2DESCR_PASSWORD
# USER_DATA_CHECK_PASSWORD
function dxc-users-password(){
    PARAMETER=$1
    if [ -z $PARAMETER ]; then
        echo "first argument should be an unique part of the user name like 'data_check'"
        return 1;
    fi
    amount_of_options=$(env | grep -e "_PASS=" -e "_PASSWORD=" | grep -i $PARAMETER | wc -l)
    if [[ $amount_of_options > 1 ]]; then
        echo "pls, specify name of the user more preciselly: $amount_of_options"
        echo `env | grep "_PASS=" | grep $PARAMETER`
        return 2
    fi
    env_variable=`env | grep -e "_PASS=" -e "_PASSWORD=" | grep -i $PARAMETER | awk -F '=' '{print $1}'`
    env_value=`echo ${!env_variable}`
    echo $env_value | clipboard
    # echo $(eval "echo \$$env_variable")  | clipboard
}

function _dxc-users-password(){
    if [[ ${COMP_CWORD} == 1 ]]; then            
            COMPREPLY=`env | grep "USER_" | grep -e "_PASSWORD"| awk -F "=" '{print $1 }' `
        return
    fi
}
complete -F _dxc-users-password dxc-users-password

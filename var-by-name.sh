# variable by name
# var by name
# param by name

KIOSK_ACCOUNT_NAME=hello

each_parameter=KIOSK_ACCOUNT_NAME
parameter_value=$(eval "echo \$$each_parameter")
echo $parameter_value

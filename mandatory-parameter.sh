list_of_variables="KIOSK_ACCOUNT_NAME ACCOUNT_ID COLLECTIONS_UPSERT DATAAPI_API_KEY DATAAPI_ACCOUNT_ID DATAAPI_CONTEXT DATAAPI_CONTEXT_ID SHOPIFY_SHOP_NAME SHOPIFY_AUTH_TOKEN"
read -a mandatory_parametes <<< $list_of_variables
for each_parameter in ${mandatory_parametes[@]}; do    
    parameter_value=$(eval "echo \$$each_parameter")
    if [ -z "$parameter_value" ]
    then
        echo "$each_parameter is empty"
        exit 1
    fi
done


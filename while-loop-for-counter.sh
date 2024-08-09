#!/bin/bash
# arifmetic
LIMIT=1
SKIP=0
amount_of_records=`curl -X GET -v --header "x-api-key:"$DATAAPI_API_KEY "$DATAAPI_BASE_URL/products?_account=$DATAAPI_ACCOUNT_ID&limit=$LIMIT&skip=$SKIP&context=$DATAAPI_CONTEXT&contextId=$DATAAPI_CONTEXT_ID" 2>&1 | grep "x-total-count" | awk '{print($3)}' `
amount_of_records=`echo $amount_of_records | tr -d '\r'`
while [ $amount_of_records -gt 0 ];
do
    echo $amount_of_records
    let amount_of_records=$amount_of_records-500
done


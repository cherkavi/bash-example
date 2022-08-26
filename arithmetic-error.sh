# ")syntax error: invalid arithmetic operator (error token is "
# you should remove trailing \r 

amount_of_records=`echo "$amount_of_records" | tr -d '\r'`
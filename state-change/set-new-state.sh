new_mode=$1


file_with_status='.status'


function_mode1(){
	echo "mode1 activated"
}

function_mode2(){
	echo "mode2 activated"
}

function_mode3(){
	echo "mode3 activated"
}


current_mode=`cat $file_with_status 2>/dev/null`

# activate current mode 
if [[ -z $new_mode ]]; then
	current_mode="function_"`cat $file_with_status 2>/dev/null`
	$current_mode
	exit 0
fi

# check for empty
if [[ $current_mode == $new_mode ]]; then
	echo "skip, currently applied"
	exit 0
fi

# activate new mode
function_for_execution=`echo "function_$new_mode"`
# try-catch 
{ # try
	$function_for_execution
} || { # catch
	echo "no function for $new_mode"
}
echo $new_mode > $file_with_status

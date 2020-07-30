print_title(){
	echo "my own title"
}

print_title
echo `print_title`
echo $(print_title)

# --------
# function should return Integers only, checking return value via $?
print_invitation(){
	echo "this is invitation for $1"
	# you can return only digits
	return 5
}

print_invitation 'John'
echo $?

# --------
# function can 'return' string
generate_body() {
cat <<EOF
   "string from function"
EOF
}

echo ">>>> $(generate_body)"


# ---------
# function set argument by name
set_argument_by_name(){
	eval "$1='value from function'"
}

set_argument_by_name my_variable
echo $my_variable


# ----------
# function set return value to global variable
set_global_var(){
	return_value="value from function 'set_global_var'"
}
set_global_var
echo $return_value

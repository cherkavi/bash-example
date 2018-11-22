print_title(){
	echo "my own title"
}

print_title
echo `print_title`
echo $(print_title)

# --------
# function should return Integers only 
print_invitation(){
	echo "this is invitation for $1"
	return 5
}

print_invitation 'John'
echo $?

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
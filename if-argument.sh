
if [ "$1" == "--help" ]
then
  echo "Usage: `basename $0` [userpassword]"
  exit 1
else
  echo "dummy logic"
  exit 0
fi
# integer comparasion
# https://www.tldp.org/LDP/abs/html/comparison-ops.html



# check if non empty: -n
if [ -z "$1" ]
then
      echo "\$var is empty"
else
      echo "\$var is NOT empty"
fi


if test -z "$1" 
then
      echo "\$var is empty"
else
      echo "\$var is NOT empty"
fi


# [ -e filepath ] Returns true if file exists.
# [ -x filepath ] Returns true if file exists and executable.
# [ -S filepath ] Returns true if file exists and its a socket file.
# [ expr1 -a expr2 ] Returns true if both the expression is true.
# [ expr1 -o expr2 ] Returns true if either of the expression1 or 2 is true.


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


# if replacement one line checker
FILE=production.roles
PATTERN="developer"
grep $FIlE -e $PATTERN | wc -l | test $0 == 0


# check if non empty: -n
if [ -z "$1" ]
then
      echo "\$var is empty"
else
      echo "\$var is NOT empty"
fi

if [ -n "$1" ]
then
    echo "\$var is NOT empty"      
else
    echo "\$var is empty"
fi


# string regexp string filter
VAR1="hello Vasya"
if [[ "$VAR1" =~ ^hello.* ]]; then
    # condition without quotas
    echo "greeting: $VAR1"
fi


if test -z "$1" 
then
      echo "\$var is empty"
else
      echo "\$var is NOT empty"
fi

# ```help test```
# test ! -f $PATH_TO_FILE;echo $?
#
# [ -f filepath ] Returns true if file NOT exists and executable.
# [ ! -f filepath ] Returns true if file NOT exists.
# [ -e filepath ] Returns true if file exists and executable.
# [ -d filepath ] Returns true if path is directory.
# [ -x filepath ] Returns true if file exists and executable.
# [ -S filepath ] Returns true if file exists and its a socket file.
# [ expr1 && expr2 ] Returns true if both the expression is true.
# [ expr1 || expr2 ] Returns true if either of the expression1 or 2 is true.

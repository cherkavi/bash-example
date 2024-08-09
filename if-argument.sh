
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
# [ -f filepath ] True if the FILE exists and is a regular file (not a directory or device).
# [ ! -f filepath ] Returns true if file NOT exists.
# [ -b filepath ] True if the FILE exists and is a special block file.
# [ -c filepath ] True if the FILE exists and is a special character file.
# [ -d filepath ] True if the FILE exists and is a directory.
# [ -e filepath ] True if the FILE exists and is a file, regardless of type (node, directory, socket, etc.).
# [ -G filepath ] True if the FILE exists and has the same group as the user running the command.
# [ -h filepath ] True if the FILE exists and is a symbolic link.
# [ -g filepath ] True if the FILE exists and has set-group-id (sgid) flag set.
# [ -k filepath ] True if the FILE exists and has a sticky bit flag set.
# [ -L filepath ] True if the FILE exists and is a symbolic link.
# [ -O filepath ] True if the FILE exists and is owned by the user running the command.
# [ -p filepath ] True if the FILE exists and is a pipe.
# [ -r filepath ] True if the FILE exists and is readable.
# [ -S filepath ] True if the FILE exists and is a socket.
# [ -s filepath ] True if the FILE exists and has nonzero size.
# [ -u filepath ] True if the FILE exists, and set-user-id (suid) flag is set.
# [ -w filepath ] True if the FILE exists and is writable.
# [ -x filepath ] True if the FILE exists and is executable.
# [ expr1 && expr2 ] Returns true if both the expression is true.
# [ expr1 || expr2 ] Returns true if either of the expression1 or 2 is true.

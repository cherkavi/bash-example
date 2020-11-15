
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

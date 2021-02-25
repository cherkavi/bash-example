# check command output
## check taskwarior task numbers
# print if output is positive
[ $(task list | tail --lines=2 | grep tasks | awk '{print $1}') > 0 ] && echo "you have task(s)"
[ $(task list | tail --lines=2 | grep tasks | awk '{print $1}') == 0 ] && echo "you have no tasks"

# print if output is negative
[ $(task list | tail --lines=2 | grep tasks | awk '{print $1}') > 0 ] || echo "you have no tasks"

# checking for a part of the string
[[ $( uname ) =~ "inux" ]] && echo 'you are using linux'

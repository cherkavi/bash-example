# is it bash shell
shell_name=`echo $SHELL | awk -F '/' '{print $(NF)}'`
if [[ "$shell_name" -ne 'bash' ]]; then
    echo "not a bash: $shell_name"
fi

## analyse last executed command for having anchors at the beginning and if yes - re-execute without anchors
## post executor
function last_command_check_anchor(){
    ### jira 157558  # epic: jira 91962
    last_command=`history | tail -n 1 | head -n 1 | awk '{$1=""; print $0}'`
    if echo $last_command | grep -q "^##";  then
        echo "last command is possible anchor: $last_command"
        # echo "$last_command" | awk '{$1=""; print $0}'
        last_command=`echo "$last_command" | awk '{$1=""; print $0}'`
        $last_command
    fi
}
function activate-last-command-analyzer(){
    export PROMPT_COMMAND='last_command_check_anchor'
}



## analyse last executed command (interceptor) for having anchors at the beginning and if yes - re-execute without anchors
## post executor
# export PROMPT_COMMAND='starship_precmd'
function _last_command_check_anchor(){
    last_command=`history | tail -n 1 | head -n 1 | awk '{$1=""; print $0}' | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'`
    # if echo "$last_command" | grep -q -e "^ ##" -e "^ \*";  then
    if echo "$last_command" | grep -q -e "^##" -e "^\*" -e "^>" ;  then
        # echo "last command is possible anchor: $last_command"
        last_command=`echo "$last_command" | awk '{$1=""; print $0}'`
        # echo "will be executed: $last_command"
        $last_command
    # else
    #     echo "not a command:>${last_command}<"
    fi

    possible_ticket=`echo "$last_command" | awk '{print $1}'`
    if [[ $possible_ticket == INC* ]]; then
        itsm-search $possible_ticket
    fi

    if [[ $possible_ticket == REQ* ]]; then
        itsm-search $possible_ticket
    fi

    if [[ $possible_ticket == JIRAOO* ]]; then
        jira ${possible_ticket#JIRAOO-}
    fi

}
function activate-last-command-analyzer(){
    export PROMPT_COMMAND='_last_command_check_anchor'
}

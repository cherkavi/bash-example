## analyze last executed command with possible prefixes
## post executor
# export PROMPT_COMMAND='starship_precmd'
function _last_command_check_anchor(){

    ## variables 
    last_command=`history | tail -n 1 | head -n 1 | awk '{$1=""; print $0}' | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'`
    url=$(echo "$last_command" | grep -oE 'https?://[^ )]+' ); url="${url%%)}"
    possible_ticket=`echo "$last_command" | awk '{print $1}'`

    if [[ $debug != 0 ]]; then
        echo "--last_command   -->"$last_command
        echo "--            url-->"$url
        echo "--possible_ticket-->"$possible_ticket        
    fi


    ## https://
    if [[ -n "$url" ]]; then
        if [[ $debug != 0 ]]; then
            echo "open url: $url"
        fi
        open_url "$url"
        return 0
    fi

    ## JIRAPREFIX-
    if [[ "$last_command" =~ ^[[:space:]]*#*[[:space:]]*JIRAPREFIX ]]; then
        possible_ticket=$(echo $last_command | awk -F 'JIRAPREFIX' '{print $2}')

        if [[ $debug != 0 ]]; then
            echo "- JIRAPREFIX: $possible_ticket"
        fi

        jira ${possible_ticket#-}
        return 0
    fi

    if [[ "$last_command" =~ ^[[:space:]]*-[[:space:]]*JIRAPREFIX ]]; then
        possible_ticket=$(echo $last_command | awk -F 'JIRAPREFIX' '{print $2}')

        if [[ $debug != 0 ]]; then
            echo "- JIRAPREFIX: $possible_ticket"
        fi

        jira ${possible_ticket#-}
        return 0
    fi
    if [[ "$last_command" =~ ^[[:space:]]*\*[[:space:]]*JIRAPREFIX ]]; then
        possible_ticket=$(echo $last_command | awk -F 'JIRAPREFIX' '{print $2}')

        if [[ $debug != 0 ]]; then
            echo "* JIRAPREFIX: $possible_ticket"
        fi

        jira ${possible_ticket#-}
        return 0
    fi

    if [[ "$last_command" =~ ^[[:space:]]*JIRAPREFIX ]]; then
        possible_ticket=$(echo $last_command | awk -F 'JIRAPREFIX' '{print $2}')

        if [[ $debug != 0 ]]; then
            echo "  JIRAPREFIX: $possible_ticket"
        fi
        jira ${possible_ticket#-}
        return 0
    fi

    if [[ $possible_ticket =~ JIRAPREFIX* ]]; then
        jira ${possible_ticket#JIRAPREFIX-}
        if [[ $debug != 0 ]]; then
            echo "JIRAPREFIX: $possible_ticket"
        fi
        return 0
    fi

    ## INC    
    if [[ $possible_ticket == INC* ]]; then
        echo "command for INC......"
        return 0
    fi

    ## REQ
    if [[ $possible_ticket == REQ* ]]; then
        echo "command for REQ......"
        return 0
    fi


    ## no options - just run it     
    if echo "$last_command" | grep -q -e "^##" -e "^\*" -e "^>" ;  then
        [[ "$DEBUG" == "1" ]] && echo "last command is possible anchor: $last_command"
        last_command=`echo "$last_command" | awk '{$1=""; print $0}'`
        
        if [[ $debug != 0 ]]; then
            echo "will be executed: $last_command"
        fi
        $last_command
        return 0
    fi

    if echo "$last_command" | grep -q -e "^ *-"  ;  then        
        cleared_command=`echo "$last_command" | awk '{$1=""; print $0}' | sed -e 's/^[[:space:]]*//' `
        [[ "$DEBUG" == "1" ]] && echo "last command debug: $cleared_command"
        [[ $debug != 0 ]]; &&  echo "will be cleared and executed: $cleared_command"
        fi
        $cleared_command
        return 0
    fi

    if [[ $debug != 0 ]]; then
        echo "no options for execution"
    fi
    return 1
}
function activate-last-command-analyzer(){
    export PROMPT_COMMAND='_last_command_check_anchor'
}

alias analyzer-for-last-command=activate-last-command-analyzer

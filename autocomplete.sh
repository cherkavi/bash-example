function aws-project() {
	echo "your choice is: "$1
    echo "and maybe: "$2
}

# ------------------------------------------------
## autocomplete for function arguments highlighting
complete -W "one two three" aws-project
# try it with: aws-project<tab>

# ------------------------------------------------
## autocomplete with internal complete parameter
function _aws-project_completion(){
	COMPREPLY+=("option1"); 
    COMPREPLY+=("option2");
}
complete -F _aws-project_completion aws-project

# ------------------------------------------------
## autocomplete with function compgen
list_of_possible_arguments="localdev-python staging-python vitalii"
function _aws-project_completion(){
    COMPREPLY=($(compgen -W "$list_of_possible_arguments" "${COMP_WORDS[1]}"))
}
complete -F _aws-project_completion aws-project

# ------------------------------------------------
## autocomplete with additional tech information
list_of_possible_arguments="localdev-python staging-python vitalii"
function get_auto_complete(){
    # an array of all the words typed after the name of the program the compspec belongs to
    echo ">>> all words: "${COMP_WORDS}
    # an index of the COMP_WORDS array pointing to the word the current cursor is at—in other words, the index of the word the cursor was when the tab key was pressed
    echo ">>> index: " ${COMP_CWORD}
    # the current command line    
    echo ">>> command line:"${COMP_LINE}
    COMPREPLY=($(compgen -W "$list_of_possible_arguments" "${COMP_WORDS[1]}"))
}
complete -F get_auto_complete aws-project

# ------------------------------------------------
## autocomplete with two arguments
function _aws-project_completion(){
    if [[ ${COMP_CWORD} == 1 ]]; then
	    COMPREPLY+=("first"); 
        COMPREPLY+=("second");
        return
    fi
    if [[ ${COMP_CWORD} == 2 ]]; then 
	    COMPREPLY+=("option1"); 
        COMPREPLY+=("option2");
        return
    fi
}
complete -F _aws-project_completion aws-project

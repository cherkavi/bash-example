function activate_aws_profile(){
	# export AWS_DEFAULT_REGION="us-east-1"
	export AWS_REGION="us-east-1"	
	export AWS_PROFILE=$1
	export AWS_ACCESS_KEY_ID=`cat ~/.aws/credentials | grep -A 1 $1 | tail -n 1 | awk -F '=' '{print $2}'`
	export AWS_SECRET_ACCESS_KEY=`cat ~/.aws/credentials | grep -A 2 $1 | tail -n 1 | awk -F '=' '{print $2}'`
}

function aws-project(){
	list_of_profiles="localdev-python staging-python vitalii"
	if [ $# -lt 1 ]
	then
		echo "--- profile list ---"
		echo "$list_of_profiles"
		echo "--------------------"
		return
	fi
	[[ $list_of_profiles =~ (^|[[:space:]])$1($|[[:space:]]) ]] && activate_aws_profile "project-$1"
}

function _aws-project_completion(){
	# autocomplete
	# COMPREPLY+=("option1"); COMPREPLY+=("option2");
	COMPREPLY=($(compgen -W "localdev-python staging-python vitalii" "${COMP_WORDS[1]}"))
}
complete -F _aws-project_completion aws-project


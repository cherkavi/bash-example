# trim whitespace
branch_name=`git status | head | grep 'On branch' | awk -F 'On branch' '{print $2}' | xargs`
echo 'deploy branch: $branch_name'

# trim strip remove white spaces
trim_input_value=`echo $1 | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//' `    

# trim strip single quotas 
echo 'hello' | jq . 2>/dev/null

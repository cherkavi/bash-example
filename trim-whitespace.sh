# trim whitespace
branch_name=`git status | head | grep 'On branch' | awk -F 'On branch' '{print $2}' | xargs`
echo 'deploy branch: $branch_name'

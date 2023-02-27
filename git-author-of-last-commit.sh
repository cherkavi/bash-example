# print all branches with author of last commit 
function git-branch-with-author(){
    for each_branch in `git branch --all`; do
        if [[ $each_branch == remotes* ]]; then
            author=`git log -1 $each_branch --pretty=format:'%an'`
            echo "$author  $each_branch"
        fi
    done
}

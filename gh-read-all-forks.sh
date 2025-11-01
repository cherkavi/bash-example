#!/bin/bash

# read all forks from repo
# compare forked repos and 'src'-repo for detecting new commits

### common 
PARENT_REPO='cherkavi/cheat-sheet'
DEFAULT_BRANCH=master
NEXT_URL="repos/cherkavi/cheat-sheet/forks"

### step 1
while [ -n "$NEXT_URL" ]; do
    FORKS_JSON=$(gh api $NEXT_URL --jq '.[] | {repo: .full_name, branch: .default_branch, forks: .forks, watchers: .watchers}')

    echo $FORKS_JSON | jq -c '.'

    # 1. Make the API call, include headers (-i) and suppress body output (--silent)
    #    The output is piped to 'awk' to extract the Link header
    RESPONSE=$(gh api "$NEXT_URL" -i --silent)
    
    # 2. Extract the Link header and the 'next' URL
    LINK_HEADER=$(echo "$RESPONSE" | grep -i '^Link:')    

    # Extract the 'next' URL part (the URL between < and > before rel="next")
    # This uses a regex to pull out the URL for the 'next' relation
    NEXT_PAGE_LINK=$(echo "$LINK_HEADER" | grep -oP '<[^>]+>; rel="next"' | grep -oP '(?<=<)[^>]+')

    if [[ -z $NEXT_PAGE_LINK ]]; then
        break;
    fi

    NEXT_URL=`echo "$NEXT_PAGE_LINK" | awk -F'?' '{print "repos/cherkavi/cheat-sheet/forks?" $2}'`
done > forks-list.json


#### step 2
for each_line in `cat forks-list.json`; do
    FORK_REPO=$(echo "$each_line" | jq -r '.repo')
    FORK_BRANCH=$(echo "$each_line" | jq -r '.branch')

    COMPARE_REF="${PARENT_REPO//\//:}:${DEFAULT_BRANCH}...${FORK_REPO//\//:}:${FORK_BRANCH}"

    # echo $COMPARE_REF
    AHEAD_COMMITS=$(gh api "repos/${PARENT_REPO}/compare/${COMPARE_REF}" --jq '.ahead_by' 2>/dev/null)

    echo $FORK_REPO"  "$FORK_BRANCH"  "$AHEAD_COMMITS
done > forks-list-ahead.txt
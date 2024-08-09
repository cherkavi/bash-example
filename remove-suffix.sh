# remove suffix if it exists

    GIT_URL=$(git remote -v  | grep push  | awk '{print $2}')
    if [[ $GIT_URL == *".git" ]]; then
        GIT_URL="${GIT_URL%'.git'}"
    fi    
    echo $GIT_URL


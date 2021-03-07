# jenkins deploy
function deploy-api-on-staging(){
        if [[ $# != 1 ]]
        then
            echo " number of staging is expected"
            return 1
        fi
        staging_env_number="stg-"$1
        
        branch_name=`git status | head | grep 'On branch' | awk -F 'On branch' '{print $2}' | xargs`
        if [ -z "$branch_name" ]
        then
          echo "git repo not found"
          return 2
        fi  

        echo "deploy branch: $branch_name  on $staging_env_number"
        curl https://jenkins-stg.dplapps.vantage.zur/job/application/job/api/job/deployment/job/deploy-from-branch-3/buildWithParameters  \
        --user $INTEL_USER:$INTEL_PASS \
        --data BRANCH_NAME=$branch_name --data DESTINATION=$staging_env_number
}

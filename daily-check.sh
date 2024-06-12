function _networking-daily-check(){
    prefix=$HOME_SHARED_DRIVE/.status.networking
    file_name=`date +'%Y.%m.%d'`".networking"
    files_count=`ls $HOME_SHARED_DRIVE/.status.networking | grep $file_name | wc -l`
    if [[ $files_count == 0 ]]; then
        networking
    fi
}


function networking(){
    prefix=$HOME_SHARED_DRIVE/.status.networking
    if [[ ! -d $prefix ]]; then
        mkdir -p $prefix
    fi
    rm $prefix/* &>/dev/null
    file_name="$prefix/"`date +'%Y.%m.%d'`".networking"
    touch $file_name

    python3 ${HOME_PROJECTS_GITHUB}/networking-reminder/meetings-manager.py $HOME_SHARED_DRIVE/contacts-meetings.db
}


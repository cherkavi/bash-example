function random-file-lines(){
    if [[ $# != 2 ]]
    then
        echo "select randomly lines from file, random lines selection"
        echo " first argument - filename"
        echo " second argument - amount of output random lines "
        return 1
    fi    
    FILE_TXT=$1
    ATTEMPTS=$2

    LINE_COUNT=`wc -l $FILE_TXT | awk '{print $1}'` 

    for (( index=0; index<${ATTEMPTS}; index++ )); do
        NEXT_LINE=`python3 -c 'import random; print(random.randint(1,'${LINE_COUNT}'))'`
        sed -n ${NEXT_LINE}p $FILE_TXT    
    done
}

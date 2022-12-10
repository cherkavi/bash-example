# prerequisites
# API_HOST="127.0.0.1:3310"
# PROJECT_HOME="/home/projects/toptal/toptal-node-3tier-app"

if [ -z "$PROJECT_HOME" ]
then
    echo "envvar PROJECT_HOME should be present"
    exit 1
fi

if [ -z "$API_HOST" ]
then
    echo "envvar DB should be present"
    exit 1
fi

application_marker="3tier-web"
PORT=3309

connection_string(){
    echo "connection string: http://localhost:$PORT"
}

status() {
    processes=`ps aux | grep $application_marker | wc -l`

    if [[ $processes -ge 2 ]]
    then
        echo "running..."
        connection_string
    else
        echo "was not started"        
    fi
}

start() {
    PORT=$PORT npm start --prefix $PROJECT_HOME/web $application_marker &
    echo "started"
    connection_string
}

stop() {
    for each_id in `ps aux | grep node | grep $application_marker | awk '{print $2}' | sort | head -n 2`
    do
        kill $each_id
    done
    echo "was stopped"
}


case "$1" in
    'start')
            start
            ;;
    'stop')
            stop
            ;;
    'restart')
            stop ; echo "Sleeping..."; sleep 1 ;
            start
            ;;
    'status')
            status
            ;;
    *)
            echo
            echo "Usage: $0 { start | stop | restart | status }"
            echo
            exit 1
            ;;
esac

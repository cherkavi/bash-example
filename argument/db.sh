container_name="postgres-server"
port=5432
password="postgres"
# default DB name
database_name="postgres"

connection_string(){
    echo "connection string: ""postgres://postgres:$password@127.0.0.1:$port/$database_name"
}

status() {
    started_container=`docker ps --filter "name=^postgres-server$" --format "{{.Names}}"`
    if [ -z "$started_container" ]
    then
        echo "was not started"        
    else
        echo "running..."
        connection_string
    fi
}

start() {
    persistent_folder=`pwd dirname $0`/data
    started_container=`docker ps -a --filter "name=^postgres-server$" --format "{{.Names}}"`
    if [ -z "$started_container" ]
    then
        sudo docker run --rm   --name $container_name -e POSTGRES_PASSWORD=$password -d -p $port:5432 -v $persistent_folder:/var/lib/postgresql/data  postgres
    else
        sudo docker start $container_name
    fi
    echo "started"
    status
}

stop() {
    sudo docker stop $container_name
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

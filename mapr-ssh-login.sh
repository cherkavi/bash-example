ssh $MDF_DOWNLOADER_USER@$MDF_DOWNLOADER_HOST 'maprlogin print >/dev/null 2>&1'           
LOGIN_RESULT=$?         

if [[ $LOGIN_RESULT -gt 0 ]]
then
        echo "input mapr password: "
        read CLUSTER_PASS
        execution_string="echo '"$CLUSTER_PASS"' | maprlogin password -user cherkavi "
        echo $execution_string
        ssh $MDF_DOWNLOADER_USER@$MDF_DOWNLOADER_HOST $execution_string
else
        echo "OK"
fi
~

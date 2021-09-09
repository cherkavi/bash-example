# first line execution only
cat airflow-w*.ini | grep -A 1 "main]" | grep -v "\-\-" | grep -v "main" | while read each_host
do 
    echo $each_host
    # avoid swallowing of stdin by ssh command
    ssh -i $EC2_KEY ubuntu@$each_host "ps aux | grep scheduler" < /dev/null
    echo "---"
done

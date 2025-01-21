# read index page, find out all the 'href' attributes of <a>
# try to make curl request for all the href links
attempts_to_check_url=10
host="https://myhost.net"
for each_url in $(curl -s ${host}/common/index.html | grep -oP '(?<=<a href=").*?(?=")'); do
    destination_url="${host}${each_url}"
	echo $destination_url
    for i in {1..$attempts_to_check_url}; do
        response=$(curl -s -w "%{http_code}" $destination_url)
        status_code=$(echo $response | tail -c 4)
        content=$(echo $response | sed 's/.\{4\}$//')
        if [ "$status_code" -ne 302 ]; then
            echo "Received $status_code response. Printing content:"
            echo "$content"
            break
        else
            echo "Attempt $i: Received $status_code response."
        fi
    done
done

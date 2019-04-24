cat ~/.docker/config.json | grep "auth\":" | awk -F '"' '{print $4}' 

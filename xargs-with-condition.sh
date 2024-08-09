# xargs pipe condition, xargs expression
# xargs compare dates
echo "2021.03.04T15:21:51" | xargs -I {} sh -c "if [[ {} > \"$(date +'%Y.%m.%dT%H:%M:%S')\" ]]; then echo 'ok'; fi"

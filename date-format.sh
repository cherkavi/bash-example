# timestamp, SimpleDateFormat, datetime to string

## datetime now
date +'%d.%m.%Y %H:%M:%S'
date +'%s'


## datetime ago
date +'%d.%m.%Y %H:%M:%S' --date="2 hour ago"
date +'%d.%m.%Y' --date="2 day ago"
date +'%d.%m.%Y' --date="2 month ago"
date +'%d.%m.%Y' --date="2 year ago"
## seconds ago
date --date="30 sec ago" +'%s'

# parse datetime parse datetime
date --date="15:21:51 04 Mar 2022" +"%Y.%m.%d %H:%M:%S"
date --date="15:21:51 04 Mar 2022" +%s


# datetime seconds linux time timestamp, seconds to time
date -d @1621508129 '+%Y%m%d %H%M%S'
## with timezone
TZ="America/Los_Angeles" date -d '2021-05-20 10:55:29' +%s

## parse datetime from string
date=$(date +'%Y-%m-%d %H:%M:%S')
read Y M D h m s <<< ${date//[-: ]/ }


function diff_in_seconds(){
    if [[ $1 == "" ]]; then
        echo "first parameter should be time like:  13:30 or 9:15 or 15:5"
        return 1
    fi
    input_value=$1
    read h m <<< "${input_value//:/' ' }"
#    echo "H=$h, m=$m"
    future_in_seconds=$(( "10#"$h * 60 * 60 + "10#"$m * 60 ))
#    echo $future_in_seconds
    current_date=$(date +'%H %M')
#    echo $current_date
    read h m <<< $current_date
#    echo "H=$h, m=$m"
    current_in_seconds=$(( "10#"$h * 60 * 60 + "10#"$m * 60 ))
#    echo $current_in_seconds

    delay_in_sec=$(( $future_in_seconds - $current_in_seconds ))
    if (( $delay_in_sec > 0 )); then
        echo $delay_in_sec
    else
        echo "time should be in future"
    fi
}

diff_in_seconds 13:10

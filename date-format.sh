# timestamp, SimpleDateFormat, datetime to string
date +'%d.%m.%Y %H:%M:%S'
date +'%d.%m.%Y %H:%M:%S' --date="2 hour ago"
date +'%d.%m.%Y' --date="2 day ago"
date +'%d.%m.%Y' --date="2 month ago"
date +'%d.%m.%Y' --date="2 year ago"
# parse date parse datetime
date --date="15:21:51 04 Mar 2022" +"%Y.%m.%d %H:%M:%S"

# datetime seconds linux time timestamp
date -d @1621508129 '+%Y%m%d %H%M%S'
TZ="America/Los_Angeles" date -d '2021-05-20 10:55:29' +%s

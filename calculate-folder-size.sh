# count size of all files inside one session 
# ./calculate-size.sh 10 4 12 4
# 
# if you want just a summurize it:
# ./calculate-size.sh 10 4 12 4 | awk 'BEGIN{sum=0}{sum=sum+$2}END{print sum}'
if [ ! -n "$4" ]; then
  echo "expected input is {day begin} {month begin} {day end} {month end} "
  exit 1
fi  

date_begin=`printf "%02d" $2``printf "%02d" $1`
date_end=`printf "%02d" $4``printf "%02d" $3`

for each_path in `find /mapr/dp.prod/adage/data/store/collected/car-data/MDF4/ingest/*/2019/*/*/ -maxdepth 1`; do 
    month_date=`echo $each_path | awk -F '/' '{print $13$14}'`
    session=`echo $each_path | awk -F '/' '{print $15}'`
    if [[ $month_date>=$date_begin && $month_date<=$date_end && $session != "" ]]; then
        echo $each_path" "`ls -la $each_path/*/*/*.MF4 | awk 'BEGIN{sum=0}{sum=sum+$6}END{print sum}'`
    fi
done

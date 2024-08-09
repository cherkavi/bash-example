# /collected/car-data/MDF4/ingest/6088/2020/11/05/008740e0-cfcf-4989-de-0175982e7/3100300/MT_RE/20201105T155936_20201105T160036_715482_6088_MT_RE.MF4
# /collected/car-data/MDF4/ingest/6088/2020/11/05/008740e0-cfcf-4989-de-0175982e7/3100300/MT_RE/20201105T153636_20201105T153736_715482_6088_MT_RE.MF4
# /collected/car-data/MDF4/ingest/6088/2020/11/05/008740e0-cfcf-4989-de-0175982e7/3100300/MT_RE/20201105T135936_20201105T140036_715482_6088_MT_RE.MF4

#
#  11111  22222     33333333        444444444  5555555
#  _________b____________________________e_________________> time
# 
# result:
#         22222     33333333        444444444   

get_time_begin(){
    echo $1 | awk -F '/' '{print $NF}' | awk -F '_' '{print $1}'
}

get_time_end(){
    echo $1 | awk -F '/' '{print $NF}' | awk -F '_' '{print $2}'
}


range_date_begin="20201105T150700"
range_date_end="20201105T150759"

cat data.txt | while read each_line; do
    file_date_begin=$(get_time_begin $each_line)
    file_date_end=$(get_time_end $each_line)
    # echo " <"$date_begin">  <"$threshold">  <"$date_end"> "
    if [[ ( $range_date_begin < $file_date_begin ) && ( $file_date_begin < $range_date_end ) ]] ||
       [[ ( $range_date_begin < $file_date_end  ) && ( $file_date_end < $range_date_end ) ]]
    then
        echo $each_line
    fi 
done

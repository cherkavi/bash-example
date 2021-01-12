is_t_time(){
    # attempt to determinate format of input argument
    # 0 - 20201209T143113_20201209T155144_716504_BM60430_BN_EV_FASDLT_UC.MF4​
    # 1 - 2020-12-09_14-27-53_2020-12-09_14-29-53_716504_BM60430_BN_FASDLT_0000.MF4
    length_without_minuses=`echo $1 | sed 's/[\-]//g' | awk '{print length($1)}'`
    length=`echo $1 | awk '{print length($1)}'`
    if [[ $length > $length_without_minuses ]]; then
        return 1
    else
        return 0
    fi
}


parse_t_time_begin(){
    # get time begin
    # 20201209T143113 - 20201209T143113_20201209T155144_716504_BM60430_BN_EV_FASDLT_UC.MF4​
    echo $1 | awk -F '/' '{print $NF}' | awk -F '_' '{print $1}'
}
parse_t_time_end(){
    # get time end
    # 20201209T143113 - 20201209T143113_20201209T155144_716504_BM60430_BN_EV_FASDLT_UC.MF4​
    echo $1 | awk -F '/' '{print $NF}' | awk -F '_' '{print $2}'
}

parse_minus_time_begin(){
    # get time begin and transform to T time
    # 20201209T142753 - 2020-12-09_14-27-53_2020-12-09_14-29-53_716504_BM60430_BN_FASDLT_0000.MF4
    echo $1 | awk -F '_' '{print $1"T"$2}' | sed 's/-//g'
}
parse_minus_time_end(){
    # get time end and transform to T time
    # 20201209T142953 - 2020-12-09_14-27-53_2020-12-09_14-29-53_716504_BM60430_BN_FASDLT_0000.MF4
    echo $1 | awk -F '_' '{print $3"T"$4}' | sed 's/-//g'    
}

get_time_begin(){
    if is_t_time $1; then
        parse_t_time_begin $1        
    else
        parse_minus_time_begin $1
    fi 
}

get_time_end(){
    if is_t_time $1; then
        parse_t_time_end $1        
    else
        parse_minus_time_end $1
    fi     
}

file1="20201209T143113_20201209T155144_716504_BM60430_BN_EV_FASDLT_UC.MF4​"
file2="2020-12-09_14-27-53_2020-12-09_14-29-53_716504_BM60430_BN_FASDLT_0000.MF4"

echo $(get_time_begin $file1)"  "$(get_time_end $file1)
echo $(get_time_begin $file2)"  "$(get_time_end $file2)
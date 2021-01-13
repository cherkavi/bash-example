is_minus_time(){
    # attempt to determinate format of input argument
    # 1 - 20201209T143113_20201209T155144_716504_BM60430_BN_EV_FASDLT_UC.MF4​
    # 1 - V714382_Mobileye_MDF_20191103T164506-20191103T164524.MF4
    # 0 - 2020-12-09_14-27-53_2020-12-09_14-29-53_716504_BM60430_BN_FASDLT_0000.MF4
    length_without_minuses=$(( `echo $1 | sed 's/[\-]//g' | awk '{print length($1)}'` + 1 ))
    length=`echo $1 | awk '{print length($1)}'`
    if [[ $length > $length_without_minuses ]]; then
        return 0 # true
    else
        return 1 # false
    fi
}

is_t_time(){
    # attempt to determinate format of input argument
    # 0 - 20201209T143113_20201209T155144_716504_BM60430_BN_EV_FASDLT_UC.MF4​
    # 1 - V714382_Mobileye_MDF_20191103T164506-20191103T164524.MF4
    # 1 - 2020-12-09_14-27-53_2020-12-09_14-29-53_716504_BM60430_BN_FASDLT_0000.MF4
    length_without_minuses=`echo $1 | sed 's/[\-]//g' | awk '{print length($1)}'`
    length=`echo $1 | awk '{print length($1)}'`
    if [[ $length == $length_without_minuses ]]; then
        return 0 # true
    else
        return 1 # false
    fi
}

is_oldstyle_time(){
    # attempt to determinate format of input argument
    # 1 - 20201209T143113_20201209T155144_716504_BM60430_BN_EV_FASDLT_UC.MF4​
    # 0 - V714382_Mobileye_MDF_20191103T164506-20191103T164524.MF4
    # 1 - 2020-12-09_14-27-53_2020-12-09_14-29-53_716504_BM60430_BN_FASDLT_0000.MF4
    length_without_minuses=$(( `echo $1 | sed 's/[\-]//g' | awk '{print length($1)}'` + 1 ))
    length=`echo $1 | awk '{print length($1)}'`
    if [[ $length == $length_without_minuses ]]; then
        return 0 # true
    else
        return 1 # false
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

parse_oldstyle_time_begin(){
    # get time begin and transform to T time
    # 20191103T164506 - V714382_Mobileye_MDF_20191103T164506-20191103T164524.MF4
    echo $1 | awk -F '[-_\.]' '{print $(NF-2)}'
}
parse_oldstyle_time_end(){
    # get time end and transform to T time
    # 20191103T164524 - V714382_Mobileye_MDF_20191103T164506-20191103T164524.MF4
    echo $1 | awk -F '[-_\.]' '{print $(NF-1)}'
}


get_time_begin(){
    if is_t_time $1; then
        parse_t_time_begin $1        
    elif is_oldstyle_time $1; then
        parse_oldstyle_time_begin $1
    else 
        parse_minus_time_begin $1
    fi 
}

get_time_end(){
    if is_t_time $1; then
        parse_t_time_end $1        
    elif is_oldstyle_time $1; then
        parse_oldstyle_time_end $1
    else 
        parse_minus_time_end $1
    fi 
}

file1="20201209T143113_20201209T155144_716504_BM60430_BN_EV_FASDLT_UC.MF4​"
file2="2020-12-09_14-27-53_2020-12-09_14-29-53_716504_BM60430_BN_FASDLT_0000.MF4"
file3="V714382_Mobileye_MDF_20191103T164506-20191103T164524.MF4"
file4="V714382_MDF4_20191103T165456-20191103T165556.MF4"

# echo $(is_t_time $file1)
# echo $(is_t_time $file2)
# echo $(is_t_time $file3)
# echo $(is_t_time $file4)
# echo "---"
# echo $(is_oldstyle_time $file1)
# echo $(is_oldstyle_time $file2)
# echo $(is_oldstyle_time $file3)
# echo $(is_oldstyle_time $file4)

echo $(get_time_begin $file1)"  "$(get_time_end $file1)
echo $(get_time_begin $file2)"  "$(get_time_end $file2)
echo $(get_time_begin $file3)"  "$(get_time_end $file3)
echo $(get_time_begin $file4)"  "$(get_time_end $file4)
  
# file=$file3
# echo $file
# if is_t_time $file; then
#     echo "is t time"
# fi
# if is_oldstyle_time $file; then
#     echo "is oldstyle time"
# fi
# if is_minus_time $file; then
#     echo "is minus time"
# fi

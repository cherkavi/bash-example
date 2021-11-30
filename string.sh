# string replacement, replaceAll, sed replacement
string_value="just a brown fox fox and this fox is jumping over another fox"
echo "${string_value//fox/dog}"

# replace comma and double-quotas symbols
# remove quotas
echo "$a" | sed -r 's/[\"\,]+//g'

# replace string replace substring
export LOCAL_MAP_FOLDER_PATH='/home/projects/bmw/temp/mdf4-download/'
export REPLACE_FOLDER='/mapr/prod/processed/'
file_path='/home/projects/bmw/temp/mdf4-download/21401/2021/07/06/7b2a512c-1b98-43de/3100/ADCAM_MIPI/some_file.MF4'

echo "${file_path/$LOCAL_MAP_FOLDER_PATH/$REPLACE_FOLDER}"

# remove space in string
a="a b c d"
echo ${a// /}

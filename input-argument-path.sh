full_path=`realpath $1`
echo $full_path
# echo ${full_path##*/}
file_name="$(basename -- $full_path)"
echo "$file_name"

file_name_without_ext=${file_name%.*}
echo "$file_name_without_ext"

file_dir="$(dirname -- $full_path)"
echo "$file_dir"



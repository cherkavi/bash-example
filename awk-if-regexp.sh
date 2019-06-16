# find files with size more than Megabyte
du -ah . | awk '{if($1 ~ /M/)print $1"  "$2}'

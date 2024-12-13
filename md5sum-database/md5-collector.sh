if [ -z "$1" ]; then
  root_dir="."
else
  root_dir="$1"
fi

if [ -z "$2" ]; then
  mask="*"
else
  mask="$2"
fi

find $root_dir -name "$mask" -type f -printf "%p\t%s\n" | while read path size; do
    filename=$(basename "$path")
    md5sum=$(md5sum $path | awk '{print $1}')
    printf "%s\t%s\t%s\t%s\n" "$size" "$md5sum" "$path" "$filename" 
done


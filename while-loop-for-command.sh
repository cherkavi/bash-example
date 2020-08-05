
ls -la >> output.file

# while redirect output
while read line; do
   # if pattern, condition pattern, pattern condition
   if [[ $line == *Feb*  ]] && [[ $line == *2020* ]]; then
	   echo "$line"
   fi

done < output.file

for each_folder in  /some/folder/data_transfer/*/*/*/; do
   if [[ $each_folder == *data_transfer/VX7693/2018/10/11/ ]]; then
      continue
   fi
   if [[ $each_folder == *data_transfer/VX7146/2018/09/10/ ]]; then
      continue
   fi
   ls -la $each_folder/*

done

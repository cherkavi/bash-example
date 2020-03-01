ls *.sh | while read each_file
do
    ls -la $each_file | awk  '{print " "$5" - "$9}' >> file-sizes.txt
done

# list of sub-folders
find /mapr/dp.prod.zurich/vantage/data/enriched/777111/2019 -maxdepth 3 -mindepth 3 | awk -F '/' '{print $14}' | while read each_session
do 
   echo $each_session
done


	# !!! warning for ssh !!!
	# "ssh -n " instead of "ssh "

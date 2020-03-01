head sessions-intel-empty.csv | awk -F ',' '{print $1}' | while read each_session
do
	echo $each_session" "`cat ../intel-filelist.txt | grep $each_session | wc -l`
	# !!! warning for ssh !!!
	# "ssh -n " instead of "ssh "
done

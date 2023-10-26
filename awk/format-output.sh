## formatted output 
awk -v FS=\| -v OFS=, '{
  $1=sprintf("%05.2f", $1); 
  $2=sprintf("%05.2f", $2); 
  $3=sprintf("%05.2f", $3); 
  print $1,$2,$3}' filename
  
## predefined length of the string
# set length in the parameters 50 & 100 
cat $CV_SITE_LOG | awk -F '|' '{printf("%-*s %-*s \n", 50,$1,  100,$5)}'
# set length in the format
cat $CV_SITE_LOG | awk -F '|' '{printf("%-50s %s \n",$1,100, $5)}'
cat $CV_SITE_LOG | awk -F '|' '{printf("%50s %s \n",$1,100, $5)}'



## for loop 
awk -F \| -v OFS=, '{ NF--; for(i = NF-2; i <= NF; i++) $i = sprintf("%07.2f", $i) } 1' filename

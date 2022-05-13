# formatted output 
awk -v FS=\| -v OFS=, '{
  $1=sprintf("%05.2f", $1); 
  $2=sprintf("%05.2f", $2); 
  $3=sprintf("%05.2f", $3); 
  print $1,$2,$3}' filename
  
  
  # for loop 
  awk -F \| -v OFS=, '{ NF--; for(i = NF-2; i <= NF; i++) $i = sprintf("%07.2f", $i) } 1' filename

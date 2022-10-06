# read multiple parameters from 
read VIN YEAR MONTH DAY  <<< `echo $MDF4_PATH | awk -F '/' '{print $9" "$10" "$11" "$12}'`

# read parameters from string
read -r col1 col2 col3 <<< "hello business world of IT"
printf "col1: %s   col2: %s   col3 %s\n" "$col1" "$col2" "$col3"

# read data with custom separator, custom delimiter for "read" command
IFS="e"
read -r col1 col2 col3 <<< "hello business world of IT"
printf "col1: %s   col2: %s   col3 %s\n" "$col1" "$col2" "$col3"


# read value with default
read -e -p "Enter the path to the file: " -i "/some/default/path/" FILEPATH

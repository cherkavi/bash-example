awk 'BEGIN{FS=","}{print $2}' column-data-comma.txt

#                                print variable with number from external variable
#     field separator from variable
#awk -v FS=$main_file_delimiter '{print($'$main_file_field_number')}' | tr -d '\r' | tr -d '\a'`

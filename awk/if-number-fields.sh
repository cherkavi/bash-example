# if number of fields equals one - print it, line size, amount of fields
# element length, field size
cat 1.txt | awk '{if(NF==1)print length($1)}'

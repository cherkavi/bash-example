#!/usr/bin/awk -f
#name       color  amount
#apple      red    4
#banana     yellow 6
#strawberry red    3
#raspberry  red    99
# using boolean operator to control blocks of code

function print_rest(array_of_element){
# function example
     for (each_index in array_of_element ) { 
          print array_of_element[each_index]
     }   
}

# skip first line, skip line by number
NR == 1 { next }


# skip first 3 lines
# format output
NR >3 { printf " >> %s <<\n", $N }


# implicit if statements
$3 <= 4{
        print length(skipped), $3
        skipped[length(skipped)+1] = $3
}

$3 > 4 {result = result + $3} 


BEGIN {
        printf "-- start --\n"
        # init array with any value, just tell to awk that it is array
        skipped[0]=0
        delete skipped[0]
}


END {
     printf "sum: %d\n", result
     print_rest(skipped)
}

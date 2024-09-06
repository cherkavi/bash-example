# read md5sum for each file in the folder and print out duplicated files only

find . -type f -exec md5sum {} \; | sort | awk 'BEGIN {last_state = ""}{first_part = $1
    if (first_part == last_state) {
        print "Duplicate " $2
    }

    last_state = first_part
}' 

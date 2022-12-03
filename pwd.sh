# print current folder
# working folder of execution

# option 1
current_directory=`pwd dirname $0`
echo $current_directory

# option 2
full_path=`realpath $1`
file_name="$(basename -- $full_path)"


# option3 real script example, current directory same directory as script
current_directory=`dirname "$0"`
python3 $current_directory/main.py $current_directory/email-sender.properties $*

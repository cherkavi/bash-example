# bash debugger: http://bashdb.sourceforge.net/
# https://sourceforge.net/projects/bashdb/files/bashdb/5.0-1.1.2/bashdb-5.0-1.1.2.tar.gz/download
# bash --debugger debug-example.sh

set -x # Display commands and their arguments as they are executed.
set -v # Display shell input lines as they are read.
set -e

echo "first line"
var1=1
var2=(1 2 3 4)
for each in ${var2[@]}; do
	echo $each
done


# example of execution sub-scripts from the same folder where current script is placed
CURRENT_PATH=`dirname $0`
PACKAGE=`$CURRENT_PATH/_obtain-package-name.sh`
VERSION=`$CURRENT_PATH/_obtain-version-number.sh`

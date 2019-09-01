#!/bin/bash

#!/bin/bash
# http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_12_02.html

# stop execution of script when first exception will happen, $?>0
# set -eE
trap '{ echo "trap section: error happend"; mkdir ~/notexistingfolder; }' ERR

ls ~/notexistingfolder
echo "folder was created and script can continue execution"


# using EXIT when need to execute something before exit
# trap '{ echo "trap section: error happend"; mkdir ~/notexistingfolder; }' ERR EXIT SIGTERM

# print output to one line
# count md5sum for all files
find . -name "*.py" -exec md5sum {} \; | awk '{print $1}' ORS=' ' | md5sum -

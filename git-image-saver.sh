# download all images from git repo
# save locally all images from markdown files
# backup git images
folder="/home/projects/investigation"
folder="/home/projects/cheat-sheet"
grep  -ir "\!\[" $folder | grep http | awk -F '[()]' '{print $2}' | xargs wget 

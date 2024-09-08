folder_source='.'
folder_dest='$HOME/Documents/books/architecture_epam'
IFS=$'\n' # for loop with spaces in filenames
for each_file in `find $folder_source -name '*.pptx'`; do    
    libreoffice --headless --convert-to pdf "$each_file" --outdir $folder_dest
done 

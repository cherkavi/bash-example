#!/bin/bash

# convert win1251 to utf-8 encoding 

# Check if at least one argument is provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 <file1> [<file2> ... <fileN>]"
  exit 1
fi

# Loop through all provided files
for file in "$@"; do
  # Check if the file exists
  if [ ! -f "$file" ]; then
    echo "File $file does not exist."
    continue
  fi

  # Create a temporary file
  temp_file=$(mktemp)

  # Convert the file encoding and write to the temporary file
  iconv --from-code=WINDOWS-1251 --to-code=UTF-8 "$file" -o "$temp_file"

  # Check if the conversion was successful
  if [ $? -eq 0 ]; then
    # Replace the original file with the temporary file
    mv "$temp_file" "$file"
    echo "Successfully converted $file to UTF-8."
  else
    echo "Failed to convert $file."
    # Clean up the temporary file if conversion failed
    rm "$temp_file"
  fi
done
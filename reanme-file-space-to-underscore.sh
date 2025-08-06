TARGET_DIR=.
find "$TARGET_DIR" -maxdepth 1 -type f -print0 | while IFS= read -r -d $'\0' old_name; do
  # Get the base filename (without the directory path)
  filename=$(basename "$old_name")

  # Replace spaces with underscores in the filename
  new_name=$(echo "$filename" | tr ' ' '_')

  # Check if a renaming is actually needed
  if [ "$filename" != "$new_name" ]; then
    # Construct the full new path
    full_new_name="$TARGET_DIR/$new_name"

    # Perform the rename operation
    mv "$old_name" "$full_new_name"
    echo "Renamed: '$filename' -> '$new_name'"
  else
    echo "Skipped: '$filename' (no spaces found)"
  fi
done

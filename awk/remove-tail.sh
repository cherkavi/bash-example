# awk remove tail
# awk rtrim
# awk trim
echo "../python-utilities/.git"  | awk -F '/' '{print substr($0, 1, length($0)-5)}'
# awk rtrim by index
echo "../python-utilities/.git"  | awk -F '/' '{print substr($0, 1, index($0, "/.git") )}'

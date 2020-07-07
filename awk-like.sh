# awk like
cat .env.dockerfile | awk -F= '{if($1 ! "#"){print $1}}'
# awk not like 
cat .env.dockerfile | awk -F= '{if($1 !~ "#"){print $1}}'

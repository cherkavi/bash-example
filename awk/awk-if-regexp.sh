# grep filter condition anchor case insensitive
awk 'BEGIN{IGNORECASE=1}  /hello/ {print $0}' greetings.txt

# find files with size more than Megabyte
du -ah . | awk '{if($1 ~ /M/)print $1"  "$2}'
# if not equals
# du -ah . | awk '{if(!($1 ~ /M/))print $1"  "$2}'
# if start with Vit
# du -ah . | awk '{IGNORECASE=1; if(!($1 ~ /^Vit/))print $1"  "$2}'



# find all nodes for kubectl with specific status
kubectl get pods --namespace training --output wide | awk '{if($7 ~ /gpu-1/ && $3 ~ /Running/)print $N}'

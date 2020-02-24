# find files with size more than Megabyte
du -ah . | awk '{if($1 ~ /M/)print $1"  "$2}'


# find all nodes for kubectl with specific status
kubectl get pods --namespace training --output wide | awk '{if($7 ~ /gpu-1/ && $3 ~ /Running/)print $N}'

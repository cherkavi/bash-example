ATTEMPTS=5
THRESHOLD=100
for (( index=0; index<${ATTEMPTS}; index++ )); do
    python3 -c 'import random; print(random.randint(1,'${THRESHOLD}'))'   
done

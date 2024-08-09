# read all secrets
all_secrets=`oc get secrets | tail +2 | awk '{print $1}'`

for each_secret in ${all_secrets[@]}; do
    printf "=====\n>>%s\n" "$each_secret"
    oc get secret $each_secret -o json | jq -r '.data | keys[]'
done

# read all config maps
all_configmaps=`oc get cm | tail +2 | awk '{print $1}' | grep -v dockerbuild`

for each_cm in ${all_configmaps[@]}; do
    printf "=====\n>>%s\n" "$each_cm"
    oc get cm $each_cm -o json | jq -r '.data | keys[]'
done

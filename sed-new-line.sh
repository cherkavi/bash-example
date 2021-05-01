printf "}\n{" | sed -e ':a' -e 'N' -e '$!ba' -e 's/}\n{/},{/g'

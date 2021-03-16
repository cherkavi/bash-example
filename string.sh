# string replacement, replaceAll, sed replacement
string_value="just a brown fox fox and this fox is jumping over another fox"
echo "${string_value//fox/dog}"

# replace comma and double-quotas symbols
echo "$a" | sed -r 's/[\"\,]+//g'

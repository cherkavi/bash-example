# arifmetic operations calculator math expressions mathematic 

echo $(( 15 + 09 ))
# bash: 15 + 09: value too great for base (error token is "09")

# different base for digits 
❯ echo $(( 15 + 10#09 ))
# 24

# inline arifmetic operations 
echo $( date +%G | cut -c3-4 )$( date +%V | xargs -I {} expr {} - 1 )

# inc unary operators
custom_value=15
echo $((++custom_value))
echo $((custom_value++))
echo $((--custom_value))
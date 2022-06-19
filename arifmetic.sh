# arifmetic operations, calculator

echo $(( 15 + 09 ))
# bash: 15 + 09: value too great for base (error token is "09")

❯ echo $(( 15 + 10#09 ))
# 24


array=(0 1 2 3 4 5 6 7 8 9 0 a b c d e f g h)
echo ${array[@]:7}
# 7 8 9 0 a b c d e f g h

echo ${array[@]:7:2}
# 7 8

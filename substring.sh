a="hello world"
echo ${a:5}
# world

echo ${a:5:6}
# world

echo $(expr substr "$a" 7 5)
# world

# substring 
a="abcd"
echo ${a:0:-1}
# abc

echo ${a:1:-1}
# bc

echo ${a:1}
# bcd

a="hello world"
echo ${a:5}
# world

echo ${a:5:6}
# world

echo $(expr substr "$a" 7 5)
# world

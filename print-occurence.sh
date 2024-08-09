#!/bin/sh

# print all after occurence
# print rest of text in file after occurence
# print after match
# remove before text

cat words-black.list | sed -n -e '/MS Office/,$p'

# or with using variable in sed
export occurence="MS Office"
cat words-black.list | sed -n -e "/$occurence/,\$p"

# or using awk
cat words-black.list | awk '/MS Office/,EOF'


# print lines before occurence
# print lines before match
sed '/MS Office/q' words-black.list
awk '{print} /MS Office/ {exit}' words-black.list

# print lines before match not included
sed '/MS Office/Q' words-black.list
awk '/MS Office/ {exit} {print}' words-black.list

# print between occurences
sed -n '/VB.Net/,/MS Office/ p' words-black.list


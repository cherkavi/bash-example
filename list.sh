distributives=('Debian' 'Redhat' 'Ubuntu' 'SuSe')
limit=2

# print only first element
echo "${distributives}"

# slice list
selection=(${distributives[@]:0:$limit})

# print full list
echo "${selection[@]}"

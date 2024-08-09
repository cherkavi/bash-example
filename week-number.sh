# week number
echo $(( ($(date +%-d)-1)/7+1))

# two weeks ago
echo $(( $(date +%V --date="2 week ago") ))

# in two weeks
echo $(( $(date +%V --date="2 week") ))
echo $(( $(date +%V)+2 ))

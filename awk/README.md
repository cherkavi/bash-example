# AWK
### single quota escape
```
\x27
```
example:
```
a=$((a+`zip_textfiles part_0 part_0.txt | awk '{if(NF>=5){print $4"/"$5}}' | awk -F '/' '{print $14" "$15"/"$16"/"$17" "$18}' | python sql-update-files-with-md5sum.py`))

awk '{print "a=$((a+`zip_textfiles "$2" "$2".txt | awk \x27 "}'
| awk -F \'/\' \'{print $14\" \"$15\"/\"$16\"/\"$17\" \"$18}\' | python sql-update-files-with-md5sum.py\`)); echo \"update "$2".txt"}' > update-db-from-files.sh
```

### last index of, lastIndexOf, substring
```
head completed2.files.list  | awk -F '/' '{print substr($0, 1, length($0) - length($NF))}'
```

### awk another FieldSeparator
```
awk -F '<new delimiter>'
```
example of multi delimiter:
```
awk -F '[/, ]'
```
example of determination delimiter in code 
```
awk 'BEGIN{FS=",";}{print $2}'
```

### print NumberofFields
```
awk '{print NF}'
```

### awk print last column
```
awk '{print $NF}'
```

### print NumberofRow
```
awk '{print NR}'
```

### awk OutputFieldSeparator
```
awk 'BEGIN{OFS="<=>"}{print $1,$2,$3}'
```

### [awk example of applying function and conditions](https://www.gnu.org/software/gawk/manual/html_node/)
```
ps -aux | awk '{if(index($1,"a.vcherk")>0){print $0}}'
ps -aux | awk '{print substr($0,1,20)}'
```

### awk execute script from file
```
awk -f <filename>
```
### awk print last element
```
print($NF)
```
### awk print all elements
```
print($0)
```

### awk complex search, print line below
```
BEGIN{
  need_to_print = 0
}
{
    if(need_to_print >0){
        print $N
        need_to_print = need_to_print - 1
    }else{
    if( index($N, "Exception")>0 && index($N, "WrongException")==0 )  {
      if(index($N,"[ERROR")==1 || index($N,"[WARN")==1){
        print $N
        need_to_print = 3
      }
    }
    }
}
```


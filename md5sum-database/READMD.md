# folder md5 sum DB
collect md5sum for files ( by mask ) in specific folder and save them in sqlite DB

```sh
./md5-collector.sh /home/projects/bash-example *.py > files.tsv
cat files.tsv | wc -l

rm files.db
sqlite3 files.db <<EOF
CREATE TABLE files (size INTEGER, md5sum TEXT, path TEXT, filename TEXT);
.separator "\t"
.import "files.tsv" files
EOF

sqlite3 files.db "select * from files;"
```

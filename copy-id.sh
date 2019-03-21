#!/usr/bin/expect -f
spawn ssh-copy-id vcherkashyn@host000159
expect "(yes/no)?"
send "yes\n"
expect "password: "
send "my_password\n"
expect eof

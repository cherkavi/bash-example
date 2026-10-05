## [how to debug bash](https://www.shell-tips.com/bash/debug-script/#gsc.tab=0)

### bash debug via adding trace info with traps
```sh
trap 'echo "line ${LINENO}: ANSWER: $ANSWER"' DEBUG
trap 'echo "$BASH_COMMAND" failed with error code $?' ERR
```

### bash debug file 
```sh
# set -o xtrace
bash -x /opt/mapr/installer/docker/mapr-setup.sh

bash -u /opt/mapr/installer/docker/mapr-setup.sh
```

### bash debug only code block
```sh
set -x 
# commands to debug
set +x
```

### check syntax without running 
```sh
bash -n myscript.sh
```

### advanced syntax check
```sh
sudo apt install shellcheck
shellcheck myscript.sh
```

### see also
[how to catch/send signals from/to process](trap.sh)
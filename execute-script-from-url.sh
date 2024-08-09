# execute script from remote url
# execute script from result of command
# left angle bracket, redirect from file

# just a content of remote file: curl -s "https://raw.githubusercontent.com/cherkavi/bash-example/master/printf.sh
bash <(curl -s "https://raw.githubusercontent.com/cherkavi/bash-example/master/printf.sh"

# just execute command
## queue of execution: 
### - print "echo 'hello'" ( execute echo in brackets )
### - redirect "echo 'hello'" as a pipe input for bash
bash <(echo "echo 'hello'")

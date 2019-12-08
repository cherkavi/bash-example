# just a simple example of using "make" command
# <target> : <dependency or filename>
# <tab key> <action1>
# <tab key> <actionN>

include config-var.mk

### example of auto-generated help with predefined variable $<
help : Makefile
	@grep "^###" $<
	
### example of help command with pre-defined values
help-manual :
	@echo "first.task : example #1"
	@echo "second.task : example #2 depends on #1"

### first.task :  comment for first task
first.task: two-lines.txt
	echo "> this is"
	echo "> first stask"


### second.task :  comment for second task
second.task: first.task
	echo "> and this is "
	echo "> second task "
	@echo "$(VAR_EXT_A)"

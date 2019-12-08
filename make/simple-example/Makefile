# https://makefiletutorial.com/

# just a simple example of using "make" command
# <target> : <dependency or filename>
# <tab key> <action1>
# <tab key> <actionN>

# !!! each command will run in new shell 
SHELL=/bin/bash
global_var_1="$(SHELL)"
export global_var_2="$(SHELL)"

# include variables from external file
include config-var.mk

### example of auto-generated help with predefined variable $<
help : Makefile
	@grep "^###" $<
	
### example of help command with pre-defined values
help-manual :
	@echo "first.task : example #1"
	@echo "second.task : example #2 depends on #1"


### execute all tasks
all.task: first.task second.task

### first.task :  comment for first task
first.task: two-lines.txt
	echo "> this is"
	echo "> first stask"
	@echo "$(global_var_1)"
	@echo $$global_var_2


### second.task :  comment for second task
second.task: first.task
ifeq ($(VAR_EXT_A),)
	echo "var is empty"
endif
ifeq ($(VAR_EXT_A), "54321")
	echo "> and this is "
	echo "> second task "
endif
	@echo "$(VAR_EXT_A)"
	@echo "${VAR_EXT_A}"


### example of using target as a parameter "$@"
%.txt %-lines.txt:
	@cat $@

### example of using prerequisites as parameters
third.task: two-lines.txt
	@echo ">>> print file <<<"
	@cat $<


.EXPORT_ALL_VARIABLES:
external_var_1 = "$(global_var_1)"
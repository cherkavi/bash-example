#!/bin/bash
values=`xdotool search --name 'Google Chrome' | sort -r`
# xdotool getwindowname 85983264
if [[ $? > 0 ]]; then
          x-www-browser --app=https://www.leo.org/german-english
	else
    xdotool windowactivate `echo $values | grep '' | awk '{print $1}' | head -n 1`
fi


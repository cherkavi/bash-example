#!/bin/sh
variable="some text"

if [ -n "$variable" ]
then
 echo $variable" is non zero"
fi

if [ -z "$variable" ];then
  echo $variable" is zero"
fi



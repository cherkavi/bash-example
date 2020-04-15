#!/bin/bash
# default value for first argument if not set
VALUE=${1:-"value-default"}  
# default date can be set as VALUE=${1:-$(date)}
echo $VALUE

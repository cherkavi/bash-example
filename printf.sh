# bash float, float in bash, double in bash, bash double
LC_NUMERIC="en_US.UTF-8"

var1=" >one< "
var2=50
var3=2.3337
printf "this is first var %s and second var %d \n" $var1 $var2

printf "%10s and second var %7d and third %10.2f \n" $var1 $var2 $var3

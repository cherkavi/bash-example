# create json policy from AccessDenied aws-cli answer
#
# how to use: 
# aws iam list-groups 2>&1 | awk-policy-json.sh
#

## read data from pipeline
## instead of reading only one line - read input_line
while read next_line
do
	input_line=$input_line$next_line
done

## awk inline script
action=`echo $input_line | awk '{for (column_item = 1; column_item <= NF; column_item++){if($column_item=="perform:")print $(column_item+1)}}'`

echo $action

echo '{'
echo '   "Version": "2012-10-17",'
echo '   "Statement": ['
echo '       {'
echo '           "Sid": "VisualEditor0",'
echo '           "Effect": "Allow",'
echo '           "Action": "'$action'",'
echo '           "Resource": "*"'
echo '       }'
echo '   ]'
echo '}'

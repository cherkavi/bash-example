# check last executed code
# check return code from pervious execution
# check System.exit(), sys.exit, ...

echo "this line always return 0"

if [ $? -ne 0 ]; then
    echo "error"
    exit 1
fi

if [ $? -eq 0 ]; then
	echo "always positive"
fi

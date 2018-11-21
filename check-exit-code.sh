# check last executed code
# check return code from pervious execution
# check System.exit(), sys.exit, ...

if [[ $? -ne 0 ]]; then
    echo "error"
    exit 1
fi

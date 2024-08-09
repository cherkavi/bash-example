echo "Run: unittest"
python -m unittest discover -p test_main.py

# exit from script with last executed command from previous script
exit $?

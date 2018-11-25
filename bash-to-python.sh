my_var="text from script"
# send values as a part of script
python -c "print('python processor:','$my_var')"

# send values via pipe
# one line execution
cat bash-var-to-python.sh | python3 -c "exec('\nimport sys\nfor line in sys.stdin:\n  print(line)\n')"

# suppress error output stderr remove
mapr dbshell --cmdfile $random_script_filename 2>/dev/null | head -n -1

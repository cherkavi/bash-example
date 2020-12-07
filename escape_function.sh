# This method escapes special characters 
#
function escape {
    string=${1/\\/\\\\}
    string=${string/\$/\\\$}
    string=${string/\%/\\\%}
    string=${string/\&/\\\&}
    echo $string
}
 
 q_account_password=$(escape "my-secret-password")

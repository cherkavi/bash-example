# realpath macos 
realpath() {
 [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

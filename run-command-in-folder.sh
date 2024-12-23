# run command in specific folder like cd (change dir) but inside function 
function run_in_dir() {
  local dir="$1"
  shift
  ( cd "$dir" && "$@" )
}
# run_in_dir /home/projects/github-mirror/cheat-sheet git status

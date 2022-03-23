# catch exception catch error control var control pipe
set -euo pipefail
VAR=$(set -euo pipefail; echo hello | myprogram)
export VAR

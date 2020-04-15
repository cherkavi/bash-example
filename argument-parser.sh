usage()
{
  echo "Usage: $0 [-s|-r] [ -d DB_DUMP ] [ -f TARBALL ]"
  exit 2
}

# assigne argument to variable
set_variable()
{
  local varname=$1
  shift
  if [ -z "${!varname}" ]; then
    # string as command, execute string
    eval "$varname=\"$@\""
  else
    echo "Error: $varname already set"
    usage
  fi
}

#########################
# Main script starts here

unset DB_DUMP TARBALL ACTION

while getopts 'srd:f:?h' c
do
  case $c in
    s) set_variable ACTION SAVE ;;
    r) set_variable ACTION RESTORE ;;
    d) 
      # process variable with argument
      set_variable DB_DUMP $OPTARG 
      ;;
    f)
      # process variable with argument 
      set_variable TARBALL $OPTARG 
      ;;    
    h|?) 
      # error processing
      usage 
      ;; 
  esac
done

[ -z "$ACTION" ] && usage
[ -z "$DB_DUMP" ] && [ -z "$TARBALL" ] && usage

if [ -n "$DB_DUMP" ]; then
  case $ACTION in
    SAVE) save_database $DB_DUMP ;;
    RESTORE) restore_database $DB_DUMP ;;
  esac
fi

if [ -n "$TARBALL" ]; then
  case $ACTION in
    SAVE) save_files $TARBALL ;;
    RESTORE) restore_files $TARBALL ;;
  esac
fi
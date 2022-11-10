#!/bin/bash

set -e

# easy ansible

ssh_user=""
hosts=""

function file() {

POSITIONAL_ARGS=()

#default values
MODE=644
CONTENT=""
OWNER=$(whoami)

while [[ $# -gt 0 ]]; do
  case $1 in
    --file)
      FILE="$2"
      shift # past argument
      shift # past value
      ;;
    --mode)
      MODE="$2"
      shift # past argument
      shift # past value
      ;;
    --owner)
      OWNER="$2"
      shift # past argument
      ;;
    --content)
      CONTENT="$2"
      shift
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done

if [ "$FILE" = "" ]; then echo "--file <path> is needed" ; exit; fi


do_remote "
cat > "$FILE" << EOF
$CONTENT
EOF"


do_remote "chown "$OWNER" "$FILE" || echo "Maybe wrong user?""
do_remote "chmod "$MODE" "$FILE"  || echo "Maybe wrong user?""



}

function lineinfile() {

file=""
search="regexp"
line=""
action=(append,replace,remove,apeend_after,prepend_befor)

while [[ $# -gt 0 ]]; do
  case $1 in
    --file)
      FILE="$2"
      shift # past argument
      shift # past value
      ;;
    --action)
      ACTION="$2"
      shift # past argument
      shift # past value
      ;;
    --line)
      LINE="$2"
      shift # past argument
      shift
      ;;
    --search)
      SEARCH="$2"
      shift # past argument
      shift
      ;;    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done




}

function insert_after() {
while [[ $# -gt 0 ]]; do
  case $1 in
    --file)
      FILE="$2"
      shift # past argument
      shift # past value
      ;;
    --insert)
      insert="$2"
      shift
      shift
      ;;
    --afterthis)
      afterthis="$2"
      shift
      shift
      ;;
    --backup)
      BACKUP="$2"
      shift
      shift
      ;;
    *)
      echo "unknown option "$1""
      exit
      ;;
  esac
done


do_remote "sed -i"$BACKUP" '/"$afterthis"/a "$insert"' "$FILE""

}

function insert_befor() {

echo "Not ready"

}

function cmd() {

run_once=(yes,no)
command=""
run_if=""


}

function apt(){

action=(update,upgrade,install,remove,purge,reinstall)
package=""

apt $action $package

}

function do_remote(){

action=$* #(echo "$@" | grep -oP "(<=%).*(<=%)")
shift
#hosts="$*"

for remote in "$hosts"
  do
typeset -f file ssh $ssh_user@$remote << EOF
    $action
EOF
    
done


}
# Aufruf 
# . easy-ansible.sh





 

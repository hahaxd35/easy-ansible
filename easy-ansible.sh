#!/bin/bash

set -e

# easy ansible

ssh_user=""
host=""

function file() {

POSITIONAL_ARGS=()

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

cat > "$FILE" << EOF
$CONTENT
EOF

chown "$OWNER" "$FILE" || echo "Maybe wrong user?"
chmod "$MODE" "$FILE"  || echo "Maybe wrong user?"



}

function lineinfile() {

file=""
line="regexp"
mode=(true,false)
action=(append,replace)

#if $mode
#if [  grep -qP "$line" "$file" ]
#then
#echo bla
#else
#if [ ! grep -qP "$line" "$file"
#echo bla
#fi

}

function cmd() {

run_once=(yes,no)
command=""

}

function apt(){

action=(update,upgrade,install,remove,purge,reinstall)
package=""

}


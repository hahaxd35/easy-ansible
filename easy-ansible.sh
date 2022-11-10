#!/bin/bash

set -e

# easy ansible

ssh_user=""
host=""

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

cat > "$FILE" << EOF
$CONTENT
EOF

chown "$OWNER" "$FILE" || echo "Maybe wrong user?"
chmod "$MODE" "$FILE"  || echo "Maybe wrong user?"



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
      ;;
    --search)
      SEARCH="$2"
      shift # past argument
      ;;    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done



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
run_if=""


}

function apt(){

action=(update,upgrade,install,remove,purge,reinstall)
package=""

apt $action $package

}
# Aufruf 
# . easy-ansible.sh


file --mode u=rwx,g=rw,o=r --owner root:root --content "Ich 
bin 
ein $(hostname)
 Gummibaer" --file test.txt
 
file --mode 322 --content "Test" --file /tmp/test.datei


 

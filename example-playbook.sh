#!/bin/bash

. ./easy-ansible.sh


hostS="ipA ipB HostC"
ssh_user="root"


file --mode u=rwx,g=rw,o=r --owner root:root --content "I can do 
many stuff here like using commands\$(hostname) = $(hostname)
 Gummibaer" --file test.txt
 
file --mode 322 --content "Test" --file /tmp/test.datei

lineinfile --line "^127\.0\.0\.1(.*?)$(hostname)" --action "append" --file /etc/hosts


insert_after --afterthis "Test" --file /tmp/test.datei --insert "After Test"


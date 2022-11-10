#!/bin/bash

. ./easy-ansible.sh


hosts="localhost"
ssh_user="root"


file --mode u=rw,g=rw,o=r --owner philipp:philipp --content "I can do 
many stuff here like using commands\$(hostname) = $(hostname)
 Gummibaer" --file test.txt
 
file --mode 644 --content "Test" --file test.datei

#lineinfile --line "^127\.0\.0\.1(.*?)$(hostname)" --action "append" --file /etc/hosts


do_remote insert_after --afterthis "Test" --file test.datei --insert "After Test"



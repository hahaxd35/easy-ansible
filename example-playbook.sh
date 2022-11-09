#!/bin/bash

. ./easy-ansible.sh


hostS="ipA ipB HostC"
ssh_user="root"

file --mode u=rw,g=rw,o=r --owner root:root --content "I can
do multiline
and i use bash \$(hostname) = $(hostname)
 :)" --file test.txt
# easy-ansible
ansible was for me way to complicated so i startet a own Bash Version of it.


Planned features:
* file (copy modul)
* cmd
* lineinfile
* apt
* any feature make it easy to confige servers without knowing how to program 


. /path/to/easy-ansible.sh

hosts=""
ssh_user=""

file --file /etc/apache2/apache2.conf --mode 622 --owner root:root --content "
please here apache2 configuration"

apt --update (runs apt update on remote server)
apt ---upgrade (runs apt upgrade on remote server)

lineinfile --action append --regex "^allow root" --file "config.cf"

cmd --comand "do_this ; sleep 1 ; do whatever you want" --runs allways|once|if condition

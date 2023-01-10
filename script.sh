#!/bin/bash

FOLDER=/root/ansible
if [ -d "$FOLDER" ]; then
    echo "Ansible is already installed"
else 
    sudo mkdir /root/ansible
    
    cd /home/gradesadmin

    apt-get install ansible -y

    echo -e "[defaults]\ninventory=/root/ansible/inventory\nremote_user=root\nhost_key_checking=False\nbecome=True\nbecome_user=root\nbecome_ask_pass=False\n" >> /root/ansible/ansible.cfg

    echo -e "[apache]\n192.168.0.100\n[mariadb]\n192.168.0.101" >> /root/ansible/inventory

    export ANSIBLE_CONFIG=/root/ansible/ansible.cfg

    echo "export ANSIBLE_CONFIG=/root/ansible/ansible.cfg" >> ~/.profile

    source ~/.profile
fi



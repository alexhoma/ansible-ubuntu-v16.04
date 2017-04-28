#!/usr/bin/env bash

# Update apt
sudo apt-get update

# Install ansible dependencies
sudo ansible-playbook /ansible/playbook.yml -i /ansible/inventory/hosts --connection=local

# Install Ansible
if ! ansible --version | grep ansible;
then
    echo "-> Installing Ansible"
    sudo apt-add-repository ppa:ansible/ansible
    sudo apt-get install -y ansible
else
    echo "-> Ansible already Installed!"
fi

# Install python2 on ubuntu16.04
sudo apt install -y python-minimal

# Install Ansistrano
# echo "-> Installing ansistrano"
# sudo ansible-galaxy install carlosbuenosvinos.ansistrano-deploy carlosbuenosvinos.ansistrano-rollback

iptables --flush
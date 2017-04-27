#!/usr/bin/env bash

if ! ansible --version | grep ansible;
then
    echo "-> Installing Ansible"

    sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
    sudo rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm

    sudo yum install -y epel-release
    sudo yum install -y ansible

    # Add SSH key
    cat /ansible/files/authorized_keys.txt >> /home/vagrant/.ssh/authorized_keys
else
    echo "-> Ansible already Installed!"
fi

# Install Ansistrano
echo "-> Installing ansistrano"
sudo ansible-galaxy install carlosbuenosvinos.ansistrano-deploy carlosbuenosvinos.ansistrano-rollback

# Execute Ansible
#echo "-> Execute Ansible playbooks"
#ansible-playbook /ansible/playbook_development.yml -i /ansible/inventories/hosts --connection=local
#ansible-playbook /ansible/playbook_apache.yml -i /ansible/inventories/hosts --connection=local
#ansible-playbook /ansible/playbook_mysql.yml -i /ansible/inventories/hosts --connection=local
#ansible-playbook /ansible/playbook_php.yml -i /ansible/inventories/hosts --connection=local

iptables --flush

# Ansible - Ubuntu 16.04
![Stable Version](https://img.shields.io/badge/release-v1.0.1-brightgreen.svg)
![License](https://img.shields.io/badge/license-MIT-brightgreen.svg)

Ubuntu 16.04 virtualmachine provisioned by Ansible.
* Apache
* PHP 7.0 + Composer
* MySQL 5.7
* Git, htop, wget, vim and tree

## Initialize
Clone this repo and start up Vagrant!
```shell
git clone https://github.com/alexhoma/ansible-ubuntu-v16.04.git
cd ansible-centos-v6.7/vagrant
vagrant up --provision
```
If the command `--provision` doesn't work for you, try with:
```shell
vagrant up; vagrant provision;
```

The default VirtualHost maps to /var/www/ in port 80. But you can change it 
or add as many as you like. I also added a Fallback to `index.php so you don't need to add manually to your url.
```apacheconfig
<VirtualHost *:80>
    DocumentRoot /var/www/html/
    ServerName ubuntu.performance.dev
    
    <Directory /var/www/html/mpwar_performance_exercise/web>
       FallbackResource /index.php
    </Directory>
</VirtualHost>
```

Default credentials for MySQL, but you can change it anytime.
* User: ubuntu
* Password: root

## Production server provision
Create an instance wherever you want. Let's say Amazon EC2.
* The first thing you do is add these lines into `ansible/inventories/hosts`
```shell
[production]
{PUT_HERE_YOUR_REMOTE_MACHINE_IP} ansible_ssh_private_key_file=~/.ssh/{PUT_HERE_YOUR_REMOTE_MACHINE_PUBLIC_KEY}.pem ansible_user=ubuntu
```
* To provision just paste this line in your terminal and magic will happen!
```shell
cd ansible-centos-v6.7
ansible-playbook ansible/playbook.yml -i ansible/inventory/hosts
```
* I'll recommend you to access to your remote machine and check if the provision was made as expected.

## Add your project
```shell
# Remove this .git repository files
cd ansible-centos-v6.7/vagrant
rm -rf .git*

# Copy your project to the shared folder
git clone {YOUR_PROJECT_REPOSITORY}
cp -R {YOUR_PROJECT_REPOSITORY}/* www/
```

## Todo:
 - Create database doesn't work. Fix that.
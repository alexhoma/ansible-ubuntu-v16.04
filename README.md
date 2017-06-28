# Ansible - Ubuntu 16.04
![Stable Version](https://img.shields.io/badge/release-v1.0.1-brightgreen.svg)
![License](https://img.shields.io/badge/license-MIT-brightgreen.svg)

Ubuntu 16.04 virtualmachine provisioned by Ansible.
* Apache
* PHP 7.1 + Composer
* MySQL 5.7
* Redis
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

## Server provisioning
### Web/Front server provision
Create an instance wherever you want. Let's say Amazon EC2.
* The first thing you have to do is add these lines into `ansible/inventories/hosts`
```shell
[web_server]
{PUT_HERE_YOUR_REMOTE_MACHINE_IP} ansible_ssh_private_key_file=~/.ssh/{PUT_HERE_YOUR_REMOTE_MACHINE_PUBLIC_KEY}.pem ansible_user=ubuntu
```
* For provision just paste this line in your terminal:
```shell
ansible-playbook ansible/web_playbook.yml -i ansible/inventory/hosts
```

### MySQL server provision
If you want to use MySQL in a distributed way:
* Add these lines into `ansible/inventories/hosts`
```shell
[mysql_server]
{PUT_HERE_YOUR_MYSQL_MACHINE_IP} ansible_ssh_private_key_file=~/.ssh/{PUT_HERE_YOUR_MYSQL_MACHINE_PUBLIC_KEY}.pem ansible_user=ubuntu
```
* Then execute this line in your terminal for provision:
```shell
ansible-playbook ansible/mysql_playbook.yml -i ansible/inventory/hosts
```

### Redis server provision
If you want to use Redis in a distributed way:
* Add these lines into `ansible/inventories/hosts`
```shell
[redis_server]
{PUT_HERE_YOUR_REDIS_MACHINE_IP} ansible_ssh_private_key_file=~/.ssh/{PUT_HERE_YOUR_REDIS_MACHINE_PUBLIC_KEY}.pem ansible_user=ubuntu
```
* Then execute this line in your terminal for provision:
```shell
ansible-playbook ansible/redis_playbook.yml -i ansible/inventory/hosts
```
* If you want to store the PHP sessions, you should add these lines manually in `/etc/php/7.0/apache2/php.ini   `
```yaml
[Session]
; Handler used to store/retrieve data.
; http://php.net/session.save-handler
session.save_handler = redis
session.save_path = "tcp://127.0.0.1:6379"
```

## Add your Application
The shared folder `shared/www`  maps to `/var/www/html` so if you want to add your PHP project just follow the next snippet: 
```shell
# Remove this .git repository files
cd ansible-centos-v6.7/vagrant
rm -rf .git*

# Copy your project to the shared folder
git clone {YOUR_PROJECT_REPOSITORY}
cp -R {YOUR_PROJECT_REPOSITORY}/* www/
```


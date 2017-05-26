# Ansible - Ubuntu 16.04
Ubuntu 16.04 virtualmachine provisioned by Ansible.
* Apache
* PHP 7.0 + Composer
* MySQL 5.7
* Git, htop, wget, vim and tree

## Initialize
Clone this repo and start up Vagrant!
```php
git clone https://github.com/alexhoma/ansible-ubuntu-v16.04.git
cd ansible-centos-v6.7/vagrant
vagrant up --provision
```
If the command `--provision` doesn't work for you, try with:
```php
vagrant up; vagrant provision;
```

The default VirtualHost maps to /var/www/ in port 80. But you can change it 
or add as many as you like.
```apacheconfig
<VirtualHost *:80>
    DocumentRoot /var/www/html/
    ServerName ubuntu.performance.dev
</VirtualHost>
```

## Add your project
```php
# Remove this .git repository files
cd ansible-centos-v6.7/vagrant
rm -rf .git*

# Copy your project to the shared folder
git clone {YOUR_PROJECT_REPOSITORY}
cp -R {YOUR_PROJECT_REPOSITORY}/* www/
```
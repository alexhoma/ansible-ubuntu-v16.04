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
or add as many as you like.
```apacheconfig
<VirtualHost *:80>
    DocumentRoot /var/www/html/
    ServerName ubuntu.performance.dev
</VirtualHost>
```

## Add your project
```shell
# Remove this .git repository files
cd ansible-centos-v6.7/vagrant
rm -rf .git*

# Copy your project to the shared folder
git clone {YOUR_PROJECT_REPOSITORY}
cp -R {YOUR_PROJECT_REPOSITORY}/* www/
```
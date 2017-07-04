#
# Deployment file
#
echo '@@ Starting provision @@'
sudo ansible-playbook ansible/development_playbook.yml \
-i ansible/inventory/hosts -e "hosts=web_server"
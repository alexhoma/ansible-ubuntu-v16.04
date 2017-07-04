#
# Deploy code on production server
#
sudo ansible-playbook --private-key ~/.ssh/mpwar_performance_recovery.pem \
-u ubuntu -i 52.210.154.223, shared/www/mpwar_performance_exercise/.ansistrano/deploy.yml

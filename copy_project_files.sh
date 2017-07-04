#
# Remove files
#
echo ''
echo '-> Removing old files...'
rm -rf ~/dev/mpwar/performance/performance-vm/shared/www/mpwar_performance_exercise
echo '   √ Removed!'
echo '-------------------------'

#
# Copy updated files
#
echo '-> Coping new files...'
cp -R ~/dev/mpwar/performance/ansible-ubuntu-v16.04/shared/www/mpwar_performance_exercise \
 ~/dev/mpwar/performance/performance-vm/shared/www/mpwar_performance_exercise
echo '   √ Copied!'
echo '-------------------------'

#
# Notes
#
echo '@@ Remember to make the fucking commit @@'

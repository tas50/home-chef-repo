sensu_check 'disk_space' do
  command 'sudo /opt/sensu/embedded/bin/check-disk-usage.rb -w 80 -c 90  -x tracefs'
  subscribers ['production']
  interval 30
end

sensu_check 'disk_space' do
  command 'check-disk-usage.rb -w 80 -c 90  -x tracefs'
  subscribers ['production']
  interval 30
end

sensu_keys = Chef::EncryptedDataBagItem.load('sensu', 'creds')
default['sensu']['rabbitmq']['host'] = '172.16.1.13'
default['sensu']['rabbitmq']['password'] = sensu_keys['rmq_password']
default['sensu']['redis']['host'] = '172.16.1.13'
default['sensu']['api']['host'] = '172.16.1.13'
default['sensu']['use_ssl'] = false
default['sensu']['use_embedded_ruby'] = true
default['sensu']['version'] = '0.21.0-2'
default['redisio']['version'] = '2.8.24'
default['redisio']['servers'] = [
  { 'port' => '6379',
    'name' => 'sensu',
    'datadir' => "#{node[:redisio][:datadir]}/sensu",
    'requirepass' => nil,
    'appendonly' => 'no',
    'logfile' => '/var/log/redis/sensu.log',
    'configdir' => node[:redisio][:default_settings][:configdir],
    'user' => 'redis'
  }
]
default['uchiwa']['install_method'] = 'http'
default['uchiwa']['settings']['user'] = sensu_keys['uchiwa_user']
default['uchiwa']['settings']['pass'] = sensu_keys['uchiwa_password']
default['uchiwa']['version'] = '0.13.0-1'
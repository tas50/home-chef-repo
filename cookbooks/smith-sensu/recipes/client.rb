include_recipe 'sensu::default'

# sensu needs sudo for certain checks
sudo 'sensu' do
  user 'sensu'
  commands  ['/usr/sbin/smartctl']
  nopasswd  true
end

sensu_client node.name do
  address node.ipaddress
  subscriptions ['production']
  keepalive(thresholds: { warning: 60,
                          critical: 300
               },
            refresh: 900,
            handlers: ['handler-mailer'])
  additional(environment: node.chef_environment)
end
include_recipe 'sensu::client_service'

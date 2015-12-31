include_recipe 'sensu::default'

# sensu needs sudo for certain checks
sudo 'sensu' do
  user 'sensu'
  commands  ['/usr/sbin/smartctl']
  nopasswd  true
end

# build a list of subscriptions for the node
subs = []
subs << node.chef_environment
subs << 'hardware' unless (node['virtualization'] && node['virtualization']['role'] == 'guest') || node['cloud']
node.run_list.each do |recipe|
  next if recipe == 'recipe[role-base]'
  subs << recipe.to_s.gsub('recipe[','').gsub(']','')
end

sensu_client node.name do
  address node.ipaddress
  subscriptions subs
  keepalive(thresholds: { warning: 60,
                          critical: 300
               },
            refresh: 900,
            handlers: ['handler-mailer'])
  additional(environment: node.chef_environment)
end
include_recipe 'sensu::client_service'

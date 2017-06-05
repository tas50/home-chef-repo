include_recipe 'sensu::default'

# sensu needs sudo for certain checks
sudo 'sensu' do
  user 'sensu'
  commands  ['/usr/sbin/smartctl', '/opt/sensu/embedded/bin/check-disk-usage.rb']
  nopasswd  true
end

# build a list of subscriptions for the node
subs = []
subs << node.chef_environment
subs << 'hardware' unless (node['virtualization'] && node['virtualization']['role'] == 'guest') || node['cloud']
node.run_list.each do |recipe|
  next if recipe == 'recipe[role-base]'
  subs << recipe.to_s.gsub('recipe[', '').delete(']')
end

sensu_client node.name do
  address node['ipaddress']
  subscriptions subs
  keepalive(thresholds: { warning: 60,
                          critical: 300 },
            refresh: 900,
            handlers: ['handler-mailer'])
  additional(environment: node.chef_environment)
end

%w( sensu-plugins-disk-checks sensu-plugins-memory-checks sensu-plugins-mailer sensu-plugins-load-checks sensu-plugins-hardware sensu-plugins-cpu-checks).each do |plugin|
  sensu_gem plugin
end

include_recipe 'sensu::client_service'

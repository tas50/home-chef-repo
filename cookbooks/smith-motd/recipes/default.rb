#
# Cookbook Name:: smith-motd
# Recipe:: default
#
# Copyright (C) 2014 Tim Smith
#
# All rights reserved - Do Not Redistribute
#

package 'update-motd' if node.platform == 'ubuntu'

# make sure the dir is there on debian
directory '/etc/update-motd.d'  

# remove fluff from motd
%w(95-hwe-eol 91-release-upgrade 51-cloudguest 98-cloudguest 10-help-text 50-landscape-sysinfo).each do |motd_file|
  file "/etc/update-motd.d/#{motd_file}" do
    action :delete
  end
end

# remove /etc/motd.tail
file '/etc/motd.tail' do
  action :delete
end

template '/etc/update-motd.d/99-systeminfo' do
  source '99-systeminfo.erb'
  mode '0755'
end

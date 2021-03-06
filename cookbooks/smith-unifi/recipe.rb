#
# Cookbook:: role_unifi
# Recipe:: default
#
# Copyright:: 2014-2019, Tim Smith
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package 'nginx'

file '/etc/nginx/sites-enabled/default' do
  action :delete
  notifies :restart, 'service[nginx]'
end

template '/etc/nginx/sites-available/unifi' do
  action :create
  notifies :restart, 'service[nginx]'
end

link '/etc/nginx/sites-enabled/unifi' do
  to '/etc/nginx/sites-available/unifi'
  notifies :restart, 'service[nginx]'
end

execute 'generate dhparams' do
  command 'openssl dhparam -out /etc/nginx/dhparam.pem 2048'
  creates '/etc/nginx/dhparam.pem'
end

dbag = data_bag_item('certificates', 'unifi')

file '/etc/nginx/unifi.smith.dmz.crt' do
  content dbag['crt']
  sensitive true
end

file '/etc/nginx/unifi.smith.dmz.key' do
  content dbag['key']
  sensitive true
end

service 'nginx' do
  supports status: true, restart: true
  action [:enable, :start]
end

include_recipe 'unifi'

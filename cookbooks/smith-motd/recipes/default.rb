#
# Cookbook Name:: smith-motd
# Recipe:: default
#
# Copyright 2014-2015, Tim Smith
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

package 'update-motd' if platform?('ubuntu')

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

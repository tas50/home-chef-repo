#
# Cookbook Name:: smith-hardware
# Recipe:: default
#
# Copyright 2015, Tim Smith
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

apt_repository 'nut-ppa' do
  uri 'http://ppa.launchpad.net/clepple/nut/ubuntu'
  distribution 'trusty'
  components ['main']
  keyserver 'keyserver.ubuntu.com'
  key 'B77076F5'
end

include_recipe 'nut'

execute 'setup_usb_hotplug' do
  command 'cp /lib/udev/rules.d/62-nut-usbups.rules /etc/udev/rules.d/'
  creates '/etc/udev/rules.d/62-nut-usbups.rules'
  action :run
  notifies :restart, 'service[nut-client]'
  notifies :restart, 'service[nut-server]'
end

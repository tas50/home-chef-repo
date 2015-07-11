#
# Cookbook Name:: role_base
# Recipe:: default
#
# Copyright 2014, Tim Smith
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'smith-packages'
include_recipe 'ntp'
include_recipe 'sensors'
include_recipe 'smith-motd'
include_recipe 'build-essential'
include_recipe 'rsyslog'
include_recipe 'vim'

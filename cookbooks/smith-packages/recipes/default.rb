#
# Cookbook Name:: smith-packages
# Recipe:: default
#
# Copyright 2013, Tim Smith
#
# All rights reserved - Do Not Redistribute
#

node['smith-packages']['install'].each do |pkg|
  package pkg
end

node['smith-packages']['remove'].each do |pkg|
  package pkg do
   action :remove
  end 
end

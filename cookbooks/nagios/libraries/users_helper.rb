require 'chef/log'
require 'chef/search/query'

# Simplify access to list of all valid Nagios users
class NagiosUsers
  attr_accessor :users

  def initialize(node)
    @node = node
    @users = []

    user_databag = node['nagios']['users_databag'].to_sym
    group = node['nagios']['users_databag_group']

    begin
      Chef::Search::Query.new.search(user_databag, "groups:#{group} NOT action:remove") { |d| @users << d unless d['nagios'].nil? || d['nagios']['email'].nil? }
    rescue Net::HTTPServerException
      Chef::Log.fatal("\"#{node['nagios']['users_databag']}\" databag could not be found.")
      raise "\"#{node['nagios']['users_databag']}\" databag could not be found."
    end
  end

  def return_user_contacts
    contacts = []

    # add base contacts from nagios_users data bag
    @users.each do |s|
      contacts << s['id']
    end

    # add pagerduty user if enabled
    contacts << 'pagerduty' unless @node['nagios']['pagerduty']['key'].empty?

    contacts
  end
end

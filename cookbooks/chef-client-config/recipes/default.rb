#
# Cookbook:: chef-client-config
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

case node['platform']
when 'redhat', 'centos', 'oracle'
  include_recipe 'chef-client-config::redhat'

when 'ubuntu', 'debian'
    include_recipe 'chef-client-config::ubuntu'

end


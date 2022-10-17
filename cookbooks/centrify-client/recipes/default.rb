#
# Cookbook:: centrify-client
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

case node['platform']
when 'redhat', 'centos', 'oracle'
  include_recipe 'centrify-client::redhat-centrify'

when 'ubuntu', 'debian'
  # Find Oracle release version
    include_recipe 'centrify-client::ubuntu-centrify'
end

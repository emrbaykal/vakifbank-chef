#
# Cookbook:: samba-config
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

case node['platform']
when 'redhat', 'centos', 'oracle'
  include_recipe 'samba-config::redhat-samba'

when 'ubuntu', 'debian'
  # Find Oracle release version
    include_recipe 'samba-config::ubuntu-samba'
end


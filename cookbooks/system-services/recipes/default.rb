#
# Cookbook:: system-services
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

case node['platform']
when 'redhat', 'centos', 'oracle'
  include_recipe 'system-services::rhel'


when 'ubuntu', 'debian'
  include_recipe 'system-services::ubuntu'

end


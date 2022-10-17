#
# Cookbook:: additional-packages
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

case node['platform']
when 'redhat', 'centos', 'oracle'
  include_recipe 'additional-packages::rhel'

when 'ubuntu', 'debian'
  include_recipe 'additional-packages::ubuntu'

end

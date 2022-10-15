#
# Cookbook:: additional-packages
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

case node['platform']
when 'redhat'
  include_recipe 'additional-packages::rhel'

when 'centos'
  include_recipe 'additional-packages::rhel' 

when 'oracle'
  include_recipe 'additional-packages::rhel' 

when 'ubuntu'
    include_recipe 'additional-packages::ubuntu'

end

#
# Copyright:: 2022, The Authors, All Rights 
#
# Cookbook:: kdump
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

case node['platform']
when 'redhat', 'centos', 'oracle'
  include_recipe 'kdump::redhat_kdump'

when 'ubuntu', 'debian'
  # Find Oracle release version
    include_recipe 'kdump::ubuntu_kdump'

end

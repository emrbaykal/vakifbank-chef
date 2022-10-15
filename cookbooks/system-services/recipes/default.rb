#
# Cookbook:: system-services
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

case node['platform']
when 'redhat'
  include_recipe 'system-services::rhel'


when 'centos'
  # Find Red Hat release version
  include_recipe 'system-services::rhel'

end

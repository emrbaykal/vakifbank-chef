#
# Cookbook:: os-repo
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

case node['platform']
when 'redhat'
  include_recipe 'os-repo::rhel_repo'

when 'centos'
  include_recipe 'os-repo::centos_repo'

#when 'oracle'
#  include_recipe 'os-repo::oracle_repo'

#when 'ubuntu'
#    include_recipe 'ntp::ubuntu_chrony'

end

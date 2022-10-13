#
# Cookbook:: sshd-config
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

case node['platform']
when 'redhat', 'centos', 'oracle'
  include_recipe 'sshd-config::redhat_sshd'

when 'ubuntu', 'debian'
  # Find Oracle release version
    include_recipe 'sshd-config::ubuntu_sshd'

end

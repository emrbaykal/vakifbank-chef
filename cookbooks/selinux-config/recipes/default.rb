#
# Cookbook:: selinux-config
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

case node['platform']
when 'redhat', 'centos', 'oracle'
  include_recipe 'selinux-config::redhat_selinux'

#when 'ubuntu', 'debian'
#    include_recipe 'sshd-config::ubuntu_sshd'

end

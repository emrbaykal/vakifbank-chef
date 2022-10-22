
#
# Cookbook:: selinux-config
# Recipe:: ubuntu_selinux
#
# Copyright:: 2019, The Authors, All Rights Reserved.

service 'apparmor' do
  action [:stop, :disable]
end

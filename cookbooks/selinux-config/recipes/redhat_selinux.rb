#
# Cookbook:: selinux-config
# Recipe:: redhat_selinux
#
# Copyright:: 2019, The Authors, All Rights Reserved.

selinux_state 'permissive' do
  action :permissive
end

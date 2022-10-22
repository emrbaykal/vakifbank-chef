#
# Cookbook:: sshd-config
# Recipe:: redhat_sshd
#
# Copyright:: 2022, The Authors, All Rights Reserved.

 replace_or_add "PermitRootLogin" do
  path "/etc/ssh/sshd_config"
  pattern "(?i)^#?PermitRootLogin.*"
  line "PermitRootLogin no"
  notifies :restart, 'service[sshd]', :immediately
 end


 service "sshd" do
    action [ :enable, :start ]
 end

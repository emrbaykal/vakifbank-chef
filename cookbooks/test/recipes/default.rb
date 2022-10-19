#
# Cookbook:: test
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.


passwd = "emre"
samba_account = Chef::EncryptedDataBagItem.load('accounts','samba-admin-id')
foo_pass = samba_account["password"]

execute 'Create test environment' do
  cwd '/root'
  #command "touch #{passwd}"
  command "touch #{foo_pass}"
  ignore_failure true
  only_if {shell_out("/usr/bin/net ads info").exitstatus == 255 }
end

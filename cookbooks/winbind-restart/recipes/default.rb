#
# Cookbook:: winbind-restart
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

  service 'winbind' do
   action [ :restart ]
   only_if { node['packages'].keys.include?('samba-winbind') }
   ignore_failure true
  end

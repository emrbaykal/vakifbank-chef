#
# Cookbook:: centrifydc-restart
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

  service 'centrifydc' do
   action [ :restart ]
   only_if { node['packages'].keys.include?('CentrifyDC') }
   ignore_failure true
  end

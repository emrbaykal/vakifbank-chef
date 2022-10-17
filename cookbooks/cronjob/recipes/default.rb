#
# Cookbook:: cronjob
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

case node['platform']
when 'redhat', 'centos', 'oracle'
  include_recipe 'cronjob::redhat_cron'

when 'ubuntu', 'debian'
    include_recipe 'cronjob::ubuntu_cron'
end

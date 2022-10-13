#
# Cookbook:: cronjob
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.
case node['platform']
when 'redhat'
  include_recipe 'cronjob::redhat_cron'

when 'centos'
  include_recipe 'cronjob::centos_cron'

when 'ubuntu'
    include_recipe 'cronjob::ubuntu'

when 'oracle'
  include_recipe 'cronjob::oracle_cron'

end 

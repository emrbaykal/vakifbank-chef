#
# Cookbook:: winbind-restart
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.


case node['platform']
  when 'redhat', 'centos', 'oracle'
    include_recipe 'winbind-restart::redhat_winbind'

  when 'ubuntu', 'debian'
    include_recipe 'winbind-restart::ubuntu_winbind'

end

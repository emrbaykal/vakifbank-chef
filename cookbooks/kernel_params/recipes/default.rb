#
# Cookbook:: kernel_params
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

template '/etc/sysctl.d/99-chef-sysctl.conf' do
    source '99-chef-sysctl.erb'
    owner 'root'
    group 'root'
    mode '0644'
    notifies :run, 'execute[sysctl --system]'
end

execute 'sysctl --system' do
  action :nothing # only a trigger
end

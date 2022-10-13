#
# Cookbook:: ntp
# Recipe:: ubuntu_chrony
#
# Copyright:: 2019, The Authors, All Rights Reserved.

  apt_package 'ntp' do
    action :purge
  end

  apt_package 'chrony' do
    action :install
  end

  template '/etc/chrony/chrony.conf' do
    mode '0755'
    source 'chrony.erb'
  end

  service 'chronyd' do
    action :enable
    subscribes :restart , 'template[/etc/chrony/chrony.conf]', :immediately
  end

  service 'chronyd' do
   supports :status => true, :restart => true, :reload => true
   action [ :enable, :start ]
   retries 3
   retry_delay 5
  end

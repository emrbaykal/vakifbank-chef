#
# Cookbook:: ntp
# Recipe:: redhat_chrony
#
# Copyright:: 2019, The Authors, All Rights Reserved.

  yum_package 'ntp' do
    action :remove
    flush_cache [ :before ]
  end

  yum_package 'chrony' do
    action :install
    flush_cache [ :before ]
  end

  template '/etc/chrony.conf' do
    mode '0755'
    source 'chrony.erb'
  end

  service 'chronyd' do
    action :enable
    subscribes :restart , 'template[/etc/chrony.conf]', :immediately
  end

  service 'chronyd' do
   supports :status => true, :restart => true, :reload => true
   action [ :enable, :start ]
   retries 3
   retry_delay 5
  end

#
# Cookbook:: ntp
# Recipe:: redhat_ntp
#
# Copyright:: 2019, The Authors, All Rights Reserved.
#


  yum_package 'ntp' do
    action :install
    flush_cache [ :before ]
  end

  template '/etc/ntp.conf' do
    mode '0755'
    source 'chrony.erb'
  end

  service 'ntpd' do
    subscribes :restart , 'template[/etc/ntp.conf]', :immediately
  end

  service 'ntpd' do
   supports :status => true, :restart => true, :reload => true
   action [ :enable, :start ]
   retries 3
   retry_delay 5
  end

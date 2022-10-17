#
# Cookbook:: samba-config
# Recipe:: redhat.samba
#
# Copyright:: 2022, The Authors, All Rights Reserved.

  package %w(samba samba-client  samba-winbind samba-winbind-clients) do
    action :install
    #flush_cache [ :before ]
  end

  template '/etc/samba/smb.conf' do
    mode '0755'
    source 'smb-conf.erb'
  end

  service 'winbind' do
    action [:enable, :start]
    subscribes :restart , 'template[/etc/samba/smb.conf]', :immediately
  end

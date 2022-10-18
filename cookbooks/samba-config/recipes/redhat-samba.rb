#
# Cookbook:: samba-config
# Recipe:: redhat.samba
#
# Copyright:: 2022, The Authors, All Rights Reserved.

  nsswitch_file= '//etc/nsswitch.conf'
  passwd_line= '^passwd.*'
  group_line='^group.*'

  package %w(samba samba-client  samba-winbind samba-winbind-clients) do
    action :install
    #flush_cache [ :before ]
  end

  ruby_block "Fix /etc/nsswitch.conf file" do
      block do
        file = Chef::Util::FileEdit.new(nsswitch_file)
        file.search_file_replace(/#{passwd_line}/, 'passwd: files sss winbind')
        file.write_file
      end
      #not_if { ::File.readlines(myfile).grep(/crashkernel=auto/).any? }
  end

  ruby_block "Fix /etc/nsswitch.conf file" do
      block do
        file = Chef::Util::FileEdit.new(nsswitch_file)
        file.search_file_replace(/#{group_line}/, 'group: files sss winbind')
        file.write_file
      end
      #not_if { ::File.readlines(myfile).grep(/crashkernel=auto/).any? }
  end

  template '/etc/samba/smb.conf' do
    mode '0755'
    source 'smb-conf.erb'
  end

  service 'winbind' do
    action [:enable, :start]
    subscribes :restart , 'template[/etc/samba/smb.conf]', :immediately
  end

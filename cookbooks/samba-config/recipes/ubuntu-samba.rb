#
# Cookbook:: samba-config
# Recipe:: ubuntu-samba
#
# Copyright:: 2022, The Authors, All Rights Reserved.

nsswitch_file= '//etc/nsswitch.conf'
passwd_line= '^passwd.*'
group_line='^group.*'

  package %w(winbind libpam-winbind libnss-winbind krb5-config samba-dsdb-modules samba-vfs-modules) do
    action :install
    #flush_cache [ :before ]
  end

  ruby_block "Fix /etc/nsswitch.conf file" do
      block do
        file = Chef::Util::FileEdit.new(nsswitch_file)
        file.search_file_replace(/#{passwd_line}/, 'passwd: files systemd winbind')
        file.write_file
      end
      #not_if { ::File.readlines(myfile).grep(/crashkernel=auto/).any? }
  end

  ruby_block "Fix /etc/nsswitch.conf file" do
      block do
        file = Chef::Util::FileEdit.new(nsswitch_file)
        file.search_file_replace(/#{group_line}/, 'group: files systemd winbind')
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

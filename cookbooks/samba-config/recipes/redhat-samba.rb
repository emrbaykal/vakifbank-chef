#
# Cookbook:: samba-config
# Recipe:: redhat.samba
#
# Copyright:: 2022, The Authors, All Rights Reserved.

  nsswitch_file= '//etc/nsswitch.conf'
  samba_account = Chef::EncryptedDataBagItem.load('accounts','samba-admin-id')
  samba_user = samba_account["username"]
  samba_passwd = samba_account["password"]
  #samba_domain = samba_account["domain"]

  package %w(samba samba-client  samba-winbind samba-winbind-clients) do
    action :install
    #flush_cache [ :before ]
  end

  ruby_block "Fix passwd parameter to the /etc/nsswitch.conf file" do
      block do
        file = Chef::Util::FileEdit.new(nsswitch_file)
        file.search_file_replace(/^passwd.*/, 'passwd:    files sss winbind')
        file.write_file
      end
      not_if "grep -i '^passwd:\s*files\s*sss\s*winbind$' /etc/nsswitch.conf"
  end

  ruby_block "Fix group parameter to the /etc/nsswitch.conf file" do
      block do
        file = Chef::Util::FileEdit.new(nsswitch_file)
        file.search_file_replace(/^group.*/, 'group:    files sss winbind')
        file.write_file
      end
      not_if "grep -i '^group:\s*files\s*sss\s*winbind$' /etc/nsswitch.conf"
  end

  template '/etc/samba/smb.conf' do
    mode '0755'
    source 'smb-conf.erb'
    notifies :restart, 'service[winbind]'
  end

  execute 'Create test environment' do
    cwd '/root'
    command "net ads join -U '#{samba_user}%#{samba_passwd}'"
    #command "net ads join -U '#{samba_user}@#{samba_domain}%#{samba_passwd}'"
    ignore_failure true
    notifies :restart, 'service[winbind]'
    only_if {shell_out("/usr/bin/net ads info").exitstatus == 255 }
  end

  service 'winbind' do
    action [:enable, :start]
    #subscribes :restart , 'template[/etc/samba/smb.conf]', :immediately
  end

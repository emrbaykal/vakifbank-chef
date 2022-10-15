#
# Cookbook:: kdump
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

myfile= '//etc/default/grub'
line= '^GRUB_CMDLINE_LINUX="\b'


  ruby_block "Fix Grub Parameters for KDUMP" do
      block do
        file = Chef::Util::FileEdit.new(myfile)
        file.search_file_replace(/#{line}/, 'GRUB_CMDLINE_LINUX="crashkernel=auto ')
        file.write_file
      end
      not_if { ::File.readlines(myfile).grep(/crashkernel=auto/).any? }
      notifies :run, 'execute[uefi-grub2-mkconfig]', :immediately
      notifies :run, 'execute[legacy-grub2-mkconfig]', :immediately
    end 

  execute 'uefi-grub2-mkconfig' do
    command 'grub2-mkconfig -o /boot/efi/EFI/redhat/grub.cfg'
    action :nothing
    only_if { ::File.exist?('/boot/efi/EFI/redhat/grub.cfg') }
  end

  execute 'legacy-grub2-mkconfig' do
    command 'grub2-mkconfig -o /boot/grub2/grub.cfg'
    action :nothing
    only_if { ::File.exist?('/boot/grub2/grub.cfg') }
  end

  template '/etc/kdump.conf' do
    mode '0644'
    source 'kdump.erb'
  end

  service 'kdump' do
    action [:enable , :start]
    subscribes :restart , 'template[/etc/kdump.conf]', :immediately
  end

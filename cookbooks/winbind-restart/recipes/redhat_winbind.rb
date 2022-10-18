

  service 'winbind' do
   action [ :restart ]
   only_if { node['packages'].keys.include?('samba-winbind') }
   ignore_failure true
  end

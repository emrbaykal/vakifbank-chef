
  service 'winbind' do
   action [ :restart ]
   only_if { node['packages'].keys.include?('winbind') }
   ignore_failure true
  end

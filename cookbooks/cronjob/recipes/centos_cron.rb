cron_d 'chef-executable' do
  path '/usr/local/bin:/usr/bin:/bin'
  action :create
  minute '*/2'
  user 'root'
  retries 4
  retry_delay 5
  command "chef-client -l warn | grep -v 'retrying [1234]/5 in'"
end

#
# Cookbook:: chef-client-config
# Recipe:: redhat
#
# Copyright:: 2022, The Authors, All Rights Reserved.


data_collect = Chef::EncryptedDataBagItem.load('accounts','data-collector-id')
server_url = data_collect["data_collector.server_url"]
token = data_collect["data_collector.token"]


replace_or_add "Append data_collector.server_url to /etc/chef/client.rb" do
  path "/etc/chef/client.rb"
  pattern "^data_collector.server_url\s*\"#{server_url}\""
  line "data_collector.server_url \"#{server_url}\""
  remove_duplicates true
end

replace_or_add "Append data_collector.token to /etc/chef/client.rb" do
  path "/etc/chef/client.rb"
  pattern "^data_collector.token\s*\"#{token}\""
  line "data_collector.token \"#{token}\""
  remove_duplicates true
end

#
# Cookbook:: data-bag-secret
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

  template '/etc/chef/encrypted_data_bag_secret' do
    mode '0600'
    source 'encrypted_data_bag_secret.erb'
  end

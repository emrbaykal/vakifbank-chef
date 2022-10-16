#
# Cookbook:: user-group
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

  node[:user][:add].each do |k, v|
    user v['name'] do
      comment v['comment']
      password v['password']
      shell v['shell']
      manage_home true
      action v['action']
    end

    sudo v['name'] do
      commands v['sudo_commands']
      #commands ['/bin/systemctl restart httpd', '/bin/systemctl restart mysql']
      nopasswd true
      users v['name']
    end

#    ssh_authorize_key v['name'] do
#        key v['ssh_public_key']
#        user v['name']
#        keytype 'ssh-rsa'
#      end
  end

#
# Cookbook:: centrify-client
# Recipe:: redhat-centrify.rb
#
# Copyright:: 2019, The Authors, All Rights Reserved.

unless node['packages'].keys.include? 'CentrifyDC'

    directory '/tmp/Linux_centrify20' do
      owner 'root'
      group 'root'
      mode '0755'
      action :create
    end


    execute 'Download Centrify Agent' do
      cwd '/tmp/Linux_centrify20'
      command 'curl --output  centrify_install.sh http://10.230.164.200/pd/scripts/centrify_install.sh'
      ignore_failure true
    end

     execute 'Install centrify agent' do
       cwd '/tmp/Linux_centrify20'
       #command 'bash ./centrify_install.sh -n --override="INSTALL=Y,CentrifyDC_nis=N,CentrifyDC_openssh=Y,CentrifyDC_ldapproxy=N,CentrifyDA=Y,DA_INST_NAME=CentrifyDA,DA_ENABLE=Y,REBOOT=N"'
       command 'bash ./centrify_install.sh'
       ignore_failure true
    end

   # execute 'Configure Centrify Agent' do
   #   command 'adjoin -u centrify_domain_join -c "Domain/Zones/Universal/Linux/Linux" -z "Domain/Zones/Universal/Linux/Linux" -p "xxxx" domain.net -f -l'
   #    ignore_failure true
   # end

   # template '/etc/issue' do
   #   source 'issue.erb'
   #   owner 'root'
   #   group 'root'
   #   mode '0755'
   # end

   #  execute 'Register DNS' do
   #     command "/usr/sbin/addns -A -m -i #{node['ipaddress']}"
   #     ignore_failure true
   #  end


    directory '/tmp/Linux_centrify20' do
     recursive true
     action :delete
    end


end


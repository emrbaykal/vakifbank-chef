 ruby_block 'reload-internal-yum-cache' do
   block do
      Chef::Provider::Package::Yum::YumCache.instance.reload
   end
    action :nothing
 end

case node['platform_version'].split('.')[0]

when '7'
 # node['package']['rhel7']['name'].each do |pkg|
    package 'chrony' do
      action :install
      ignore_failure true
    end
 # end

when '8'
#  node['package']['rhel8']['name'].each do |pkg|
    package 'chrony' do
      action :install
      ignore_failure true
    end
 # end

end

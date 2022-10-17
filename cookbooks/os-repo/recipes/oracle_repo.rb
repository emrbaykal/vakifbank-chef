
case node['platform_version'].split('.')[0]

when '7'
  node[:software][:repos][:oel7].each do |k, v|
      yum_repository v['name'] do
        description v['description']
        baseurl v['baseurl']
        gpgcheck v['gpgcheck']
        action :create
        #make_cache false
      end
    end

when '8'
  node[:software][:repos][:oel8].each do |k, v|
      yum_repository v['name'] do
        description v['description']
        baseurl v['baseurl']
        gpgcheck v['gpgcheck']
        action :create
        #make_cache false
      end
    end

end

case node['platform_version'].split('.')[0]

when '22'
  node[:software][:repos][:ubuntu_jammy].each do |k, v|
      apt_repository v['name'] do
        uri v['uri']
        components v['components']
        distribution v['distribution']
        action :add
      end
    end

when '20'
  node[:software][:repos][:ubuntu_focal].each do |k, v|
      apt_repository v['name'] do
        uri v['uri']
        components v['components']
        distribution v['distribution']
        action :add
      end
    end

end

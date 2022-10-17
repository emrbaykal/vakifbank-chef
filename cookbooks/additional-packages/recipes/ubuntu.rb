
case node['platform_version'].split('.')[0]

when '22'
 node['package']['ubuntu_jammy']['name'].each do |pkg|
    package pkg do
      action :install
      ignore_failure true
    end
  end

when '20'
  node['package']['ubuntu_focal']['name'].each do |pkg|
    package pkg do
      action :install
      ignore_failure true
    end
  end

end

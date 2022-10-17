

   case node['platform_version'].split('.')[0]

   when '22'
      node['service']['ubuntu_jammy']['state']['disabled'].each do |srv|
        service srv do
          action [ :disable, :stop ]
        end
      end

      node['service']['ubuntu_jammy']['state']['enabled'].each do |srv|
        service srv do
          action [ :enable, :start ]
        end
      end

   when '20'
      node['service']['ubuntu_focal']['state']['disabled'].each do |srv|
        service srv do
          action [ :disable, :stop ]
        end
      end

      node['service']['ubuntu_focal']['state']['enabled'].each do |srv|
        service srv do
          action [ :enable, :start ]
        end
      end

  end

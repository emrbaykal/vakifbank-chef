

   case node['platform_version'].split('.')[0]

   when '7'
      node['service']['rhel7']['state']['disabled'].each do |srv|
        service srv do
          action [ :disable, :stop ]
        end
      end

      node['service']['rhel7']['state']['enabled'].each do |srv|
        service srv do
          action [ :enable, :start ]
        end
      end

   when '8'
      node['service']['rhel8']['state']['disabled'].each do |srv|
        service srv do
          action [ :disable, :stop ]
        end
      end

      node['service']['rhel8']['state']['enabled'].each do |srv|
        service srv do
          action [ :enable, :start ]
        end
      end

  end

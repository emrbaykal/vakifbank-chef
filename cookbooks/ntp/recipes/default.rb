#
# Cookbook:: ntp
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

case node['platform']
when 'redhat'
  # Find Red Hat release version
  pv = node['platform_version'].to_f

  # Call implementation recipe based on platform version
  include_recipe 'ntp::redhat_ntp' if pv < 7.0
  include_recipe 'ntp::redhat_chrony' if pv >= 7.0 


when 'centos'
  # Find Centos release version
  pv = node['platform_version'].to_f
  
  # Call implementation recipe based on platform version
  include_recipe 'ntp::redhat_ntp' if pv < 7.0
  include_recipe 'ntp::redhat_chrony' if pv >= 7.0

when 'oracle'
  # Find Oracle release version
  pv = node['platform_version'].to_f

  # Call implementation recipe based on platform version
  include_recipe 'ntp::redhat_ntp' if pv < 7.0
  include_recipe 'ntp::redhat_chrony' if pv >= 7.0

when 'ubuntu'
  # Find Oracle release version
    include_recipe 'ntp::ubuntu_chrony'

end

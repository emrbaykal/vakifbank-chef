# copyright: 2022, The Authors Emre Baykal

title 'Ubuntu Jammy System Profile'

control "rule_1.1_Ensure_chrony_is_configured" do
  title "Ensure chrony is configured"
  desc  "ntp is a daemon which implements the Network Time Protocol (NTP)."
  impact 0.5
  describe file('/etc/chrony.conf') do
    it { should exist }
    its('content') { should match(/^\s*server\s10.254.254.10/) }
  end
  describe service('chronyd') do
    it { should be_running }
    it { should be_enabled }
  end
end

control "rule_1.2_Ensure_hosts_is_configured" do
  title "Ensure /etc/hosts is configured"
  desc  "Ensure /etc/hosts is configured"
  impact 0.5
  describe file('/etc/hosts') do
    it { should exist }
    its('content') { should match(/^\s*10.20.30.40\s*chefserver.vakifbank.intra\s*chefserver/) }
  end
end

control "rule_1.3_TEST_SSH_Protocols" do
  title "Test SSH Protocols"
  desc  "Test SSH Protocols"
  impact 1.0
  describe port(22) do
  its('processes') { should include 'sshd' }
  its('protocols') { should include 'tcp' }
  its('addresses') { should include '0.0.0.0' }
  end
end

control 'rule_1.4_SELinux' do
  impact 1.0
  title 'Ensure SELinux is not working.'
  desc 'It should make sure SELinux mode is "permissive".'
  describe selinux do
  it { should be_permissive }
end
end

control "rule_1.5_Enabled_Services" do
  title "System Servcices should be active"
  desc  "System Servcices should be active"
  impact 1.0
  services = ["sshd","kdump","winbind"]
  services.each do |srv|
  describe service(srv) do
    it { should be_running }
    it { should be_enabled }
  end
end
end

control "rule_1.6_Disabled_Services" do
  title "System Servcices should not be active"
  desc  "System Servcices should not be active"
  impact 1.0
  services = ["ftp","firewalld"]
  services.each do |srv|
  describe service(srv) do
    it { should_not be_running }
    it { should_not be_enabled }
  end
end
end

control "rule_1.7_additional_package_installed" do
  title "Ensure That Additional Packege Installed"
  desc  "Ensure That Additional Packege Installed"
  impact 0.6
  package = ["wget","curl","chrony","perl","nfs-utils","net-tools"]
  package.each do |pkg|
  describe package(pkg) do
      it { should be_installed }
  end
end
end

control "rule_1.8_additional_package_not_istalled" do
  title "Ensure That Additional Packege Not Installed"
  desc  "Ensure That Additional Packege Not Installed"
  impact 0.6
  package = ["ftp","telnet-server"]
  package.each do |pkg|
  describe package(pkg) do
      it { should_not be_installed }
  end
end
end

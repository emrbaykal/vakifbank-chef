# copyright: 2022, The Authors Emre Baykal

title 'RHEL7 Agent Profile'

control "rule_2.0_Ensure_Centrify_Service_is_enabled" do
  title "Ensure Centrify Service is enabled and configured properly"
  desc  "Ensure Centrify Service is enabled and configured properly"
  impact 1.0
  describe package('CentrifyDC') do
    it { should be_installed }
    end
    describe command('/usr/bin/adinfo') do
      it { should exist }
      its('exit_status') { should eq 0 }
    end
end

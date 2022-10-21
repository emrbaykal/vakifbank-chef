# copyright: 2021, The Authors Emre Baykal

title 'RHEL7 System Profile'

control "System_Rule_001" do
	title "DNS"
	desc  "It was detected that the DNS settings were not desired state"
	impact 1.0
	describe file("/etc/resolv.conf") do
		its("content") { should match(/^\s*nameserver\s10.254.254.10/) }
	end
	describe file("/etc/resolv.conf") do
		its("content") { should match(/^\s*nameserver\s10.254.254.11/) }
	end
	describe file("/etc/resolv.conf") do
		its("content") { should match(/^\s*search\s*hpetrlab.local/) }
	end
end

# Invoke the Compliance Phase
default['audit']['compliance_phase'] = true
# Set profile locations
default['audit']['profiles']['RHEL7-Compliance'] = {
  'compliance': 'admin/RHEL7-Compliance'
}
# Fetch additional profiles
default['audit']['fetcher'] = 'chef-automate'
# Set reporter
default['audit']['reporter'] = 'chef-automate'

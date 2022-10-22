# Invoke the Compliance Phase
default['audit']['compliance_phase'] = true
# Set profile locations
default['audit']['profiles']['Jammy-Compliance'] = {
  'compliance': 'admin/Jammy-Compliance'
}
# Fetch additional profiles
default['audit']['fetcher'] = 'chef-automate'
# Set reporter
default['audit']['reporter'] = 'chef-automate'

#default['audit']['interval']['time'] = 1440 # twice a day, the default value

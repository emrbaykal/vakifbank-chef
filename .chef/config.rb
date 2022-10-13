current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "hpe"
client_key               "#{current_dir}/hpe.pem"
chef_server_url          "https://lxchaut1.hpetrlab.local/organizations/hpe-tur"
cookbook_path            ["#{current_dir}/../cookbooks"]

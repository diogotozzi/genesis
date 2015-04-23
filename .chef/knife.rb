current_dir = File.dirname(__FILE__)

node_name               'your-id'
client_key              '/Users/you/.chef/your-id.pem'
validation_client_name  'chef-validator'
validation_key          '/Users/you/.chef/chef-validator.pem'

chef_server_url         'https://path.to.your/chef-server'

cache_type              'BasicFile'
cache_options( :path => '/Users/you/.chef/checksums' )
cookbook_path           ["#{current_dir}/../cookbooks"]

cookbook_copyright      'Your Name'
cookbook_license        'reserved'
cookbook_email          'you@example.com'

log_level               :debug
log_location            STDOUT

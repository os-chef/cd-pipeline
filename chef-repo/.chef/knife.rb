# raise "You must set the ORGNAME environment variable" if ENV['ORGNAME'].nil?
current_dir = File.dirname(__FILE__)

user_email  = `git config --get user.email`
home_dir    = ENV['HOME'] || ENV['HOMEDRIVE']
org         = ENV['CHEF_ORG'] || 'openstack-chef'

knife_override = "#{home_dir}/.chef/knife_override.rb"

chef_server_url     "https://api.opscode.com/organizations/#{org}"
log_level           :info
log_location        STDOUT

#windows USERNAME is UPCASED, downcased on chef-server
node_name           ( ENV['OPSCODE_USER'] || ENV['USER'] || ENV['USERNAME'] ).downcase
client_key               "#{home_dir}/.chef/#{node_name}.pem"

validation_client_name   "#{org}-validator"
validation_key           "#{current_dir}/#{org}-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/#{org}"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]

cookbook_copyright       "Opscode, Inc."
cookbook_license         "Apache"
cookbook_email           "#{user_email}"

knife[:identity_file]      = ENV['OS_IDENTITY_FILE']

# OpenStack
knife[:openstack_username] = ENV['OS_USERNAME']
knife[:openstack_password] = ENV['OS_PASSWORD']
knife[:openstack_auth_url] = ENV['OS_AUTH_URL']
knife[:openstack_tenant]   = ENV['OS_TENANT']

# HP Cloud
knife[:hp_access_key] = ENV['HP_ACCESS_KEY']
knife[:hp_secret_key] = ENV['HP_SECRET_KEY']
knife[:hp_tenant_id]  = ENV['HP_TENANT_ID']
knife[:hp_auth_uri]   = ENV['HP_AUTH_URI']
knife[:hp_avl_zone]   = ENV['HP_AVL_ZONE']

Chef::Config.from_file(knife_override) if File.exist?(knife_override)

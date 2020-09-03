cron 'chef_client' do
  action :create
  minute '0,15,30,45'
  user 'root'
  home '/opt/oci-caas/chef'
  command 'chef-client -z --runlist wazuh_server -j /opt/oci-caas/chef/attributes.json'
end

chef_gem 'htauth'
cron 'chef_client' do
  action :create
  minute '38'
  hour '1'
  user 'root'
  home '/opt/oci-caas/chef'
  command 'chef-client -z --runlist wazuh_server -j /opt/oci-caas/chef/attributes.json'
end

chef_gem 'htauth'

# Install, configure, and enable chrony client
package 'chrony'

cookbook_file '/etc/chrony.conf' do
  source 'chrony.conf'
  owner 'root'
  group 'root'
  mode '0644'
end

service 'chronyd' do
  action :enable
end
cron 'chef_client' do
  action :create
  minute '0,15,30,45'
  user 'root'
  home '/opt/oci-caas/chef'
  command 'chef-client -z --runlist wazuh_server -j /opt/oci-caas/chef/attributes.json'
end

cron 'wazuh_log_backups' do
  action :create
  minute '33'
  hour '0'
  user 'root'
  command "/usr/bin/oci os object bulk-upload --src-dir /var/ossec/logs/archives -bn #{node['backup_bucket_name']} --exclude \"*.json\" --exclude \"*.log\" --no-overwrite --auth=instance_principal"
end

package 'gcc'
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
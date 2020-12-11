#
# Cookbook:: wazuh_server
# Recipe:: wazuh_base
#

cron 'wazuh_log_backups' do
  action :create
  minute '33'
  hour '0'
  user 'root'
  command "/usr/bin/oci os object bulk-upload --src-dir /var/ossec/logs/archives -bn #{node['backup_bucket_name']} --exclude \"*.json\" --exclude \"*.log\" --no-overwrite --auth=instance_principal"
end

package 'gcc'
chef_gem 'htauth'
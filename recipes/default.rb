#
# Cookbook:: wazuh_server
# Recipe:: default
#

include_recipe 'oci_caas_base::base'

include_recipe '::wazuh_base'
include_recipe '::firewalld'
include_recipe 'oci_caas_base::scanning'

include_recipe '::repository'
include_recipe '::manager'
include_recipe '::filebeat'

include_recipe '::nginx'
include_recipe '::elasticsearch'
include_recipe '::kibana'

include_recipe 'oci_caas_base::clamav'
include_recipe 'oci_caas_base::suricata'

include_recipe 'selinux::default'
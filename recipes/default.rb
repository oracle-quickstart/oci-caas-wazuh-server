#
# Cookbook:: wazuh_server
# Recipe:: default
#

include_recipe '::base'
include_recipe '::firewalld'

include_recipe '::repository'
include_recipe '::manager'
include_recipe '::filebeat'

include_recipe '::nginx'
include_recipe '::elasticsearch'
include_recipe '::kibana'

include_recipe '::clamav'

include_recipe 'selinux::default'
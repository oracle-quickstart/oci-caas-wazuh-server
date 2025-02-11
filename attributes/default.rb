#
# Cookbook Name:: ossec
# Attributes:: default
#
# Copyright 2010-2015, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# general settings
default['ossec']['dir'] = '/var/ossec'
default['ossec']['address'] = nil
default['ossec']['ignore_failure'] = true

# Filebeat settings
default['filebeat']['package_name'] = 'filebeat'
default['filebeat']['service_name'] = 'filebeat'
default['filebeat']['elasticsearch_server_ip'] = 'localhost'
default['filebeat']['timeout'] = 15
default['filebeat']['config_path'] = '/etc/filebeat/filebeat.yml'

# Required for Kiabana/Nginx listener
default['selinux']['booleans']['httpd_can_network_connect'] = 'on'

# ClamAV settings
default['clamav']['clamd']['enabled'] = true
default['clamav']['freshclam']['enabled'] = true
default['clamav']['dev_package'] = false

# To fix an htauth installation error due to old apt cookbook dependency
force_override['htpasswd']['install_method'] = 'packages'

default['runlist_name'] = 'wazuh_server'
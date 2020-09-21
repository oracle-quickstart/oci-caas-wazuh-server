#
# Cookbook Name:: ossec
# Recipe:: repository
#
# Copyright 2015, Opscode, Inc.
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

if platform_family?('ubuntu', 'debian')
    package 'lsb-release'

    ohai 'reload lsb' do
      plugin 'lsb'
      # action :nothing
      subscribes :reload, 'package[lsb-release]', :immediately
    end

    apt_repository 'Wazuh' do
      uri 'http://packages.wazuh.com/3.x/apt/'
      key 'https://packages.wazuh.com/key/GPG-KEY-WAZUH'
      components ['main']
      distribution 'stable'
    end

    apt_update
elsif platform_family?('rhel','redhat', 'centos', 'amazon')
  yum_repository 'Wazuh' do
    description 'WAZUH Repository - www.wazuh.com'
    baseurl 'https://packages.wazuh.com/3.x/yum'
    gpgkey 'https://packages.wazuh.com/key/GPG-KEY-WAZUH'
    action :create
  end
else
  raise 'Currently platforn not supported yet. Feel free to open an issue on https://www.github.com/wazuh/wazuh-chef if you consider that support for a specific OS should be added'
end

if platform_family?('debian','ubuntu')
  package 'lsb-release'

  ohai 'reload lsb' do
    plugin 'lsb'
    # action :nothing
    subscribes :reload, 'package[lsb-release]', :immediately
  end

apt_repository "elastic-7.x" do
  uri 'https://artifacts.elastic.co/packages/7.x/apt'
  key 'https://artifacts.elastic.co/GPG-KEY-elasticsearch'
  distribution 'stable'
  components ['main']
  not_if do
    ::File.exist?('/etc/apt/sources.list.d/elastic-7.x.list')
  end
end
elsif platform_family?('rhel', 'redhat', 'centos', 'amazon')
  yum_repository "elastic-7.x" do
    description "Elastic repository for 7.x packages"
    baseurl "https://artifacts.elastic.co/packages/7.x/yum"
    gpgkey "https://artifacts.elastic.co/GPG-KEY-elasticsearch"
    action :create
  end
else
  raise "Currently platforn not supported yet. Feel free to open an issue on https://www.github.com/wazuh/wazuh-chef if you consider that support for a specific OS should be added"
end

yum_repository 'nginx' do
  description 'nginx repo'
  gpgcheck false
  baseurl 'https://nginx.org/packages/centos/$releasever/$basearch/'
  action :create
end
#
# Cookbook:: wazuh_server
# Recipe:: scanning
#
# Copyright:: 2020, The Authors, All Rights Reserved.

include_recipe 'yum-epel'

package 'lynis' do
  action :install
end

package 'nmap' do
  action :install
end

package 'git' do
  action :install
end

git '/opt/scipag_vulscan' do
  repository 'https://github.com/scipag/vulscan'
  action :sync
end

cron 'run_lynis_pentest' do
  action :create
  minute '13'
  hour '3'
  user 'root'
  command '/bin/lynis audit system --pentest'
end

cron 'Local nmap vulscan' do
  action :create
  minute '43'
  hour '3'
  user 'nobody'
  command '/usr/bin/nmap -Pn -sV --script=/opt/scipag_vulscan/vulscan.nse localhost | logger -t nmap_scipag_vulscan'
end
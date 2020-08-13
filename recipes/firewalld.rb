#
# Cookbook:: wazuh_server
# Recipe:: firewalld
#
# Copyright:: 2020, The Authors, All Rights Reserved.

firewalld_rich_rule 'ssh_add' do
  zone 'public'
  family 'ipv4'
  source_address node['vcn_cidr_block']
  port_number '22'
  port_protocol 'tcp'
  log_prefix 'ssh'
  log_level 'info'
  firewall_action 'accept'
  action :add
end

firewalld_rich_rule 'https_port_add' do
  zone 'public'
  family 'ipv4'
  source_address node['vcn_cidr_block']
  port_number node['https_port']
  port_protocol 'tcp'
  log_prefix 'https'
  log_level 'info'
  firewall_action 'accept'
  action :add
end

firewalld_rich_rule 'wazuh_registration' do
  zone 'public'
  family 'ipv4'
  source_address node['vcn_cidr_block']
  port_number node['https_port']
  port_protocol 'tcp'
  log_prefix 'wazuh_reg'
  log_level 'info'
  firewall_action 'accept'
  action :add
end

firewalld_rich_rule 'wazuh_clients' do
  zone 'public'
  family 'ipv4'
  source_address node['vcn_cidr_block']
  port_number '1514'
  port_protocol 'udp'
  log_prefix 'wazuh_client'
  log_level 'info'
  firewall_action 'accept'
  action :add
end
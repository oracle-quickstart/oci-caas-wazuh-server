# wazuh_server Cookbook

## Description
This is a fork of the community wazuh_manager cookbook, modified to work on
Oracle Autonomous Linux. 

## Requirements

### Platforms
* Oracle Autonomous Linux 7.8+

### Chef
* Chef 16+

### Cookbooks
* oci_caas_base
* apt
* poise-python
* yum
* hostsfile
* htpasswd
* firewalld
* selinux
* tar

## Attributes
* node['runlist_name'] - The runlist name used for scheduling Chef via cron
* node['vcn_cidr_block'] - CIDR block used for inbound firewall rules
* node['backup_bucket_name'] - An OCI Object Store bucket for backups and archives
* node['wazuh_user'] - Web login user id
* node['wazuh_password'] - Password for wazuh_user

Additionally, the ``attributes`` folder contains all the default configuration files in order to generate ossec.conf file.

Check ['ossec.conf']( https://documentation.wazuh.com/3.x/user-manual/reference/ossec-conf/index.html) documentation to see all configuration sections.

## Recipes
### default
The default recipe will run all required recipes in the recommended order.

### wazuh_base
Our base recipe with some requirements for setting up Wazuh

### firewalld
Managed firewall rules using firewall-cmd

### repository
Sets up repos for installing Wazuh components

### manager
The main Wazuh manager installation

### filebeat
Installs / manages filebeat

### nginx
Installs nginx, which is used to proxy the kibana interface

### elasticsearch
Installs / manages elasticsearch

### kibana
Installs / manages kibana

## Usage
This is intended to be a complete wrapper cookbook for the environment. You can run
everything via the default cookbook.

## License
Copyright (c) 2020, Oracle and/or its affiliates. All rights reserved.

Licensed under the Universal Permissive License 1.0 or Apache License 2.0.

See [LICENSE](LICENSE) for more details.
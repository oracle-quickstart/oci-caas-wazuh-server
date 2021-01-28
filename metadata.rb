name 'wazuh_server'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license          'Apache 2.0'
description 'Installs/Configures wazuh_server'
version '0.5.1'
chef_version '>= 16.0'

depends 'oci_caas_base'
depends 'apt'
depends 'poise-python'
depends 'yum'
depends 'hostsfile'
depends 'htpasswd'
depends 'firewalld'
depends 'selinux'
depends 'tar'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/wazuh_server/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/wazuh_server'

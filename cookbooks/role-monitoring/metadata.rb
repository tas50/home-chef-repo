name             'role-monitoring'
maintainer       'Tim Smith'
maintainer_email 'tsmith84@gmail.com'
license          'Apache-2.0'
description      'Role cookbook for the monitoring host'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.3.0'

depends 'smith-ups'
depends 'smith-sensu'

chef_version '>= 13'
supports 'debian'
supports 'ubuntu'

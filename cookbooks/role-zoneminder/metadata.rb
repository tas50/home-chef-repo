name             'role-zoneminder'
maintainer       'Tim Smith'
maintainer_email 'tsmith84@gmail.com'
license          'Apache-2.0'
description      'Role cookbook for the monitoring host'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.2'

depends 'zoneminder'

chef_version '>= 12'
supports 'debian'
supports 'ubuntu'

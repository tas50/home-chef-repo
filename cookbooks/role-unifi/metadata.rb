name             'role-unifi'
maintainer       'Tim Smith'
maintainer_email 'tsmith84@gmail.com'
license          'Apache-2.0'
description      'Role cookbook for the unifi host'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.1'

depends 'smith-unifi'

chef_version '>= 12'
supports 'debian'
supports 'ubuntu'

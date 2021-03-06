name             'smith-sensu'
maintainer       'Tim Smith'
maintainer_email 'tsmith84@gmail.com'
license          'Apache-2.0'
description      'Installs and configures sensu with the uchiwa UI'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.7.0'
depends 'uchiwa'
depends 'sensu'

supports 'debian'
supports 'ubuntu'

chef_version '>= 14'

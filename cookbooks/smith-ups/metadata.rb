name             'smith-ups'
maintainer       'Tim Smith'
maintainer_email 'tsmith84@gmail.com'
license          'Apache-2.0'
description      'Installs and configures nut for UPS monitoring'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.3.2'
depends 'nut', '~> 0.0.4'

chef_version '>= 13'
supports 'debian'
supports 'ubuntu'

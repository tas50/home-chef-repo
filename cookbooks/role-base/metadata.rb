name             'role-base'
maintainer       'Tim Smith'
maintainer_email 'tsmith84@gmail.com'
license          'Apache-2.0'
description      'Base role cookbook for all nodes'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.4.0'

depends 'smith-packages'
depends 'smith-motd'
depends 'smith-hardware'
depends 'ntp'
depends 'sensors'
depends 'build-essential'
depends 'vim'
depends 'chef_client_updater'

chef_version '>= 12'

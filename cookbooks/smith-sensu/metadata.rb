name             'smith-sensu'
maintainer       'Tim Smith'
maintainer_email 'tsmith84@gmail.com'
license          'Apache 2.0'
description      'Installs and configures sensu with the uchiwa UI'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.3.0'
depends 'uchiwa', '~> 1.2'
depends 'sensu', '~> 2.12'
depends 'sudo'

name             'smith-hardware'
maintainer       'Tim Smith'
maintainer_email 'tsmith84@gmail.com'
license          'Apache 2.0'
description      'Installs and configures packages for manging hardware systems'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'
depends 'sensors', '~> 1.1'
depends 'smartmontools', '~> 1.0'

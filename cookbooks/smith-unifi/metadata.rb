name             'smith-unifi'
maintainer       'Tim Smith'
maintainer_email 'tsmith84@gmail.com'
license          'Apache-2.0'
description      'Wrapper cookbook for installing unifi controller'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.2'

depends 'unifi'

supports 'debian'
supports 'ubuntu'

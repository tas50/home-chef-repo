name             'role-nas'
maintainer       'Tim Smith'
maintainer_email 'tsmith84@gmail.com'
license          'Apache-2.0'
description      'Storage role'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'smith-zfs'

chef_version '>= 14'

supports 'debian'
supports 'ubuntu'

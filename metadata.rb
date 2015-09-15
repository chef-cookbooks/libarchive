name             'libarchive'
maintainer       'Jamie Winsor'
maintainer_email 'jamie@vialstudios.com'
license          'Apache 2.0'
description      'A library cookbook for extracting archive files'
long_description 'A library cookbook for extracting archive files'
version          '0.6.1'

%w( debian ubuntu centos redhat arch mac_os_x).each { |os| supports os }

depends 'apt', '~> 2.5'
depends 'yum-epel', '~> 0.6'

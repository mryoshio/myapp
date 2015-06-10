name             'offers'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures offers'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w{ packages gem_support apache2 nginx unicorn rails opsworks_initial_setup }.each do |cb|
  depends cb
end

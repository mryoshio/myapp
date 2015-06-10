set['opsworks_bundler']['version'] = '1.5.3'
set['manage_package'] = true
set['opsworks_rubygems']['version'] = '2.2.2'
set['opsworks']['ruby_version'] = '2.1'
set[:opsworks][:rails_stack][:name] = 'apache_passenger'
set[:passenger][:version] = '4.0.48'

default[:deploy][:offers][:application_name] = 'offers'
default[:deploy][:offers][:application_type] = 'rails'



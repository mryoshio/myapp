#
# Cookbook Name:: offers
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

application = node[:deploy][:application_name]
deploy = node[:deploy][application]

Chef::Log.info "Deploying #{application} using ownlocal_deploy::default"

include_recipe "nginx::uninstall"
include_recipe "apache2"

opsworks_deploy_user do
  deploy_data deploy
end

opsworks_deploy_dir do
  user deploy[:user]
  group deploy[:group]
  path deploy[:deploy_to]
end

opsworks_rails do
  deploy_data deploy
  app application
end

opsworks_deploy do
  deploy_data deploy
  app application
end

###
# Wrapping the following two commands in this deploy[:domains].present? block is necessary so that
# deploying other applications no-ops well
###

if deploy[:domains].present?
  nginx_web_app application do
    Chef::Log.debug("Calling nginx_web_app with #{deploy}")
    application deploy
    cookbook "nginx"
  end

  unicorn_web_app do
    application application
    deploy deploy
  end
end

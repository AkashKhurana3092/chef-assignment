#
# Cookbook:: Tomcat_install
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
include_recipe 'Tomcat_install::Package'
include_recipe 'Tomcat_install::user'
include_recipe 'Tomcat_install::configuration'
include_recipe 'Tomcat_install::service'

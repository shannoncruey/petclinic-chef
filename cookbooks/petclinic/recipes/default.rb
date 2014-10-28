#
# Cookbook Name:: chef-petclinic
# Recipe:: default
#
# Copyright (C) 2013 Mark O'Connor
# 
# All rights reserved - Do Not Redistribute
#
include_recipe "application"

application 'petclinic' do
  path         '/opt/pets'
  owner        node['tomcat']['user']
  group        node['tomcat']['group']
  repository   node['petclinic']['war']['url']
  revision     node['petclinic']['war']['checksum']
  scm_provider Chef::Provider::RemoteFile::Deploy

  java_webapp

  tomcat
end


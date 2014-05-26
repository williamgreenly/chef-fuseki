#
# Cookbook Name:: fuseki
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "java"

src = "http://www.apache.org/dist/jena/binaries/jena-fuseki-" + node['fuseki']['version'] + "-distribution.tar.gz"
target = node["fuseki"]["path"] + "fuseki.tar.gz"
tar_output = node["fuseki"]["path"] + "jena-fuseki-" + node['fuseki']['version']
service_output = "/etc/init.d/fuseki"

directory node["fuseki"]["path"] do
	owner "root"
  	group "root"
  	mode "0755"
  	action :create
  	recursive true
end

directory node["fuseki"]["data"] do
	owner "root"
  	group "root"
  	mode "0777"
  	action :create
  	recursive true
end

remote_file target do
	source src
	mode "0644"
end

execute "untar-fuseki" do
	cwd node["fuseki"]["path"]
  	command "tar -xzf " + target
  	creates tar_output
end

template tar_output + "/config.ttl" do
	source "config.erb"
	action :create
end

file target do
	action :delete
end

link "/etc/init.d/fuseki" do
	link_type :symbolic
	to tar_output + "/fuseki"
end

service "fuseki" do
	action :start
end

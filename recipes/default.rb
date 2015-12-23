#
# Cookbook Name:: libarchive
# Recipe:: default
#
# Author:: Jamie Winsor (<jamie@vialstudios.com>)
#

include_recipe 'apt::default' if platform_family?('debian')
if platform_family?('rhel')
  include_recipe 'yum-epel::default' if node[:platform_version].to_i == 5
end

package node[:libarchive][:package_name] do
  version node[:libarchive][:package_version] if node[:libarchive][:package_version]
  action :upgrade
end unless platform_family?('mac_os_x')

chef_gem 'ffi-libarchive' do # ~FC009
  version '~> 0.2.0'
  compile_time true if Chef::Resource::ChefGem.instance_methods(false).include?(:compile_time)
end

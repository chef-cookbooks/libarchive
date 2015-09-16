#
# Cookbook Name:: libarchive
# Attribute:: default
#
# Author:: Jamie Winsor (<jamie@vialstudios.com>)
#

default[:libarchive][:package_name] =
case node[:platform_family]
when 'debian' then 'libarchive-dev'
when 'rhel' then 'libarchive-devel'
else 'libarchive'
end

default[:libarchive][:package_version] = nil

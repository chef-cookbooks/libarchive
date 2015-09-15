![Release](https://img.shields.io/badge/release-v0.6.1-blue.svg)
![License](https://img.shields.io/badge/license-Apache2-blue.svg)

# libarchive-cookbook

A [library cookbook][0] that provides LWRPs for extracting archive files

## Requirements

* Chef ~> 12.1

## Supported Platforms

* Ubuntu
* CentOS (RHEL)
* Arch Linux
* Mac OS X

## Usage

```ruby
include_recipe 'libarchive::default'

libarchive_file 'my_archive.tar.gz' do
  path '/path/to/artifact/my_archive.tar.gz'
  extract_to '/path/to/extraction'
  owner 'reset'
  group 'reset'
  action :extract
end
```

## Recipes

### libarchive::default

Include this recipe before leveraging any of the LWRPs provided by this cookbook. It will install the necessary libarchive packages on your node and the necessary libarchive rubygem as a chef_gem.

## libarchive_file Resource/Provider

### Actions

- **extract** - extracts the contents of the archive to the destination on disk. (default)

### Parameter Attributes

- **path** - filepath to the archive to extract (name attribute)
- **owner** - set the owner of the extracted files
- **group** - set the group of the extracted files
- **mode** - set the mode of the extracted files
- **extract_to** - filepath to extract the contents of the archive to
- **extract_options** - an array of symbols representing extraction flags. See extract options below.

### Extract Options

- `:no_overwrite` - don't overwrite files if they already exist

## License and Authors

Author:: Jamie Winsor (<jamie@vialstudios.com>)
Author:: John Bellone (<jbellone@bloomberg.net>)

[0]: http://blog.vialstudios.com/the-environment-cookbook-pattern#thelibrarycookbook

require 'spec_helper'

describe 'libarchive::default' do
  %w(14.04 12.04).each do |version|
    context "ubuntu #{version}" do
      let(:chef_run) do
        ChefSpec::SoloRunner.new(
          platform: 'ubuntu',
          version: version
        ).converge(described_recipe)
      end

      it 'includes apt recipe' do
        expect(chef_run).to include_recipe('apt::default')
      end

      it 'upgrades the libarchive-dev package using apt' do
        expect(chef_run).to upgrade_package('libarchive-dev')
      end
    end
  end

  %w(7.0 6.6).each do |version|
    context "centos #{version}" do
      let(:chef_run) do
        ChefSpec::SoloRunner.new(
          platform: 'centos',
          version: version
        ).converge(described_recipe)
      end

      it 'does not include the yum-epel recipe' do
        expect(chef_run).to_not include_recipe('yum-epel::default')
      end

      it 'upgrades the libarchive-devel package using yum' do
        expect(chef_run).to upgrade_package('libarchive-devel')
      end
    end
  end

  context 'centos 5.11' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(
        platform: 'centos',
        version: '5.11'
      ).converge(described_recipe)
    end

    it 'includes yum-epel recipe' do
      expect(chef_run).to include_recipe('yum-epel::default')
    end

    it 'upgrades the libarchive-devel package' do
      expect(chef_run).to upgrade_package('libarchive-devel')
    end
  end

  context 'mac_os_x' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(
        platform: 'mac_os_x',
        version: '10.10'
      ).converge(described_recipe)
    end

    it 'does not upgrade the libarchive package' do
      expect(chef_run).to_not upgrade_package('libarchive')
    end
  end

  context 'defaults' do
    cached(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

    it 'installs the ffi-libarchive gem' do
      expect(chef_run).to install_chef_gem('ffi-libarchive')
    end

    it 'upgrades the libarchive package' do
      expect(chef_run).to upgrade_package('libarchive')
    end
  end
end

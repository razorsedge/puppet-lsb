#!/usr/bin/env rspec

require 'spec_helper'

describe 'lsb', :type => 'class' do

  context 'on a non-supported operatingsystem' do
    let :facts do {
      :osfamily               => 'foo',
      :operatingsystem        => 'bar',
      :operatingsystemrelease => '1',
      :operatingsystemmajrelease => '1'
    }
    end
    it 'should fail' do
      expect {
        should raise_error(Puppet::Error, /Unsupported platform: foo/)
      }
    end
  end

  context 'on a supported operatingsystem, default parameters' do
    let(:params) {{}}

    describe 'RedHat 5' do
      let :facts do {
        :osfamily                  => 'RedHat',
        :operatingsystem           => 'RedHat',
        :operatingsystemmajrelease => '5'
      }
      end
      it { should contain_package('lsb').with(
        :ensure => 'present',
        :name   => 'redhat-lsb'
      )}
    end

    describe 'RedHat 6' do
      let :facts do {
        :osfamily                  => 'RedHat',
        :operatingsystem           => 'RedHat',
        :operatingsystemmajrelease => '6'
      }
      end
      it { should contain_package('lsb').with(
        :ensure => 'present',
        :name   => 'redhat-lsb-core'
      )}
    end

    describe 'Fedora 16' do
      let :facts do {
        :osfamily               => 'RedHat',
        :operatingsystem        => 'Fedora',
        :operatingsystemrelease => '16',
        :operatingsystemmajrelease => '16'
      }
      end
      it { should contain_package('lsb').with(
        :ensure => 'present',
        :name   => 'redhat-lsb'
      )}
    end

    describe 'Fedora 17' do
      let :facts do {
        :osfamily               => 'RedHat',
        :operatingsystem        => 'Fedora',
        :operatingsystemrelease => '17',
        :operatingsystemmajrelease => '17'
      }
      end
      it { should contain_package('lsb').with(
        :ensure => 'present',
        :name   => 'redhat-lsb-core'
      )}
    end

    describe 'osfamily Debian' do
      let :facts do {
        :osfamily               => 'Debian',
        :operatingsystem        => 'Debian',
        :operatingsystemrelease => '1',
        :operatingsystemmajrelease => '1'
      }
      end
      it { should contain_package('lsb').with(
        :ensure => 'present',
        :name   => 'lsb-release'
      )}
    end

    describe 'osfamily Suse' do
      let :facts do {
        :osfamily               => 'Suse',
        :operatingsystem        => 'Suse',
        :operatingsystemrelease => '1',
        :operatingsystemmajrelease => '1'
      }
      end
      it { should contain_package('lsb').with(
        :ensure => 'present',
        :name   => 'lsb-release'
      )}
    end
  end

  context 'on a supported operatingsystem, custom parameters' do
    let :facts do {
      :osfamily               => 'RedHat',
      :operatingsystem        => 'RedHat',
      :operatingsystemrelease => '1',
      :operatingsystemmajrelease => '1'
    }
    end

    describe 'ensure => absent' do
      let :params do {
        :ensure => 'absent'
      }
      end
      it { should contain_package('lsb').with_ensure('absent') }
    end

    describe 'autoupgrade => true' do
      let :params do {
        :autoupgrade => true
      }
      end
      it { should contain_package('lsb').with_ensure('latest') }
    end
  end

  context 'on a supported operatingsystem, custom parameters, install_full_lsb_support => true' do
    let :params do {
      :install_full_lsb_support => true
    }
    end

    describe 'osfamily RedHat' do
      let :facts do {
        :osfamily               => 'RedHat',
        :operatingsystem        => 'RedHat',
        :operatingsystemrelease => '1',
        :operatingsystemmajrelease => '1'
      }
      end
      it { should contain_package('lsb').with(
        :ensure => 'present',
        :name   => 'redhat-lsb'
      )}
    end

    describe 'osfamily Debian' do
      let :facts do {
        :osfamily               => 'Debian',
        :operatingsystem        => 'Debian',
        :operatingsystemrelease => '1',
        :operatingsystemmajrelease => '1'
      }
      end
      it { should contain_package('lsb').with(
        :ensure => 'present',
        :name   => 'lsb'
      )}
    end

    describe 'osfamily Suse' do
      let :facts do {
        :osfamily               => 'Suse',
        :operatingsystem        => 'Suse',
        :operatingsystemrelease => '1',
        :operatingsystemmajrelease => '1'
      }
      end
      it { should contain_package('lsb').with(
        :ensure => 'present',
        :name   => 'lsb'
      )}
    end
  end

end

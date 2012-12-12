#!/usr/bin/env rspec

require 'spec_helper'

describe 'lsb', :type => 'class' do

  context 'on a non-supported operatingsystem' do
    let :facts do {
      :osfamily        => 'foo',
      :operatingsystem => 'bar'
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
    let :facts do {
      :osfamily => 'RedHat'
    }
    end
    it { should contain_package('lsb').with_ensure('present') }
  end

  context 'on a supported operatingsystem, custom parameters' do
    let :facts do {
      :osfamily => 'RedHat'
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

end

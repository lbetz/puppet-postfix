require 'spec_helper'

describe('postfix', :type => :class) do
  let(:facts) { {:osfamily => 'RedHat'} }

  context 'on unsupported os' do
    let(:facts) { {:osfamily => 'foo', :operatingsystem => 'foo'} }
    it do
      expect {
        should contain_package('postfix')
      }.to raise_error(Puppet::Error, /this platform not supported/)
    end
  end

  context 'with ensure => running' do
    let(:params) { {:ensure => 'running'} }
    it do
      should contain_service('postfix').with({
        'ensure' => 'running',
      })
    end
  end

  context 'with ensure => stopped' do
    let(:params) { {:ensure => 'stopped'} }
    it do
      should contain_service('postfix').with({
        'ensure' => 'stopped',
      })
    end
  end

  context 'with ensure => foo' do
    let(:params) { {:ensure => 'foo'} }
    it do
      expect {
        should contain_service('postfix')
      }.to raise_error(Puppet::Error, /Valid values for ensure are running and stopped/)
    end
  end

  context 'with enable => true' do
    let(:params) { {:enable => true} }
    it do
      should contain_service('postfix').with({
        'enable' => true,
      })
    end
  end

  context 'with enable => false' do
    let(:params) { {:enable => false} }
    it do
      should contain_service('postfix').with({
        'enable' => false,
      })
    end
  end

  context 'with enable => foo' do
    let(:params) { {:enable => 'foo'} }
    it do
      expect {
        should contain_service('postfix')
      }.to raise_error(Puppet::Error, /is not a boolean/)
    end
  end

  context 'with correct main.cf' do
    it do
      should contain_file('/etc/postfix/main.cf').with({
        'ensure' => 'file',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
      })
    end
  end
end

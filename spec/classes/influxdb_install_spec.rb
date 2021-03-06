require 'spec_helper'

describe 'influxdb::install', :type => :class do

  it { should create_class('influxdb::install') }
  it { should contain_package('influxdb') }

  context 'installing from a repository' do
    let(:pre_condition) {
      'class{"influxdb":
        ensure => "installed",
        install_from_repository => true,
      }'
    }
    context 'on debian' do
      let(:facts) {
        {
          :osfamily => 'Debian',
          :architecture => 'x86_64',
        }
      }
      it { should contain_package('influxdb').with(
        :ensure   => 'installed',
      )}
    end
    context 'on redhat' do
      let(:facts) {
        {
          :osfamily => 'RedHat',
          :architecture => 'x86_64',
        }
      }
      it { should contain_package('influxdb').with(
        :ensure   => 'installed',
      )}
    end
  end
end

require 'beaker-rspec/spec_helper'
require 'beaker-rspec/helpers/serverspec'
require 'beaker/puppet_install_helper'

unless ENV['RS_PROVISION'] == 'no' or ENV['BEAKER_provision'] == 'no'

  run_puppet_install_helper

end

  RSpec.configure do |c|
    proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
    c.formatter = :documentation
    
    c.before :suite do
      hosts.each do |host|
        copy_module_to(host, :source => proj_root, :module_name => 'ntp')
    end
  end
end

require 'spec_helper_acceptance' 

describe 'ntp class' do
  it "applies idempotently" do
    pp = "class {'ntp':}"
    apply_manifest(pp, :catch_failures => true)
    apply_manifest(pp, :catch_changes => true)
  end
  describe file("/etc/ntp.conf") do
    it { should be_file }
    it { should contain("driftfile /var/lib/ntp/drift") }
  end
  describe service("ntpd") do
    it { should be_running }
    it { should be_enabled }
  end
end  


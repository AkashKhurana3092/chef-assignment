# InSpec test for recipe Tomcat_install::default

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

describe port(8080) do
  it {should be_listening}
end

describe service('tomcat') do
  it { should be_enabled }
  it { should be_running }
end

describe group('tomcat') do
  it { should exist }
end

describe user('tomcat') do
  it { should exist }
end

describe package('java-1.8.0-openjdk-devel') do
  it { should be_installed }
end

describe directory('/opt/tomcat') do
  it { should exist }
  its('group') { should eq 'tomcat' }
end

describe http('http://127.0.0.1:8080') do
  its('status') { should eq 200 }
end

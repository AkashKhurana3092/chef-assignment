# InSpec test for recipe Tomcat_install::default

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

describe 'Tomcat Daemon' do
  it 'is listening on port 8080' do
    expect(port(8080)).to be_listening
  end
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

describe group('tomcat') do
  it { should exist }
end

describe directory('/opt/tomcat') do
  it { should exist }
  its('group') { should eq 'tomcat' }
end

describe http('http://127.0.0.1:8080') do
  its('status') { should cmp 200 }
end

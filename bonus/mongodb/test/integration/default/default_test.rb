# InSpec test for recipe mongodb::default

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

describe file('/etc/apt/sources.list.d') do
  it { should exist }
end




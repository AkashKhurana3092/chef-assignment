# # InSpec test for recipe windows::default

# # The Chef InSpec reference, with examples and extensive documentation, can be
# # found at https://docs.chef.io/inspec/resources/

## To Veify "Allow log on locally to Administrator" ##

describe security_policy do
  its('SeInteractiveLogonRight') { should eq ['S-1-5-32-544'] }
end

## To Verify "Allow log on through RDP to Admin & Remote Desktop User" ##

describe security_policy do
  its('SeRemoteInteractiveLogonRight') { should eq ['S-1-5-32-544'] + ['S-1-5-32-555'] }
end

## To verify "Disable Admin Account" ##

describe security_policy do
  its('EnableAdminAccount') { should eq 0 }
end

## To Verify CTRL+ALT+DEL is set to Disabled ##

describe registry_key 'HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System' do
  its('DisableCAD') { should eq 0 }
end

## To Verify NTP Client is set to Enabled ##

describe registry_key 'HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\W32time\\TimeProviders\\NtpClient' do
  its('Enabled') { should eq 1 }
end

## To Verify NTP Server is set to Disabled ##

describe registry_key 'HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\W32time\\TimeProviders\\NTPServer' do
  its('Disabled') { should eq 0 }
end
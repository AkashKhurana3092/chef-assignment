# InSpec test for recipe windows::default

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

control 'log-n_local_administrator_rule' do
  allowed_principals = ['S-1-5-32-544']
  describe security_policy.SeInteractiveLogonRight - allowed_principals do
    it { should be_empty }
  end
end

control 'Remote_Desktop_Services_is_set_to_Administrators_Remote_Desktop_Users' do
  allowed_principals = (['S-1-5-32-544'] + ['S-1-5-32-555'])
  describe security_policy.SeRemoteInteractiveLogonRight - allowed_principals do
    it { should be_empty }
  end
end

control 'CTRLALTDEL_is_set_to_Disabled' do
  describe registry_key('HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System') do
    it { should have_property 'DisableCAD' }
    its('DisableCAD') { should cmp == 0 }
  end
end

control 'NTP_Client_is_set_to_Enabled' do
  describe registry_key('HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\W32Time\\TimeProviders\\NtpClient') do
    it { should have_property 'Enabled' }
    its('Enabled') { should cmp == 1 }
  end
end

control 'NTP_Server_is_set_to_Disabled' do
  describe registry_key('HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\W32Time\\TimeProviders\\NtpServer') do
    it { should have_property 'Disabled' }
    its('Disabled') { should cmp == 0 }
  end
end

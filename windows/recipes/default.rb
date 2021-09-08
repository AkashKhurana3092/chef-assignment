#
# Cookbook:: windows
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

windows_user_privilege 'Allow log on locally' do
  privilege 'SeInteractiveLogonRight'
  users         ['BUILTIN\Administrators']
  action         :set
end

windows_user_privilege 'Remote interactive logon' do
  privilege 'SeRemoteInteractiveLogonRight'
  users          ['BUILTIN\Administrators', 'BUILTIN\Remote Desktop Users']
  action         :set
end

windows_security_policy 'disable administrator' do
  secoption 'EnableAdminAccount'
  secvalue '0'
  action :set
end

registry_key node['windows']['Policy'] do
  values [{
    name: 'DisableCAD',
    type: :dword,
    data: 0,
  }]
  action :create
end

registry_key node['windows']['NtpClinet'] do
  values [{
    name:  'Enabled',
    type:  :dword,
    data:  1,
  }]
  recursive true
  action :create
end

registry_key node['windows']['NtpServer'] do
  values [{
    name:  'Disabled',
    type:  :dword,
    data:  0,
  }]
  recursive true
  action :create
end

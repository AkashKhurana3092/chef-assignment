yum_repository 'mongoDB' do
  baseurl node['mongodb']['baseurl']
  gpgcheck true
  enabled true
  gpgkey node['mongodb']['gpgkey']
  action :create
end

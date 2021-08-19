package node['mongodb']['package'] do
  action :install
  version '4.4.4'
end

service 'mongod' do
  action [:enable, :start]
end

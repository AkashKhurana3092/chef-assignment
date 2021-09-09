package node['mongodb']['package'] do
  action :install
end

service 'mongod' do
  action [:enable, :start]
end

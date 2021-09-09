case node['platform']
when 'redhat', 'centos'

package node['mongodb']['package'] do
    action :install
end

service 'mongod' do
    action [:enable, :start]
end

when 'ubuntu', 'debian'

apt_update

package 'mongodb' do
    action :install
end

service 'mongodb' do
    provider Chef::Provider::Service::Init
    start_command '/etc/init.d/mongodb start'
    action :start
end

end

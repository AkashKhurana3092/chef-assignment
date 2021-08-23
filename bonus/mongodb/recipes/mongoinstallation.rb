case node['platform']
when 'redhat', 'centos'

package node['mongodb']['package'] do
    action :install
    version '4.4.4'
end

service 'mongod' do
    action [:enable, :start]
end

when 'ubuntu', 'debian'

apt_update
apt_package 'mongodb'

 bash "mongodb service" do
     code <<-EOH
     service mongodb enable
     service mongodb start
     EOH
     not_if { File.exist?("/etc/init.d/mongodb") }
 end

end

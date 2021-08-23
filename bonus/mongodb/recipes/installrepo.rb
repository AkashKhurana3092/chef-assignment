case node['platform']
when 'redhat', 'centos'

yum_repository 'mongoDB' do
    baseurl node['mongodb']['baseurl']
    gpgcheck true
    enabled true
    gpgkey node['mongodb']['gpgkey']
    action :create
end

when 'ubuntu', 'debian'

bash "mongodb-org" do
    code <<-EOH
    curl -fsSL #{node['mongodb']['key']} | sudo apt-key add -
    apt-key adv --keyserver #{node['mongodb']['keyserver']}
    echo "deb #{node['mongodb']['repo']}" | tee #{node['mongodb']['source']}
    EOH
    not_if { ::File.exists?("#{node['mongodb']['source']}") }
end

directory '/data/db' do
    action :create
    recursive true
end
end
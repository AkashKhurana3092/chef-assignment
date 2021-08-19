file node['tomcat']['file']['service'] do
  owner 'tomcat'
  group 'tomcat'
  mode '0755'
  action :create
end

template node['tomcat']['file']['service'] do
  source 'tomcat.service.erb'
  action :create
end

template node['tomcat']['opt']['user'] do
  source 'tomcat-usr.xml.erb'
end

service 'tomcat' do
  action [:enable, :start]
end

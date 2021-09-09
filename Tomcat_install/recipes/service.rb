template node['tomcat']['file']['service'] do
  source 'tomcat.service.erb'
  owner 'tomcat'
  group 'tomcat'
  mode '0755'
  action :create
end

template node['tomcat']['opt']['user'] do
  source 'tomcat-usr.xml.erb'
  owner 'tomcat'
  group 'tomcat'
  mode '0755'
  action :create
end

service 'tomcat' do
  action [:enable, :start]
end

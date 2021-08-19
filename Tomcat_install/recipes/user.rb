group node['tomcat']['group'] do
    action :create
end

user 'tomcat' do
  gid 'tomcat'
  manage_home false
  home '/opt/tomcat'
  shell '/bin/nologin'
  action :create
end

directory node['tomcat']['directory'] do
    owner 'tomcat'
     group 'tomcat'
    action :create
  end

directory "#{node['tomcat']['directory']}/conf" do
    mode '750'
    group 'tomcat'
    action :create
end
remote_file "#{Chef::Config[:file_cache_path]}/tomcat.tar.gz" do
  group "#{node['tomcat']['group']}"
  owner "#{node['tomcat']['group']}"
  source "https://archive.apache.org/dist/tomcat/tomcat-8/v8.0.1/bin/#{node['tomcat']['package']}"
  action :create
end

archive_file "#{Chef::Config[:file_cache_path]}/tomcat.tar.gz" do
  group "#{node['tomcat']['group']}"
  owner "#{node['tomcat']['group']}" 
  mode '755'
  destination '/opt/apache'
  action :extract
  not_if { Dir.exist?("/opt/tomcat/bin") }
end

bash 'extract file content' do
  cwd "/opt/apache/"
  code <<-EOH
  mv #{node['tomcat']['extract']}/* #{node['tomcat']['directory']}
  chown tomcat:tomcat #{node['tomcat']['directory']}
  EOH
  not_if { Dir.exist?("/opt/tomcat/bin") }
end

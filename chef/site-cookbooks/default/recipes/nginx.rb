template "#{node['nginx']['dir']}/sites-available/node" do
  source "node.erb"
  owner "root"
  group "root"
  mode 00644
end

nginx_site 'default' do
  enable false
end

nginx_site 'node' do
  enable true
end

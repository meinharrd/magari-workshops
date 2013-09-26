bash "Set timezone to Etc/UTC" do
  code <<-EOH
    echo "Etc/UTC" > /etc/timezone
    dpkg-reconfigure --frontend noninteractive tzdata
  EOH
end

template "/etc/default/locale" do
  source "locale.erb"
  owner "root"
  group "root"
  mode "0644"
end

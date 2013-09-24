# Set timezone to UTC
bash "Set timezone to Etc/UTC" do
  code <<-EOH
    echo "Etc/UTC" > /etc/timezone
    dpkg-reconfigure --frontend noninteractive tzdata
  EOH
end

# Allow unattended-upgrades
package "unattended-upgrades" do
  action :install
end

# .. and configure
template "/etc/apt/apt.conf.d/50unattended-upgrades" do
  source "50unattended-upgrades.erb"
  owner "root"
  group "root"
  mode "0644"
  variables(
    :install_on_shutdown => true
  )
end
template "/etc/apt/apt.conf.d/10periodic" do
  source "10periodic.erb"
  owner "root"
  group "root"
  mode "0644"
  variables(
  )
end
template "/etc/default/locale" do
  source "locale.erb"
  owner "root"
  group "root"
  mode "0644"
end

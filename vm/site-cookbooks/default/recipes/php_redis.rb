
case node['platform_family']
when "debian"
  package "redis-server" do
    action :install
  end
  
  php_pear "redis" do
    action :install
  end
  
  template "/etc/php5/mods-available/redis.ini" do
    source "redis.ini.erb"
    owner "root"
    group "root"
    mode "0644"
    variables(
    )
  end
  
  link "/etc/php5/fpm/conf.d/20-redis.ini" do
    link_type :symbolic
    to "/etc/php5/mods-available/redis.ini"
    action :create
  end

  link "/etc/php5/cli/conf.d/20-redis.ini" do
    link_type :symbolic
    to "/etc/php5/mods-available/redis.ini"
    action :create
  end
end
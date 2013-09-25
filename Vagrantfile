# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.network "forwarded_port", guest: 80, host: 8080

  # quick fix for permissions
  config.vm.synced_folder "./", "/vagrant", :id => "vagrant-root", :group => "www-data", :mount_options => ["dmode=775", "fmode=764"]
  
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "512"]
  end
  
  config.vm.provision :shell do |shell|
    shell.inline = "apt-get update"
    shell.inline = "gem install chef --version 11.6.0 --no-ri --no-rdoc --conservative"
  end

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["vm/cookbooks", "vm/site-cookbooks"]
    chef.roles_path = "vm/roles"
    chef.add_role "default"
  end

  config.vm.provision :shell do |shell|
    shell.inline = "sed -i 's/user = www-data/user = vagrant/' /etc/php5/fpm/pool.d/www.conf && service php5-fpm restart"
  end
end

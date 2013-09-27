# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.define "apache" do |web|
    web.vm.network "forwarded_port", guest: 80, host: 8080

    # quick fix for permissions
    web.vm.synced_folder "./", "/vagrant", :id => "vagrant-root", :group => "www-data", :extra => "dmode=775,fmode=764"
    
    web.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512"]
    end
    
    web.vm.provision :shell do |shell|
      shell.inline = "gem install chef --version 11.6.0 --no-ri --no-rdoc --conservative"
    end

    web.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = ["chef/cookbooks", "chef/site-cookbooks"]
      chef.roles_path = "chef/roles"
      chef.add_role "apache"
    end
  end
  
  config.vm.define "nginx" do |web|
    web.vm.network "forwarded_port", guest: 80, host: 8090

    # quick fix for permissions
    web.vm.synced_folder "./", "/vagrant", :id => "vagrant-root", :group => "www-data", :extra => "dmode=775,fmode=764"
    
    web.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512"]
    end
    
    web.vm.provision :shell do |shell|
      shell.inline = "gem install chef --version 11.6.0 --no-ri --no-rdoc --conservative"
    end

    web.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = ["chef/cookbooks", "chef/site-cookbooks"]
      chef.roles_path = "chef/roles"
      chef.add_role "nginx"
    end
  end

end

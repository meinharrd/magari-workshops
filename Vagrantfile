# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  
  config.vm.network :private_network, ip: "192.168.104.63"
  config.vm.hostname = "sandbox-vm"
  # config.ssh.forward_agent = true
  
  config.vm.synced_folder "./", "/usr/local/share/app"
  
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "512"]
  end
  
  config.vm.provision :shell do |shell|
    shell.inline = "gem install chef --version 11.6.0 --no-rdoc --no-ri --conservative"
  end

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["vm/cookbooks", "vm/site-cookbooks"]
    chef.roles_path = "vm/roles"
    chef.add_role "default"
  end
end

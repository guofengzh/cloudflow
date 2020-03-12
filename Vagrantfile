# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  centos = "generic/centos8"
  memory = "4096"
  net_ip = "192.168.50"
  config.vm.boot_timeout = 900

  config.vm.define :node0, primary: true do |node_config|
    setup_box_config(node_config, "node0", "#{centos}", "#{net_ip}.10","#{memory}")
	config.vm.provision :shell, path: "bootstrap.sh", privileged: true
  end
end

def setup_box_config(config, hostname, os, ip, memory)
    config.vm.provider :virtualbox do |v|
        v.memory = memory
        v.cpus = 1
        v.name = hostname
    end
    
    # Fix: By default, Vagrant will share your project directory (the directory with the Vagrantfile) to /vagrant.
    config.vm.synced_folder ".", "/vagrant"

    config.vm.box = os
    config.vm.host_name = hostname
    config.vm.network :private_network, ip: ip
end

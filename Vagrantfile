# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vagrant.configure("2") do |config|
  config.vm.define "fluentd" do |master|
    master.vm.box = "ubuntu/xenial64"
    master.vm.hostname = "fluentd"
    master.vm.network "private_network", ip: "192.168.10.10"
    master.vm.provision "shell", path: "install.sh"
  end

  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
  end

end


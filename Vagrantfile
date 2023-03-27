# -*- mode: ruby -*-
# vi:set ft=ruby sw=2 ts=2 sts=2:

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.box_check_update = false
  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end
  config.vm.provider "virtualbox" do |v|
	v.customize ["modifyvm", :id, "--audio", "none"]
    v.check_guest_additions = false
  end
  
  config.vm.define "bash" do |bash|
	  bash.vm.hostname = "bash"
	  bash.vm.provider "virtualbox" do |vb|
	    vb.name = "bash"
    end
    bash.vm.synced_folder ".", "/home/vagrant/bash", owner: "vagrant", group: "vagrant", mount_options: ["dmode=755","fmode=755"]
  end
end
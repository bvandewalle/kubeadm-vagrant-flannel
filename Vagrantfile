# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 1000 ]
    vb.memory = "2048"
    vb.cpus = 4
  end

  config.vm.box = "ubuntu/xenial64"

  config.vm.define "kube-master" do |c|
    c.vm.hostname = "kube-master"
    c.vm.network "private_network", ip: "192.168.100.10"
    c.vm.synced_folder "./workspace", "/home/ubuntu/workspace"
    c.vm.synced_folder "./bin", "/home/ubuntu/bin"
    c.vm.provision "file", source: "./config/profile", destination: ".profile"
    c.vm.provision "file", source: "./config/kubeadm-master.sh", destination: "kubeadm-master.sh"
    c.vm.provision "file", source: "./config/kube-flannel.yml", destination: "kube-flannel.yml"
    c.vm.provision :shell, :path => "config/install.sh"
    c.vm.provision :shell, :path => "config/kubeadm-master.sh"
  end

  config.vm.define "kube-node" do |c|
    c.vm.hostname = "kube-node"
    c.vm.network "private_network", ip: "192.168.100.11"
    c.vm.synced_folder "./workspace", "/home/ubuntu/workspace"
    c.vm.synced_folder "./bin", "/home/ubuntu/bin"
    c.vm.provision "file", source: "./config/profile", destination: ".profile"
    c.vm.provision "file", source: "./config/kubeadm-join.sh", destination: "kubeadm-join.sh"
    c.vm.provision :shell, :path => "config/install.sh"
    c.vm.provision :shell, :path => "config/kubeadm-join.sh"
  end

end

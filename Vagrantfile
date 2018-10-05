# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.box = "centos/7"

  # Provider Settings
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 4
  end

  # Network Settings
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.network "public_network"

  # Folder Settings
  config.vm.synced_folder ".", "/var/www/html", :mount_options => ["dmode=777", "fmode=666"]
 
  # Provision Settings
  config.vm.provision "shell", inline: <<-SHELL
    sudo yum install gcc -y
    sudo yum install kernel-devel -y
    sudo kernel-devel-3.10.0-862.2.3.el7.x86_64 -y
    #mount optical drives dulu. sebelum sampai provision, buka console VM lepas tu  klik Devices > Insert Guest Additions CD Image
    sudo mount /dev/cdrom /mnt/
    cd /mnt
    sudo ./VBoxLinuxAdditions.run
    setenforce 0
  SHELL

  
end

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.box = "centos/7"

  # Provider Settings
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 4
    #Add Optical Drive
    #Need to open VM and click Device > Insert VBox Additions Guest during boot up 
    vb.customize ["storageattach", :id, 
                "--storagectl", "IDE", 
                "--port", "0", "--device", "1", 
                "--type", "dvddrive", 
                "--medium", "emptydrive"]    
  end

  # Network Settings
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.network "public_network"

  # Folder Settings
  # Comment out  (, disabled: true) after provisining and vagrant reload to get Folder Settings work after VBox Additions Guest installed
  config.vm.synced_folder ".", "/var/www/html", :mount_options => ["dmode=777", "fmode=666"], disabled: true

  # Provision Settings
  # config.vm.provision "shell", inline: <<-shell
  #   sudo yum install gcc -y
  #   sudo yum install kernel-devel -y
  #   sudo kernel-devel-3.10.0-862.2.3.el7.x86_64 -y
  #   #mount optical drives dulu. sebelum sampai provision, buka console vm lepas tu  klik devices > insert guest additions cd image
  #   sudo mount /dev/cdrom /mnt/
  #   cd /mnt
  #   sudo ./VBoxLinuxAdditions.run
  #   setenforce 0
  # shell

  config.vm.provision "shell", path: "bootstrap.sh"

  
end

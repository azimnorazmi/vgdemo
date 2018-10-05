# install vBox Linux Addition
sudo yum install gcc -y
sudo yum install kernel-devel -y
sudo kernel-devel-3.10.0-862.2.3.el7.x86_64 -y
#mount optical drives dulu. sebelum sampai provision, buka console vm lepas tu  klik devices > insert guest additions cd image
sudo mount /dev/cdrom /mnt/
cd /mnt
sudo ./vboxlinuxadditions.run

#disable selinux temporarily
setenforce 0

#LAMP stack begin

#Apache
sudo yum install httpd
sudo systemctl start httpd.service
sudo systemctl enable httpd.service

#Mariadb
sudo yum install mariadb-server mariadb
sudo systemctl start mariadb
sudo systemctl enable mariadb.service

#PHP
sudo yum install php php-mysql
sudo systemctl restart httpd.service






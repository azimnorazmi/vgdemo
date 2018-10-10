# install vBox Linux Addition
sudo yum install gcc -y
sudo yum install kernel-devel -y
sudo kernel-devel-3.10.0-862.2.3.el7.x86_64 -y
#Mount Guest Additions CD Image. After VM successfully boot up and before provisioner part, open VM and click Devices > Insert Guest Additions CD Image.
sudo mount /dev/cdrom /mnt/
cd /mnt
sudo ./VBoxLinuxAdditions.run

#disable SELinux
sudo setenforce 0
sudo sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config 

#LAMP stack begin

#Apache
sudo yum install httpd -y
sudo systemctl start httpd.service
sudo systemctl enable httpd.service

#Mariadb
sudo yum install mariadb-server mariadb -y
sudo systemctl start mariadb.service
sudo systemctl enable mariadb.service

#PHP
sudo yum install php php-mysql -y
sudo systemctl restart httpd.service
sudo systemctl restart mariadb.service





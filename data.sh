#!/bin/bash
sudo su
yum update -y
yum install -y httpd
cd /var/www/html
wget https://github.com/Aditya-modi20/iu/archive/refs/heads/main.zip
unzip main.zip
cp -r iu-main/* /var/www/html/
rm -rf iu-main main.zip
systemctl enable httpd
systemctl start httpd
#! /bin/bash
sudo yum -update
sudo yum -y install httpd
sudo systemctl start httpd.service
sudo echo "Here is the demo of my Terraform training" >> /var/www/html/index.html
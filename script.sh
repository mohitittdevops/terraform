#! /bin/bash
sudo yum -update
sudo yum -y install httpd
sudo systemctl start httpd.service
sudo echo 'Here is the demo of my Terraform training by using remote-exec' > index.html
sudo mv index.html /var/www/html/
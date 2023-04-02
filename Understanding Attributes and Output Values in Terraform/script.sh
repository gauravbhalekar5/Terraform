#! /bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
sudo echo "Welcome to DevOps. We are in Pune India" > /var/www/html/index.html

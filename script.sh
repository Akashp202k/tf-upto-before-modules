#!/bin/bash
# Use this for your user data (script from top to bottom)
# install httpd (Linux 2 version)
# echo "Executing script.sh on remote machine"
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
sudo echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
#!/bin/bash
# set permission as a super-user
sudo su

# Update your yum repository for latest updates
yum update -y

#  install Mysql server using yum
yum install mysql-server -y

# Start Mysql service
service mysqld start

# Set password for Mysql & Basic/Defualt Configuration
mysql-secure-installation

# Mysql login using root user
mysql -u root -p

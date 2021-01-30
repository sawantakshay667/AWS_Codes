#!/bin/bash 

# set permission as a super-user
sudo su

# Update your yum repository for latest updates
yum update -y

# Install Apache Server
yum install httpd -y

# Start the Apache service
service httpd start

# Check the status of Apache service
service httpd status

#!/bin/bash 
# set permission as a super-user
sudo su

# Update your yum repository for latest updates
yum update –y 

# Amazon Linux Extras repositories to get the latest versions of the LAMP MariaDB and PHP packages for Amazon Linux 2.
amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2

# Install PHP 7 with Apache and MariaDB 
yum install -y httpd mariadb-server

# Start the Apache service
systemctl start httpd 

# enabling the Apache service
systemctl enable httpd

# Group membership can be modified with the usermod Command
usermod -a -G apache ec2-user 

# Change File/Directory Ownership with Linux Chown Command
chown -R ec2-user:apache /var/www

# Chmod 2775 (chmod a+rwx,o-w,ug+s,+t,u-s,-t) sets permissions so that, (U)ser / owner can read, can write and can execute. (G)roup can read, can't write and can execute. (O)thers can read, can't write and can execute.
chmod 2775 /var/www

# https://explainshell.com/explain?cmd=find+%2Fvar%2Fwww+-type+d+-exec+chmod+2775+%7B%7D+%5C%3B#
find /var/www -type d -exec chmod 2775 {} \;

# https://explainshell.com/explain?cmd=find+%2Fvar%2Fwww+-type+f+-exec+chmod+0664+%7B%7D+%5C%3B
find /var/www -type f -exec chmod 0664 {} \;

# Make index.html file on path:/var/www/html/
echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php

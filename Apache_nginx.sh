#!/bin/bash 
# set permission as a super-user
sudo su

# Update your yum repository for latest updates
yum update –y 

# Install nginx1.12
amazon-linux-extras install nginx1.12

# Check Nginx version
nginx -v

# Start the Nginx service
systemctl start nginx

# enabling the Nginx service
systemctl enable nginx

# Chmod 2775 (chmod a+rwx,o-w,ug+s,+t,u-s,-t) sets permissions so that, (U)ser / owner can read, can write and can execute. (G)roup can read, can't write and can execute. (O)thers can read, can't write and can execute.
chmod 2775 /usr/share/nginx/html 

# https://explainshell.com/explain?cmd=find+%2Fusr%2Fshare%2Fnginx%2Fhtml+-type+d+-exec+chmod+2775+%7B%7D+%5C%3B
find /usr/share/nginx/html -type d -exec chmod 2775 {} \;

# https://explainshell.com/explain?cmd=find+%2Fusr%2Fshare%2Fnginx%2Fhtml+-type+f+-exec+chmod+0664+%7B%7D+%5C%3B
find /usr/share/nginx/html -type f -exec chmod 0664 {} \;

# Make index.html file on path: /usr/share/nginx/html/
echo "<h3>This is Created from Akshay_A_Sawant. Visit my github page https://github.com/sawantakshay667/AWS_Codes/blob/main/Apache_nginx.sh </h3>" > /usr/share/nginx/html/index.html

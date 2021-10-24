#!/bin/bash
## Above command is not needed as we are calling bash shell in Makefile

Print () {
  echo -e "\e[1m$1\e[0m"
}

Print "Installing Nginx"
yum install nginx -y
Print "Enabling Nginx"
systemctl enable nginx
Print "Starting Nginx"
systemctl start nginx
exit

curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"

cd /usr/share/nginx/html
rm -rf *
unzip /tmp/frontend.zip
mv frontend-main/* .
mv static/* .
rm -rf frontend-master static README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf
systemctl restart nginx
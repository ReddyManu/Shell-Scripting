#!/bin/bash
## Above command is not needed as we are calling bash shell in Makefile

source components/common.sh

Print "Installing Nginx"
yum install nginx -y &>>$LOG
Stat $?

Print "Enabling Nginx"
systemctl enable nginx &>>$LOG
Stat $?
Print "Starting Nginx"
systemctl start nginx &>>$LOG
Stat $?

Print "Download HTML pages"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>$LOG
Stat $?

Print "Remove Old HTML pages"
rm -rf /usr/share/nginx/html/* &>>$LOG
Stat $?

Print "Extract Frontend Archive"
unzip -d /usr/share/nginx/html /tmp/frontend.zip &>>$LOG
Stat $?

#mv frontend-main/* .
#mv static/* .
#rm -rf frontend-master static README.md
#mv localhost.conf /etc/nginx/default.d/roboshop.conf
#systemctl restart nginx
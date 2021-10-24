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
unzip -o -d /tmp /tmp/frontend.zip &>>$LOG
Stat $?
## -o helps to overwrite the replace content prompt, for content inside /tmp/frontend.log file

Print "Copy files to Nginx path"
mv /tmp/frontend-main/static/* /usr/share/nginx/html/.
Stat $?

#mv static/* .
#rm -rf frontend-master static README.md
#mv localhost.conf /etc/nginx/default.d/roboshop.conf
#systemctl restart nginx
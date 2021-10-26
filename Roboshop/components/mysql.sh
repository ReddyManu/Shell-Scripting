#!/bin/bash

source components/common.sh

MSPACE=$(cat $0 components/common.sh | grep Print | awk -F '"' '{print $2}' | awk '{ print length }' | sort | tail -1)

COMPONENT_NAME=MySQL
COMPONENT=mysql

Print "Setup $COMPONENT_NAME Repo"
curl -s -L -o /etc/yum.repos.d/mysql.repo https://raw.githubusercontent.com/roboshop-devops-project/mysql/main/mysql.repo &>>$LOG
Stat $?

Print "Install MariaDB Service"
yum remove mariadb-libs -y &>>$LOG && yum install mysql-community-server -y &>>$LOG
Stat $?

Print "Start $COMPONENT_NAME Service"
systemctl enable mysqld &>>$LOG && systemctl restart mysqld &>>$LOG
Stat $?

DEFAULT_PASSWORD=$(grep 'temporary password' /var/log/mysqld.log | awk '{print $NF}')
NEW_PASSWORD="RoboShop@1"

echo 'show databases;' | mysql -uroot -p"${NEW_PASSWORD}"  &>>$LOG
if [ $? -ne 0 ]; then
  Print "Changing the Default Password"
  echo -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${NEW_PASSWORD}';\nuninstall plugin validate_password;" >/tmp/pass.sql
  mysql --connect-expired-password -uroot -p"${DEFAULT_PASSWORD}" </tmp/pass.sql &>>$LOG
  Stat $?
fi

DOWNLOAD

# curl -s -L -o /tmp/mysql.zip "https://github.com/roboshop-devops-project/mysql/archive/main.zip"
Load the schema for Services.

# cd /tmp
# unzip mysql.zip
# cd mysql-main
# mysql -u root -pRoboShop@1 <shipping.sql
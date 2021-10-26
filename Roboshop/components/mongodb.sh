source components/common.sh

MSPACE=$(cat $0 components/common.sh | grep Print | awk -F '"' '{print $2}' | awk '{ print length }' | sort | tail -1)

COMPONENT_NAME=MongoDB
COMPONENT=mongodb

Print "Download Repo"
curl -s -o /etc/yum.repos.d/$COMPONENT.repo https://raw.githubusercontent.com/roboshop-devops-project/$COMPONENT/main/mongo.repo &>>$LOG
Stat $?

Print "Install $COMPONENT_NAME"
yum install -y $COMPONENT-org &>>$LOG
Stat $?

Print "Update $COMPONENT_NAME Config"
sed -i -e 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf &>>$LOG
Stat $?

Print "Enable $COMPONENT_NAME Service"
systemctl enable mongod &>>$LOG
Stat $?

Print "Start $COMPONENT_NAME"
systemctl restart mongod &>>$LOG
Stat $?

DOWNLOAD "/tmp"

Print "Load Schema"
cd /tmp/$COMPONENT-main
mongo < catalogue.js &>>$LOG && mongo < users.js &>>$LOG
Stat $?


#!/bin/bash

COUNT=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$1" | jq ".Reservations[].Instances[].PrivateIpAddress" | grep -v null | wc -l)

if [ $COUNT -eq 0 ]; then
  aws ec2 run-instances --image-id ami-0e4e4b2f188e91845 --instance-type t2.micro --security-group-ids sg-09fb885e47a86a40e --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$1}]" | jq
else
  echo "Instance already exists"
fi
# Problem with above command (under then in if else condition) is, if run for 2nd time, it brings up 2nd(ex:cart) instance. Which is not what we want. If Else condition gives a solution.

IP=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$1" | jq ".Reservations[].Instances[].PrivateIpAddress" | grep -v null | xargs)
# xargs is used to remove the double quotes

sed -e "s/DNSNAME/$1.roboshop.internal/" -e "s/IPADDRESS/${IP}" record.json >/tmp/record.json

aws route53 change-resource-record-sets --hosted-zone-id Z001660225QQOTCNZKCLY --change-batch file:///tmp/record.json | jq

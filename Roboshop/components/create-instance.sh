#!/bin/bash

COUNT=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$1" | jq ".Reservations[].Instances[].PrivateIpAddress" | grep -v null | wc -l)

if [ $COUNT -eq 0 ]; then
  aws ec2 run-instances --image-id ami-0e4e4b2f188e91845 --instance-type t2.micro --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$1}]" | jq
else
  echo "Instance already exists"
fi

# Problem with above command (under then in if else condition) is, if run for 2nd time, it brings up 2nd(ex:cart) instance. Which is not what we want. If Else condition gives a solution.

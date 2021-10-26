#!/bin/bash

source components/common.sh

MSPACE=$(cat $0 | grep Print | awk -F '"' '{print $2}' | awk '{ print length }' | sort | tail -1)

COMPONENT_NAME=Shipping
COMPONENT=shipping

MAVEN

sleep 15


Print "Checking DB connections from APP"
STAT=$(curl -s localhost:8080/health)
if [ "$STAT" == "OK" ]
then
  Stat 0
else
  Stat 1
fi


#!/bin/bash

read -p "Enter Username:" username

if [ "$username" == "root" ]
then
  echo "Hey, you are root user"
else
  echo "Hey, you are non-root user"
fi